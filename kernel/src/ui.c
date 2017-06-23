#include "ts7200.h"
#include "time.h"
#include "userRequestCall.h"
#include "server.h"
#include "controller.h"
#include "ui.h"

#define SENSOR_BIT_MASK_1 0x80
#define SENSOR_BIT_MASK_2 0x40
#define SENSOR_BIT_MASK_3 0x20
#define SENSOR_BIT_MASK_4 0x10
#define SENSOR_BIT_MASK_5 0x08
#define SENSOR_BIT_MASK_6 0x04
#define SENSOR_BIT_MASK_7 0x02
#define SENSOR_BIT_MASK_8 0x01



void displayGrid() {

    int iosTID = WhoIs("UART2S");
	bwassert(iosTID >= 0, COM2, "<displayGrid>: IOServer has not been set up.\r\n");
    
    // since this is the first function called, clear the damn screen!
    Printf(iosTID, COM2, "\033[2J");
    
	// drawing borders
    volatile int j = 2;
    Printf(iosTID, COM2, "\033[2;1H");   
    for (; j < 136; j++) { 
    	Printf(iosTID, COM2, "_"); 
    }

    Printf(iosTID, COM2, "\033[5;1H");   
    for (j = 5; j < 46; j++) { 
    	Printf(iosTID, COM2, "="); 
    }

    Printf(iosTID, COM2, "\033[28;1H");   

    for (j = 5; j < 139; j++) { 
    	Printf(iosTID, COM2, "_");
    }

	volatile int i = 3;
	for (; i <= 28; i++) {
		Printf(iosTID, COM2, "\033[%d;1H|", i);
		Printf(iosTID, COM2, "\033[%d;12H|", i);
		Printf(iosTID, COM2, "\033[%d;24H|", i);
		Printf(iosTID, COM2, "\033[%d;41H|", i);
		Printf(iosTID, COM2, "\033[%d;84H|", i);
		Printf(iosTID, COM2, "\033[%d;134H|", i);
	}

	// sensor graph.

	displayTrack();

	// table headers
	Printf(iosTID, COM2,  "\033[3;4HSwitch\033[4;3HPosition");
    for (i = 4; i < 13; i++) {
        Printf(iosTID, COM2,"\033[%d;2H00%d", i+2, i-3);
        Printf(iosTID, COM2,"\033[%d;26H%d: ", i+2, i+54);
    }
    for (; i < 22; i++) {
        Printf(iosTID, COM2,"\033[%d;2H0%d", i+2, i-3);
        Printf(iosTID, COM2,"\033[%d;26H%d: ", i+2, i+54);
    }
    Printf(iosTID, COM2,"\033[%d;26H%d: ", i+2, i+54);
    Printf(iosTID, COM2,"\033[%d;26H%d: ", i+3, i+55);
    Printf(iosTID, COM2,"\033[%d;26H%d: ", i+4, i+56);
    Printf(iosTID, COM2,"\033[%d;26H%d: ", i+5, i+57);
    for (; i < 26; i++) {
        Printf(iosTID, COM2,"\033[%d;2H%d", i+2, i+131);
    }
        
	Printf(iosTID, COM2, "\033[3;15HSensor\033[4;14HTriggers");
	Printf(iosTID, COM2, "\033[3;28HNext Train\033[4;26HSensor Trigger");
        
    // manual description
    Printf(iosTID, COM2, "\033[4;86HCOMMANDS:");
    Printf(iosTID, COM2, "\033[6;86Htr A B");
    Printf(iosTID, COM2, "\033[7;86H   Sets train A's speed to B.");
    Printf(iosTID, COM2, "\033[8;86Hrv A");
    Printf(iosTID, COM2, "\033[9;86H   Reverses train A.");
    Printf(iosTID, COM2, "\033[10;86Hsw X Y");
    Printf(iosTID, COM2, "\033[11;86H   Sets switch X to Y.");
    Printf(iosTID, COM2, "\033[12;86Hq");
    Printf(iosTID, COM2, "\033[13;86H   Quits the program.");
    Printf(iosTID, COM2, "\033[15;86HNote constraints:");
    Printf(iosTID, COM2, "\033[17;86H    1 <= A <= 80");
    Printf(iosTID, COM2, "\033[18;86H    0 <= B <= 14");
    Printf(iosTID, COM2, "\033[19;86H    1 <= X <= 18 || 153 <= X <= 156");
    Printf(iosTID, COM2, "\033[20;86H    Y = 'C' for curved, 'S' for straight");

    // Diagnostics header.
    Printf(iosTID, COM2, "\033[1;63HIdle:");
    Printf(iosTID, COM2, "\033[1;120HTime:");

    // Recent sensor pointer. It's ugliness is observer-dependent. Remove if not desired.
	Printf(iosTID, COM2, "\033[6;13H-->");
	Printf(iosTID, COM2, "\033[6;21H<--");

	// Displaying the prompt here.
    Printf(iosTID, COM2, "\033[34;1H>");	

}



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
	return counter;
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




/*****************************************************************************
CLOCK DISPLAY AND DIAGNOSTICS
*****************************************************************************/
void displayClock() {
	
	int old_idle = 0;
	int old_time = 0;
	int parentTID = MyParentTid();
	int csTID = WhoIs("clockServer");

	char msg[8];
	char rpl[3];
	int rpllen = 3;

	while(1){
		Delay(csTID, 10);
		
		int time = Time(csTID)/10; //get in 100 ms

		if(time %10 == 0){
		//every second print idle diplay...if it changed
			int new_idle = IdlePercentage();
			if(old_idle - new_idle){
			old_idle = new_idle;
			//well modify when full interface is created
			msg[0] = DELAY_U;
			msg[1] = old_idle;
			msg[2] = 0;
	        bwassert(Send(parentTID, msg, 3, rpl, rpllen) >= 0, COM2, "<UserPrompt>: could not send backspace to server. \r\n");
			}
		}

		if(old_time != time ){
			//only print if changed
			old_time = time;
			int MS = time % 10;
			time = time /10; //get seconds
			int SS1 = (time %60)%10; 
			int SS10 = (time %60)/10; 
			time = time /60; //get mins
			int MI1 = (time %60)%10; 
			int MI10 = (time %60)/10; 
			time = time /24; //get mins
			int HR1 = (time %24)%10;
			int HR10 = (time %24)/10;
		
			//104
			//104 m
			//HH:MM:SS.m
			msg[0] = CLOCK_U;
			msg[1] = HR10;
			msg[2] = HR1;
			msg[3] = MI10;
			msg[4] = MI1;
			msg[5] = SS10;
			msg[6] = SS1;
			msg[7] = MS;
			msg[8] = 0;
	        bwassert(Send(parentTID, msg, 9, rpl, rpllen) >= 0, COM2, "<UserPrompt>: could not send backspace to server. \r\n");
		}
	}
		// 	}

}










