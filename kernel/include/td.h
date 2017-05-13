

#ifndef _TD_
#define _TD_

typedef enum State {
	ACTIVE,
	READY,
	ZOMBIE,
	SEND_BLOCKED,
	RECIEVE_BLOCKED,
	REPLY_BLOCKED,
	EVENT_BLOCKED
} State;


typedef struct TD {
	int TID;
	TD * parent;
	int priority;
	State state;
	int sp;		 // stack pointer.
	
	int retVal;	 // since this task may not be scheduled to run immediately
			 // after a requestCall, we must store the value it's looking for
			 // when it makes the request here. 
	
	int spsr;	 // for the same reasons above, we must store it's CPSR here when it
			 // returns from the requestCall.

} TD;


#endif

