
#include "queue.h"

// Note that circularBuffer initialization, additions and retreivals returns a success or failure 
// value. This way if any one of the function calls fail we can short-circuit out and return a 0.
// Hence the use of ternary operators.



int queueInit(queue * Q) {
	return circularBufferInit(&(Q->high)) &&
		circularBufferInit(&(Q->medium)) &&
		circularBufferInit(&(Q->low));
}


int queuePush(queue * Q, BUFFER_TYPE item, int P) {
	return P == HIGH ? addToBuffer(item, &(Q->high)) :
		(P == MEDIUM ? addToBuffer(item, &(Q->medium)) :
		 (P == LOW ? addToBuffer(item, &(Q->low)) : 0));
}

int queuePriorityPop(queue * Q, BUFFER_TYPE * item, int P) {
	return P == HIGH ? getFromBuffer (item, &(Q->high)) :
		(P == MEDIUM ? getFromBuffer (item, &(Q->medium)) :
		 (P == LOW ? getFromBuffer (item, &(Q->low)) : 0));
}

int queuePop(queue * Q, BUFFER_TYPE * item) {
	return queuePriorityPop(Q, item, HIGH) ? 1 :
		(queuePriorityPop(Q, item, MEDIUM) ? 1 :
		 (queuePriorityPop(Q, item, LOW) ? 1 : 0));
}



