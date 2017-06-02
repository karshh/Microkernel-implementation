

#ifndef _KERNEL_REQUEST_CALL

#define _KERNEL_REQUEST_CALL


#include "td.h"
#include "request.h"
#include "kernelHandler.h"
#include "message.h"
#include "time.h"
#include "icu.h"

// the context switch will execute one of the following code based on the
// sw code. 

int kernel_Create(TD * t, request * r, kernelHandler * ks);
int kernel_CreateNameServer(TD * t, request * r, kernelHandler * ks);
int kernel_CreateClockServer(TD * t, request * r, kernelHandler * ks);

int kernel_MyTid(TD * t);

int kernel_AwaitEvent(TD * t, request * r, kernelHandler * ks);

int kernel_MyParentTid(TD * t);

int kernel_Pass(TD * t);

int kernel_Exit(TD * t); 

int kernel_Send(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_WhoIs(TD * t, request * r, kernelHandler * ks, message * m);
int kernel_RegisterAs(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_Receive(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_Reply(TD * t, request * r, kernelHandler * ks, message * m);

int processMail(int receiever, kernelHandler * ks, message * m, int pushIntoQueue);


int processInterupt(kernelHandler *ks);
void kernelTestRun();


// return 1 if request was succesfully processed.
int processRequest(kernelHandler *ks, TD * t, request * r, message * m);

#endif
