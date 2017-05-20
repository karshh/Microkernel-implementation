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

void userTask2(void) {
	register int r asm("r0");

    bwprintf(COM2, "USER TASK 2 ENTRY. REQUEST ID = %d\r\n", r);
    int tid = MyTid();
    bwprintf(COM2, "USER TASK 2 GOT TID = %d.\r\n", tid);
    bwprintf(COM2, "USER TASK 2 EXIT, REQUESTING to get off the train.\r\n");
    Exit();
    bwprintf(COM2, "USER TASK fucked up. Train don't stop here  \r\n" );
}
void userTask1(void) {
	register int r asm("r0");

    bwprintf(COM2, "USER TASK 1 ENTRY. REQUEST ID = %d\r\n", r);
    bwprintf(COM2, "USER TASK 1 MIDDLE \r\n");
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING TID.\r\n");
    int tid = MyTid();

    bwprintf(COM2, "USER TASK 1 GOT TID = %d.\r\n", tid);
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING Parent TID.\r\n");
    int parentTid = MyParentTid();
    bwprintf(COM2, "USER TASK 1 GOT Parent TID = %d.\r\n", parentTid);
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING to Pass the train.\r\n");
    Pass();
    bwprintf(COM2, "USER TASK has had a nap but is awake  \r\n" );
	int create =-1;
int j =10;
while(j < 10){
	j++;
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING to birth a child.\r\n");
	create  = Create(1,(void *)((int) userTask2) + REDBOOT_LOAD_OFFSET);
	if(create == -1){
    		bwprintf(COM2, "USER TASK 1' child never born. no father: %d.\r\n", create);
	}
	else if(create == -2){
    		bwprintf(COM2, "world is overpopulated. train gods refuse Task's offer: %d.\r\n", create);
	}else if(create >= 0){
    		bwprintf(COM2, "USER TASK gave birth to a bouncing baby task named: %d.\r\n", create);
	}else{
    		bwprintf(COM2, "USER TASK 1's fucked up when fucking: %d.\r\n", create);
	}
}
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING to get off the train.\r\n");
    Exit();
    bwprintf(COM2, "USER TASK fucked up. Train don't stop here  \r\n" );
}

int user_contextswitch1(int * i) {//request * myRequest){
//note since r0...r3 are used in gcc convention for passing args, r0 has the first arg...i.e my Request
//since we don't change any of the argument values r0--r1 retains thier value when running swi.
//* ((int *) (0x01000008)) = i;
	//bwprintf(COM2,"User:Sending %d \n\r", i);
	asm ("swi 0");	
	return 0;
	
}


void kernelTestRun(kernelHandler * ks) {
	

	queue Q;
	queueInit(&Q);


	bwprintf(COM2, "Kernel:Starting Run...\r\n");



	bwprintf(COM2, "!!!!!!!!!!!!!!!!!!!!Kernel:Starting Run...\r\n");
	 

	int TID;
	if(getNextTID(ks, &TID)) {
		bwprintf(COM2,"error getting TID\n\r"); //see sl
	}
 
	bwprintf(COM2, "!!!!!!!!!!!!!!!!!!!!Kernel:Starting Run...\r\n");
	int code  = ((int) userTask1) + REDBOOT_LOAD_OFFSET;
	bwprintf(COM2, "!!!!!!!!!!!!!!!!!!!!Kernel:Starting Run...\r\n");
	TD * td = setTask(ks,TID,TID,HIGH,code);   //if TID == , it is created by kernel
	bwprintf(COM2, "!!!!!!!!!!!!!!!!!!!!Kernel:Starting Run...\r\n");
		bwprintf(COM2,"First Task sp%x\n\r",td->sp); //see sl
	
	bwprintf(COM2, "!!!!!!!!!!!!!!!!!!!!Kernel:Starting Run...\r\n");
	request r_;
	r_.reqType = MYPARENTID;
 


	if (queuePush(&Q, td, td->priority)) bwprintf(COM2, "Kernel:Pushed TD %d on the queue\n\r", td->TID);
	request r;
	TD * task;
//might refactor queues to use kernal held queue pts...for now will do processing for creat in queuepush
	while(queuePop(&Q, &task)) {
		bwprintf(COM2, "Kernel:Running task %d. \n\r", task->TID);
		 r = *activate(task->reqVal, &(task->sp));
		processRequest(&Q, ks, task, &r);
		queuePush( &Q, task, task->priority);
	}

	bwprintf(COM2, "Kernel:Exiting..\n\r");


}





int main(void) {
	bwsetfifo(COM2, OFF);
	* ((int *) (0x28)) = ((int) swiHandler) + REDBOOT_LOAD_OFFSET;

        // switching to user mode explicitly in the start.
	bwprintf(COM2, "Kernel:Starting test...\r\n");
	kernelHandler ks;

	initKernel(&ks);
	kernelTestRun(&ks);
	//request r;
	//r.reqType = MYPARENTID;
	//* ((int *) (0x01000004)) = &r;

	//user_contextswitch1(&r);
	/*register request * r_ asm("r0");
	r_ = &r;
	asm ("bl dummy");
	*/
	return 0;
}
