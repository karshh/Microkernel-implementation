

#ifndef _KERNEL_REQUEST_CALL

#define _KERNEL_REQUEST_CALL


#include "td.h"
#include "request.h"
// the context switch will execute one of the following code based on the
// sw code. 

int kernel_Create(int priority, void (*code));

int kernel_MyTid(TD * t);

int kernel_MyParentTid(TD * t);

int kernel_Pass(TD * t);

int kernel_Exit(TD * t); 




void kernelTestRun();


// return 1 if request was succesfully processed.
int processRequest(TD * t, request * r);

#endif
