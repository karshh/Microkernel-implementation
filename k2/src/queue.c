
#include "queue.h"
#include "bwio.h"


int queueInit(queue * Q) {
	volatile int ret =0;
	ret = circularBufferInit(&(Q->zombie)) ;
	ret = ret && circularBufferInit(&(Q->high)) ;
	ret = ret && circularBufferInit(&(Q->medium)) ;
	ret = ret && circularBufferInit(&(Q->low)) ;
	
	return ret;
}


int queuePush(queue * Q, BUFFER_TYPE item) {
	switch (item->priority){
	case(HIGH):
		return addToBuffer(item, &(Q->high));
		break;
	case(MEDIUM):
		return addToBuffer(item, &(Q->medium));
		break;
	case(LOW):
		return addToBuffer(item, &(Q->low));
		break;
	case(ZOMBIE_PRIORITY):
		return addToBuffer(item, &(Q->zombie));
		break;
	default:
		return 0;
		break;
	}
}

int queuePriorityPop(queue * Q, BUFFER_TYPE * item, volatile int P) {
	switch (P){
	case(HIGH):
		return getFromBuffer (item, &(Q->high)) ;
		break;
	case(MEDIUM):
		return getFromBuffer (item, &(Q->medium));
		break;
	case(LOW):
		return getFromBuffer (item, &(Q->low));
		break;
	case(ZOMBIE_PRIORITY):
		return getFromBuffer (item, &(Q->zombie));
		break;
	default:
		return 0;
		break;
	}
}

int queuePop(queue * Q, BUFFER_TYPE * item) {
	volatile int ret = 0;
		ret = queuePriorityPop(Q, item, HIGH);
	if(ret) return 1;
		ret = queuePriorityPop(Q, item, MEDIUM);
		
	if(ret) return 1;
		ret = queuePriorityPop(Q, item, LOW);
	return ret;
	
	
}



