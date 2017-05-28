
#include "ts7200.h"
#include "debugtime.h"


#define STARTER_TIME 0x77777777

#define LOAD_ADDR (int *) (TIMER3_BASE + LDR_OFFSET)
#define CTRL_ADDR (int *) (TIMER3_BASE + CRTL_OFFSET)
#define VAL_ADDR (int *) (TIMER3_BASE + VAL_OFFSET)

void startTime() {
	*LOAD_ADDR = STARTER_TIME;
	*CTRL_ADDR = ENABLE_MASK | CLKSEL_MASK;
}

int getTime() {
	return (int) (((int) (STARTER_TIME - *VAL_ADDR)) * 1.96850393701); 	
}



