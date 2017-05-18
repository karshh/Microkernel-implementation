

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
	int* sp;	 // stack pointer.
	
	int reqVal;	
	
	int spsr;	 // for the same reasons above, we must store it's CPSR here when it
			 	 // returns from the requestCall.
	int lr;

	int TID;
	int parentTID;
	int priority;
	State state;

} TD;


#endif

