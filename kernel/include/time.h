
#ifndef _DEBUG_TIME_
#define _DEBUG_TIME_


#include "ts7200.h"
#include "bwio.h"

void startTimer(int base, int khz, int startTime);

void stopTimer(int base);

int getTicks(int base, int offset);

void clearTimerInterrupt(int base);

#endif
