#include <td.h>

#include "bwio.h"

int initInbox(volatile Inbox * i) {
	i->mailIncr = 0;
	i->mailSeen = 0;
	return 1;
}


int checkMail(TD * td, message * m) {
    volatile Inbox i = td->inbox;
    
    int n = i.mailSeen + 1 >= MAIL_CAPACITY ? 0 : i.mailSeen + 1;
    if (i.mailIncr == i.mailSeen) return 0;
    *m = i.mail[i.mailSeen];
    i.mailSeen = n;
    return 1;
}

int putMail(TD * td, message m) {
    volatile Inbox i = td->inbox;

    int n = i.mailIncr + 1 >= MAIL_CAPACITY ? 0 : i.mailIncr + 1;
    if (n == i.mailSeen) return 0;
    i.mail[i.mailSeen] = m;
    i.mailSeen = n;
    return 1;


}



int initTD( TD * td, int TID, int memOffset){
	td->TID = TID;
	td->parent = 0;
	td->parentTID = 0;
	td->priority = 4; //highest priority.. can change later
	td->state = FREE; 
	td->reqVal = 0;
	td->sp = (int *) memOffset;
	td->spsr = 0xd0; //set SPSR to just user mode
	td->lr = 0; //must be set on task creation
	
	//not getting free list yet so init to 0.
	td->nextTD = 0;
	td->prevTD = 0;
	
	if (!initInbox(&(td->inbox))) return 0;
	td->compose = 0;
	td->composelen = 0;	
	return 1;
}

