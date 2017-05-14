#include "ts7200.h"

#include "bwio.h"



void PL();

void kernelEnter() {
	PL();
}


void _switch() {
	asm ("swi 0");	
	
}
void PL() {
	bwprintf(COM2, "CONTEXT SWITCH SUCCEEDED!");
}



int main(void) {
	bwsetfifo(COM2, OFF);
	* ((int *) (0x28)) = ((int) kernelEnter) + 0x218000;
	_switch();
	return 0;
}
