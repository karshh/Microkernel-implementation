#include "ts7200.h"
#include "time.h"
#include "userRequestCall.h"
#include "server.h"
#include "controller.h"

#define SENSOR_BIT_MASK_1 0x80
#define SENSOR_BIT_MASK_2 0x40
#define SENSOR_BIT_MASK_3 0x20
#define SENSOR_BIT_MASK_4 0x10
#define SENSOR_BIT_MASK_5 0x08
#define SENSOR_BIT_MASK_6 0x04
#define SENSOR_BIT_MASK_7 0x02
#define SENSOR_BIT_MASK_8 0x01


void displayGrid() {

    int iosTID = WhoIs("UART2SendServer");
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
    for (j = 5; j < 29; j++) { 
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
		Printf(iosTID, COM2, "\033[%d;84H|", i);
		Printf(iosTID, COM2, "\033[%d;134H|", i);
	}

	// table headers
	Printf(iosTID, COM2,  "\033[3;4HSwitch\033[4;3HPosition");
    for (i = 4; i < 13; i++) {
        Printf(iosTID, COM2,"\033[%d;2H00%d", i+2, i-3);
    }
    for (; i < 22; i++) {
        Printf(iosTID, COM2,"\033[%d;2H0%d", i+2, i-3);
    }
    for (; i < 26; i++) {
        Printf(iosTID, COM2,"\033[%d;2H%d", i+2, i+131);
    }
        
	Printf(iosTID, COM2, "\033[3;15HSensor\033[4;14HTriggers");
        
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
	Printf(iosTID, COM2, "\033[7;13H->");
	Printf(iosTID, COM2, "\033[8;13H>");
	Printf(iosTID, COM2, "\033[6;21H<--");
	Printf(iosTID, COM2, "\033[7;22H<-");
	Printf(iosTID, COM2, "\033[8;23H<");

	// Displaying the prompt here.
    Printf(iosTID, COM2, "\033[34;1H>");	

}

void getSensorData(int * s){
	//first send two bytes
	int iosTID = WhoIs("UART1ReceiveServer");
	bwassert(iosTID >= 0, COM2, "<UserPrompt>: UART1ReceiveServer has not been set up.\r\n");
	int commandTID = WhoIs("commandServer");
	char msg[3];
	msg[0] = 'P';
	msg[1] = 0x85;
	msg[2] = 0;
	char rpl[3];
	int rpllen = 3;

	bwassert(Send(commandTID, msg, 3, rpl, rpllen) >= 0, COM2, "<getSensorData>: Polling sensors failed."); //poll sensors

	int i = 0;
	int counter=0;
	for(i = 0; i< 5; i++){
		volatile char b1 = Getc(iosTID,COM1); //get char for this module

		volatile char b2 = Getc(iosTID,COM1); //get char for this module
		if (b1 & SENSOR_BIT_MASK_1){ 
			s[counter] = (i * 16) +1;
			counter ++;
	 	}
		if (b1 & SENSOR_BIT_MASK_2){ 
			s[counter] = (i * 16) +2;
			counter ++;
	 	}
		if (b1 & SENSOR_BIT_MASK_3){ 
			s[counter] = (i * 16) +3;
			counter ++;
	 	}
		if (b1 & SENSOR_BIT_MASK_4){ 
			s[counter] = (i * 16) +4;
			counter ++;
	 	}
		if (b1 & SENSOR_BIT_MASK_5){ 
			s[counter] = (i * 16) +5;
			counter ++;
	 	}
		if (b1 & SENSOR_BIT_MASK_6){ 
			s[counter] = (i * 16) +6;
			counter ++;
	 	}
		if (b1 & SENSOR_BIT_MASK_7){ 
			s[counter] = (i * 16) +7;
			counter ++;
	 	}
		if (b1 & SENSOR_BIT_MASK_8){ 
			s[counter] = (i * 16) +8;
			counter ++;
	 	}
		if (b2 & SENSOR_BIT_MASK_1){ 
			s[counter] = (i * 16) +9;
			counter ++;
	 	}
		if (b2 & SENSOR_BIT_MASK_2){ 
			s[counter] = (i * 16) +10;
			counter ++;
	 	}
		if (b2 & SENSOR_BIT_MASK_3){ 
			s[counter] = (i * 16) +11;
			counter ++;
	 	}
		if (b2 & SENSOR_BIT_MASK_4){ 
			s[counter] = (i * 16) +12;
			counter ++;
	 	}
		if (b2 & SENSOR_BIT_MASK_5){ 
			s[counter] = (i * 16) +13;
			counter ++;
	 	}
		if (b2 & SENSOR_BIT_MASK_6){ 
			s[counter] = (i * 16) +14;
			counter ++;
	 	}
		if (b2 & SENSOR_BIT_MASK_7){ 
			s[counter] = (i * 16) +15;
			counter ++;
	 	}
		if (b2 & SENSOR_BIT_MASK_8){ 
			s[counter] = (i * 16) +16;
			counter ++;
	 	}

	}
}

void displaySensors() {
	int parentTID = MyParentTid();
	int recentSensors[64];
	volatile int i = 0;
	for (; i < 64; i++) recentSensors[i] = 0;

	char msg[SENSOR_LIST_SIZE + 1];

	int msgLen = 0;

	char rpl[3];
	int rpllen = 3;

	int s[64];
	int old[64]; 
	
	//volatile int num = 0;
	while(1)  {

		msgLen = 0;
		/***************************************
		  Start of block comment
		****************************************/

		/****************************************
		  The actual command that must be run.
		  MAKE SURE TO USE THE MACRO SNESOR_LIST_SIZE
		  AS THE MAXIMUM NUMBER OF UPDATES YOU FILL
		  THE ARRAY WITH.
		*****************************************/

		for (i=0; i < 64; i++) s[i] = 0;
		for (i=0; i < 64; i++) old[i] = recentSensors[i];

		getSensorData(&s[0]);
		//merge new data with old list
		i = 0;
		//if(!s[0] )
		while(1){
			if(!s[i]) break;
			recentSensors[i] = s[i];
			i++;
		}
		volatile int offset = i;
		for (; i < 64; i++){ recentSensors[i] = old[i-offset];
		}
		
	

		/****************************************
		  Dummy replacement for UI test purposes
		*****************************************/
/*
		for (i = 0; i < SENSOR_LIST_SIZE; i++) {
			recentSensors[i] = num;
			num++;
		}
*/
		/***************************************
		  End of block comment
		****************************************/

		for (msgLen = 0; 
			recentSensors[msgLen] != 0 && msgLen < SENSOR_LIST_SIZE; 
			msgLen++) msg[msgLen] = recentSensors[msgLen];

		bwassert(Send(parentTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<displaySensors>: Displaying sensors failed."); 

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










