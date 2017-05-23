#include "kernelHandler.h"
#include "kernelRequestCall.h"
#include "td.h"
#include "interruptHandler.h"
#include "request.h"
#include "bwio.h"

int getNextTID(kernelHandler  * ks, int * TID){
	if (ks->TIDgen == MAX_TID) return -1;  //check if there are enough TD's
	*TID = ks->TIDgen;
	ks->TIDgen ++;
	return 0;
}

int initKernel(kernelHandler * ks, int priority, int code){
	//turn off fifos
	bwsetfifo(COM2, OFF);
	//turn off swi handler
	* ((int *) (0x28)) = ((int) swiHandler) + REDBOOT_LOAD_OFFSET;

	ks->TIDgen = 5;

	int TID = 0;
	/******************************************************
	a suggestion by ben the TA
	i've allocated a subset of the kernel stack in a 16M array of characters.
	I use the memory location of this array as the space available for task memory
	That way we are sure never to touch actual used memory
	note: i set the max number of tasks to 128; so each task should have 128kb of space
	as part of the init and push/pop of register in the context switch it might be a good idea 
	to set a stack limit (r10) for each task on init.....i might even do that.....
	not going to do so now unless if program is unrunable
        */
	int memOffset = (int) &(ks->taskSpace[MAX_STACKSIZE-1]);
	memOffset = memOffset - (memOffset%16);
	ks->memOffset = memOffset;

	for (TID = 0; TID<MAX_TID;TID++){
		initTD(&ks->TDList[TID],TID,memOffset);
	}
	
	int queue =0;
	for (queue = 0; queue<32; queue++){
		ks->priorityHead[queue] = 0;
		ks->priorityTail[queue] = 0;
	}


	// initialize kernel's queue.
	queueInit(&(ks->Q));

	//set first task
	TID =0;
	if(getNextTID(ks, &TID)) {
		bwprintf(COM2,"error getting TID\n\r"); //see sl
		return -1;
	}
 
	TD * td = setTask(ks,TID,KERNAL_CHILD,priority,code);   //if PTID == -1 , it is created by kernel

	//;if (!(kernel_queuePush(ks, td))){
	if (!(k_Push(ks, td))){
		 bwprintf(COM2, "Kernel:failed to push TD %d on the queue\n\r", td->TID);
		return -2;
	}

	//everthing good by this point
	return 0;
}

void kernelRun(int priority, int code) {

	kernelHandler ks;
	if(initKernel(&ks, priority, code)){
		//if we return non-zero initialization failed and we don't go further
		return;
	}
	
	TD * task =0;
	request r;


	while(k_Pop(&ks, task)) {
	bwprintf(COM2,"K-pop! TID %d is popped\n\r",task->TID);
		task->state = ACTIVE;
		r = *activate(task->reqVal, &(task->sp));
		processRequest(&ks, task, &r);
		k_Push(&ks, task);
		task = 0;
	}
/*
	while(kernel_queuePop(&ks, &task)) {
		r = *activate(task->reqVal, &(task->sp));
		processRequest(&ks, task, &r);
		kernel_queuePush(&ks, task);
	}
*/
}

TD * setTask(kernelHandler * ks,  int TID, int parentTID,int priority, int code){
	TD * td = &(ks->TDList[TID]);
	td->priority = priority;
	td->parentTID = parentTID;
	if(parentTID == KERNAL_CHILD) td->parent = 0;
	else td->parent = &(ks->TDList[parentTID]);

	td->state = READY;
	td->spsr = 0xd0;
	td->reqVal = -1;
	volatile int mem = (volatile int) (TID * (MAX_STACKSIZE/MAX_TID));//giving stack space of 1kb
	td->sp  = (int *) (ks->memOffset -(int) mem);
	*(td->sp - 11) = code+REDBOOT_LOAD_OFFSET; //assumes redboot is loaded at 0x21000
 	*(td->sp - 12) = td->spsr; 	
		td->sp -= 12;
return  td;

}

int k_Push(kernelHandler * ks,  TD * task){
	//puts or priority queue at task's priority
	int priority = task->priority;

	if(ks->priorityHead[priority] == 0){
	bwprintf(COM2,"K-push. priority %d is empty\n\r",priority);
		//this priority is empty
		//will modify to modify bitstring later
		ks->priorityHead[priority] = task;
		ks->priorityTail[priority] = task;
		task->nextTD = 0;
		task->prevTD = 0;
		task->state = READY;
	}else{
	bwprintf(COM2,"K-push. priority %d is not  empty\n\r",priority);
		volatile TD * prevHead = ks->priorityHead[priority];
		prevHead->nextTD = task;
		task->prevTD = prevHead;
		task->nextTD = 0;
		task->state = READY;
		ks->priorityHead[priority] = task;
	}
	return 1;
	
}


int k_Popp(kernelHandler * ks, TD * task, int priority){
	//pops off specific priority. makes no assumption what will happen to task after pop
	//it is calling function's responsability to change Task's state

	if(ks->priorityTail[priority] == 0) return -1; //queue is empty
	task = 0;
	task = (TD * )ks->priorityTail[priority];
	volatile TD * nextTail = task->nextTD;
	if(nextTail == 0){
		//will modify to modify bitstring later
		//if poped task is head as well
		ks->priorityHead[priority] = 0;
		ks->priorityTail[priority] = 0;
	}else{
		nextTail->prevTD = 0;
		ks->priorityTail[priority] = nextTail;
	}

	task->nextTD = 0;
	task->prevTD = 0;
	bwprintf(COM2,"K-popp! TID %d is popped\n\r",task->TID);
	return 0;
}

int k_Pop(kernelHandler * ks, TD * task){
	int i =0;
	bwprintf(COM2,"K-pop? before pop\n\r",i);
	bwprintf(COM2,"K-pop?  \n\r");
	//will modify to use bitstring check instead of loop later
	TD * test =0;
	task = 0;
	while(k_Popp(ks,test,i)){ //true if k_popp returns -1
		i ++;
		if (i == 32) break;
	}

	bwprintf(COM2,"K-pop! priority %d is popped\n\r",i);
	if (i== 32)return 0; 
	bwprintf(COM2,"K-pop!! TID %d is popped\n\r",test->TID);
	
	return 1;
	
}


int kernel_queuePush(kernelHandler * ks, BUFFER_TYPE task) {
	return queuePush(&(ks->Q), task);
}



int kernel_queuePop(kernelHandler * ks, BUFFER_TYPE * task){
	return queuePop(&(ks->Q), task);
}



