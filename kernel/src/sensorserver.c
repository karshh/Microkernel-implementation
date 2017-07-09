#include "ts7200.h"
#include "bwio.h"
#include "server.h"
#include "pkstring.h"
#include "userRequestCall.h"
#include "controller.h"


void sensorServer(){
 //holds sensor database and communicates to outside
	bwassert(!RegisterAs("sensorServer"), COM2, "Failed to register sensorServer.\r\n");

 	sensorWarehouseStruct sw;
 	sensorCourierStruct sc;
	int dcTID = Create(3,(void *)sensorDisplayCourier); 
	bwassert(dcTID >= 0, COM2, "<sensorServer>: sensor to display courier has not been set up.\r\n");
	int dcWaiting =0;
	char msg[512];
    	int msgCap = 512;
	int msgLen;

    	int _tid = -1;
	int i =0;
	for(i = 0; i< 80;i++){
		//init sensor library data
		sw.sensorHeld[i] =0;
		sw.lastSensorTime[i] =0;
	}
	//init recent sensors
	for (i=0; i < 81; i++) sw.recentSensors[i] = 0;
	sw.recentSensors[0] =0;
	sw.counter =1;
	int spTID = Create(3,(void *)sensorProcessor);
	bwassert(spTID >= 0, COM2, "<sensorServer>: sensor processor has not been set up.\r\n");
	
	
	
	
	while(1){
		msgLen = Receive(&_tid, msg, msgCap);
		switch(msg[0]){
			case SENSOR_COURIER_TO_DISPLAY_SERVER:
				dcWaiting = 1;
				break;

			case SENSOR_COURIER_TO_SENSOR_SERVER:
		        	Reply(_tid, "1", 2); //recieved go bother the other server
				pkmemcpy((void *) &sc,(void *) msg, sizeof(sensorCourierStruct));//convert message to sensor courier struct
				pkmemcpy((void *) &sw,(void *) &(sc.sw), sizeof(sensorWarehouseStruct));
				//updates libray
				//should reply to courier to display server
				if(dcWaiting && sw.counter > 1){
		        		Reply(dcTID, sw.recentSensors, sw.counter); //finished synching libary. send recent sensor report to display server.
					dcWaiting = 0;
					
				}

				break;
			default:
		        	Reply(_tid, "0", 2); //seriosly, why are you even here?
				break;
		}

	}

	Exit();
}

void sensorCourier(){
//passes data from sensorProcessor and sensor Server;
	int spTID = MyParentTid(); //sensor processor
	int ssTID = WhoIs("sensorServer");
	sensorCourierStruct sc;
	char rpl[3];
	int rpllen = 3;
	char msg[2];
	msg[0] = SENSOR_COURIER_TO_SENSOR_SERVER;
	msg[1] = 0;

	while(1){
		//wait on sensor processor, and get sensor library
		bwassert(Send(spTID, msg, 2,(char *) &sc, sizeof(sensorCourierStruct)) >= 0, COM2, "<sensorCourier>: Getting sensor libray from sensor processor failed."); //poll sensors
		bwassert(Send(ssTID,(char*) &sc, sizeof(sensorCourierStruct),rpl,rpllen) >= 0, COM2, "<sensorCourier>: SSending sensor library to sensor server failed."); //poll sensors
	}
	Exit();
}


void sensorDisplayCourier(){
//passes data from sensorProcessor and sensor Server;
	int ssTID = MyParentTid(); //sensor processor
	int dspTID = WhoIs("displayServer");
	char recentSensors[81];//81
	char rpl[3];
	int rpllen = 3;
	char msg[2];
	int recentSensorsLen = 0;
	msg[0] = SENSOR_COURIER_TO_DISPLAY_SERVER;
	msg[1] = 0;

	while(1){
		//wait on sor processor, and get sensor library
		bwassert(Send(ssTID, msg, 2,recentSensors, 81) >= 0, COM2, "<sensorDisplayCourier>: Getting recenent sensor list from sensor processor failed."); //poll sensors
		recentSensorsLen = recentSensors[0];
		recentSensors[0] = TRACK_SENSORUPDATE;
		bwassert(Send(dspTID,recentSensors, recentSensorsLen,rpl,rpllen) >= 0, COM2, "<sensorDisplayCourier>: Sending sensor recent sensor list to display sensor server failed."); //poll sensors
	}
	Exit();
}


void sensorNotifier(){
 //polls COM1 for sensor info. Sends data to sensorProcessor();
	int spTID = MyParentTid();
	int iosTID = WhoIs("UART1R");
	bwassert(iosTID >= 0, COM2, "<getSensorData>: UART1ReceiveServer has not been set up.\r\n");
	int commandTID = WhoIs("commandServer");
	bwassert(commandTID >= 0, COM2, "<sensorNotifier>: commandServer has not been set up.\r\n");

	char msg[2]; 
	msg[0] = COMMAND_PN;
	char rpl[3];
	int i = 0;
	char b[11];
	
	int rpllen = 3;

	while(1){
		bwassert(Send(commandTID, msg, 1, rpl, rpllen) >= 0, COM2, "<sensorNotifier>: Polling sensors failed."); //poll sensors
		b[0] = SENSOR_RAW_BATCH;
		for(i = 0; i<10;i++)
		b[i+1] = Getc(iosTID,COM1); //get char for this module
		
		//i can do processing or just send raw data.
		// if i send raw data, less time wasted by sensorNotifier processing
		//more time polling next sensor. let processor function handle the work.
		bwassert(Send(spTID, b, 11, rpl, rpllen) >= 0, COM2, "<sensorNotifier>: Sending raw sensor batch data failed."); //poll sensors
	}

	Exit();
}


void sensorProcessor(){ 
//gets raw info from Terminal/Notifier, processes it and sends it to Sensor Server
	bwassert(!RegisterAs("sensorProcessor"), COM2, "Failed to register sensorProcessor.\r\n");
	int scTID = Create(3,(void *)sensorCourier); 
	bwassert(scTID >= 0, COM2, "<sensorServer>: sensor courier has not been set up.\r\n");
	int scWaiting =0;
	int snTID = Create(3,(void *)sensorNotifier); 
	bwassert(snTID >= 0, COM2, "<sensorServer>: sensor notifier has not been set up.\r\n");
	int csTID = WhoIs("clockServer");
    	int _tid = -1;
    	char msg[11];
    	int msgCap = 11;
	int curTime =0;
	int msgLen;

 	sensorWarehouseStruct sw;
	sensorCourierStruct sc;
	int i =0;
	for(i = 0; i< 80;i++){
		//init sensor library data
		sw.sensorHeld[i] =0;
		sw.lastSensorTime[i] =0;
	}
	//init recent sensors
	
	for (i=0; i < 81; i++) sw.recentSensors[i] = 0;
	sw.recentSensors[0] = 0;
	sw.counter =1;
	sc.message[0] = SENSOR_COURIER_TO_SENSOR_SERVER;

	while(1){
		msgLen = Receive(&_tid, msg, msgCap);
		switch(msg[0]){
			case SENSOR_COURIER_TO_SENSOR_SERVER:
				scWaiting = 1;
				//waits till next sensor ping. anything missed is missed. (should not be a problem cause)
				//Since sensor courier messages should be quick (immideate replies) and input are long (60 ms for batch)
				//or longer for single sensors, couriers should almost always be in replyblock
				break;

			case SENSOR_RAW_SINGLE:
				//used normally
		        	Reply(_tid, "1", 2);
				// 0 = type, 1 = sensored pinged
				curTime = Time(csTID);	
				if(!sw.sensorHeld[msg[1]-1]) {
					sw.lastSensorTime[msg[1]-1] = curTime;
					sw.recentSensors[sw.counter] = msg[1];
					sw.counter ++;
				}
				for (i=0; i < 80; i++) sw.sensorHeld[i] = 0;
				sw.sensorHeld[msg[1]-1] = 1;

				//used on non-track boxes to test status
				if(scWaiting && sw.counter > 1){	
				//should always be true (due to timing)
					//copy 
					sw.recentSensors[0] = sw.counter;
					pkmemcpy((void *) &(sc.sw),(void *) &sw,sizeof(sensorWarehouseStruct));				
		        		Reply(scTID,(char *) &sc, sizeof(sensorCourierStruct)); //finished updating warehouse struct. send new library to sensor Server (400 bytes...< 10 microseconds).
					scWaiting = 0;
					for (i=0; i < 81; i++) sw.recentSensors[i] = 0;
					sw.recentSensors[0] = 0;
					sw.counter = 1;
				}
				break;


			case SENSOR_RAW_BATCH:
				//used normally
		        	Reply(_tid, "1", 2);
				//gor 10 bytes of raw sensor information. timne to process
				curTime = Time(csTID);	
				for(i = 0; i< 5; i++){
					//for each module, update time (if sensor was not held in last report)
					//update new recent sensors list
					//only update time if it wasnt' held in last report but is now tirggered
					//so last time is not updated if sensor is held down , and will only records the first
					//time its hit before untriggers

					if ((msg[i*2+1] & SENSOR_BIT_MASK_1)&&!sw.sensorHeld[i*16+0]){ 
						sw.recentSensors[sw.counter] = (i * 16) +1;
						sw.counter ++;
						sw.lastSensorTime[i*16+0] = curTime;
					}
					sw.sensorHeld[i*16+0] = (msg[i*2+1] & SENSOR_BIT_MASK_1) > 0 ? 1:0;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_2)&&!sw.sensorHeld[i*16+1]){ 
						sw.recentSensors[sw.counter] = (i * 16) +2;
						sw.counter ++;
						sw.lastSensorTime[i*16+1]= curTime;
					}
					sw.sensorHeld[i*16+1] = (msg[i*2+1] & SENSOR_BIT_MASK_2) > 0 ? 1:0;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_3)&&!sw.sensorHeld[i*16+2]){ 
						sw.recentSensors[sw.counter] = (i * 16) +3;
						sw.counter ++;
						sw.lastSensorTime[i*16+2]= curTime;
					}
					sw.sensorHeld[i*16+2] = (msg[i*2+1] & SENSOR_BIT_MASK_3) > 0 ? 1:0;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_4)&&!sw.sensorHeld[i*16+3]){ 
						sw.recentSensors[sw.counter] = (i * 16) +4;
						sw.counter ++;
						sw.lastSensorTime[i*16+3]= curTime;
					}
					sw.sensorHeld[i*16+3] = (msg[i*2+1] & SENSOR_BIT_MASK_4) > 0 ? 1:0;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_5)&&!sw.sensorHeld[i*16+4]){ 
						sw.recentSensors[sw.counter] = (i * 16) +5;
						sw.counter ++;
						sw.lastSensorTime[i*16+4]= curTime;
					}
					sw.sensorHeld[i*16+4] = (msg[i*2+1] & SENSOR_BIT_MASK_5) > 0 ? 1:0;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_6)&&!sw.sensorHeld[i*16+5]){ 
						sw.recentSensors[sw.counter] = (i * 16) +6;
						sw.counter ++;
						sw.lastSensorTime[i*16+5]= curTime;
					}
					sw.sensorHeld[i*16+5] = (msg[i*2+1] & SENSOR_BIT_MASK_6) > 0 ? 1:0;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_7)&&!sw.sensorHeld[i*16+6]){ 
						sw.recentSensors[sw.counter] = (i * 16) +7;
						sw.counter ++;
						sw.lastSensorTime[i*16+6]= curTime;
					}
					sw.sensorHeld[i*16+6] = (msg[i*2+1] & SENSOR_BIT_MASK_7) > 0 ? 1:0;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_8)&&!sw.sensorHeld[i*16+7]){ 
						sw.recentSensors[sw.counter] = (i * 16) +8;
						sw.counter ++;
						sw.lastSensorTime[i*16+7]= curTime;
					}
					sw.sensorHeld[i*16+7] = (msg[i*2+1] & SENSOR_BIT_MASK_8) > 0 ? 1:0;



					if ((msg[i*2+2] & SENSOR_BIT_MASK_1)&&!sw.sensorHeld[i*16+8]){ 
						sw.recentSensors[sw.counter] = (i * 16) +9;
						sw.counter ++;
						sw.lastSensorTime[i*16+8]= curTime;
					}
					sw.sensorHeld[i*16+8] = (msg[i*2+2] & SENSOR_BIT_MASK_1) > 0 ? 1:0;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_2)&&!sw.sensorHeld[i*16+9]){ 
						sw.recentSensors[sw.counter] = (i * 16) +10;
						sw.counter ++;
						sw.lastSensorTime[i*16+9]= curTime;
					}
					sw.sensorHeld[i*16+9] = (msg[i*2+2] & SENSOR_BIT_MASK_2) > 0 ? 1:0;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_3)&&!sw.sensorHeld[i*16+10]){ 
						sw.recentSensors[sw.counter] = (i * 16) +11;
						sw.counter ++;
						sw.lastSensorTime[i*16+10]= curTime;
					}
					sw.sensorHeld[i*16+10] = (msg[i*2+2] & SENSOR_BIT_MASK_3) > 0 ? 1:0;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_4)&&!sw.sensorHeld[i*16+11]){ 
						sw.recentSensors[sw.counter] = (i * 16) +12;
						sw.counter ++;
						sw.lastSensorTime[i*16+11]= curTime;
					}
					sw.sensorHeld[i*16+11] = (msg[i*2+2] & SENSOR_BIT_MASK_4) > 0 ? 1:0;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_5)&&!sw.sensorHeld[i*16+12]){ 
						sw.recentSensors[sw.counter] = (i * 16) +13;
						sw.counter ++;
						sw.lastSensorTime[i*16+12]= curTime;
					}
					sw.sensorHeld[i*16+12] = (msg[i*2+2] & SENSOR_BIT_MASK_5) > 0 ? 1:0;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_6)&&!sw.sensorHeld[i*16+13]){ 
						sw.recentSensors[sw.counter] = (i * 16) +14;
						sw.counter ++;
						sw.lastSensorTime[i*16+13]= curTime;
					}
					sw.sensorHeld[i*16+13] = (msg[i*2+2] & SENSOR_BIT_MASK_6) > 0 ? 1:0;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_7)&&!sw.sensorHeld[i*16+14]){ 
						sw.recentSensors[sw.counter] = (i * 16) +15;
						sw.counter ++;
						sw.lastSensorTime[i*16+14]= curTime;
					}
					sw.sensorHeld[i*16+14] = (msg[i*2+2] & SENSOR_BIT_MASK_7) > 0 ? 1:0;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_8)&&!sw.sensorHeld[i*16+15]){ 
						sw.recentSensors[sw.counter] = (i * 16) +16;
						sw.counter ++;
						sw.lastSensorTime[i*16+15]= curTime;
					}
					sw.sensorHeld[i*16+15] = (msg[i*2+2] & SENSOR_BIT_MASK_8) > 0 ? 1:0;

				
				}
				if(scWaiting){
					sw.recentSensors[0] = sw.counter;
					pkmemcpy((void *) &(sc.sw), (void *) &sw,sizeof(sensorWarehouseStruct));			
		        		Reply(scTID, (char *) &sc, sizeof(sensorCourierStruct)); //finished updating warehouse struct. send new library to sensor Server (400 bytes...< 10 microseconds).
					scWaiting = 0;
					for (i=0; i < 81; i++) sw.recentSensors[i] = 0;
					sw.recentSensors[0] = 0;
					sw.counter = 1;
				}
				break;
			default:
		        	Reply(_tid, "0", 2); //seriosly, why are you even here?
				break;
		}

	}

	Exit();
}
 


