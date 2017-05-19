
#include "queue.h"

// Note that circularBuffer initialization, additions and retreivals returns a success or failure 
// value. This way if any one of the function calls fail we can short-circuit out and return a 0.
// Hence the use of ternary operators.



int queueInit(queue * Q) {
	return circularBufferInit(&(Q->high)) &&
		circularBufferInit(&(Q->medium)) &&
		circularBufferInit(&(Q->zombie)) &&
		circularBufferInit(&(Q->low));
}


int queuePush(queue * Q, BUFFER_TYPE item, int P) {
	switch (P){
	case(HIGH):
		return addToBuffer(item, &(Q->high));
		break;
	case(MEDIUM):
		return addToBuffer(item, &(Q->medium));
		break;
	case(LOW):
		return addToBuffer(item, &(Q->low));
		break;
	case(ZOMBIE):
		return addToBuffer(item, &(Q->zombie));
		break;
	default:
		return 0;
		break;
	}
}

int queuePriorityPop(queue * Q, BUFFER_TYPE * item, int P) {
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
	case(ZOMBIE):
		return getFromBuffer (item, &(Q->zombie));
		break;
	default:
		return 0;
		break;
	}
}

int queuePop(queue * Q, BUFFER_TYPE * item) {
	return queuePriorityPop(Q, item, HIGH) ||
		queuePriorityPop(Q, item, MEDIUM) ||
		 queuePriorityPop(Q, item, LOW);
}



