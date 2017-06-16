

#ifndef _TD_
#define _TD_


#include "message.h"


#define MAIL_CAPACITY 16

typedef struct Inbox {
	message mail[MAIL_CAPACITY];
 	int mailIncr ;
	int mailSeen; //??

} Inbox;

int initInbox(volatile Inbox * i);

typedef enum State {
	FREE, // state is not zombie and is on free list
	ACTIVE,
	READY,
	ZOMBIE,
	SEND_BLOCKED,
	RECEIVE_BLOCKED,
	REPLY_BLOCKED,
	EVENT_BLOCKED
} State;

typedef struct TD {
	int* sp;	 // stack pointer.
	
 int reqVal;	

	volatile int interupted;	
	
	volatile int spsr;	 // for the same reasons above, we must store it's CPSR here when it
			 	 // returns from the requestCall.
	volatile int lr;

	volatile int TID; 
	volatile int parentTID; //will use for getMyparentTid for now
	volatile struct TD * parent; //pointer to parent if null, then ptid is first_task
	int priority;
	State state;

	struct TD * nextTD; //used for priority queues and free list
	//when pop, next means the task after the poped task
	struct TD * prevTD; 
/*
	// message passing
	volatile Inbox inbox;
	volatile char* compose;
	volatile int composelen;
*/
	int* tidBuffer;
	//new vars to replace inbox
	char* sendMsg;
	int sendMsgLen;
	char* replyMsg;
	int replyMsgLen;
	char* receiveMsg;
	int receiveMsgLen;
	int inboxCount;
	struct TD * inboxHead;
	struct TD * inboxTail;
	
} TD;


int initTD( TD * td, int TID, int memOffset);//sets upmemory allocation for tasks
/*
int checkMail(TD * td, message * m);

int putMail(TD * td, message * m);
*/
int inbox_Push(TD * inboxOwner, TD * inboxEntry);
int inbox_Pop(TD * inboxOwner,TD ** inboxEntry);


#endif

