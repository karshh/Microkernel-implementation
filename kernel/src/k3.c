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
	int clockServerTid = WhoIs("clockServer");
	char reply[3];
	char replyLen = 3;
	bwprintf(COM2, "TD<%d>: Asking God for a delay request.\r\n", myTid);
	Send(godTid, "1", 2, reply, replyLen);
	volatile int delayTime = (int) reply[0];
	volatile int numDelays = (int) reply[1];
	volatile int i = 0;
	bwprintf(COM2, "TD<%d>: Received delayTime:%d, numDelays:%d. Entering delay mode.\r\n", myTid, delayTime, numDelays);
	volatile int time1 = 0;
	volatile int time2 = 0;
	for (i = 0; i < numDelays; i++) {
		time1 = Time(clockServerTid);
		Delay(clockServerTid, delayTime);
		time2 = Time(clockServerTid);
		bwprintf(COM2, "TD<%d>: Delay Interval:[%d-%d]\tDelays completed: %d.\r\n", myTid, time1, time2, i+1);
	}
	bwprintf(COM2, "TD<%d>: Completed God's delay request. Current time is %d ticks\r\n", myTid, Time(clockServerTid));
	Exit();

}


void God() {
	CreateNameServer(2, (void *) NameServerTask);
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
