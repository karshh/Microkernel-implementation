#include <td.h>

#include "bwio.h"
int initTD( TD * td, int TID, int memOffset){
	td->TID = TID;
	td->parent = 0;
	td->parentTID = 0;
	td->priority = 4; //highest priority.. can change later
	td->state = FREE; 
	td->reqVal = 0;
	td->sp = (int *) memOffset;
	td->spsr = 0xd0; //set SPSR to just user mode
	td->lr = 0; //must be set on task creation
	
	//not getting free list yet so init to 0.
	td->nextTD = 0;
	td->prevTD = 0;

	return 1;
}

