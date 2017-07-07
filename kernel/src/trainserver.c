#include "ts7200.h"
#include "dictionary.h"
#include "buffer.h"
#include "userRequestCall.h"
#include "trackGraph.h"
#include "bwio.h"
#include "server.h"
#include "ui.h"
#include "pkstring.h"
#include "icu.h"
#include "controller.h"
#include "time.h"

int stopDistance(int velocity){
        int v[7];
        v[0] = 0;
        v[1] = 1122; //6 
        v[2] = 1999;//8;
        v[3] = 2688; //9 
        v[4] = 3361; //10;
        v[5] = 5616; //13
        v[6] = 6712; //14


        int s[7];
        s[0] = 0;
        s[1] = 199200;
        s[2] = 316083;
        s[3] = 421500;
        s[4] =  529450;
        s[5] = 1009200;
        s[6] = 1170200;


        int a;
        int b;
        int diff;
        int i =0; 
        int alpha = 0;
        int beta = 0;
        while(i < 7){
        
                if (v[i] >= velocity) {a = i;break;}
            
                
                i++;
                if(i ==7) {a = 6; break;}
          
        }   
     
        
        if (a == 0) a =1;
        b = a-1;
        
        diff = v[a] - v[b];
 
        alpha = ((v[a] - velocity) * 100) / diff;
      
        beta = 100 -alpha;
 
        return (((alpha * s[b]) + (beta * s[a])) /100);
}

void trainVelocityServer(){
	//keeps track of velocity model for all trains....
   	//perhaps should be admin/worker model, one for each train. 
	//where each 
	//trainserver should comminicate to velocityModelServer whenn is, ss, and sensor pings occurs
	int parentTID = MyParentTid();
	int dspTID = WhoIs("displayServer");


	//either make genric for single train or array-ify 
	int train58TID  = Create(3,(void *)trainStopServer);
	int velocity58 = 1;
	//int stopDistance =0;


	int hasStopValue = 0;
	int isDying = 0;
	int curSensor =0;
	int nextSensor =0;

	//int stateChanged = 0;
	int msgLen = 0;

    	int _tid = -1;
	char msg[128];
    	int msgCap = 128;

	int sdist=0;
	int stime=0;;
	int nextSensorDist =0;
	int nextSensorTime =0;
	int deltaTime = 0;
	int deltaDist = 0;
	int alpha = 50;

	char dspMsg[128];
	char rpl[3];
    	int rpllen = 3;

	int sensorLength=0;
	int infoLength=0;
    	int sensorList[100];
	int gotSensorList =0;
    	int distanceList[100];
	int gotDistanceList =0;
	int stopWaitingJ = 0;

	int distanceToStop =0;
	int extraDist = 0;
	int timeToStop = 0;

	int csTID = WhoIs("clockServer");
	int i =0;

	int distance =0;


	while(1){
		msgLen = Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<trainVelocityServer>: Receive error.\r\n");
		if (_tid == parentTID) {
			switch(msg[0]){
				case COMMAND_DEATH:
					//time to quit
					isDying = 1;
					Reply(_tid, "1", 2);
					//if child is reply blocked, it stays reply blocked, and current task goes send-blocked
					break;
				case 'J':



					//new stop sensor info,start this bitch
					//gets stop sensors...expects a series of distance messages (see K);
					sensorLength = msg[1];
					infoLength = msg[2];
					extraDist = msg[3];
					for(i = 0; i< sensorLength; i++){		
						sensorList[i] =	msg[4+i] ;
					}
					gotSensorList = 1;
					gotDistanceList =0;
					distanceToStop = 0;
					Reply(_tid, "1", 2);
			

		        		break;
				case 'K':
					//new stop sensor info,start this bitch
					i = msg[1];
					
					distanceList[i] = msg[5] + (msg[4] << 8) + (msg[3] << 16) + (msg[2] <<24);
					gotDistanceList++;
					distanceToStop += distanceList[i];
					if(gotDistanceList == infoLength){
	
						hasStopValue = 1;
						distanceToStop += extraDist;
						timeToStop =  Time(csTID) + nextSensorTime + (((1000*distanceToStop)-stopDistance(velocity58))/velocity58);		
						//timeToStop -=  120;
						//timeToStop -=  ((5000 -velocity58) * 6 )/100;
						//mutiply by 1000 to change distance from mm to um
						//timeToStop =   nextSensorTime + (distanceToStop/velocity58);		
						if( stopWaitingJ ){
						//stop server doesnt need to know the path, just the distance, velocity and time
 						//note velocity is always >0 as velocty is based on two sensor pings, not 1 sensor ping. (i.e assume train is in motion when ss is called)
						//also assuming next nextSensor = sensorList[0]
						//distance to stop is distance to next sensor. however we don't really know where we are, since im only sending delta time from trainserver to velocity server. should send ticks...but later. will correct at next sensor hit
						//next sensorTime only makes if SS occurs immideatly after a sensor ping.
						//should correct after sensor ping
						dspMsg[0] = 'G';
						dspMsg[1] = (timeToStop >> 24) & 0xff;
						dspMsg[2] = (timeToStop >> 16) & 0xff;
						dspMsg[3] = (timeToStop >> 8) &0xff;
						dspMsg[4] = timeToStop & 0xff;

						Reply(train58TID, dspMsg, 5);
						}
					}
						
					

					Reply(_tid, "1", 2);
		        		break;

				case 'S':
					//new sensor info
					curSensor = msg[1];
					stime = ((msg[2]*10000) + (msg[3]*100) + msg[4]); //time in clock server ticks
					sdist = ((msg[5]*10000) + (msg[6]*100) + msg[7]) *1000; //distance in micrometers

					//sdist -=95;
					if(stime){
						velocity58 = (((sdist * alpha )/stime) + (velocity58 * (100-alpha)))/100;
					}
					//sdist = 100;
					if(hasStopValue){
						int startDist = sensorLength-1;
						distanceToStop =0;
						//search for curr sensor in sensor 
						for(i = 0 ; i< sensorLength; i++){
							if(sensorList[i] == curSensor) {
								startDist = i;
								break;
							}
							
						}

						for(i= startDist; i < infoLength ; i++){
							distanceToStop += distanceList[i];
						}
	
						distanceToStop += extraDist;
						//timeToStop =  Time(csTID) + nextSensorTime + (1000*distanceToStop/velocity58);		
						timeToStop =  Time(csTID) +  (((1000*distanceToStop)-stopDistance(velocity58))/velocity58);		
					}

					if(curSensor != nextSensor){
						nextSensorTime = stime;
						//last sensor was missed, so calculation is wrong
					}

					dspMsg[0] = VELOCITY_DEBUG;
					dspMsg[1] = 58; //
					dspMsg[2] = (velocity58 / 10000) % 100;
					dspMsg[3] = (velocity58 / 100) % 100;
					dspMsg[4] = (velocity58) % 100;
					dspMsg[5] = (stime / 10000) % 100;
					dspMsg[6] = (stime / 100) % 100;
					dspMsg[7] = (stime) % 100;
					dspMsg[8] = (nextSensorTime / 10000) % 100;
					dspMsg[9] = (nextSensorTime / 100) % 100;
					dspMsg[10] = (nextSensorTime) % 100;
					dspMsg[11] = 0;
					bwassert(Send(dspTID, dspMsg, 11, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");

					nextSensor = msg[8];
					nextSensorDist = ((msg[9]*10000) + (msg[10]*100) + msg[11]) *1000; //dist in micrometers
					nextSensorTime = nextSensorDist/ velocity58; //estimate time  in ticks


					Reply(_tid, "1", 2);
		
		        		break;
				default:
					Reply(_tid, "1", 2);
					
		        		bwassert(0, COM2, "<trainVelocityServer>: Illegal request code from userTask <%d>:[%s].\r\n", _tid,msg);
		        		break;

			}

		}else if(_tid == train58TID){
			//check child message (G = get status, S = just stopped)
			//child asking for current velocity info 
			switch(msg[0]){
				case 'G':
					if(isDying){
						Reply(_tid, "Q", 2);
						//if dying, child should die to prevent it from communicating to command server
					}
					dspMsg[0] = 'G';
					dspMsg[1] = (timeToStop >> 24) & 0xff;
					dspMsg[2] = (timeToStop >> 16) & 0xff;
					dspMsg[3] = (timeToStop >> 8) &0xff;
					dspMsg[4] = timeToStop & 0xff;
					Reply(_tid, dspMsg, 5);

					break;
				case 'J':
					stopWaitingJ =1;
					if(isDying){
						Reply(_tid, "Q", 2);
						//if dying, child should die to prevent it from communicating to command server
					}else if(hasStopValue){
						dspMsg[0] = 'G';
						dspMsg[1] = (timeToStop >> 24) & 0xff;
						dspMsg[2] = (timeToStop >> 16) & 0xff;
						dspMsg[3] = (timeToStop >> 8) &0xff;
						dspMsg[4] = timeToStop &0xff;
						Reply(train58TID, dspMsg, 5);

					}

					break;
				case 'S':


					hasStopValue = 0;
					dspMsg[0] = 'S';
					bwassert(Send(parentTID, dspMsg, 1, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
					Reply(_tid, "1", 2);

					break;
				default:
					bwassert(0, COM2, "<trainVelocityServer>: child croaked with wierd request<%d>:[%s].\r\n", _tid,msg);
		        		break;

			}
			//if no stop value, child should be reply-blocked until its available
		} else{
					Reply(_tid, "1", 2);
		       bwassert(0, COM2, "<trainVelocityServer>: Who this bitch? <%d>:[%s].\r\n", _tid,msg);
		       break;
		}
		
	}
}

void trainStopServer(){
	int dspTID = WhoIs("displayServer");
	int commandServerTID = WhoIs("commandServer");
	int csTID = WhoIs("clockServer");
	int parentTID = MyParentTid();
	int timeToStop = 0;
	int hasStop = 0;

	char msg[128];
    	int msgCap = 128;
  	char dspMsg[128];
	char rpl[128];
    	int rpllen = 128;


	while(1){
		if(hasStop){
			if((timeToStop - Time(csTID) ) <= 10) {
				Delay(csTID,(Time(csTID) - timeToStop));
				hasStop =0;
				//stop
				msg[0] = 'T';
				msg[1] = 0;
				msg[2] = 58;
				msg[3] = 0;
				bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
				msg[0] = 'S'; //sent stop command stopped
				bwassert(Send(parentTID, msg, 1, rpl, rpllen) >= 0, COM2, "<trainstopServer>: Send G issue."); 
				dspMsg[0] = 'S';
				bwassert(Send(parentTID, dspMsg, 1, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");



	
			}else if(timeToStop - (Time(csTID)) < 20 ){
				Delay(csTID,5);
			}else if(timeToStop - (Time(csTID)) > 20 ){

				Delay(csTID,10);

	int t = Time(csTID);


			}
		}
		
		if(!hasStop){
			//send J
			// J and G does the same, but J informs the velocity server that the last stop command is 
			//done and waiting for a new stop
			msg[0] = 'J'; //no warning
			bwassert(Send(parentTID, msg, 1, rpl, rpllen) >= 0, COM2, "<trainstopServer>: Send J issue."); 

			if(msg[0] == COMMAND_DEATH) Exit();
			timeToStop = rpl[4] + (rpl[3] << 8) + (rpl[2] << 16) + (rpl[1] <<24);
			hasStop = 1;
		
		}
		else{
			msg[0] = 'G'; //no warning
			bwassert(Send(parentTID, msg, 1, rpl, rpllen) >= 0, COM2, "<trainstopServer>: Send G issue."); 
			if(msg[0] == COMMAND_DEATH) Exit();
			timeToStop = rpl[4] + (rpl[3] << 8) + (rpl[2] << 16) + (rpl[1] <<24);
		}

	}
	
	
	Exit();

}
void initTrains(int csTID, int commandServerTID, int dspTID){
    	char msg[64];
    	char rpl[3];
    	int rpllen = 3;

	int i =0;
	for (i=58; i < 80; i++){
			msg[0] = 'T';
			msg[1] =  0;
			msg[2] = i;
			msg[3] = 0;
			bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

			//send message to display thaat trains are initilizaing
			msg[0] = COMMAND_TRAIN_INIT; //no warning
			msg[1] = 0;
			msg[2] = i;//position (0..17)
			msg[3] = 0;
			bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 
			Delay(csTID,5);
	}
	Delay(csTID,436);
	//send message to display thaat switches are initilizaing
	msg[0] = COMMAND_TRAIN_INIT; //no warning
	msg[1] = 1;
	msg[2] = 0;//position (0..17)
	msg[3] = 0;
	bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 



	//send message to display that init is done. allow command line input
	msg[0] = COMMAND_TRAIN_INIT; //no warning
	msg[1] = 2;
	msg[2] = 0;//position (0..17)
	msg[3] = 0;
	bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 


}
void trainServer(){
	//handles communication between userprompt/Deathserver and train server specific stuff
	bwassert(!RegisterAs("trainServer"), COM2, "Failed to register trainServer.\r\n");
	int commandServerTID = WhoIs("commandServer");
	int csTID = WhoIs("clockServer");



	int sensorTID = WhoIs("displaySensors");
	while (sensorTID < 0) {
		Pass();
		sensorTID = WhoIs("displaySensors");
	}



	//int velTID = Create(2,(void *)trainVelocityServer); //currently vel58 server //make one for each train
	int dspTID = WhoIs("displayServer");
    	int _tid = -1;
    	char msg[64];
    	int msgCap = 64;

    	// need seperate Msg and Rpl buffers just for displaying train sensors.
    	char dspMsg[64];

    	char commandMsg[64];
    	char rpl[3];
    	int rpllen = 3;

	volatile int i=0;
	volatile int j=0;
	int msgLen = 0;
	
/*

	int train;
	int speed;
	int sw;
	int swd;
	int sens;
	int dist;

	int prevSensor = 0;
	int curSensor = 0;
	int nextSensor = 0;
	int prevSensorTime = 0;
	int curSensorTime = 0;
	volatile int curSensorTimeT = 0;
	volatile int prevSensorTimeT = 0;
	//run initialization
*/
	initTrains(csTID,commandServerTID, dspTID);
	while(1){
	msgLen = Receive(&_tid, msg, msgCap);
		
	}
}

/*
void trainServer(){
//keep track of train speeds, and sends instructions to ioserver
	bwassert(!RegisterAs("trainServer"), COM2, "Failed to register trainServer.\r\n");
	int commandServerTID = WhoIs("commandServer");
	int csTID = WhoIs("clockServer");
	int sensorTID = WhoIs("displaySensors");
	while (sensorTID < 0) {
		Pass();
		sensorTID = WhoIs("displaySensors");
	}
	int velTID = Create(2,(void *)trainVelocityServer);
	//keep track of train speeds
	int trainSpeed[80];
	int trainCurrentSensor[80];
	int trainExpectedSensor[80];
	int trainDestinationSensor[80];



	// track graph.
	TrackGraph t;
	TrackGraphInit(&t);
	TrackGraphNode * node = t.node;

    int _tid = -1;
    char msg[64];
    int msgCap = 64;

    // need seperate Msg and Rpl buffers just for displaying train sensors.
    char dspMsg[64];

    char commandMsg[64];
    char rpl[3];
    int rpllen = 3;

	volatile int i=0;
	volatile int j=0;
	int msgLen = 0;
	int dspTID = WhoIs("displayServer");
	

	for (i=0; i < 80; i++){
			trainCurrentSensor[i] = 0;
			trainExpectedSensor[i] = 0;
			trainDestinationSensor[i] = 0;
 			trainSpeed[i] = 0;
			commandMsg[0] = 'T';
			commandMsg[1] = trainSpeed[i];
			commandMsg[2] = i;
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
			//send message to display thaat trains are initilizaing
			msg[0] = COMMAND_TRAIN_INIT; //no warning
			msg[1] = 0;
			msg[2] = i;//position (0..17)
			msg[3] = 0;
			bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

			//Delay(csTID, (14 * 19) + 170);
			Delay(csTID, 5);
	}
	// why do we have this massive delay here?
	Delay(csTID,436);
	//send message to display thaat switches are initilizaing
	msg[0] = COMMAND_TRAIN_INIT; //no warning
	msg[1] = 1;
	msg[2] = 0;//position (0..17)
	msg[3] = 0;
	bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 


	//init switches
	for (i=1; i <= 18; i++){
		node[i+80].switchConfig = C;
		commandMsg[0] = 'S';
		commandMsg[1] = node[i+80].switchConfig == S ? 33 : 34;
		commandMsg[2] = i;
		commandMsg[3] = 0;
		bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		update_switch(i, &t, &trainExpectedSensor[0]); //updates the display
	}

	node[99].switchConfig = CS;
	commandMsg[0] = 'S';
	commandMsg[1] = 34;
	commandMsg[2] = 153;
	commandMsg[3] = 0;
	bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	//update_switch(153, &t); //updates the display
	
	commandMsg[0] = 'S';
	commandMsg[1] = 33;
	commandMsg[2] = 154;
	commandMsg[3] = 0;
	bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	update_switch(154, &t, &trainExpectedSensor[0]); //updates the display

	node[100].switchConfig = CS;
	commandMsg[0] = 'S';
	commandMsg[1] = 34;
	commandMsg[2] = 155;
	commandMsg[3] = 0;
	bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	//update_switch(155, &t); //updates the display
	
	commandMsg[0] = 'S';
	commandMsg[1] = 33;
	commandMsg[2] = 156;
	commandMsg[3] = 0;
	bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	update_switch(156, &t, &trainExpectedSensor[0]); //updates the display
		

	//send message to display that init is done. allow command line input
	msg[0] = COMMAND_TRAIN_INIT; //no warning
	msg[1] = 2;
	msg[2] = 0;//position (0..17)
	msg[3] = 0;
		bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

		Delay(csTID, 5);
	int train;
	int speed;
	int sw;
	int swd;
	int sens;
	int dist;

	int prevSensor = 0;
	int curSensor = 0;
	int nextSensor = 0;
	int prevSensorTime = 0;
	int curSensorTime = 0;
	volatile int curSensorTimeT = 0;
	volatile int prevSensorTimeT = 0;
	int distSensor = 0;

	while(1){

		msgLen = Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<trainServer>: Receive error.\r\n");
		if (_tid == sensorTID) {
			// we received a sensor update from dspTID
			// search for each train if it's expected sensor was hit. If yes, then find next sensor
			// and add that as it's expected sensor.
			volatile int j = 0;
			for (j = 1; j < msgLen; j++) {
				curSensorTime = getTicks4(0); //in ms
				curSensorTimeT = Time(csTID);
				curSensor = msg[j];
				//for train velocity model
				//get distance between the current and last sensor in most direct route.
				if(prevSensor && prevSensor != curSensor){
					int path[102];
					int pathLength = 0;
					getShortestPath(&t,  prevSensor, curSensor,path, &pathLength);

					nextSensor = findNextSensor(&t,curSensor, &distSensor);
					int distanceList[100];
					int infoLength = 0;

					getEdgeInfo(&t, path, pathLength, distanceList, &infoLength);
					int dist = 0;
					for ( i = 0; i < infoLength; i++) {
						dist += distanceList[i];
					}
					// Fix this!!

					dspMsg[0] = 'S';
					dspMsg[1] = curSensor;
					dspMsg[2] = ((curSensorTimeT  -prevSensorTimeT) / 10000) % 100;
					dspMsg[3] = ((curSensorTimeT - prevSensorTimeT) / 100) % 100;
					dspMsg[4] = (curSensorTimeT - prevSensorTimeT) % 100;
					dspMsg[5] = (dist / 10000) % 100;
					dspMsg[6] = (dist  / 100) % 100;
					dspMsg[7] = dist % 100;
					dspMsg[8] = nextSensor;
					dspMsg[9] = (distSensor / 10000) % 100;
					dspMsg[10] = (distSensor  / 100) % 100;
					dspMsg[11] = distSensor  % 100;

					dspMsg[12] = 0;
					bwassert(Send(velTID, dspMsg, 12, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to Velocity train server.\r\n");
				}

				prevSensorTime = curSensorTime;
				prevSensorTimeT = curSensorTimeT;
				prevSensor = curSensor;
				
				for (i = 58; i < 80; i++) {
					if (trainDestinationSensor[i] == msg[j]) {
						trainSpeed[i] = 0;
						trainDestinationSensor[i] = 0;
					}
					if (trainExpectedSensor[i] == msg[j] ) {
						trainCurrentSensor[i] = msg[j];
						trainExpectedSensor[i] = findNextSensor(&t, msg[j], &distSensor);
						dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
						dspMsg[1] = i;
						dspMsg[2] = trainExpectedSensor[i];
						dspMsg[3] = 0;
						bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
					}else if(msg[j] == findNextSensor(&t,trainExpectedSensor[i], &distSensor)){
						trainCurrentSensor[i] = msg[j];
						trainExpectedSensor[i] = findNextSensor(&t, msg[j], &distSensor);
						dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
						dspMsg[1] = i;
						dspMsg[2] = trainExpectedSensor[i];
						dspMsg[3] = 0;
						bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
					}
				}
			}
			Reply(_tid, "1", 2);
		}else if( _tid == velTID){
			trainSpeed[58] = 0;
			Reply(_tid, "1", 2);
		} else {

			switch(msg[0]){
			case 'L':
				train = msg[1];
				trainSpeed[train] = 0;


				commandMsg[0] = 'L';
				commandMsg[1] = 16+trainSpeed[train];
				commandMsg[2] = train;
				commandMsg[3] = 0;
				bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        Reply(_tid, "1", 2);
		        break;

			case 'T':
				speed = msg[1];
				train = msg[2];
				trainSpeed[train] = speed;

				commandMsg[0] = 'T';
				commandMsg[1] = trainSpeed[train];
				commandMsg[2] = train;
				commandMsg[3] = 0;
				bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

		        Reply(_tid, "1", 2);
		        break;

			case 'R':
				train = msg[1];

				commandMsg[0] = 'R';
				commandMsg[1] = train;
				commandMsg[2] = trainSpeed[train];
				commandMsg[3] = 0;
				bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
				{ char c[2];
				 c[0] = trainSpeed[train];
				 c[1] = 0;
				
		        	Reply(_tid, &c[0], 2);
				}

		        break;

			case 'J': // ss command
				train = msg[1];
				sens = msg[2];
				dist = (msg[3] * 1000000) + (msg[4] * 10000) + (msg[5] * 100) + msg[6];

				
				if (train >= 58 && train < 80) {
					if (sens == 90 ){
					 // Next sensor
						sens = trainExpectedSensor[train];
					}

					int path[102];
					int pathLength = 0;
					if (!getShortestPath(&t, trainExpectedSensor[train], sens, path, &pathLength)) {
						Reply(_tid, "0", 2);
						break;
					}
    					int sensorList[100];
    					int distanceList[100];
    					int sensorLength = 0; 
    					int infoLength = 0;

    					// Fix this!

					getEdgeInfo(&t, path, pathLength, distanceList, &infoLength);
					dspMsg[0] = 'J';
					dspMsg[1] = sensorLength;
					dspMsg[2] = infoLength;
					dspMsg[3] = (dist / 1000000) % 100;
					dspMsg[4] = (dist / 10000) % 100;
					dspMsg[5] = (dist / 100) % 100;
					dspMsg[6] = dist % 100;
    					for ( i = 0; i < sensorLength; i++) {
						dspMsg[7+i] = sensorList[i];
					}
					dspMsg[7+i] = 0;

					bwassert(Send(velTID, dspMsg, 7+i, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending  J message to Velocity train server.\r\n"); 

    					for ( i = 0; i < infoLength; i++) {
						dspMsg[0] = 'K';
						dspMsg[1] = i;
						//dspMsg[2] = distanceList[i];
    						dspMsg[2] = (distanceList[i] >> 24) & 0xFF;
						dspMsg[3] = (distanceList[i] >> 16) & 0xFF;
						dspMsg[4] = (distanceList[i] >> 8) & 0xFF;
						dspMsg[5] = distanceList[i] & 0xFF;
        					//bwprintf(COM2, " %d ", distanceList[i]);
						bwassert(Send(velTID, dspMsg, 6, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending  k message to Velocity train server.\r\n"); 
    					}

 



					//Send path info to velocity server here
					trainDestinationSensor[train] = sens;

					for (i = 0; i < pathLength; i++) {
						if (node[path[i]].type == Sensor) continue;
						else if (node[path[i]].type == Switch) {
							switch(node[path[i]].switchConfig) {
								case C:
									if (node[path[i]].CnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = S;
									commandMsg[0] = 'S';
									commandMsg[1] = 33;
									commandMsg[2] = path[i] - 80;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] - 80, &t, &trainExpectedSensor[0]); //updates the display
									break;
								case S:
									if (node[path[i]].SnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = C;
									commandMsg[0] = 'S';
									commandMsg[1] = 34;
									commandMsg[2] = path[i] - 80;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] - 80, &t, &trainExpectedSensor[0]); //updates the display
									break;
								default:
									bwassert( 0, COM2, "<trainServer>: Got an invalid single switch configuration.");
									break;
							}

						}
						else if (node[path[i]].type == MultiSwitch) {
							switch(node[path[i]].switchConfig) {
								case CS:
									if (node[path[i]].CSnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = SC;
									commandMsg[0] = 'S';
									commandMsg[1] = 33;
									commandMsg[2] = path[i] == 99 ? 153 : 155;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 153 : 155, &t, &trainExpectedSensor[0]); //updates the display
									commandMsg[0] = 'S';
									commandMsg[1] = 34;
									commandMsg[2] = path[i] == 99 ? 154 : 156;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 154 : 156, &t, &trainExpectedSensor[0]); //updates the display
									break;

								case SC:
									if (node[path[i]].SCnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = CS;
									commandMsg[0] = 'S';
									commandMsg[1] = 34;
									commandMsg[2] = path[i] == 99 ? 153 : 155;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 153 : 155, &t, &trainExpectedSensor[0]); //updates the display
									commandMsg[0] = 'S';
									commandMsg[1] = 33;
									commandMsg[2] = path[i] == 99 ? 154 : 156;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 154 : 156, &t, &trainExpectedSensor[0]); //updates the display
									break;
								default:
									bwassert( 0, COM2, "<trainServer>: Got an invalid multi switch configuration.");
									break;

							}
						} else {
							bwassert( 0, COM2, "<trainServer>: Got an invalid node.");

						}
					}
				} 
				Reply(_tid, "1", 2);
		        break;

			case 'I': // is command
				train = msg[1];
				sens = msg[2];
				if (train >= 58 && train < 80) {
					trainCurrentSensor[train] = -1;
					trainExpectedSensor[train] = sens;	
					dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
					dspMsg[1] = train;
					dspMsg[2] = trainExpectedSensor[train];
					dspMsg[3] = 0;
					bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
				}

		        Reply(_tid, "1", 2);

		        break;

			case 'S': //switch
				sw = msg[1];
				swd = msg[2];
				if(sw <= 18) {
					node[80+sw].switchConfig = swd == 'C' ? C : S;

				} else if (sw == 19) {
				//for mutliswitch nodes 19-20 (19 = 153/154 and 20 = 155/156, D = CS and T = SC
				// CC and SS are invalid states (perhaps SS might be needed for reversing?)
						node[99].switchConfig = swd == 'D' ? CS : SC;
				} else if (sw == 20) {
						node[100].switchConfig = swd == 'D' ? CS : SC;

				}
				if(sw < 19){
					commandMsg[0] = 'S';
					commandMsg[1] = swd == 'S' ? 33 : 34;
					commandMsg[2] = sw;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
					update_switch(sw, &t, &trainExpectedSensor[0]); //updates the display
				}else if(sw == 19){
					//s == 33 , C = 34
					//D = CS = 34:33	 T = SC = 33:34


					commandMsg[0] = 'S'; 
					commandMsg[1] = swd == 'D' ? 34 : 33;
					commandMsg[2] = 153;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

					commandMsg[0] = 'S';
					commandMsg[1] = swd == 'D' ? 33 : 34; 
					commandMsg[2] = 154;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
					update_switch(154 , &t, &trainExpectedSensor[0]); //updates the display

					//update_switch(sw, &t, &trainExpectedSensor[0]); //updates the display

				}else if(sw == 20){
					//s == 33 , C = 34
					//D = CS = 34:33	 T = SC = 33:34


					commandMsg[0] = 'S'; 
					commandMsg[1] = swd == 'D' ? 34 : 33;
					commandMsg[2] = 155;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

					commandMsg[0] = 'S';
					commandMsg[1] = swd == 'D' ? 33 : 34; 
					commandMsg[2] = 156;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
					update_switch(156, &t, &trainExpectedSensor[0]); //updates the display

					//update_switch(sw, &t, &trainExpectedSensor[0]); //updates the display

				}

		        Reply(_tid, "1", 2);
		        break;

			default:
		        bwassert(0, COM2, "<trainServer>: Illegal request code from userTask <%d>:[%s].\r\n", _tid,msg);
		        break;
			}

		}
	}

}

*/

