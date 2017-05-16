
#include "userRequestCall.h"
#include "request.h"
#include "bwio.h"

int user_contextswitch(request * myRequest, int arg1, int arg2, int arg3){
//note since r0...r3 are used in gcc convention for passing args, r0 has the first arg...i.e my Request
//since we don't change any of the argument values r0--r1 retains thier value when running swi
	asm ("swi 0");	
	return 0;
	
}
int MyTid(){
	
	request myRequest;
	myRequest.reqType = MYTID;
	//r0 = &myrequest
	//note args arg1...arg3 are useless might remove in future
	//r1 = 3
	//r2 = 1
	//r3 = 4
	
	user_contextswitch(&myRequest, 3,1,4);
	bwprintf(COM2,"got tid\n\r");
	return myRequest.reqVal;
}

int MyParentTid(){
	
	request myRequest;
	myRequest.reqType = MYPARENTID;
	//r0 = &myrequest
	//note args arg1...arg3 are useless might remove in future
	//r1 = 3
	//r2 = 1
	//r3 = 4
	
	user_contextswitch(&myRequest, 0,0,0);
	bwprintf(COM2,"got parent tid\n\r");
	return myRequest.reqVal;
}




#ifndef _REQUEST_

#define _REQUEST_
typedef enum requestType {
	MYTID,
	MYPARENTID,
	CREATE,
	PASS,
	EXIT
	
} requestType;

typedef struct request{
	requestType reqType;
	int reqVal;
} request;


// return 1 if kernel handler was succesfully initialized. 
int kernelHandlerInit();

#endif
