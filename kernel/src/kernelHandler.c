#include "kernelHandler.h"
#include "td.h"
#include "bwio.h"

int getNextTID(kernelHandler  * ks, int * TID){
	if (ks->TIDgen == MAX_TID) return -1;  //check if there are enough TD's
	*TID = ks->TIDgen;
	ks->TIDgen ++;
	return 0;
}

int initKernel(kernelHandler * ks){

	ks->TIDgen = 0;

	int i = 0;
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
	for (i = 0; i<MAX_TID;i++){
		initTD(&ks->TDList[i],i,memOffset);
	}

/*
	for (i = 0; i<MAX_TID;i++){
		bwprintf(COM2, "Checking Memory at %d to %x \r\n",i, ks->TDList[i].sp);
	}
*/

	//create_first task
	//for now we forget about shceduling and assume there is only one active td


	// initialize kernel's queue.
	queueInit(&(ks->Q));
	return 0;
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
	*(td->sp - 11) = code;
 	*(td->sp - 12) = td->spsr; 	
		td->sp -= 12;
return  td;

}

int kernel_queuePush(kernelHandler * ks, BUFFER_TYPE task) {
	return queuePush(&(ks->Q), task);
}

int kernel_queuePop(kernelHandler * ks, BUFFER_TYPE * task){
	return queuePop(&(ks->Q), task);
}



