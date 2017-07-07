#include "ts7200.h"
#include "bwio.h"
#include "server.h"
#include "pkstring.h"
#include "userRequestCall.h"
#include "controller.h"

//#define ALERT_SENSORPING		29
#define SENSOR_RAW_BATCH 1
#define SENSOR_RAW_SINGLE 2
#define SENSOR_COURIER_TO_SENSOR_SERVER 3

#define SENSOR_BIT_MASK_1 0x80
#define SENSOR_BIT_MASK_2 0x40
#define SENSOR_BIT_MASK_3 0x20
#define SENSOR_BIT_MASK_4 0x10
#define SENSOR_BIT_MASK_5 0x08
#define SENSOR_BIT_MASK_6 0x04
#define SENSOR_BIT_MASK_7 0x02
#define SENSOR_BIT_MASK_8 0x01


/*

int getSensorData(char * s){
	//first send two bytes
	int iosTID = WhoIs("UART1R");
	bwassert(iosTID >= 0, COM2, "<getSensorData>: UART1ReceiveServer has not been set up.\r\n");
	int commandTID = WhoIs("commandServer");
	bwassert(commandTID >= 0, COM2, "<getSensorData>: commandServer has not been set up.\r\n");
	char msg[3];
	msg[0] = 'P';
	msg[1] = 0x85;
	msg[2] = 0;
	char rpl[3];
	int rpllen = 3;

	bwassert(Send(commandTID, msg, 3, rpl, rpllen) >= 0, COM2, "<getSensorData>: Polling sensors failed."); //poll sensors
	
	int i = 0;
	char b[10];
	//volatile char b[10];
	
	int counter=0;
	s[counter] = ALERT_SENSORPING;
	counter++;
	for(i = 0; i<10;i++)
		b[i] = Getc(iosTID,COM1); //get char for this module

	for(i = 0; i< 5; i++){
		//volatile char b1 = Getc(iosTID,COM1); //get char for this module

		//volatile char b2 = Getc(iosTID,COM1); //get char for this module
		if (b[i*2] & SENSOR_BIT_MASK_1){ 
			s[counter] = (i * 16) +1;
			counter ++;
	 	}
		if (b[i*2] & SENSOR_BIT_MASK_2){ 
			s[counter] = (i * 16) +2;
			counter ++;
	 	}
		if (b[i*2] & SENSOR_BIT_MASK_3){ 
			s[counter] = (i * 16) +3;
			counter ++;
	 	}
		if (b[i*2] & SENSOR_BIT_MASK_4){ 
			s[counter] = (i * 16) +4;
			counter ++;
	 	}
		if (b[i*2] & SENSOR_BIT_MASK_5){ 
			s[counter] = (i * 16) +5;
			counter ++;
	 	}
		if (b[i*2] & SENSOR_BIT_MASK_6){ 
			s[counter] = (i * 16) +6;
			counter ++;
	 	}
		if (b[i*2] & SENSOR_BIT_MASK_7){ 
			s[counter] = (i * 16) +7;
			counter ++;
	 	}
		if (b[i*2] & SENSOR_BIT_MASK_8){ 
			s[counter] = (i * 16) +8;
			counter ++;
	 	}
		if (b[i*2+1] & SENSOR_BIT_MASK_1){ 
			s[counter] = (i * 16) +9;
			counter ++;
	 	}
		if (b[i*2+1] & SENSOR_BIT_MASK_2){ 
			s[counter] = (i * 16) +10;
			counter ++;
	 	}
		if (b[i*2+1] & SENSOR_BIT_MASK_3){ 
			s[counter] = (i * 16) +11;
			counter ++;
	 	}
		if (b[i*2+1] & SENSOR_BIT_MASK_4){ 
			s[counter] = (i * 16) +12;
			counter ++;
	 	}
		if (b[i*2+1] & SENSOR_BIT_MASK_5){ 
			s[counter] = (i * 16) +13;
			counter ++;
	 	}
		if (b[i*2+1] & SENSOR_BIT_MASK_6){ 
			s[counter] = (i * 16) +14;
			counter ++;
	 	}
		if (b[i*2+1] & SENSOR_BIT_MASK_7){ 
			s[counter] = (i * 16) +15;
			counter ++;
	 	}
		if (b[i*2+1] & SENSOR_BIT_MASK_8){ 
			s[counter] = (i * 16) +16;
			counter ++;
	 	}

	}
	return counter > 1 ? counter : 0;
}

void displaySensors() {
	
	bwassert(!RegisterAs("displaySensors"), COM2, "Failed to register displaySensors.\r\n");
	int parentTID = MyParentTid();
	// a brittle hack to forcefully get the trainServer TID.
	int trainTID = WhoIs("trainServer");
	while (trainTID < 0) {
		Pass();
		trainTID = WhoIs("trainServer");
	}
	char recentSensors[64];
	volatile int i = 0;
	for (; i < 64; i++) recentSensors[i] = 0;
	int recentSensorsLen = 0;


	char rpl[3];
	int rpllen = 3;

	
	//volatile int num = 0;
	while(1)  {
		recentSensorsLen = getSensorData(recentSensors);
		if (recentSensorsLen) {
			bwassert(Send(trainTID, recentSensors, recentSensorsLen, rpl, rpllen) >= 0, COM2, "<getSensorData>: Displaying sensors failed.");
			bwassert(Send(parentTID, recentSensors, recentSensorsLen, rpl, rpllen) >= 0, COM2, "<getSensorData>: Displaying sensors failed."); 
		}
	}

	Exit();

}



*/
typedef struct sensorWarehouseStruct {
//even passing this along a message should take less than 10 microseconds (with go fast button on)
	int  lastSensorTime[80]; //80*4 =320
	char sensorHeld[80]; //80
	int counter; //4
	char recentSensors[81];//81
	//485 bytes
} sensorWarehouseStruct;

typedef struct sensorCourierStruct {
//even passing this along a message should take less than 10 microseconds (with go fast button on)
	char message[4]; //4
	sensorWarehouseStruct sw; //485
	//489 bytes
} sensorCourierStruct;


void sensorServer(){
 //holds sensor database and communicates to outside
	bwassert(!RegisterAs("sensorServer"), COM2, "Failed to register sensorServer.\r\n");

 	sensorWarehouseStruct sw;
 	sensorCourierStruct sc;
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
	sw.recentSensors[0] = ALERT_SENSORPING;
	sw.counter =1;
	int spTID = Create(3,(void *)sensorProcessor);
	bwassert(spTID >= 0, COM2, "<sensorServer>: sensor processor has not been set up.\r\n");
	
	
	
	
	while(1){
		msgLen = Receive(&_tid, msg, msgCap);
		switch(msg[0]){
			case SENSOR_COURIER_TO_SENSOR_SERVER:
		        	Reply(_tid, "1", 2); //recieved go bother the other server
				pkmemcpy((void *) &sc,(void *) msg, sizeof(sensorCourierStruct));//convert message to sensor courier struct
				pkmemcpy((void *) &sw,(void *) &(sc.sw), sizeof(sensorWarehouseStruct));
				//updates libray
				//should reply to courier to display server
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

void sensorNotifier(){
 //polls COM1 for sensor info. Sends data to sensorProcessor();
	int spTID = MyParentTid();
	int iosTID = WhoIs("UART1R");
	bwassert(iosTID >= 0, COM2, "<getSensorData>: UART1ReceiveServer has not been set up.\r\n");
	int commandTID = WhoIs("commandServer");
	bwassert(commandTID >= 0, COM2, "<sensorNotifier>: commandServer has not been set up.\r\n");

	char msg[3]; 
	msg[0] = 'P';
	msg[1] = 0x85;
	msg[2] = 0;
	char rpl[3];
	int i = 0;
	char b[11];
	
	int rpllen = 3;

	while(1){
		bwassert(Send(commandTID, msg, 3, rpl, rpllen) >= 0, COM2, "<sensorNotifier>: Polling sensors failed."); //poll sensors
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
	sw.recentSensors[0] = ALERT_SENSORPING;
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

				for (i=0; i < 80; i++) sw.sensorHeld[i] = 0;
				sw.sensorHeld[msg[1]-1] = 1;
				sw.lastSensorTime[msg[1]-1] = curTime;
				sw.recentSensors[sw.counter] = msg[2];
				sw.counter ++;

				//used on non-track boxes to test status
				if(scWaiting){	
				//should always be true (due to timing)
					//copy 
					pkmemcpy((void *) &(sc.sw),(void *) &sw,sizeof(sensorWarehouseStruct));				
		        		Reply(scTID,(char *) &sc, sizeof(sensorCourierStruct)); //finished updating warehouse struct. send new library to sensor Server (400 bytes...< 10 microseconds).
					scWaiting = 0;
					for (i=0; i < 81; i++) sw.recentSensors[i] = 0;
					sw.recentSensors[0] = ALERT_SENSORPING;
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

					if ((msg[i*2+1] & SENSOR_BIT_MASK_1)&&~sw.sensorHeld[i*16+0]){ 
						sw.recentSensors[sw.counter] = (i * 16) +1;
						sw.counter ++;
						sw.lastSensorTime[i*16+0] = curTime;
					}
					sw.sensorHeld[i*16+0] = msg[i*2+1] & SENSOR_BIT_MASK_1;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_2)&&~sw.sensorHeld[i*16+1]){ 
						sw.recentSensors[sw.counter] = (i * 16) +2;
						sw.counter ++;
						sw.lastSensorTime[i*16+1]= curTime;
					}
					sw.sensorHeld[i*16+1] = msg[i*2+1] & SENSOR_BIT_MASK_2;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_3)&&~sw.sensorHeld[i*16+2]){ 
						sw.recentSensors[sw.counter] = (i * 16) +3;
						sw.counter ++;
						sw.lastSensorTime[i*16+2]= curTime;
					}
					sw.sensorHeld[i*16+2] = msg[i*2+1] & SENSOR_BIT_MASK_3;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_4)&&~sw.sensorHeld[i*16+3]){ 
						sw.recentSensors[sw.counter] = (i * 16) +4;
						sw.counter ++;
						sw.lastSensorTime[i*16+3]= curTime;
					}
					sw.sensorHeld[i*16+3] = msg[i*2+1] & SENSOR_BIT_MASK_4;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_5)&&~sw.sensorHeld[i*16+4]){ 
						sw.recentSensors[sw.counter] = (i * 16) +5;
						sw.counter ++;
						sw.lastSensorTime[i*16+4]= curTime;
					}
					sw.sensorHeld[i*16+4] = msg[i*2+1] & SENSOR_BIT_MASK_5;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_6)&&~sw.sensorHeld[i*16+5]){ 
						sw.recentSensors[sw.counter] = (i * 16) +6;
						sw.counter ++;
						sw.lastSensorTime[i*16+5]= curTime;
					}
					sw.sensorHeld[i*16+5] = msg[i*2+1] & SENSOR_BIT_MASK_6;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_7)&&~sw.sensorHeld[i*16+6]){ 
						sw.recentSensors[sw.counter] = (i * 16) +7;
						sw.counter ++;
						sw.lastSensorTime[i*16+6]= curTime;
					}
					sw.sensorHeld[i*16+6] = msg[i*2+1] & SENSOR_BIT_MASK_7;

					if ((msg[i*2+1] & SENSOR_BIT_MASK_8)&&~sw.sensorHeld[i*16+7]){ 
						sw.recentSensors[sw.counter] = (i * 16) +8;
						sw.counter ++;
						sw.lastSensorTime[i*16+7]= curTime;
					}
					sw.sensorHeld[i*16+7] = msg[i*2+1] & SENSOR_BIT_MASK_8;



					if ((msg[i*2+2] & SENSOR_BIT_MASK_1)&&~sw.sensorHeld[i*16+8]){ 
						sw.recentSensors[sw.counter] = (i * 16) +9;
						sw.counter ++;
						sw.lastSensorTime[i*16+8]= curTime;
					}
					sw.sensorHeld[i*16+8] = msg[i*2+2] & SENSOR_BIT_MASK_1;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_2)&&~sw.sensorHeld[i*16+9]){ 
						sw.recentSensors[sw.counter] = (i * 16) +10;
						sw.counter ++;
						sw.lastSensorTime[i*16+9]= curTime;
					}
					sw.sensorHeld[i*16+9] = msg[i*2+2] & SENSOR_BIT_MASK_2;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_3)&&~sw.sensorHeld[i*16+10]){ 
						sw.recentSensors[sw.counter] = (i * 16) +11;
						sw.counter ++;
						sw.lastSensorTime[i*16+10]= curTime;
					}
					sw.sensorHeld[i*16+10] = msg[i*2+2] & SENSOR_BIT_MASK_3;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_4)&&~sw.sensorHeld[i*16+11]){ 
						sw.recentSensors[sw.counter] = (i * 16) +12;
						sw.counter ++;
						sw.lastSensorTime[i*16+11]= curTime;
					}
					sw.sensorHeld[i*16+11] = msg[i*2+2] & SENSOR_BIT_MASK_4;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_5)&&~sw.sensorHeld[i*16+12]){ 
						sw.recentSensors[sw.counter] = (i * 16) +13;
						sw.counter ++;
						sw.lastSensorTime[i*16+12]= curTime;
					}
					sw.sensorHeld[i*16+12] = msg[i*2+2] & SENSOR_BIT_MASK_5;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_6)&&~sw.sensorHeld[i*16+13]){ 
						sw.recentSensors[sw.counter] = (i * 16) +14;
						sw.counter ++;
						sw.lastSensorTime[i*16+13]= curTime;
					}
					sw.sensorHeld[i*16+13] = msg[i*2+2] & SENSOR_BIT_MASK_6;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_7)&&~sw.sensorHeld[i*16+14]){ 
						sw.recentSensors[sw.counter] = (i * 16) +15;
						sw.counter ++;
						sw.lastSensorTime[i*16+14]= curTime;
					}
					sw.sensorHeld[i*16+14] = msg[i*2+2] & SENSOR_BIT_MASK_7;

					if ((msg[i*2+2] & SENSOR_BIT_MASK_8)&&~sw.sensorHeld[i*16+15]){ 
						sw.recentSensors[sw.counter] = (i * 16) +16;
						sw.counter ++;
						sw.lastSensorTime[i*16+15]= curTime;
					}
					sw.sensorHeld[i*16+15] = msg[i*2+2] & SENSOR_BIT_MASK_8;

				
				}
				if(scWaiting){
					pkmemcpy((void *) &(sc.sw), (void *) &sw,sizeof(sensorWarehouseStruct));			
		        		Reply(scTID, (char *) &sc, sizeof(sensorCourierStruct)); //finished updating warehouse struct. send new library to sensor Server (400 bytes...< 10 microseconds).
					scWaiting = 0;
					for (i=0; i < 81; i++) sw.recentSensors[i] = 0;
					sw.recentSensors[0] = ALERT_SENSORPING;
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
 


