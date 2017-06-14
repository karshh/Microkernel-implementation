
#ifndef _DEBUG_TIME_
#define _DEBUG_TIME_


#include "ts7200.h"
#include "bwio.h"

typedef enum timerModeType {
	FREERUNNING,
	PERIODIC
} timerModeType;


void startTimer(int base, int khz, int startTime, int timerMode);

void stopTimer(int base);

unsigned int getTicks(int base, int offset);
unsigned long getTicks4(long offset);
unsigned long getTicks4us(long offset);

void clearTimerInterrupt(int base);

#endif
