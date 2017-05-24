

#ifndef _TD_
#define _TD_

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
	
	volatile int reqVal;	
	
	volatile int spsr;	 // for the same reasons above, we must store it's CPSR here when it
			 	 // returns from the requestCall.
	volatile int lr;

	volatile int TID; 
	volatile int parentTID; //will use for getMyparentTid for now
	volatile struct TD * parent; //pointer to parent if null, then ptid is first_task
	volatile int priority;
	volatile State state;

	volatile struct TD * nextTD; //used for priority queues and free list
		//when pop, next means the task after the poped task
	volatile struct TD * prevTD; 

} TD;


int initTD( TD * td, int TID, int memOffset);//sets upmemory allocation for tasks


#endif

