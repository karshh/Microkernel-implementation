#include "ts7200.h"

#include "bwio.h"
#include "request.h"
#include "queue.h"
#include "kernelRequestCall.h"
#include "userRequestCall.h"
#include "interruptHandler.h"

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
	
	// set this to 1 to print debug statements.
	int debug = 0;

	// This variable is used to accurately set up stack of each user task.
	// It will also be used to assign a TID for each task.
	// It will need to be incremented for every instance of user task we make.
	volatile int numTasks = 0;
	queue Q;
	queueInit(&Q);

	// TODO, create first task here.
	kernel_Create(MEDIUM, (((int)firstUserTask),
							&numTasks, 0);
	
	if (debug) bwprintf(COM2, "Kernel:  Beginning run.\n\r");

	TD * task;
	request r;
	while(queuePop(&Q, &task)) {
		 r = *activate(task->reqVal, &(task->sp));
		processRequest(task, &r);
		queuePush(&Q, task, task->priority);
	}

	if (debug) bwprintf(COM2, "Kernel: Exitting.\n\r");




}
