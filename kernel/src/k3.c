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
	//bwprintf(COM2, "TD<%d>: Asking God for a delay request.\r\n", myTid);
	Send(godTid, "1", 2, reply, replyLen);
	volatile int delayTime = (int) reply[0];
	volatile int numDelays = (int) reply[1];
	volatile int i = 0;
	//bwprintf(COM2, "TD<%d>: Received delayTime:%d, numDelays:%d. Entering delay mode.\r\n", myTid, delayTime, numDelays);
	volatile int time1 = 0;
	volatile int time2 = 0;
	for (i = 0; i < numDelays; i++) {
		time1 = Time(clockServerTid);
		Delay(clockServerTid, delayTime);
		time2 = Time(clockServerTid);
		bwprintf(COM2, "%d:[%d-%d]-%d\r\n", myTid, time1, time2, i+1);
	}
	bwprintf(COM2, "%d:%d\r\n", myTid, Time(clockServerTid));
	Exit();

}


void God() {
	//and lo on his day off he created a name server and clock server
	bwprintf(COM2, "\033[2J\033[2;H");//clear screen
	CreateNameServer(2, (void *) NameServerTask);
	CreateClockServer(2, (void *) clockServer);
	Create(31, (void *) idleTask);
	//and it was good
	
	//Then he created his children
	Create(3, (void *) Task);
    	Create(4, (void *) Task);
	Create(5, (void *) Task);
	Create(6, (void *) Task);
	
	//lo when his children raised thier voices in query
	//he gave them the commandment to wait.
	//once the alloted time has arrived the idle shalt inherit the kernel
	int _tid = 0;
	char msg[4];
	int msgLen = 4;
	char reply[3];
	Receive( &_tid, msg, msgLen);
	reply[0] = 10; // Delay Time (ticks)
	reply[1] = 20; // Number of delays
	reply[2] = 0;
	//bwprintf(COM2, "<God>: Sending the following delay parameters to TD<%d>: delayTime:%d, numDelays:%d \r\n", _tid, reply[0], reply[1]);
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 23; // Delay Time (ticks)
	reply[1] = 9; // Number of delays
	reply[2] = 0;
	//bwprintf(COM2, "<God>: Sending the following delay parameters to TD<%d>: delayTime:%d, numDelays:%d \r\n", _tid, reply[0], reply[1]);
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 33; // Delay Time (ticks)
	reply[1] = 6; // Number of delays
	reply[2] = 0;
	//bwprintf(COM2, "<God>: Sending the following delay parameters to TD<%d>: delayTime:%d, numDelays:%d \r\n", _tid, reply[0], reply[1]);
	Reply(_tid, reply, 3);
	Receive( &_tid, msg, msgLen);
	reply[0] = 71; // Delay Time (ticks)
	reply[1] = 3; // Number of delays
	reply[2] = 0;
	//bwprintf(COM2, "<God>: Sending the following delay parameters to TD<%d>: delayTime:%d, numDelays:%d \r\n", _tid, reply[0], reply[1]);
	Reply(_tid, reply, 3); 
	//and it was good
	//after giving his holy commandments, he left this mortal plane toward the next form of existence
	bwprintf(COM2, "<God>: Exitting..\r\n");
	Exit( );
	//and it was good.
	//amen
}


// Make sure the idle task is initialized by kernel create.
int main() {

	// turning on caches.
     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<12 \n" 
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");

bwprintf(COM2,"STARING K3 Tests (post k4)/n/r");

	kernelRun(3, (int) God);

	return 0;

}
