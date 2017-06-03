
#include "ts7200.h"
#include "icu.h"


void toggleTimer1Interrupt(int _switch) {
	*((int *) (VIC1_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << TIMER1_INT;
}

void toggleTimer2Interrupt(int _switch) {
	*((int *) (VIC1_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << TIMER2_INT;
}

void toggleTimer3Interrupt(int _switch) {
	*((int *) (VIC2_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << TIMER3_INT;
}

void toggleUART1Interrupt(int _switch) {
	*((int *) (VIC2_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << UART1_INT;
}

void toggleUART2Interrupt(int _switch) {
	*((int *) (VIC2_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << UART2_INT;
}

int checkInterrupts() {
	//Note this works if there is only one interupt.
	//but if there are multpliple interupts on, we need to re-order this based on priority on which interupts must be handled
	//eg if timer1 and uart1 are asserted, should we make sure timer1 await is handled before or after uart 1 is handled?
	if (*((int *) (VIC1_BASE + VIC_IRQ_STATUS)) >> TIMER1_INT == 1) return TIMER1_INT;
	if (*((int *) (VIC1_BASE + VIC_IRQ_STATUS)) >> TIMER2_INT == 1) return TIMER2_INT;
	if (*((int *) (VIC2_BASE + VIC_IRQ_STATUS)) >> TIMER3_INT == 1) return TIMER3_INT;
	if (*((int *) (VIC2_BASE + VIC_IRQ_STATUS)) >> UART1_INT == 1) return UART1_INT;
	if (*((int *) (VIC2_BASE + VIC_IRQ_STATUS)) >> UART2_INT == 1) return UART2_INT;
	
	return 0;
}

void disableInterrupts() {
	toggleTimer1Interrupt(0);
	toggleTimer2Interrupt(0);
	toggleTimer3Interrupt(0);
	toggleUART1Interrupt(0);
	toggleUART2Interrupt(0);
}

