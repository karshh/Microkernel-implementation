

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

inline int processRequest(kernelHandler *ks, TD * t, request * r, message * m);

int processInterrupt(kernelHandler *ks);

int kernel_Send(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_Receive(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_Reply(TD * t, request * r, kernelHandler * ks, message * m);


int kernel_Create(TD * t, request * r, kernelHandler * ks);

int kernel_CreateNameServer(TD * t, request * r, kernelHandler * ks);

int kernel_CreateClockServer(TD * t, request * r, kernelHandler * ks);

int kernel_CreateIOServer(TD * t, request * r, kernelHandler * ks);

int kernel_MyTid(TD * t);

int kernel_AwaitEvent(TD * t, request * r, kernelHandler * ks);

int kernel_MyParentTid(TD * t);

int kernel_Pass(TD * t);

int kernel_Exit(TD * t); 

int kernel_Quit(TD * t, kernelHandler * ks); 


int kernel_WhoIs(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_RegisterAs(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_RequestClockServer(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_RequestIOServer(TD * t, request * r, kernelHandler * ks, message * m);

int kernel_IdlePercentage(TD * t, kernelHandler * ks);

void kernelTestRun();


int processMail(int receiever, kernelHandler * ks, message * m, int pushIntoQueue);


#endif
