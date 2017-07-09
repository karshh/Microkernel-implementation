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

//train server codes
#define TRAINS_GETPROFILEID 1
//#define COMMAND_TR 13 //set train speed   (controller)
//#define COMMAND_LI  14 //turn on lights    (controller)
//#define COMMAND_RV 12 //reverse train (controller)

//train profile codes
//#define COMMAND_TR 13 //set train speed   (controller)
//#define COMMAND_LI  14 //turn on lights    (controller)
//#define COMMAND_RV 12 //reverse train (controller)

void initTrains(int csTID, int commandServerTID, int dspTID, int trackServerTID){
    	char msg[64];
    	char rpl[3];
    	int rpllen = 3;

	int i =0;
	for (i=58; i < 80; i++){
			msg[0] = COMMAND_TR;
			msg[1] =  0;
			msg[2] = i;
			msg[3] = 0;
			bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<initTrains>: Error sending message to CommandServer.\r\n");

			//send message to display thaat trains are initilizaing
			msg[0] = COMMAND_TRAIN_INIT; //no warning
			msg[1] = 0;
			msg[2] = i;//position (0..17)
			msg[3] = 0;
			bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<initTrains>: Displaying switches failed."); 
			Delay(csTID,5);
	}
	Delay(csTID,436);
	//send message to display thaat switches are initilizaing
	msg[0] = COMMAND_TRAIN_INIT; //no warning
	msg[1] = 1;
	msg[2] = 0;//position (0..17)
	msg[3] = 0;
	bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<initTrains>: Displaying switches failed."); 


////////////////////////////// move below to trackserver
	//init switches

	msg[0] = TRACK_INITSW;
	msg[1] = 0;
	bwassert(Send(trackServerTID, msg, 2, rpl, rpllen) >= 0, COM2, "<initTrains>: Displaying switches failed."); 

//////////////////////////// move above to trackserver
	//send message to display that init is done. allow command line input
	msg[0] = COMMAND_TRAIN_INIT; //no warning
	msg[1] = 2;
	msg[2] = 0;//position (0..17)
	msg[3] = 0;
	bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<initTrains>: Displaying switches failed."); 

}

void trainServer(){
	//handles communication between userprompt/Deathserver and train server specific stuff
	bwassert(!RegisterAs("trainServer"), COM2, "Failed to register trainServer.\r\n");
	int commandServerTID = WhoIs("commandServer");
	int csTID = WhoIs("clockServer");
	int dspTID = WhoIs("displayServer");
	int trackTID = WhoIs("trackServer");
    	int _tid = -1;

    	char msg[64];
    	int msgCap = 64;
	char rpl[3];
    	int rpllen = 3;
	int msgLen = 0;

	//move to trackserver
	int sw;
	int swd;
   //////////////////////////////////////
 	initTrains(csTID,commandServerTID, dspTID, trackTID);

	int tr58TID = Create(23,(void *)trainProfile);
	int tr76TID = Create(23,(void *)trainProfile);

	char * debug1 = "D5SUCH TRAINS";
	char * debug2 = "D6MUCH PAILY";
	char * debug3 = "D20CHOOCHOO MOTHERFUCKERS!";
	char * debug4 = "D25 25[USE SPACE TO DISPLAY NUMBERS UNCONJOINED WITH CURSORINDEX.]";

	bwassert(Send(dspTID, debug1, pkstrlen((void*)debug1), rpl, rpllen) >= 0, COM2, "<trainServer>: Debug Statement failed"); 
	bwassert(Send(dspTID, debug2, pkstrlen((void*)debug2), rpl, rpllen) >= 0, COM2, "<trainServer>: Debug Statement failed"); 
	bwassert(Send(dspTID, debug3, pkstrlen((void*)debug3), rpl, rpllen) >= 0, COM2, "<trainServer>: Debug Statement failed"); 
	bwassert(Send(dspTID, debug4, pkstrlen((void*)debug4), rpl, rpllen) >= 0, COM2, "<trainServer>: Debug Statement failed"); 


	while(1){
		msgLen = Receive(&_tid, msg, msgCap);
		switch(msg[0]){
			case TRAINS_GETPROFILEID:
				if(_tid == tr58TID) rpl[0] = 58;
				if(_tid == tr76TID) rpl[0] = 76;
				rpl[1] = 0;
		        	Reply(_tid,rpl, 2); 
				break;

			case COMMAND_RV:
			case COMMAND_LI:
				switch(msg[1]){
					case 58:
						bwassert(Send(tr58TID, msg, 2, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        			Reply(_tid, rpl, 2);
						break;
					case 76:
						bwassert(Send(tr76TID, msg, 2, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        			Reply(_tid, rpl, 2);

						break;
					default:
		        			Reply(_tid, "0", 2); //seriosly, why are you even here?
						break;
				}		
				break;
			case COMMAND_TR:
				switch(msg[2]){
					case 58:
						bwassert(Send(tr58TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        			Reply(_tid, rpl, 2);
						break;
					case 76:
						bwassert(Send(tr76TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        			Reply(_tid, rpl, 2);

						break;
					default:
		        			Reply(_tid, "0", 2); //seriosly, why are you even here?
						break;
				}		
				break;
			default:
					// changed this to a bwassert since bugs were silently passing through here causing me a debugging headache.
					bwassert(0,COM2, "<trainServer> seriosly, why are you even here?");
		        	
				break;
		}
		
	}
}

void trainProfile(){ //will replace trainVelocityServer
	int trainServer = MyParentTid();
	int commandServerTID = WhoIs("commandServer");
	int trNumber = 0;
	int trSpeed = 0;
	int lightFlag = 0;
    	int _tid = -1;

    	char msg[64];
    	int msgCap = 64;
	char rpl[3];
	char rpllen = 3;
	int msgLen = 0;

	msg[0] = TRAINS_GETPROFILEID;
	Send(trainServer, msg, 1, rpl, rpllen);
	trNumber = rpl[0];
	if(!trNumber) Exit();

	while(1){
		msgLen = Receive(&_tid, msg, msgCap);
		switch(msg[0]){
			case COMMAND_LI:
				if(lightFlag) 
					lightFlag = 0;
				else
					lightFlag = 16;

				msg[0] = COMMAND_LI;
				msg[1] = lightFlag + trSpeed;
				msg[2] = trNumber;
				msg[3] = 0;
				bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        	Reply(_tid, rpl, 2);
				break;

			case COMMAND_TR:
				trSpeed = msg[1];
				msg[0] = COMMAND_TR;
				msg[1] = lightFlag + trSpeed;
				msg[2] = trNumber;
				msg[3] = 0;
				bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        	Reply(_tid, rpl, 2);
				break;

			case COMMAND_RV:
				lightFlag =0; //turn it off since it will need to be passed on and i dont have that kindof time
				msg[0] = COMMAND_RV;
				msg[1] = trNumber;
				msg[2] = trSpeed;
				msg[3] = 0;
				bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

				msg[0] = trSpeed;
				msg[1] = rpl[0];
		        	Reply(_tid, msg, 2);

			default:
		        	Reply(_tid, 0, 1); //seriosly, why are you even here?
				break;
		}
		
	}
	Exit();
	

}

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
	int trackTID = Create(3, (void*) trackServer);
	int velTID = Create(2,(void *)trainVelocityServer);
	//keep track of train speeds
	
	int trainSpeed[80];
    int _tid = -1;
    char msg[64];
    int msgCap = 64;

    // need seperate Msg and Rpl buffers just for displaying train sensors.

    char commandMsg[64];
    char rpl[3];
    int rpllen = 3;

	volatile int i=0;
	int msgLen = 0;
	int dspTID = WhoIs("displayServer");
	

	for (i=0; i < 80; i++){
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
	
	msg[0] = TRACK_INITSW;
	msg[1] = 0;

	bwassert(Send(trackTID, msg, 2, rpl, rpllen) >= 0, COM2, "<update switchs>: Updating switches failed."); 
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

	Delay(csTID, 5);
	int train;
	int speed;


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
				msg[0] = TRACK_SS;
				bwassert(Send(trackTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trainServer>: Updating switches failed."); 
				Reply(_tid, "1", 2);
				break;

			case 'I': // is command
				msg[0] = TRACK_IS;
				bwassert(Send(trackTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trainServer>: Updating switches failed."); 
				Reply(_tid, "1", 2);

		        Reply(_tid, "1", 2);

		        break;

			case 'S': //switch

				msg[0] = TRACK_SW;
				bwassert(Send(trackTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trainServer>: Updating switches failed."); 
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

