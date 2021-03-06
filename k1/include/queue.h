

#ifndef _QUEUE_
#define _QUEUE_

#include "buffer.h"
#include "kernelMacros.h"

typedef struct priorityQueue {
	circularBuffer high;
	circularBuffer medium;
	circularBuffer low;
	circularBuffer zombie;
	
} queue;


// initializes the Qeueue. Return 1 if the queue was succesfully initialized. Otherwise, 0.
int queueInit(queue * Q);

// push it into one of the queues, based on priority. Returns 1 if succesful, 0 otherwise.
int queuePush(queue * Q, BUFFER_TYPE item);

// pop's an item with specific priority from the queue. Returns 1 if succesful, 0 otherwise.
int queuePriorityPop(queue * Q, BUFFER_TYPE * item, int P);

// pop's an item from the queue. Returns 1 if succesful, 0 otherwise.
int queuePop(queue * Q, BUFFER_TYPE * item);

#endif
