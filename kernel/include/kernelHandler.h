

#ifndef _KERNEL_HANDLER_

#define _KERNEL_HANDLER_

#include "queue.h"


typedef struct kernelHandler {
	
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
	TD * currentTask;
	
	// kernel uses this to generate new TID's.
	int TIDgen;



} kernelHander;


// return 1 if kernel handler was succesfully initialized. 
int kernelHandlerInit();

void kernelTestRun();

#endif
