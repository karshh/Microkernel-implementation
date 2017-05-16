#include "ts7200.h"

#include "bwio.h"

#include "request.h"
#include "userRequestCall.h"

void PL();



void kernelEnter(request * myRequest) {
//changed kernal entry point to have an argument, which points to r0.
//saves me from writing janky code

	switch(myRequest->reqType){
	case(MYTID):
		//#TODO change when you get create_task done
		//lets return 314
		myRequest->reqVal = 314;
		//note does not change r0;
		bwputc(COM2,'R');
		//changes r0; but doesnt matter as we are chaning the result of 314
		//asm("movs	pc, lr");
		break;
	case(MYPARENTID):
		myRequest->reqVal = 69;
		//#TODO change when you get create_task done
		//lets return 69
		break;
	case(CREATE):
		break;
	case(PASS):
		break;
	case(EXIT):
		break;
	default:
		break;
	}



}
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



void _switch() {
	asm ("swi 0");	
	
}
void PL() {
	bwprintf(COM2, "CONTEXT SWITCH SUCCEEDED!");
}



int main(void) {
	bwsetfifo(COM2, OFF);
	* ((int *) (0x28)) = ((int) kernelEnter) + 0x218000;
	int tid = 0;
	int ptid = 0;
	tid = MyTid();
	ptid = MyParentTid();
	bwprintf(COM2, "myTid: %d", tid);
	bwprintf(COM2, "mypTid: %d", ptid);
	return 0;
}
