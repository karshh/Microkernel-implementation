#include "userRequestCall.h"
#include "request.h"
#include "bwio.h"

int user_contextswitch(int dummy, request * r) {
	asm ("swi 0");
	register int r_ asm("r0");	
	return r_;
	
}


int Create( int priority, void (*code)){
	request myRequest;
	myRequest.reqType = CREATE;
	myRequest.arg1 = (void *) priority;
	myRequest.arg2 = code;
	return user_contextswitch(0xdeadbeef, &myRequest);
}
int MyTid(){
	
	request myRequest;
	myRequest.reqType = MYTID;
	
	return user_contextswitch(0xdeadbeef, &myRequest);

}

int MyParentTid(){
	
	request myRequest;
	myRequest.reqType = MYPARENTID;
	//r0 = &myrequest
	//note args arg1...arg3 are useless might remove in future
	//r1 = 3
	//r2 = 1
	//r3 = 4
	
	return user_contextswitch(0xdeadbeef, &myRequest);
}

void Pass(){
	
	request myRequest;
	myRequest.reqType = PASS;
	//r0 = &myrequest
	//note args arg1...arg3 are useless might remove in future
	//r1 = 3
	//r2 = 1
	//r3 = 4

	user_contextswitch(0xdeadbeef, &myRequest);
}


void Exit(){
	
	request myRequest;
	myRequest.reqType = EXIT;
	//r0 = &myrequest
	//note args arg1...arg3 are useless might remove in future
	//r1 = 3
	//r2 = 1
	//r3 = 4
	
	user_contextswitch(0xdeadbeef, &myRequest);
}

int Send(int tid, char *msg, int msglen, char *reply, int rplen){
	
	request myRequest;
	myRequest.reqType = SEND;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msglen;
	myRequest.arg4 = (void *) reply;
	myRequest.arg5 = (void *) rplen;
	//r0 = &myrequest
	//note args arg1...arg3 are useless might remove in future
	//r1 = 3
	//r2 = 1
	//r3 = 4
	
	return user_contextswitch(0xdeadbeef, &myRequest);
}

int Receive(int *tid, char *msg, int msglen){
	
	request myRequest;
	myRequest.reqType = RECEIVE;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msglen;
	//r0 = &myrequest
	//note args arg1...arg3 are useless might remove in future
	//r1 = 3
	//r2 = 1
	//r3 = 4
	
	return user_contextswitch(0xdeadbeef, &myRequest);
}


int Reply(int tid, char *reply, int rplen){
	
	request myRequest;
	myRequest.reqType = REPLY;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) reply;
	myRequest.arg3 = (void *) rplen;
	//r0 = &myrequest
	//note args arg1...arg3 are useless might remove in future
	//r1 = 3
	//r2 = 1
	//r3 = 4
	
	return user_contextswitch(0xdeadbeef, &myRequest);
}
