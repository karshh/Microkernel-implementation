#include "kernelHandler.h"
#include "td.h"

int getNextTID(kernelHander * ks, int * TID){
	if (ks->TIDgen == MAX_TID) return -1;  //check if there are enough TD's
	*TID = ks->TIDgen;
	ks->TIDgen ++;
	return 0;
}

int kernelHandlerInit(kernelHander * ks){

	ks->TIDgen = 0;

	int i = 0;
	for (i = 0; i<MAX_TID ;i++){
		initTD(&ks->TDList[i],i);
	}

	//create_first task
	//for now we forget about shceduling and assume there is only one active td
	int err = 0;
	int TID;
	err = getNextTID(ks, &TID);
	if(err) return err;

	TD * firstTd = &(ks->TDList[TID]);
/*
	bwprintf(COM2,"my TID %d \n\r",firstTd->spsr);
	//sp 0--10 saves r0-r10 , why we save r10 (stack limit) i don't know...but assume i do
	*(firstTd->sp - 11) = ((int) userTaskC) + REDBOOT_LOAD_OFFSET;
 	*(firstTd->sp - 12) = firstTd->spsr; 	
	firstTd->sp -= 12;


	//assert(err == 0);//Check if nextTid gotten
	bwprintf(COM2,"my TID %d \n\r",TID);
	bwprintf(COM2,"my TID %x \n\r",firstTd->sp);
	bwprintf(COM2,"my TID's address %x \n\r",&firstTd);
*/
	return 0
}
