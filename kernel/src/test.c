#include "ts7200.h"

#include "request.h"
#include "userRequestCall.h"
#include "queue.h"
#include "bwio.h"
#include "interruptHandler.h"
#include "kernelHandler.h"

#define REDBOOT_LOAD_OFFSET 0x218000

#define USER_STACK_PTR_ADDR 0x1A00000

void userTask1(void) {
    bwprintf(COM2, "USER TASK 1 ENTRY\r\n");
    bwprintf(COM2, "USER TASK 1 MIDDLE \r\n");
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING TID.\r\n");
    MyTid();
}

static void processRequest(request * myRequest, TD * task) {
//changed kernal entry point to have an argument, which points to r0.
//saves me from writing janky code

	switch(myRequest->reqType){
	case(MYTID):
		//#TODO change when you get create_task done
		//lets return 314
		myRequest->reqVal = task->TID;
		//note does not change r0;
		bwputc(COM2,'R');
		//changes r0; but doesnt matter as we are chaning the result of 314
		//asm("movs	pc, lr");
		break;
	case(MYPARENTID):
		myRequest->reqVal = task->parentTID;
		//#TODO change when you get create_task done
		//lets return 69
		break;
	case(CREATE):
		break;
	case(PASS):
		break;
	case(EXIT):
		break;
	default:
		break;
	}


}

void kernelTestRun() {
	

	// TODO: initialize a test task;
	queue Q;
	queueInit(&Q);

	TD td;
	td.TID = 1;
	td.parentTID = 0;
	td.priority = HIGH;
	td.state = READY;
	td.spsr = 0xd0;
	td.retVal = -1;

	request r_;
	r_.reqType = NONE;
	r_.reqVal = -1;

	td.sp = (int*) USER_STACK_PTR_ADDR;

	*(td.sp - 11) = ((int) userTask1) + REDBOOT_LOAD_OFFSET;
	*(td.sp - 12) = td.spsr; 
	td.sp -= 12;

	if (queuePush(&Q, &td, td.priority)) bwprintf(COM2, "Pushed TD %d on the queue\n\r", td.TID);

	TD * task;
	if (queuePop(&Q, &task)) {
		if (task->state != READY && task->state != ACTIVE) {
			bwprintf(COM2, "FAIL, TASK %d IS NOT READY OR ACTIVE. \n\r", task->TID);
		} 
		else {
			request * r = activate(&r_, &(task->sp));
			bwprintf(COM2, "Request for task %d recieved\n\r", task->TID);
			if (r->reqType != MYTID) {
				bwprintf(COM2, "Wrong request type recieved [%d]. \n\r", r->reqType);
			} else {
				processRequest(r, task);
				bwprintf(COM2,"SUCCESS! TID: %d \n\r", r->reqVal);
			}

		}
	} 

	bwprintf(COM2, "Exiting..\n\r");

		// TODO: make sure contents are properly placed on stack.


}





int main(void) {
	bwsetfifo(COM2, OFF);
	* ((int *) (0x28)) = ((int) swiHandler) + REDBOOT_LOAD_OFFSET;
        // switching to user mode explicitly in the start.
	
	bwprintf(COM2, "Starting test...\r\n");
	kernelTestRun();
	return 0;
}
