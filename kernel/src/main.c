#include "ts7200.h"

#include "bwio.h"
#include "request.h"
#include "queue.h"
#include "kernelRequestCall.h"
#include "userRequestCall.h"
#include "interruptHandler.h"
#include "kernelHandler.h"

#define REDBOOT_LOAD_OFFSET 0x218000

#define USER_STACK_PTR_ADDR 0x0400000

void firstUserTask() {
	volatile int r;
	int priority = LOW;

	int i = 1;
	for (; i <= 4; i++) {

		int r = Create(priority, (void *)otherUserTask);
		if (r == -1) {
			bwprintf("Invalid priority.\r\n");
			Exit();
		} else if (r == -2) {
			bwprintf("Out of task descriptors.\r\n");
			Exit();
		} else {
			bwprintf("Created: %d.\r\n", r);
		}
		if (i == 2) priority = HIGH;
	}

	bwprintf("FirstUserTask: exiting.\r\n");
	Exit();

}

void otherUserTask() {
	int tid = MyTid();
	int parenttid = MyParentTid();
	bwprintf("MyTid:%d.        MyParentTid:%d.\r\n", tid, parenttid);
	
	Pass();
	
	tid = MyTid();
	parenttid = MyParentTid();
	bwprintf("MyTid:%d.        MyParentTid:%d.\r\n", tid, parenttid);
	Exit();
}

int main(void) {
	// initialization
	bwsetfifo(COM2, OFF);
	* ((int *) (0x28)) = ((int) kernelEnter) + REDBOOT_LOAD_OFFSET;
	
	kernelHandler k;

	// TODO: provide a paramter which would be the first user task to run. 
	initKernel(&k);

	if (debug) bwprintf(COM2, "Kernel:  Beginning run.\n\r");

	kernelRun(&k);
	
	if (debug) bwprintf(COM2, "Kernel: Exitting.\n\r");




}
