

#ifndef _KERNEL_HANDLER_

#define _KERNEL_HANDLER_

#include "queue.h"
#include "td.h"
#include "kernelMacros.h"



typedef struct kernelHandler{
	
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

	volatile int nameServer; //k2
	volatile int clockServer;//k3

	volatile int idleTaskRunning;//k3
	volatile int clockTaskRunning;//k3
	volatile int clockNotifierTaskRunning;//k3

	volatile int lastIdleRunningTime;//k3

	volatile int totalCSRunningTime;//k3
	volatile int totalCNRunningTime;//k3
	volatile int totalIdleRunningTime;//k3

	/******************************
		we need to figure for each possible wait event, if there can only be one
		task for each interupt, or if multiple tasks should wait for a particular event.
		i.e should only the clock notifier care about the timer wait event, or can other tasks be put on wait as well?
		if so, do they all get unblocked or do they get poped one at a time?

		for now, im going to assume there is only one task waiting on a prarticular event at a time.
		if we need to allow mutliple, we should do something like freeHead, free tail, where we push these tasks to a
		list/queue.
	*/
	volatile int await_TIMER; 

	//memm offset for user task space
	int memOffset;
	//an idea from ben to safely allocate space is to have 
	//wondering if this should be placed in another datastructure to limit cache misses
	char taskSpace[MAX_STACKSIZE+16];//add extra padding to deal with wierd offsets
	
} kernelHandler;

// return 1 if kernel handler was succesfully initialized. 
int initKernel(kernelHandler * ks, int priority, int code);

void  exitKernel(kernelHandler * ks);

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

