
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

int getTicks(int base, int offset);

void clearTimerInterrupt(int base);

#endif
