#include "td.h"

#include "bwio.h"


/*
int messageInit(message * m) {
	m->msg = 0;
	m->msglen = 0;
	m->senderTID = 0;
	return 1;

}

int initInbox(volatile Inbox * i) {
	i->mailIncr = 0;
	i->mailSeen = 0;
	return 1;
}

int checkMail(TD * td, message * m) {
    volatile Inbox * i = &(td->inbox);
    
    int n = i->mailSeen + 1 >= MAIL_CAPACITY ? 0 : i->mailSeen + 1;
    if (i->mailIncr == i->mailSeen) return 0;
    
    m->senderTID = (i->mail[i->mailSeen]).senderTID;
    m->msglen = (i->mail[i->mailSeen]).msglen;
    m->msg = (i->mail[i->mailSeen]).msg;

    i->mailSeen = n;
    return 1;
}

int putMail(TD * td, message * m) {
    volatile Inbox * i = &(td->inbox);

    int n = i->mailIncr + 1 >= MAIL_CAPACITY ? 0 : i->mailIncr + 1;
    if (n == i->mailSeen) return 0;
    
    // stuck on a memcpy linker error.Just manually copying over to bypass it.
    (i->mail[i->mailIncr]).senderTID = m->senderTID;
    (i->mail[i->mailIncr]).msglen = m->msglen;
    (i->mail[i->mailIncr]).msg = m->msg;

    i->mailIncr = n;
    return 1;


}

*/

int initTD( TD * td, int TID, int memOffset){
	td->TID = TID;
	td->parent = 0;
	td->parentTID = 0;
	td->priority = 4; //highest priority.. can change later
	td->state = FREE; 
	td->reqVal = 0;
	td->interupted = 0;
	td->sp = (int *) memOffset;
	//td->spsr = 0xd0; //set SPSR to just user mode
	td->spsr = 0x50; //set SPSR to just user mode (interupts on, FIQ disabled bit 5=0);
	td->lr = 0; //must be set on task creation
	
	//not getting free list yet so init to 0.
	td->nextTD = 0;
	td->prevTD = 0;
	/*
	if (!initInbox(&(td->inbox))) return 0;
	td->compose = 0;
	td->composelen = 0;
*/
	td->tidBuffer = 0;	

	td->inboxCount = 0;
	td->inboxHead = 0;
	td->inboxTail = 0;
	td->sendMsg = 0;
	td->receiveMsg = 0;
	td->replyMsg = 0;
	td->sendMsgLen = 0;
	td->receiveMsgLen = 0;
	td->replyMsgLen = 0;
	return 1;
}



int inbox_Push(TD * inboxOwner, TD * inboxEntry){
	//puts or priority queue at task's priority

	if(inboxOwner->inboxHead == 0){
		//this priority is empty
		//will modify to modify bitstring later
		inboxOwner->inboxHead = inboxEntry;
		inboxOwner->inboxTail = inboxEntry;
		inboxEntry->nextTD = 0;
		inboxEntry->prevTD = 0;
		inboxEntry->state = RECEIVE_BLOCKED;
	}else{
		TD * prevHead = inboxOwner->inboxHead;
		prevHead->nextTD = inboxEntry;
		inboxEntry->prevTD = prevHead;
		inboxEntry->nextTD = 0;
		inboxEntry->state = RECEIVE_BLOCKED;
		inboxOwner->inboxHead = inboxEntry;
	}
	inboxOwner->inboxCount ++;
	return 1;
	
}


int inbox_Pop(TD * inboxOwner,TD ** inboxEntry){
	if (!inboxOwner->inboxTail || !inboxOwner->inboxCount ) return 0;
	
	TD * poppedtask =  inboxOwner->inboxTail;
	TD * nextTail = poppedtask->nextTD;

	if(nextTail == 0){
		inboxOwner->inboxTail = 0;
		inboxOwner->inboxHead = 0;
	}
	else{
		nextTail->prevTD = 0;
		inboxOwner->inboxTail = nextTail;
	}

	poppedtask->nextTD = 0;
	poppedtask->prevTD = 0;
	*inboxEntry = poppedtask;
	inboxOwner->inboxCount --;
	return 1;
}

