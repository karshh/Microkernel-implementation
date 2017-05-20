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

	ks->TIDgen = 5;

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
	bwprintf(COM2, "Task Memory start at %x to %x \r\n",memOffset, memOffset - (MAX_TID * (MAX_STACKSIZE/MAX_TID)));
	memOffset = memOffset - (memOffset%16);
	bwprintf(COM2, "Task Memory start at %x to %x \r\n",memOffset, memOffset - (MAX_TID * (MAX_STACKSIZE/MAX_TID)));
	for (i = 0; i<MAX_TID;i++){
		initTD(&ks->TDList[i],i,memOffset);
	}

	//create_first task
	//for now we forget about shceduling and assume there is only one active td
	return 0;
}


TD * setTask(kernelHandler * ks,  int TID, int parentTID,int priority, int code){


	bwprintf(COM2, "---------------------------...\r\n");
	TD * td = &(ks->TDList[TID]);
	bwprintf(COM2, "---------------------------...\r\n");
	td->priority = priority;
	bwprintf(COM2, "---------------------------...\r\n");
	td->parentTID = parentTID;
	bwprintf(COM2, "---------------------------...\r\n");
	if(parentTID == KERNAL_CHILD) td->parent = 0;
	else td->parent = &(ks->TDList[parentTID]);

	bwprintf(COM2, "---------------------------...\r\n");
	td->state = READY;
	bwprintf(COM2, "---------------------------...\r\n");
	td->spsr = 0xd0;
	bwprintf(COM2, "---------------------------...\r\n");
	td->reqVal = -1;
	bwprintf(COM2, "Hur?---------------------------...\r\n");
	bwprintf(COM2, "Hur?%x---------------------------...\r\n",td->sp);
	*(td->sp - 11) = code;
	bwprintf(COM2, "---------------------------...\r\n");
 	*(td->sp - 12) = td->spsr; 	
	bwprintf(COM2, "---------------------------...\r\n");
		td->sp -= 12;
	bwprintf(COM2, "---------------------------...\r\n");
return  td;

}


