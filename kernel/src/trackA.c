
#include "kernelHandler.h"
#include "userRequestCall.h"
#include "server.h"


void displayTrack() {
	
    int iosTID = WhoIs("UART2S");
	bwassert(iosTID >= 0, COM2, "<displayGrid>: IOServer has not been set up.\r\n");
	Printf(iosTID, COM2,  "\033[8;34H    _____________________________        ");
	Printf(iosTID, COM2,  "\033[9;34H     _____/ /____________________\\    ");
	Printf(iosTID, COM2,  "\033[10;34H	        /  /     \\        /     \\     ");
	Printf(iosTID, COM2,  "\033[11;34H	        |  |      \\      /      |     ");
	Printf(iosTID, COM2,  "\033[12;34H	        |  |       \\    /       |     ");
	Printf(iosTID, COM2,  "\033[13;34H         |  |        \\||/        |     ");
	Printf(iosTID, COM2,  "\033[14;34H         |  |         ||         |     ");
	Printf(iosTID, COM2,  "\033[15;34H         |  |         ||         |     ");
	Printf(iosTID, COM2,  "\033[16;34H         |  |        /||\\        |    ");
	Printf(iosTID, COM2,  "\033[17;34H         |  |       /    \\       |    ");
	Printf(iosTID, COM2,  "\033[18;34H         |  |      /      \\      |    ");
	Printf(iosTID, COM2,  "\033[19;34H          \\ \\_____/________\\_____/    ");
	Printf(iosTID, COM2,  "\033[20;34H    ______\\ \\____ ________ ______/    ");
    Printf(iosTID, COM2,  "\033[21;34H __________\\     \\        /           ");
    Printf(iosTID, COM2,  "\033[22;34H____________\\_____\\______/__________  " );
}



int main(void) {
    // turning on data and instruction cache.

     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<12 \n"
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");

    kernelRun(2,(int) FirstUserTask);
	return 0;
}



