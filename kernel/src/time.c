
#include "ts7200.h"
#include "time.h"



void startTimer(int base, int khz, int startTime) {
	bwassert(base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE,
				COM2, "ERROR startTimer: Illegal base address for timer: 0x%x\r\n", base);
	*((int*) (base + CRTL_OFFSET))  &= ~ENABLE_MASK; // disable.
	*((int*) (base + LDR_OFFSET)) = startTime;		 // load starter time.
	*((int*) (base + CRTL_OFFSET))  |= khz == 508 ? CLKSEL_MASK : 0x0; // set frequency
	*((int*) (base + CRTL_OFFSET))  |= ENABLE_MASK; // enable.
}


void stopTimer(int base) {
	bwassert(base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE,
				COM2, "ERROR stopTimer: Illegal base address for timer: 0x%x\r\n", base);
	*((int*) (base + CRTL_OFFSET))  &= ~ENABLE_MASK; // disable.
}

void clearTimerInterrupt(int base) {
	bwassert(base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE,
				COM2, "ERROR stopTimer: Illegal base address for timer: 0x%x\r\n", base);
	*((int*) (base + CLR_OFFSET))  = 1; // disable.

}

int getTicks(int base, int offset) {
	bwassert(base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE,
				COM2, "ERROR geTicks: Illegal base address for timer: 0x%x\r\n", base);
	return (int) (offset -  *((int*) (base + VAL_OFFSET)));
}



