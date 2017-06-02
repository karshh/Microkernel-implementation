#include "dictionary.h"
#include "userRequestCall.h"
#include "bwio.h"
#include "server.h"
#include "pkstring.h"

int nameServerInit(nameServer * ns) {
	volatile int myTid = MyTid();
	ns->serverTID = myTid;

	// initialize data structure.

	return 1;
}

int nameServerRun() {
	nameServer ns;

	// initialize nameserver.
	bwassert(nameServerInit(&ns), COM2, "Failed NameServer initialization.\n\r");
	return 1;
}


void NameServerTask(){

    dictionary d;
    initDictionary(&d);

    while(1){
   	int _tid = 0;
    	char _msg[20];
    	int _msglen = 20;

    	volatile char _type[3];
    	volatile char _name[16];

    	volatile int rcvLen = Receive(&_tid, _msg, _msglen);
	if(rcvLen >=4){
		_type[0] = _msg[0];
		_type[1] = _msg[1];
		_type[2] = '\0';
		volatile int i = 0;
		for(i=0;i<15;i++){
			_name[i] = _msg[2+i];
		}



		if(pkstreq_volatile(_type,"01")) {
			//whois
			//bwprintf(COM2, "NameServer:who is  %s\r\n", _name);
			volatile int whoisTid =0;
			volatile int err = 0;
			err =searchDictionary(&d,_name, &whoisTid);
			if(!err) whoisTid = -2; 

			char _reply[2] = "1";
			_reply[0] = whoisTid;
			int _rplen = 2;
			//bwprintf(COM2, "NameServer:Replying to <%d>the following: %d %d.\r\n", _tid, _reply[0], _reply[1]);
			Reply( _tid, _reply, _rplen);
		}
		else if(pkstreq_volatile(_type,"10")) {
			//add name
			//bwprintf(COM2, "NameServer: register TID  %d %s, \r\n", _tid,_name);
			int err = addDictionary(&d,_name,_tid);
			char _reply[2] = "1";
			if(err) _reply[0] = 0;
			else _reply[0] = -2;
			int _rplen = 2;
			//bwprintf(COM2, "NameServer:Replying to <%d>the following: %d %d.\r\n", _tid, _reply[0], _reply[1]);
			Reply( _tid, _reply, _rplen);
		}
		else{
			char * _reply = "DO NOT SEND TO NAME SERVER";
			int _rplen = 27;
			Reply( _tid, _reply, _rplen);
		}
	}else{
			char * _reply = "DO NOT SEND TO NAME SERVER";
			int _rplen = 27;
			Reply( _tid, _reply, _rplen);
	}
	
	//forever 
    }
 
}



void initStorage(TimeStorage * t) {
	t->size = 0;
}

int insertIntoStorage(TimeStorage * t, StorageNode * n) {
	
	if (t->size >= STORAGE_CAPACITY) return 0;

	volatile int low = 0;
	volatile int high = t->size;
	volatile int mid = (low + high - 1) / 2;
	while (low != high) {
		mid = (low + high - 1) / 2;
		if ((t->store[mid]).delayTime > n->delayTime) {
			low = mid + 1;
		} else {
			high = mid;
		}
	}
	// delayTime-index relationship instability fix
	while ((mid < t->size) && ((t->store[mid]).delayTime > n->delayTime)) mid++;
    
    if (t->size != 0) {

		volatile int i = t->size - 1;
		for (; i >= mid; i--) t->store[i+1] = t->store[i];
    }
	t->store[mid].tid = n->tid;

	t->store[mid].delayTime = n->delayTime;
    (t->size)++;
    
	return 1;
}

int deleteFromStorage(TimeStorage * t, StorageNode * n) {
	if (t->size <= 0) return 0;
	n->tid = t->store[t->size - 1].tid;
	n->delayTime = t->store[t->size - 1].delayTime;
	(t->size)--;
	return 1;
}


void idleTask() {
	volatile int i = 0;
	while(1) {
		for (i = 0; i < 10000; i++) {}

		bwprintf(COM2, "ID: Enter\r\n");
		Pass();
		bwprintf(COM2, "ID: Exit\r\n");
		for (i = 0; i < 10000; i++) {}
	}
}

void clockNotifier() {

	int csTID = MyParentTid();
	// avoiding corruption of memory regarding null char pointer passing.
	char msg[3];
	int msgLen = 3;
	bwprintf(COM2, "clockNotifier: ENTERING NOTIFICATION LOOP\r\n");
	while(1) {

		AwaitEvent(TIMER_TICK);
		bwprintf(COM2, "clockNotifier: TIMER INTERRUPT\r\n");
		Send(csTID, 0, 0, msg, msgLen);
		bwprintf(COM2, "clockNotifier: BACK TO AWAITING EVENT\r\n");
	}


}
void clockServer() {

	bwprintf(COM2, "clockServer: CREATING IDLE TASK\r\n");
	Create(10, (void *) idleTask);
	bwprintf(COM2, "clockServer: CREATING CLOCK NOTIFIER\r\n");
	int notifierTID = Create(6, (void *) clockNotifier);
	StorageNode s;
	TimeStorage t;
	initStorage(&t);

	int _tid = -1;
	char _msg[3];
	int msgCap = 3;
	volatile int tick = 0;

	while(1) {
		bwassert(Receive(&_tid, _msg, msgCap) >= 0, COM2, "Invalid code received\r\n");
		if (_tid == notifierTID) {
			bwprintf(COM2, "clockServer: NOTIFIED BY THE GREAT NOTIFIER\r\n");
			tick++;
			while(deleteFromStorage(&t, &s) && s.delayTime < tick) {
				Reply(s.tid, "1", 2);
			}
			bwassert(insertIntoStorage(&t, &s), COM2, "Could not put back %d into storage.\r\n", s.tid);
			bwprintf(COM2, "clockServer: BACK TO RECEIVE MODE\r\n");
			Reply(notifierTID, "1", 2);
		} else {
			s.tid = _tid;
			s.delayTime = tick + ((int)_msg[1]);
			bwassert(insertIntoStorage(&t, &s), COM2, "Could not put %d into storage.\r\n", s.tid);
		}

	}
}
