

#ifndef _KERNEL_HANDLER_

#define _KERNEL_HANDLER_

#include "queue.h"
#include "td.h"

#define MAX_TID 128


typedef struct kernelHandler {
//Kernal struct
	
	// information returned back to the task which invoked the handler.
	void * sp;
	void * lr;
	void * spsr;
	int retVal;
	
	// information for the kernel to return back to redboot.
	void * redbootsp;
	void * redbootlr;
	void * redbootspsr;
	
	// kernel uses this to schedule tasks.
	queue * priorityQueue;

	// kernel uses this to generate new TID's.
	int TIDgen; //remove when implimenting free list/destry

	TD TDList[MAX_TID];
} kernelHander;


// return 1 if kernel handler was succesfully initialized. 
int kernelHandlerInit(kernelHander * ks);


void kernelTestRun();

int getNextTID(kernelHander * ks, int * TID);
#endif
