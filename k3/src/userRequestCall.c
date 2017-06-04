#include "userRequestCall.h"
#include "request.h"
#include "pkstring.h"
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

int CreateNameServer( int priority, void (*code)){
	request myRequest;
	myRequest.reqType = CREATENAMESERVER;
	myRequest.arg1 = (void *) priority;
	myRequest.arg2 = code;
	return user_contextswitch(0xdeadbeef, &myRequest);
}

int CreateClockServer( int priority, void (*code)){
	request myRequest;
	myRequest.reqType = CREATECLOCKSERVER;
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

int WhoIs(char *name){
	volatile char * name2 = (volatile char *) name;
	volatile char name1[18];
	name1[0] ='0';
	name1[1] ='1';
	pkstrcpy_aftern_append(name1,name2,2,17);
	//name 1 is the truncated name with 

	request myRequest;

	myRequest.reqType = WHOIS;
    	char _reply[2];
	_reply[0] = 0;
	_reply[1] = 0;
    	int _rplen = 2;
	myRequest.arg1 = (void *) 0;
	myRequest.arg2 = (void *) name1;
	myRequest.arg3 = (void *) 18;
	myRequest.arg4 = (void *) _reply;
	myRequest.arg5 = (void *) _rplen;
	volatile int result =  user_contextswitch(0xdeadbeef, &myRequest);
	
	if(result < 0) return result;

	if(_reply[0] > 127) return _reply[0] -256;
	return _reply[0];
}

int RegisterAs(char *name){
	volatile char * name2 = (volatile char *) name;
	volatile char name1[18];
	name1[0] ='1';
	name1[1] ='0';
	pkstrcpy_aftern_append(name1,name2,2,17);
	//name 1 is the truncated name with 

	request myRequest;

	myRequest.reqType = REGISTER;
    char _reply[2];
	_reply[0] = 0;
	_reply[1] = 0;
    int _rplen = 2;
	myRequest.arg1 = (void *) 0;
	myRequest.arg2 = (void *) name1;
	myRequest.arg3 = (void *) 18;
	myRequest.arg4 = (void *) _reply;
	myRequest.arg5 = (void *) _rplen;
	volatile int result =  user_contextswitch(0xdeadbeef, &myRequest);
	
	if(result < 0) return result;

	if(_reply[0] > 127) return _reply[0] -256;
	return _reply[0];
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

int AwaitEvent( int eventid){
	request myRequest;
	myRequest.reqType = AWAITEVENT;
	myRequest.arg1 = (void *) eventid;
	return user_contextswitch(0xdeadbeef, &myRequest);
}


int Delay(int tid, int ticks) { 
	if (ticks <= 0) return -2;
	char msg[7];
	msg[0] = 10;
	msg[1] = (ticks / 100000000) % 100;
	msg[2] = (ticks / 1000000) % 100;
	msg[3] = (ticks / 10000) % 100;
	msg[4] = (ticks / 100) % 100;
	msg[5] = ticks % 100;
	msg[6] = 0;
	int msgLen = 7;
	char rpl[2];
	int rplLen = 2;

	request myRequest;

	myRequest.reqType = DELAY;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msgLen;
	myRequest.arg4 = (void *) rpl;
	myRequest.arg5 = (void *) rplLen;
	return user_contextswitch(0xdeadbeef, &myRequest) == 2 ? 0 : -3;

}

int Time(int tid) {
	char msg[2];
	msg[0] = 11;
	msg[1] = 0;
	int msgLen = 2;
	char rpl[6];
	int rplLen = 6;

	request myRequest;
	myRequest.reqType = TIME;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msgLen;
	myRequest.arg4 = (void *) rpl;
	myRequest.arg5 = (void *) rplLen;
	return user_contextswitch(0xdeadbeef, &myRequest) == 6 
			? 	((((int)rpl[0]) * 100000000) + 
				(((int)rpl[1]) * 1000000) + 
				(((int)rpl[2]) * 10000) + 
				(((int)rpl[3]) * 100) + 
				((int)rpl[4])) 
			: 	-1;
}


int DelayUntil(int tid, int ticks) {
	char msg[7];
	msg[0] = 12;
	msg[1] = (ticks / 100000000) % 100;
	msg[2] = (ticks / 1000000) % 100;
	msg[3] = (ticks / 10000) % 100;
	msg[4] = (ticks / 100) % 100;
	msg[5] = ticks % 100;
	msg[6] = 0;
	int msgLen = 7;
	char rpl[2];
	int rplLen = 2;

	request myRequest;
	myRequest.reqType = DELAYUNTIL;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msgLen;
	myRequest.arg4 = (void *) rpl;
	myRequest.arg5 = (void *) rplLen;
	return user_contextswitch(0xdeadbeef, &myRequest) == 2 ? 0 : -3;

}


