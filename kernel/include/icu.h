


#ifndef _ICU_

#define _ICU_

void toggleTimer1Interrupt(int _switch);

void toggleTimer2Interrupt(int _switch);
void toggleTimer3Interrupt(int _switch);

void toggleUART1VICInterrupt(int _switch);
void toggleUART1SendInterrupt(int _switch);

void toggleUART1ReceiveInterrupt(int _switch);

void toggleUART2VICInterrupt(int _switch);
void toggleUART2SendInterrupt(int _switch);
void toggleUART2ReceiveInterrupt(int _switch);

int checkInterrupts();

void disableInterrupts();

#endif
