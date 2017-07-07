
#include "kernelHandler.h"
#include "userRequestCall.h"
#include "server.h"
#include "trackGraph.h"


void TrackGraphInit(TrackGraph * t) {
	TrackGraphInitA(t);
}

void implementTrackB(sensorModel * vm) {
	// Nothin!
}


void drawTrackB(int iosTID) {

}



int main(void) {
    // turning on data and instruction cache.

     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<30 \n"
        "ORR r0, r0, #0x1 <<12 \n"
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");

    kernelRun(2,(int) FirstUserTask);
	return 0;
}



