#include "ts7200.h"

#include "request.h"
#include "userRequestCall.h"
#include "bwio.h"
#include "interruptHandler.h"


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
		myRequest->reqVal = 619;
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


void _switch() {
	asm ("swi 0");	
	asm ("/* Comment */");	
	
}

void PL() {
	bwprintf(COM2, "CONTEXT SWITCH SUCCEEDED!");
}

static int j;

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
