#include <td.h>

int initTD( TD * td, int TID){
	td->TID = TID;
	td->parent = 0;
	td->parentTID = 0;
	td->priority = 1; //highest priority.. can change later
	td->state = FREE; 
	td->reqVal = 0;
	td->sp = (int *) 0x01A00000 - (TID * 1024);//giving stack space of 1kb
	//TODO RnD look at linker scripts to reserve space on linker instead of magic number
	td->spsr = 0xd0; //set SPSR to just user mode
	td->lr = 0; //must be set on task creation
	return 1;
}
