#include "ts7200.h"
#include "time.h"
#include "userRequestCall.h"
#include "server.h"

void displayGrid() {

    int iosTID = WhoIs("ioServer");

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
    Printf(iosTID, COM2, "\033[6;86HCOMMANDS:");
    Printf(iosTID, COM2, "\033[8;86Htr A B");
    Printf(iosTID, COM2, "\033[9;86H   Sets train A's speed to B.");
    Printf(iosTID, COM2, "\033[10;86Hrv A");
    Printf(iosTID, COM2, "\033[11;86H   Reverses train A.");
    Printf(iosTID, COM2, "\033[12;86Hsw X Y");
    Printf(iosTID, COM2, "\033[13;86H   Sets switch X to Y.");
    Printf(iosTID, COM2, "\033[14;86Hq");
    Printf(iosTID, COM2, "\033[15;86H   Quits the program.");
    Printf(iosTID, COM2, "\033[17;86HNote constraints:");
    Printf(iosTID, COM2, "\033[19;86H    1 <= A <= 80");
    Printf(iosTID, COM2, "\033[20;86H    0 <= B <= 14");
    Printf(iosTID, COM2, "\033[21;86H    1 <= X <= 18 || 153 <= X <= 156");
    Printf(iosTID, COM2, "\033[22;86H    Y = 'C' for curved, 'S' for straight");

    // Diagnostics header.
    Printf(iosTID, COM2, "\033[1;63HIdle:");
    Printf(iosTID, COM2, "\033[1;120HTime:");

	// Displaying the prompt here.
    Printf(iosTID, COM2, "\033[34;1H>");	

    Exit();

}






