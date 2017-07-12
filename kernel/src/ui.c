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
    for (; j < 43; j++) { 
    	Printf(iosTID, COM2, "_"); 
    }

    Printf(iosTID, COM2, "\033[5;1H");   
    for (j = 5; j < 46; j++) { 
    	Printf(iosTID, COM2, "="); 
    }

    Printf(iosTID, COM2, "\033[31;1H");   

    for (j = 5; j < 46; j++) { 
    	Printf(iosTID, COM2, "_");
    }

	volatile int i = 3;
	for (; i <= 31; i++) {
		Printf(iosTID, COM2, "\033[%d;1H|", i);
		Printf(iosTID, COM2, "\033[%d;12H|", i);
		Printf(iosTID, COM2, "\033[%d;24H|", i);
		Printf(iosTID, COM2, "\033[%d;41H|", i);
		Printf(iosTID, COM2, "\033[%d;81H|", i);
		// Printf(iosTID, COM2, "\033[%d;84H|", i);
		// Printf(iosTID, COM2, "\033[%d;203H|", i);
	}


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
        
    // // manual description
    // Printf(iosTID, COM2, "\033[4;86HCOMMANDS:");
    // Printf(iosTID, COM2, "\033[6;86Htr A B");
    // Printf(iosTID, COM2, "\033[7;86H   Sets train A's speed to B.");
    // Printf(iosTID, COM2, "\033[8;86Hrv A");
    // Printf(iosTID, COM2, "\033[9;86H   Reverses train A.");
    // Printf(iosTID, COM2, "\033[10;86Hsw X Y");
    // Printf(iosTID, COM2, "\033[11;86H   Sets switch X to Y.");
    // Printf(iosTID, COM2, "\033[12;86Hq");
    // Printf(iosTID, COM2, "\033[13;86H   Quits the program.");
    // Printf(iosTID, COM2, "\033[15;86HNote constraints:");
    // Printf(iosTID, COM2, "\033[17;86H    1 <= A <= 80");
    // Printf(iosTID, COM2, "\033[18;86H    0 <= B <= 14");
    // Printf(iosTID, COM2, "\033[19;86H    1 <= X <= 18 || 153 <= X <= 156");
    // Printf(iosTID, COM2, "\033[20;86H    Y = 'C' for curved, 'S' for straight");

	// sensor map time.

	// module A
	// Printf(iosTID, COM2, "\033[3;43H%s->%s:","A01","C13");
	// Printf(iosTID, COM2, "\033[4;43H%s->%s:","A03","C13");
	// Printf(iosTID, COM2, "\033[5;43H%s->%s:","A03","C11");
	// Printf(iosTID, COM2, "\033[6;43H%s->%s:","A04","B16");
	// Printf(iosTID, COM2, "\033[7;43H%s->%s:","A05","C07");
	// Printf(iosTID, COM2, "\033[8;43H%s->%s:","A06","B10");
	// Printf(iosTID, COM2, "\033[9;43H%s->%s:","A07","B12");
	// Printf(iosTID, COM2, "\033[10;43H%s->%s:","A08","C07");
	// Printf(iosTID, COM2, "\033[11;43H%s->%s:","A09","B08");
	// Printf(iosTID, COM2, "\033[12;43H%s->%s:","A10","C07");
	// Printf(iosTID, COM2, "\033[13;43H%s->%s:","A11","C07");
	// Printf(iosTID, COM2, "\033[14;43H%s->%s:","A13","C13");
	// Printf(iosTID, COM2, "\033[15;43H%s->%s:","A16","C13");
	// drawTrackB(iosTID);
	// // module B
	// Printf(iosTID, COM2, "\033[3;73H%s->%s:","B01","D14");
	// Printf(iosTID, COM2, "\033[4;73H%s->%s:","B02","C09");
	// Printf(iosTID, COM2, "\033[5;73H%s->%s:","B03","C02");
	// Printf(iosTID, COM2, "\033[6;73H%s->%s:","B04","C09");
	// Printf(iosTID, COM2, "\033[7;73H%s->%s:","B05","D03");
	// Printf(iosTID, COM2, "\033[8;73H%s->%s:","B06","C12");
	// Printf(iosTID, COM2, "\033[9;73H%s->%s:","B07","A10");
	// Printf(iosTID, COM2, "\033[10;73H%s->%s:","B09","A05");
	// Printf(iosTID, COM2, "\033[11;73H%s->%s:","B11","A08");
	// Printf(iosTID, COM2, "\033[12;73H%s->%s:","B13","D02");
	// Printf(iosTID, COM2, "\033[13;73H%s->%s:","B13","E02");
	// Printf(iosTID, COM2, "\033[14;73H%s->%s:","B14","D16");
	// Printf(iosTID, COM2, "\033[15;73H%s->%s:","B15","A03");
	// Printf(iosTID, COM2, "\033[16;73H%s->%s:","B16","C10");
	// Printf(iosTID, COM2, "\033[17;73H%s->%s:","B16","C05");
	// //module C
	// Printf(iosTID, COM2, "\033[3;103H%s->%s:","C01","B04");
	// Printf(iosTID, COM2, "\033[4;103H%s->%s:","C02","E02");
	// Printf(iosTID, COM2, "\033[5;103H%s->%s:","C02","D02");
	// Printf(iosTID, COM2, "\033[6;103H%s->%s:","C04","C06");
	// Printf(iosTID, COM2, "\033[7;103H%s->%s:","C04","C08");
	// Printf(iosTID, COM2, "\033[8;103H%s->%s:","C05","C15");
	// Printf(iosTID, COM2, "\033[9;103H%s->%s:","C05","E11");
	// Printf(iosTID, COM2, "\033[10;103H%s->%s:","C05","C03");
	// Printf(iosTID, COM2, "\033[11;103H%s->%s:","C06","B15");
	// Printf(iosTID, COM2, "\033[12;103H%s->%s:","C07","E11");
	// Printf(iosTID, COM2, "\033[13;103H%s->%s:","C07","C03");
	// Printf(iosTID, COM2, "\033[14;103H%s->%s:","C08","A12");
	// Printf(iosTID, COM2, "\033[15;103H%s->%s:","C08","A09");
	// Printf(iosTID, COM2, "\033[16;103H%s->%s:","C08","A07");
	// Printf(iosTID, COM2, "\033[17;103H%s->%s:","C08","A06");
	// Printf(iosTID, COM2, "\033[18;103H%s->%s:","C09","B15");
	// Printf(iosTID, COM2, "\033[19;103H%s->%s:","C10","B03");
	// Printf(iosTID, COM2, "\033[20;103H%s->%s:","C10","B01");
	// Printf(iosTID, COM2, "\033[21;103H%s->%s:","C11","E16");
	// Printf(iosTID, COM2, "\033[22;103H%s->%s:","C11","B05");
	// Printf(iosTID, COM2, "\033[23;103H%s->%s:","C12","A04");
	// Printf(iosTID, COM2, "\033[24;103H%s->%s:","C13","E07");
	// Printf(iosTID, COM2, "\033[25;103H%s->%s:","C14","A02");
	// Printf(iosTID, COM2, "\033[26;103H%s->%s:","C14","A14");
	// Printf(iosTID, COM2, "\033[27;103H%s->%s:","C14","A15");
	// Printf(iosTID, COM2, "\033[28;103H%s->%s:","C14","A04");
	// Printf(iosTID, COM2, "\033[29;103H%s->%s:","C15","D12");
	// Printf(iosTID, COM2, "\033[30;103H%s->%s:","C16","C06");
	// //module D
	// Printf(iosTID, COM2, "\033[3;133H%s->%s:","D01","C01");
	// Printf(iosTID, COM2, "\033[4;133H%s->%s:","D01","B14");
	// Printf(iosTID, COM2, "\033[5;133H%s->%s:","D02","E04");
	// Printf(iosTID, COM2, "\033[6;133H%s->%s:","D03","E05");
	// Printf(iosTID, COM2, "\033[7;133H%s->%s:","D04","B06");
	// Printf(iosTID, COM2, "\033[8;133H%s->%s:","D05","E06");
	// Printf(iosTID, COM2, "\033[9;133H%s->%s:","D06","E10");
	// Printf(iosTID, COM2, "\033[10;133H%s->%s:","D06","D09");
	// Printf(iosTID, COM2, "\033[11;133H%s->%s:","D07","E10");
	// Printf(iosTID, COM2, "\033[12;133H%s->%s:","D07","D09");
	// Printf(iosTID, COM2, "\033[13;133H%s->%s:","D08","E08");
	// Printf(iosTID, COM2, "\033[14;133H%s->%s:","D09","E12");
	// Printf(iosTID, COM2, "\033[15;133H%s->%s:","D10","D08");
	// Printf(iosTID, COM2, "\033[16;133H%s->%s:","D10","D05");
	// Printf(iosTID, COM2, "\033[17;133H%s->%s:","D11","C16");
	// Printf(iosTID, COM2, "\033[18;133H%s->%s:","D12","E11");
	// Printf(iosTID, COM2, "\033[19;133H%s->%s:","D13","B02");
	// Printf(iosTID, COM2, "\033[20;133H%s->%s:","D14","E14");
	// Printf(iosTID, COM2, "\033[21;133H%s->%s:","D15","B13");
	// Printf(iosTID, COM2, "\033[22;133H%s->%s:","D16","E14");
	// //module E
	// Printf(iosTID, COM2, "\033[3;163H%s->%s:","E01","C01");
	// Printf(iosTID, COM2, "\033[4;163H%s->%s:","E01","B14");
	// Printf(iosTID, COM2, "\033[5;163H%s->%s:","E02","E15");
	// Printf(iosTID, COM2, "\033[6;163H%s->%s:","E03","D01");
	// Printf(iosTID, COM2, "\033[7;163H%s->%s:","E04","E05");
	// Printf(iosTID, COM2, "\033[8;163H%s->%s:","E05","D06");
	// Printf(iosTID, COM2, "\033[9;163H%s->%s:","E06","E03");
	// Printf(iosTID, COM2, "\033[10;163H%s->%s:","E06","D04");
	// Printf(iosTID, COM2, "\033[11;163H%s->%s:","E07","D07");
	// Printf(iosTID, COM2, "\033[12;163H%s->%s:","E08","C14");
	// Printf(iosTID, COM2, "\033[13;163H%s->%s:","E09","D08");
	// Printf(iosTID, COM2, "\033[14;163H%s->%s:","E09","D05");
	// Printf(iosTID, COM2, "\033[15;163H%s->%s:","E10","E13");
	// Printf(iosTID, COM2, "\033[16;163H%s->%s:","E11","D10");
	// Printf(iosTID, COM2, "\033[17;163H%s->%s:","E12","D11");
	// Printf(iosTID, COM2, "\033[18;163H%s->%s:","E12","C08");
	// Printf(iosTID, COM2, "\033[19;163H%s->%s:","E12","C06");
	// Printf(iosTID, COM2, "\033[20;163H%s->%s:","E13","D13");
	// Printf(iosTID, COM2, "\033[21;163H%s->%s:","E13","D15");
	// Printf(iosTID, COM2, "\033[22;163H%s->%s:","E14","E09");
	// Printf(iosTID, COM2, "\033[23;163H%s->%s:","E15","C12");
	// Printf(iosTID, COM2, "\033[24;163H%s->%s:","E16","E01");


    // Diagnostics header.
    Printf(iosTID, COM2, "\033[1;63HIdle:");
    Printf(iosTID, COM2, "\033[1;120HTime:");

    // Recent sensor pointer. It's ugliness is observer-dependent. Remove if not desired.
	Printf(iosTID, COM2, "\033[6;13H-->");
	Printf(iosTID, COM2, "\033[6;21H<--");

	// Displaying the prompt here.
    Printf(iosTID, COM2, "\033[34;1H>");	

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










