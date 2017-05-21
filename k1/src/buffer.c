
#include "buffer.h"


int circularBufferInit(circularBuffer * cb) {
    cb->head = 0;
    cb->tail = 0;
    return 1;
}

int addToBuffer(BUFFER_TYPE c, circularBuffer * cb) {
    int n = cb->head + 1 >= BUFFER_CAPACITY ? 0 : cb->head + 1;
    if (n == cb->tail) return 0;
    cb->buffer[cb->head] = c;
    cb->head = n;
    return 1;
}

int getFromBuffer(BUFFER_TYPE * c,circularBuffer * cb) {
    int n = cb->tail + 1 >= BUFFER_CAPACITY ? 0 : cb->tail + 1;
    if (cb->head == cb->tail) return 0;
    *c = cb->buffer[cb->tail]; 
    cb->tail = n;
    return 1;
    
}

int isBufferEmpty( circularBuffer * cb){
	if(cb->head == cb->tail) return 1;
	else return 0;
}


//Returns the number of elements currently in circular buffer
int bufferLength( circularBuffer * cb){
    	if (cb->head == cb->tail) return 0;
	 else if (cb->head > cb->tail) return cb->head - cb->tail;
	else  return cb->head + BUFFER_CAPACITY- cb->tail;
}


