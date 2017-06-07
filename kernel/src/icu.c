
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

void toggleUART1SendInterrupt(int _switch) {

         if (_switch) {
                *((int *) (UART1_BASE + UART_CTLR_OFFSET)) |= (TIEN_MASK | MSIEN_MASK) ;
        } else {
                *((int *) (UART1_BASE + UART_CTLR_OFFSET)) &= ~(TIEN_MASK | MSIEN_MASK);
        }

	*((int *) (VIC2_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << UART1_INT;
}


void toggleUART1ReceiveInterrupt(int _switch) {
         if (_switch) {
		*((int *) (UART1_BASE + UART_CTLR_OFFSET)) |= RIEN_MASK;
        } else {
		*((int *) (UART1_BASE + UART_CTLR_OFFSET)) &= ~RIEN_MASK;
	}
	*((int *) (VIC2_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << UART1_INT;
}


void toggleUART2SendInterrupt(int _switch) {

         if (_switch) {
                *((int *) (UART2_BASE + UART_CTLR_OFFSET)) |= (TIEN_MASK | MSIEN_MASK);
        } else {
                *((int *) (UART2_BASE + UART_CTLR_OFFSET)) &= ~(TIEN_MASK | MSIEN_MASK);
        }

        *((int *) (VIC2_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << UART2_INT;
}


void toggleUART2ReceiveInterrupt(int _switch) {
         if (_switch) {
                *((int *) (UART2_BASE + UART_CTLR_OFFSET)) |= RIEN_MASK;
        } else {
                *((int *) (UART2_BASE + UART_CTLR_OFFSET)) &= ~RIEN_MASK;
        }
        *((int *) (VIC2_BASE + (_switch ? VIC_INT_ENABLE : VIC_INT_ENCLEAR))) |= 1 << UART2_INT;
}



int checkInterrupts() {
	//Note this works if there is only one interupt.
	//but if there are multpliple interupts on, we need to re-order this based on priority on which interupts must be handled
	//eg if timer1 and uart1 are asserted, should we make sure timer1 await is handled before or after uart 1 is handled?
	//(usharma): I guess we'll just have to return an encoded integer.

	volatile int ans = 0;
	volatile int vic1 = *((int *) (VIC1_BASE + VIC_IRQ_STATUS));
	volatile int vic2 = *((int *) (VIC2_BASE + VIC_IRQ_STATUS));
	if (vic2 >> TIMER3_INT == 1) ans |= 0x1;
	if (vic1 >> TIMER1_INT == 1) ans |= 0x2;
	if (vic1 >> TIMER2_INT == 1) ans |= 0x4;
	if (vic2 >> UART1_INT == 1) ans |= 0x8; 
	if (vic2 >> UART2_INT == 1) ans |= 0x10; 

	
	return ans;
}

void disableInterrupts() {
	toggleTimer1Interrupt(0);
	toggleTimer2Interrupt(0);
	toggleTimer3Interrupt(0);
	toggleUART1SendInterrupt(0);
	toggleUART1ReceiveInterrupt(0);
    toggleUART2SendInterrupt(0);
	toggleUART2ReceiveInterrupt(0);


}

