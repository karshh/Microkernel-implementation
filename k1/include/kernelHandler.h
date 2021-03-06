

#ifndef _KERNEL_HANDLER_

#define _KERNEL_HANDLER_

#include "queue.h"
#include "td.h"
#include "kernelMacros.h"



typedef struct kernelHandler{
//Kernal struct
	//list of TD's
	TD TDList[MAX_TID];
	//priority queues
	volatile TD * priorityHead[32];
	volatile TD * priorityTail[32];
	unsigned int priotiyBitLookup;  

	//free list
	volatile TD * freeHead;
	volatile TD * freeTail;

	volatile TD * activeTask;
	//memm offset for user task space
	int memOffset;
	//an idea from ben to safely allocate space is to have 
	//wondering if this should be placed in another datastructure to limit cache misses
	char taskSpace[MAX_STACKSIZE+16];//add extra padding to deal with wierd offsets
	
} kernelHandler;

// return 1 if kernel handler was succesfully initialized. 
int initKernel(kernelHandler * ks, int priority, int code);

// run the kernel
void kernelRun();

int getNextTID(kernelHandler  * ks, int * TID);

void kernelTestRun(int priority, int code);

TD * setTask(kernelHandler * ks,  int TID, int parentTID,int priority, int code);


// Abstracting queue code away.
//int kernel_queuePush(kernelHandler * ks, BUFFER_TYPE task);
//int kernel_queuePop(kernelHandler * ks, BUFFER_TYPE * task);


//temporary queue functions for now
int kernel_queuePush(kernelHandler * ks,volatile TD * task);
int kernel_queuePop_priority(kernelHandler * ks, volatile TD ** task, volatile int priority);
int kernel_queuePop(kernelHandler * ks, volatile TD ** task);

int free_Push(kernelHandler * ks,volatile TD * task);
int free_Pop(kernelHandler * ks, volatile TD ** task);

#endif

