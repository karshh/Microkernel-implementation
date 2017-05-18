
#include "userRequestCall.h"
#include "request.h"
#include "bwio.h"

int user_contextswitch(int dummy, request * r) {
	asm ("swi 0");
	register int r_ asm("r0");	
	return r_;
	
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


