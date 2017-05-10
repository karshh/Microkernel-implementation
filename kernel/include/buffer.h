
#ifndef _BUFFER_
#define _BUFFER_


#define BUFFER_CAPACITY 512

// not sure what the buffer type is going to be, so assigned it as int for now. Change it later.
typedef int BUFFER_TYPE; 

typedef struct circularBuffer {
	BUFFER_TYPE buffer[BUFFER_CAPACITY];
	int head;
	int tail; 

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


#endif

