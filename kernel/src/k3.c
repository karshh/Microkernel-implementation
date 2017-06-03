#include "ts7200.h"
#include "time.h"
#include "bwio.h"
#include "userRequestCall.h"
#include "kernelHandler.h"
#include "kernelMacros.h"
#include "buffer.h"
#include "pkstring.h"
#include "server.h"


// Add bw print code for debugging purposes.
void Task() {
	int godTid = MyParentTid();
	int myTid = MyTid();
	char reply[3];
	char replyLen = 3;
	bwprintf(COM2, "<%d>: Asking God for a delay request.\r\n", myTid);
	Send(godTid, "1", 2, reply, replyLen);
	volatile int delayTime = (int) reply[0];
	volatile int numDelays = (int) reply[1];
	volatile int i = 0;
	bwprintf(COM2, "<%d>: Received delayTime:%d, numDelays:%d.\r\n", myTid, delayTime, numDelays);
	for (i = 0; i < numDelays; i++) {
		Delay(1, delayTime);
		bwprintf(COM2, "<%d>: Slept %d %s. Current time is %d ticks.\r\n", myTid, i+1, i == 0 ? "time" : "times", Time(1));
	}
	bwprintf(COM2, "<%d>: Completed God's delay request. Current time is %d ticks\r\n", myTid, Time(1));
	Exit();

}


void God() {
	CreateClockServer(2, (void *) clockServer);
	Create(3, (void *) Task);
    Create(4, (void *) Task);
	Create(5, (void *) Task);
	Create(6, (void *) Task);

	int _tid = 0;
	char msg[4];
	int msgLen = 4;
	char reply[3];
	Receive( &_tid, msg, msgLen);
	reply[0] = 10; // Delay Time (ticks)
	reply[1] = 20; // Number of delays
	reply[2] = 0;
	bwprintf(COM2, "<God>: Sending the following delay parameters to TD<%d>: delayTime:%d, numDelays:%d \r\n", _tid, reply[0], reply[1]);
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 23; // Delay Time (ticks)
	reply[1] = 9; // Number of delays
	reply[2] = 0;
	bwprintf(COM2, "<God>: Sending the following delay parameters to TD<%d>: delayTime:%d, numDelays:%d \r\n", _tid, reply[0], reply[1]);
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 33; // Delay Time (ticks)
	reply[1] = 16; // Number of delays
	reply[2] = 0;
	bwprintf(COM2, "<God>: Sending the following delay parameters to TD<%d>: delayTime:%d, numDelays:%d \r\n", _tid, reply[0], reply[1]);
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 71; // Delay Time (ticks)
	reply[1] = 3; // Number of delays
	reply[2] = 0;
	bwprintf(COM2, "<God>: Sending the following delay parameters to TD<%d>: delayTime:%d, numDelays:%d \r\n", _tid, reply[0], reply[1]);
	Reply(_tid, reply, 3); 

	bwprintf(COM2, "<God>: Exitting..\r\n");
	Exit( );
}


// Make sure the idle task is initialized by kernel create.
int main() {

	// turning on caches.
     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<12 \n" 
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");


	kernelRun(3, (int) God);

	return 0;

}
