#include "ts7200.h"
#include "debugtime.h"
#include "bwio.h"
#include "userRequestCall.h"
#include "kernelHandler.h"
#include "kernelMacros.h"
#include "buffer.h"
#include "pkstring.h"
#include "server.h"


void God() {
	Create(2, (void *) ClockServer);
	Create(3, (void *) Task);
	Create(4, (void *) Task);
	Create(5, (void *) Task);
	Create(6, (void *) Task);

	int tid;
	char msg[4];
	int msgLen = 4;
	char reply[4];
	char replyLen = 4;
	Receive( &_tid, msg, msgLen);
	reply[0] = 10; // Delay Time (ticks)
	reply[1] = 20; // Number of delays
	reply[2] = 0;
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 23; // Delay Time (ticks)
	reply[1] = 9; // Number of delays
	reply[2] = 0;
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 33; // Delay Time (ticks)
	reply[1] = 6; // Number of delays
	reply[2] = 0;
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 71; // Delay Time (ticks)
	reply[1] = 3; // Number of delays
	reply[2] = 0;
	Reply(_tid, reply, 3); 
}


// Add bw print code for debugging purposes.
void Task() {
	int godTid = MyParentTid();
	int myTid = MyTid();
	int tid;
	char msg = "1"; // Random message.
	int msgLen = 2;
	char reply[4];
	char replyLen = 4;

	Send(godTid, msg, msgLen, reply, replyLen);
	volatile int delayTime = (int) msg[0];
	volatile int numDelays = (int) msg[1];
	volatile int i = 0;
	for (i = 0; i < numDelays; i++) Delay(myTid, delayTime);
	Exit();

}


// Make sure the idle task is initialized by kernel create.
int main() {

	// turning on caches.
     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<12 \n" 
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");


	kernelRun(1, (int) God);

}