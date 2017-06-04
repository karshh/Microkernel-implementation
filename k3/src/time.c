
#include "ts7200.h"
#include "time.h"



void startTimer(int base, int khz, int startTime, int timerMode) {
	bwassert(base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE || base == TIMER4_BASE,
				COM2, "ERROR startTimer: Illegal base address for timer: 0x%x\r\n", base);
	if (base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE){
	*((int*) (base + CRTL_OFFSET))  &= ~ENABLE_MASK; // disable.
	*((int*) (base + LDR_OFFSET)) = startTime;		 // load starter time.
	if(khz == 508)
		*((int*) (base + CRTL_OFFSET))  |= CLKSEL_MASK; // set frequency to 508kHz (what if you want to set 
	else
		*((int*) (base + CRTL_OFFSET))  &= ~CLKSEL_MASK; // set frequency to 2kHz
	if(timerMode == PERIODIC)
		*((int*) (base + CRTL_OFFSET))  |= MODE_MASK; // set timer mode to periodic
	else
		*((int*) (base + CRTL_OFFSET))  &= ~MODE_MASK; // set timer mode to free running
	*((int*) (base + CRTL_OFFSET))  |= ENABLE_MASK; // enable.
	}else{
		// starting 40bit timer. so khz, starttime, timermode doesnt matter
		//40 bit timer always starts from 0 and counts to FF FFFF FFFF at 983.04 kHz (overflow every 12.946 days)
		//resets at 0 and continues counting at overflow.
		//low 32 bits fills up every 1:12:49 (HH:MM:SS)	
		//timer 4 does not interupt
		
		*((int*) (base))  |= TIMER4_ENABLE_MASK; // enable.
		
	}
}


void stopTimer(int base) {
	bwassert(base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE || base == TIMER4_BASE,
				COM2, "ERROR stopTimer: Illegal base address for timer: 0x%x\r\n", base);
	if (base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE)
		*((int*) (base + CRTL_OFFSET))  &= ~ENABLE_MASK; // disable TIMER 1/2/3.
	else
		*((int*) (base))  &= ~TIMER4_ENABLE_MASK; // disable timer 4.
	
}

void clearTimerInterrupt(int base) {
	bwassert(base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE,
				COM2, "ERROR stopTimer: Illegal base address for timer: 0x%x\r\n", base);
	*((int*) (base + CLR_OFFSET))  = 1; // disable.

}

unsigned int getTicks(int base, int offset) {
	bwassert(base == TIMER1_BASE || base == TIMER2_BASE || base == TIMER3_BASE,
				COM2, "ERROR geTicks: Illegal base address for timer: 0x%x\r\n", base);
	return (unsigned int) (offset -  *((int*) (base + VAL_OFFSET)));

}


unsigned long getTicks4(long offset) {
		//timer 4 works differntly, as it counts up, instead of down, so returns timer value - offset is ignored
		//since likelyness of kernel running over 1.2 hrs is 0 at a time, only care of low 32 bits on Timer4 
		return (unsigned long) (*((unsigned long*) (TIMER4_VALUE)) - offset)/983 ;


}


