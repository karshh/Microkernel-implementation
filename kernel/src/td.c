#include <td.h>

#include "bwio.h"
int initTD( TD * td, int TID, int memOffset){
	td->TID = TID;
	td->parent = 0;
	td->parentTID = 0;
	td->priority = 4; //highest priority.. can change later
	td->state = FREE; 
	td->reqVal = 0;
	td->sp = (int *) (memOffset - (TID * (MAX_STACKSIZE/MAX_TID)));//giving stack space of 1kb
	bwprintf(COM2,"%d %x %x\n\r",TID,(memOffset - (TID * (MAX_STACKSIZE/MAX_TID))),td->sp);
	//TODO RnD look at linker scripts to reserve space on linker instead of magic number
	td->spsr = 0xd0; //set SPSR to just user mode
	td->lr = 0; //must be set on task creation
	return 1;
}

