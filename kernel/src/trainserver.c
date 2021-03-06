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


//Please stop moving local macro's out of this c file. non-local exposed macros go to controller.h or an agreed apon macro header file
//trainserver/sensorserver c files tell what are possible entires for each server with exposed or duplicate functions commented
//out and refrenced where to find macro.

//train server codes
#define TRAINS_GETPROFILEID 1
//#define COMMAND_TR 13 //set train speed   (controller)
//#define COMMAND_LI  14 //turn on lights    (controller)
//#define COMMAND_RV 12 //reverse train (controller)
//#define COMMAND_IS	22 //Init at sensor "IS <TR> <SEN>" (controller)
//#define TRACK_GETNEXTSENSOR  7//reverse train (controller) //remove when moved to trackserver

//train profile codes
#define TRAIN_WORKER_READY 1
#define TRAIN_WORKER_IS_REPLY 2
#define TRAIN_WORKER_IS_REPLY2 5 //depreciate when done
#define TRAIN_WORKER_VELOCITY_REPLY 3
#define TRAIN_WORKER_VELOCITY_REPLY2 6 //depreciate when done
//#define COMMAND_TR 13 //set train speed   (controller)
//#define COMMAND_LI  14 //turn on lights    (controller)
//#define COMMAND_IS	22 //Init at sensor "IS <TR> <SEN>" (controller)
//#define COMMAND_RV 12 //reverse train (controller)
//#define COMMAND_TRBATCH 39 (controller)
#define TRAIN_TIMER_PING 4

//train Worker codes
#define TRAIN_WORKER_IS_SENSOR 1
#define TRAIN_WORKER_VELOCITY_SENSOR 2


#define TRAIN_CREW_COUNT 5 //be conservative

int trainPrintLocation(int train){
	if(train == 58) return 6;
	else if(train ==69) return 13;
	else if(train ==70) return 20;
	else if(train ==71) return 27;
	else return 34;
	
}

void printTrainDiagnostics(int dspTID,int train, int lost, int velocity, int lastSensor, int deltaTime){
	 iodebug(dspTID,"D6\033[%d;53HTR# %2d",trainPrintLocation(train),train);
	 iodebug(dspTID,"D6\033[%d;53HLost[%d]",trainPrintLocation(train)+1,lost);
	 if(!lost){
	 	iodebug(dspTID,"D6\033[%d;53Hsens :%d",trainPrintLocation(train)+2,lastSensor);
	 	iodebug(dspTID,"D6\033[%10d;53Hvel  :%d",trainPrintLocation(train)+3,velocity);
	 	iodebug(dspTID,"D6\033[%10d;53HdTime:%d",trainPrintLocation(train)+4,deltaTime);
	 	iodebug(dspTID,"D6\033[%10d;53HdDist:%d",trainPrintLocation(train)+5,(velocity * deltaTime *10)/1000);
	 }
}


void initTrains(int csTID, int commandServerTID, int dspTID, int trackServerTID){
    	char msg[64];
    	char rpl[3];
    	int rpllen = 3;

	int i =0;
	for (i=57; i < 80; i++){
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


	//init switches

	msg[0] = TRACK_INITSW;
	msg[1] = 0;
	bwassert(Send(trackServerTID, msg, 2, rpl, rpllen) >= 0, COM2, "<initTrains>: Displaying switches failed."); 

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

 	initTrains(csTID,commandServerTID, dspTID, trackTID);

	int tr58TID = Create(5,(void *)trainProfile);
	int tr71TID = Create(5,(void *)trainProfile);
	int tr70TID = Create(5,(void *)trainProfile);
	int tr69TID = Create(5,(void *)trainProfile);

	while(1){
		msgLen = Receive(&_tid, msg, msgCap);
		switch(msg[0]){
			case TRAINS_GETPROFILEID:
				if(_tid == tr58TID) rpl[0] = 58;
				if(_tid == tr71TID) rpl[0] = 71;
				if(_tid == tr69TID) rpl[0] = 69;
				if(_tid == tr70TID) rpl[0] = 70;
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
					case 71:
						bwassert(Send(tr71TID, msg, 2, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        			Reply(_tid, rpl, 2);

						break;
					case 70:
						bwassert(Send(tr70TID, msg, 2, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        			Reply(_tid, rpl, 2);

						break;
					case 69:
						bwassert(Send(tr69TID, msg, 2, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
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
					case 71:
						bwassert(Send(tr71TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
				Reply(_tid, rpl, 2);
						break;
					case 70:
						bwassert(Send(tr70TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
				Reply(_tid, rpl, 2);
						break;
					case 69:
						bwassert(Send(tr69TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
				Reply(_tid, rpl, 2);


						break;
					default:
						break;
				}		
				break;

			case COMMAND_TRBATCH:
				// initialization of trbatch code. Add here for all initializations to be performed.
				msg[0] = COMMAND_TRBATCH;
				bwassert(Send(tr70TID, msg, 1, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
				Delay(csTID,54);
				msg[0] = COMMAND_TR;
				msg[1] = 12;
				msg[2] = 58;
				msg[3] = 0;



				bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");  

				// Delay(csTID,54);
				// msg[0] = COMMAND_TRBATCH;
				// bwassert(Send(tr71TID, msg, 1, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");     	

				Reply(_tid, rpl, 2);

				break;


			case COMMAND_IS:
				switch(msg[1]){
					case 58:
		        			Reply(_tid, "1", 2);
						bwassert(Send(tr58TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
						break;
					case 71:
		        			Reply(_tid, "1", 2);
						bwassert(Send(tr71TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

						break;

					case 70:
		        			Reply(_tid, "1", 2);
						bwassert(Send(tr70TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

						break;

					case 69:
		        			Reply(_tid, "1", 2);
						bwassert(Send(tr69TID, msg, 3, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

						break;
					default:
		        			Reply(_tid, "0", 2); //seriosly, why are you even here?
						break;
				}		
				break;

				break;

			default:
					// changed this to a bwassert since bugs were silently passing through here causing me a debugging headache.
					bwassert(0,COM2, "<trainServer> INVALIDE CASE [%d] seriosly, why are you even here?",msg[0]);
		        	
				break;
		}
		
	}
}

int max(int val1, int val2){
	if(val1 >= val2)
		return val1;
	else
		return val2;
}

void trainProfile(){ //will replace trainVelocityServer
	int tsTID = MyParentTid();
	int commandServerTID = WhoIs("commandServer");
	int trNumber = 0;

    	int _tid = -1;
    	char msg[64];
    	int msgCap = 64;
	char rpl[64];
	char rpllen = 64;
	int msgLen = 0;
	int occilate = 0;
	
	msg[0] = TRAINS_GETPROFILEID;
	Send(tsTID, msg, 1, rpl, rpllen);
	trNumber = rpl[0];
	if(!trNumber) Exit();
	int speed =0;
	int trTimerTID = Create(3,(void *) occilationTimer);
	ocilStruct oci;
	while(1){
		msgLen = Receive(&_tid, msg, msgCap);
		switch(msg[0]){
			case TRAIN_TIMER_PING:
				if(occilate){
					if(trNumber == 70){
						//at 15:1 we got about  5 minutes collide????
						//at 15:2 we got about  minutes derail collide????
						//at 13:1 we got about  5 min  collide????
						//at 26:2 we got about  8 min  collide????
						//at 24:2 we got about  8 min  collide????
						oci.trNumber = trNumber;
						oci.speed1 = 10; //9
						oci.speed2 = 8;
						oci.time1 = 97;
						oci.time2 = 96;
						Reply(trTimerTID,(char *)&oci,sizeof(ocilStruct)); //remind me in 6 ticks

					}else if(trNumber == 71){
						oci.trNumber = trNumber;
						oci.speed1 = 13;
						oci.speed2 = 11;
						oci.time1 = 102;
						oci.time2 = 98;
						Reply(trTimerTID,(char *)&oci,sizeof(ocilStruct)); //remind me in 6 ticks
					}
				}else{
					msg[0] = COMMAND_TR;
					msg[1] = speed;
					msg[2] = trNumber;
					msg[3] = 0;
					bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");		        	
					//send speed command;
				}
				break;
			case COMMAND_TR:
				speed = msg[1];
				if(occilate){
					occilate = 0;
					Reply(_tid, "1", 2);
				}
				else{
					bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");		        	
					Reply(_tid, rpl, 2);
					//send speed command;
				}
				break;
			case COMMAND_TRBATCH:
					Reply(_tid, "1", 2);
					occilate = 1;
					if(trNumber == 70){
						oci.trNumber = trNumber;
						oci.speed1 = 14;
						oci.speed2 = 14;
						oci.time1 = 55;
						oci.time2 = 6;
						Reply(trTimerTID,(char *)&oci,sizeof(ocilStruct)); //remind me in 6 ticks
					}else if(trNumber == 71){

						oci.trNumber = trNumber;
						oci.speed1 = 14;
						oci.speed2 = 14;
						oci.time1 = 51;
						oci.time2 = 49;

						Reply(trTimerTID,(char *)&oci,sizeof(ocilStruct)); //remind me in 6 ticks
					}
				//send to train_timer_PING
				break;
			default:
				break;
			}
	}
				

	
}

void occilationTimer(){
//all it does is poll parent  train profile once every 60 ms. mainly used to timeout tests;
	int csTID = WhoIs("clockServer");
	int trTID = MyParentTid();
	int commandServerTID = WhoIs("commandServer");
	int dspTID = WhoIs("displayServer");
	ocilStruct oci;
   	char msg[64];
	char rpl[64];
	char rpllen = 64;
	int speed1 =0;
	int speed2 =0;
	int time1 =0;
	int time2 =0;
	int trNumber =0;

	while(1){
		msg[0] = TRAIN_TIMER_PING;
		Send(trTID, msg, 1, (char *) &oci, sizeof(ocilStruct));
		trNumber = oci.trNumber;;
		speed1 = oci.speed1;
		speed2 = oci.speed2;
		time1 = oci.time1;
		time2 = oci.time2;

	 iodebug(dspTID,"D7train %d speed1:%d speed2:%d time1:%d time2:%d",trNumber, speed1, speed2, time1, time2);
		msg[0] = COMMAND_TR;
		msg[1] = speed1;
		msg[2] = trNumber;
		msg[3] = 0;
		bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");		        	
		Delay(csTID,time1);
		msg[0] = COMMAND_TR;
		msg[1] = speed2+16;
		msg[2] = trNumber;
		msg[3] = 0;
		bwassert(Send(commandServerTID, msg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");		        	
		Delay(csTID,time2);


		//always be in faster speed when next speed is requested



	

	}
	Exit();
}


void trainTimer(){
//all it does is poll parent  train profile once every 60 ms. mainly used to timeout tests;
	int csTID = WhoIs("clockServer");
	int trTID = MyParentTid();

   	char msg[64];
	char rpl[64];
	char rpllen = 64;


	while(1){
		Delay(csTID,6);
		msg[0] = TRAIN_TIMER_PING;
		Send(trTID, msg, 1, rpl, rpllen);
	}
	Exit();
}

void initTrainWorker(trainWorkerListItem * workerList){
	int dspTID = WhoIs("displayServer"); //used for debugging
	int i;
	for(i =0; i< TRAIN_CREW_COUNT; i++){
		workerList[i].taskStatus = WORKER_INIT;	
		workerList[i].tid = Create(17, (void *) trainWorker); 
	}

}


int trainWorkerIndex(trainWorkerListItem * workerList, int tid){
	int dspTID = WhoIs("displayServer"); //used for debugging
	int i;
	for(i =0; i< TRAIN_CREW_COUNT; i++){
		if(workerList[i].tid == tid){
			 return i;
		}
	}
	return -1;

}


int setTrainWorkerStatus(trainWorkerListItem * workerList, int tid, int taskStatus){
	int i;
	for(i =0; i< TRAIN_CREW_COUNT; i++){
		if(workerList[i].tid == tid){
			workerList[i].taskStatus = taskStatus;
			 return 0;
		}
	}
	return -1;

}
int nextFreeTrainWorker(trainWorkerListItem * workerList){
	int i;
	for(i =0; i< TRAIN_CREW_COUNT; i++){
		if(workerList[i].taskStatus == WORKER_READY){
			 return workerList[i].tid;
		}
	}
	return -1;
}

void trainWorker(){ 
	int trTID = MyParentTid(); //train associated with this worker
	int dspTID = WhoIs("displayServer"); //used for debugging
	int ssTID = WhoIs("sensorServer");//used for sensor quering
	int csTID = WhoIs("clockServer");//used for delaying
    	char msg[64];
    	int msgCap = 64;
	char rpl[64];
	char rpllen = 64;
	int msgLen = 0;

	int sensorE;
	int sensorF;
	int sensorS;
	sensorCurrentStatusStruct scs;
	trainWorkerSensorReportStruct tws;
	trainWorkerSensorTask twst;
	int first_sensorTime;
	int poll_limit =0;
	int trainTask;
	int taskStatus;
	int expectedTime =0;
	
	msg[0] = TRAIN_WORKER_READY;
	Send(trTID, msg, 1, rpl, rpllen);
	while(1){
		switch(rpl[0]){ //jobs...don't return till job is finished
			case TRAIN_WORKER_VELOCITY_SENSOR:
				sensorE = rpl[1];
				sensorF = rpl[2];
				sensorS = rpl[3];
				trainTask = rpl[4];
				taskStatus = rpl[5];

				msg[0] = SENSOR_REGISTER_WORKER;
				msg[1] = sensorE;
				msg[2] = sensorF;
				msg[3] = sensorS;
				Send(ssTID, msg, 4,(char *) &scs, sizeof(sensorCurrentStatusStruct));

	//iodebug(dspTID,)		
				if(scs.sensor == sensorE){
					tws.taskStatus = WORKER_VELE;
					tws.sensor = sensorE;
				}
				else if(scs.sensor == sensorF){
					tws.taskStatus = WORKER_VELF;
					tws.sensor = sensorF;
					tws.sensor = scs.sensor;
				}
				else{
					tws.taskStatus = WORKER_VELS;
					tws.sensor = sensorS;
				}

				tws.trainTask = trainTask;
				tws.message[0] = TRAIN_WORKER_VELOCITY_REPLY;
				tws.error = scs.taskStatus;
				tws.lastSensorTime =scs.lastSensorTime;

				Send(trTID, (char *)&tws, sizeof(trainWorkerSensorReportStruct), rpl, rpllen);
				break;
			case TRAIN_WORKER_IS_SENSOR:
				sensorE = rpl[1];
				trainTask = rpl[2];
				taskStatus = rpl[3];
				msg[0] = SENSOR_REGISTER_WORKER;
				msg[1] = sensorE;
				msg[2] = 0;
				msg[3] = 0;
				Send(ssTID, msg, 4,(char *) &scs, sizeof(sensorCurrentStatusStruct));

				tws.taskStatus = taskStatus;
				tws.trainTask = trainTask;
				tws.message[0] = TRAIN_WORKER_IS_REPLY;
				tws.sensor = sensorE;

				tws.error = scs.taskStatus;
				tws.lastSensorTime =scs.lastSensorTime;

				Send(trTID, (char *)&tws, sizeof(trainWorkerSensorReportStruct), rpl, rpllen);
				//when return we will be at top of loop with new task in rpl,rplen
				//thus there is no intermediate step to send TRAIN_WORKER_READY, as train already holds the lock on worker.
				break;
			default:
                      
				msg[0] = TRAIN_WORKER_READY;
				Send(trTID, msg, 1, rpl, rpllen);
				break;
		}
	}
	Exit();
	

}

/////////////////////////////////////////////
//
//	HERE BE DRAGONS AND DINOSAURS WAITING FOR EXTINCTION
//
//////////////////////////////////////////

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

