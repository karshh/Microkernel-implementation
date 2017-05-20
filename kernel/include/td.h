

#ifndef _TD_
#define _TD_

#define MAX_TID 128
#define MAX_STACKSIZE  1024*1024*16 
#define KERNAL_CHILD -1
typedef enum State {
	FREE, // state is not zombie and is on free list
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
	int parentTID; //will use for getMyparentTid for now
	struct TD * parent; //pointer to parent if null, then ptid is first_task
	int priority;
	struct TD * nextTD; //used for next TD//pointer to parent if null, then ptid is first_task
	struct TD * prevTD; //pointer to parent if null, then ptid is first_task
	State state;

} TD;


int initTD( TD * td, int TID, int memOffset);//sets upmemory allocation for tasks


#endif

