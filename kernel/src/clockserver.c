#include "ts7200.h"
#include "dictionary.h"
#include "buffer.h"
#include "userRequestCall.h"
#include "trackGraph.h"
#include "bwio.h"
#include "server.h"
#include "ui.h"
#include "pkstring.h"
#include "icu.h"
#include "controller.h"
#include "time.h"


void initStorage(TimeStorage * t) {
	t->size = 0;
}
int heapParent(int i){
	//assimiong root is at 0
	return (i-1)/2;//c integer division floors the expression
}

int heapLeft(int i){
	//assimiong root is at 0
	return (2*i)+1;
}

int heapRight(int i){
	//assimiong root is at 0
	return (2*i)+2;
}


//min heap so A[parent(i)] <= A[i];

//peak
int minHeapPeak(TimeStorage *t, int * peak){
	if (!t->size) return 0;
	*peak = t->store[0].delayTime;
	return 1;
}

void minHeapify(TimeStorage *t,int i){
	int l = heapLeft(i);
	int r = heapRight(i);
	int minIndex = i;

	if (l <= t->size && t->store[l].delayTime < t->store[minIndex].delayTime)
		minIndex = l;
	if (r <= t->size && t->store[r].delayTime < t->store[minIndex].delayTime)
		minIndex = r;

	if (minIndex != i){
		int delayTime = t->store[minIndex].delayTime;
		int tid = t->store[minIndex].tid;
		t->store[minIndex].tid = t->store[i].tid;
		t->store[minIndex].delayTime = t->store[i].delayTime;
		t->store[i].tid = tid;
		t->store[i].delayTime = delayTime;
		minHeapify(t,minIndex);
	}

}
//delete
int minHeapDelete(TimeStorage *t, StorageNode *n){
	if (!t->size) return 0;
	n->delayTime = t->store[0].delayTime;
	n->tid = t->store[0].tid;

	//replace root with last element in the heap;
	t->store[0].delayTime = t->store[t->size -1].delayTime;
	t->store[0].tid = t->store[t->size -1].tid;
	//remove the last element
	t->size --;
	//heapify
	minHeapify(t,0);
	return 1;
}
//insert
int minHeapInsert(TimeStorage *t, StorageNode *n){

	if (t->size + 1 == STORAGE_CAPACITY) return 0;

	int i = t->size;
	
	while(i >0 && t->store[heapParent(i)].delayTime > n->delayTime){
		t->store[i].delayTime = t->store[heapParent(i)].delayTime;
		t->store[i].tid = t->store[heapParent(i)].tid;
		i = heapParent(i);
	}
	t->store[i].delayTime = n->delayTime;
	t->store[i].tid = n->tid;
	t->size ++;
	return 1;
}

void clockNotifier() {

	int csTID = MyParentTid();
	// avoiding corruption of memory regarding null char pointer passing.
	char msg[3];
	int msgLen = 3;
	while(1) {

		AwaitEvent(TIMER_TICK);
		//bwprintf(COM2, "clockNotifier: TIMER INTERRUPT\r\n");
		Send(csTID, 0, 0, msg, msgLen);
		//bwprintf(COM2, "clockNotifier: BACK TO AWAITING EVENT\r\n");

	}
}

void clockServer() {
	bwassert(!RegisterAs("clockServer"), COM2, "Failed to register clockServer.\r\n");
	int notifierTID = Create(1, (void *) clockNotifier);
	StorageNode s;
	TimeStorage t;
	initStorage(&t);

	int _tid = -1;
	char msg[7];
	int msgCap = 7;
	volatile int tick = 0;
	char reply[6];
	int peak;
	while(1) {
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "Invalid code received\r\n");
		if (_tid == notifierTID) {
			tick++;

			while(1) {
		
				if (!minHeapPeak(&t, &peak)) break; //if empty break
				if (peak > tick) break; //if next delay has not occured yet break
				if (!minHeapDelete(&t, &s)) break; //should not break //get next delay
				Reply(s.tid, "1", 2); //reply to delayed task;
			}
			Reply(notifierTID, "1", 2);
		} else {
			volatile int requestCode = (int) msg[0];
			switch(requestCode) {
				case 10: // Delay code.
					s.tid = _tid;
					s.delayTime = tick + ((((int)msg[1]) * 100000000) + 
									(((int)msg[2]) * 1000000) + 
									(((int)msg[3]) * 10000) + 
									(((int)msg[4]) * 100) + 
									((int)msg[5]));
					bwassert(s.delayTime >= 0, COM2, "<ClockServer>: Delay overflow error. Could not delay TD<%d>.\r\n", _tid);
					//bwassert(insertIntoStorage(&t, &s), COM2, "<ClockServer>: Delay storage error. Could not put %d into storage.\r\n", s.tid);
					bwassert(minHeapInsert(&t, &s), COM2, "<ClockServer>: Delay storage error. Could not put %d into storage.\r\n", s.tid);
					break; 

				case 11: // Time code.
					bwassert(tick >= 0, COM2, "<ClockServer>: Time overflow error. Could not send time to TD<%d>.\r\n", _tid);
					reply[0] = (tick / 100000000) % 100;
					reply[1] = (tick / 1000000) % 100;
					reply[2] = (tick / 10000) % 100;
					reply[3] = (tick / 100) % 100;
					reply[4] = tick % 100;
					reply[5] = 0;
					Reply(_tid, reply, 6);
					break;

				case 12: // DelayUntil code.
					s.tid = _tid;
					s.delayTime = ((((int)msg[1]) * 100000000) + 
									(((int)msg[2]) * 1000000) + 
									(((int)msg[3]) * 10000) + 
									(((int)msg[4]) * 100) + 
									((int)msg[5]));
					bwassert(s.delayTime >= 0, COM2, "<ClockServer>: DelayUntil overflow error. Could not delay TD<%d>.\r\n", _tid);
					if (s.delayTime <= tick) {
						Reply(_tid, "1", 2);
					}
					//bwassert(insertIntoStorage(&t, &s), COM2, "<ClockServer>: DelayUntil storage error. Could not put TD<%d> into storage.\r\n", s.tid);
					bwassert(minHeapInsert(&t, &s), COM2, "<ClockServer>: DelayUntil storage error. Could not put TD<%d> into storage.\r\n", s.tid);
					break;
				default:
					bwassert(0, COM2, "<ClockServer>: Invalid code: %d.\r\n", requestCode);
					break;
			}

		}

	}
}
