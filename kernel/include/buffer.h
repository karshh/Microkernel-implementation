
#ifndef _BUFFER_
#define _BUFFER_

#include "td.h"

#define BUFFER_CAPACITY 32
#define BUFFER_TYPE TD*

typedef struct circularBuffer {
	BUFFER_TYPE buffer[BUFFER_CAPACITY];
	volatile int head;
	volatile int tail; 

} circularBuffer;


// Return 1 if the initialization is succesful.
int circularBufferInit(circularBuffer * cb);

// Adds c to the buffer cb. 
// If head + 1 == tail, then we return 0 since at that point the buffer is full. 
// Return 1 on successful insertion.
int addToBuffer(BUFFER_TYPE c, circularBuffer * cb);

// get's the value from the buffer and assigs it to c. 
// Here, if tail == head, then get will return 0 since at that point the buffer is empty.
// Otherwise, we return 1 on succesful assignment.
int getFromBuffer(BUFFER_TYPE * c, circularBuffer * cb);

// Checks if buffer is empty
// Here, if tail == head, then get will return 1 else the buffer is not empty
int isBufferEmpty( circularBuffer * cb);


//Returns the number of elements currently in circular buffer
int bufferLength( circularBuffer * cb);



#endif

