

#ifndef _KERNEL_HANDLER_

#define _KERNEL_HANDLER_

#include "queue.h"
#include "td.h"
#include "kernelMacros.h"



typedef struct kernelHandler{
//Kernal struct
	
	// information returned back to the task which invoked the handler.
	void * sp;
	void * lr;
	void * spsr;
	int retVal;
	
	// information for the kernel to return back to redboot. Commented out for now
	// due to lack of use.
	// void * redbootsp;
	// void * redbootlr;
	// void * redbootspsr;
	
	// kernel uses this to schedule tasks.
	queue Q;

	// kernel uses this to generate new TID's.
	int TIDgen; //remove when implimenting free list/destry

	TD TDList[MAX_TID];
	//an idea from ben to safely allocate space is to have 
	char taskSpace[MAX_STACKSIZE+16];//add extra padding to deal with wierd offsets
	int memOffset;
	
} kernelHandler;

// return 1 if kernel handler was succesfully initialized. 
int initKernel(kernelHandler * ks, int priority, int code);

// run the kernel
void kernelRun();

int getNextTID(kernelHandler  * ks, int * TID);

void kernelTestRun(int priority, int code);

TD * setTask(kernelHandler * ks,  int TID, int parentTID,int priority, int code);


// Abstracting queue code away.
int kernel_queuePush(kernelHandler * ks, BUFFER_TYPE task);

int kernel_queuePop(kernelHandler * ks, BUFFER_TYPE * task);
#endif

