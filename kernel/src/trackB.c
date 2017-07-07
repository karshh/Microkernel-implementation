

#include "kernelHandler.h"
#include "userRequestCall.h"
#include "server.h"
#include "trackGraph.h"





void TrackGraphInit(TrackGraph * t) {
    TrackGraphInitB(t);
}


// void implementTrackB(sensorModel * vm) {
//     sensorModelNode * v = vm->v;

//     // A12
//     v[12].numChild= 1;
//     v[12].child[0] = sensor2i("A16");
//     v[12].child[1] = 0;
//     v[12].child[2] = 0;
//     v[12].child[3] = 0;
//     v[12].child[4] = 0;

//     // A15
//     v[15].numChild= 1;
//     v[15].child[0] = sensor2i("A11");
//     v[15].child[1] = 0;
//     v[15].child[2] = 0;
//     v[15].child[3] = 0;
//     v[15].child[4] = 0;

// }


void drawTrackB(int iosTID) {

	// Printf(iosTID, COM2, "\033[16;43H%s->%s:","A12","A16");
	// Printf(iosTID, COM2, "\033[17;43H%s->%s:","A15","A11");
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



