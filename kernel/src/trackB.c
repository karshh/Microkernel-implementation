

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



void drawTrack(int iosTID) {

      Printf(iosTID, COM2, "\033[10;45H       +___ O____O_+_______________+_______+\n");
      Printf(iosTID, COM2, "\033[11;45H           /    /                           \\\n");
      Printf(iosTID, COM2, "\033[12;45H     +___ O    O___+_____O_+___+_O___+___+___O\n");
      Printf(iosTID, COM2, "\033[13;45H         /    /           +     +            |\n");
      Printf(iosTID, COM2, "\033[14;45H        +    +             + | +             |\n");
      Printf(iosTID, COM2, "\033[15;45H        |    |              O|O              | \n");
      Printf(iosTID, COM2, "\033[16;45H        |    |               |               | \n");
      Printf(iosTID, COM2, "\033[17;45H        |    |              O|O              | \n");
      Printf(iosTID, COM2, "\033[18;45H        +    +             + | +             |\n");
      Printf(iosTID, COM2, "\033[19;45H         \\    \\           +     +            |\n");
      Printf(iosTID, COM2, "\033[20;45H +___+___ O    O___+_____O_+___+_O___+___+___O\n");
      Printf(iosTID, COM2, "\033[21;45H           \\    \\                           /\n");
      Printf(iosTID, COM2, "\033[22;45H    +___+___O    +___O_____+___+_____O_____+\n");
      Printf(iosTID, COM2, "\033[23;45H             \\        \\             /\n");
      Printf(iosTID, COM2, "\033[24;45H      +___+___O____+___O___________O___+         \n");
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



