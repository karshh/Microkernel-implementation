


#ifndef _ICU_

#define _ICU_

void toggleTimer1Interrupt(int _switch);

void toggleTimer2Interrupt(int _switch);
void toggleTimer3Interrupt(int _switch);
void toggleUART1Interrupt(int _switch);

void toggleUART2Interrupt(int _switch);

int checkInterrupts();

void disableInterrupts();

#endif
