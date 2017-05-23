#include "kernelRequestCall.h"
#include "kernelHandler.h"
#include "bwio.h"



int processRequest(kernelHandler * ks, TD * t, request * r) {
	switch(r->reqType){
	case(MYTID):
		return kernel_MyTid(t);
		break;
	case(MYPARENTID):
		return kernel_MyParentTid(t);
		break;
	case(CREATE):
		return kernel_Create(t,r,ks);
		break;
	case(PASS):
		return kernel_Pass(t);
		break;
	case(EXIT):
		return kernel_Exit(t);
		break;
	default:
		break;
	}
	return 0;


}



int kernel_MyTid(TD * t) {
	t->reqVal = t->TID;
	return 1;
}


int kernel_MyParentTid(TD * t) {
	t->reqVal = t->parentTID;
	return 1;
}

int kernel_Pass(TD * t) {
	//literally does absolutly nothing
	t->reqVal = 0;
	return 1;
}

int kernel_Exit(TD * t) {
	//literally does absolutly nothing
	volatile int p = ZOMBIE;
	t->priority = (int) p;
	t->reqVal = 0;
	return 1;
}


int kernel_Create(TD * t, request * r, kernelHandler * ks) {
	int priority =(int) r->arg1;
	if (priority <1 || priority >3){
		 //change to 
		t->reqVal = -1;
	}else{
		int err = getNextTID(ks,&(t->reqVal));
		//got a live child
		if (err) 
		{ t->reqVal  = -2;}
		else{
		int TID = t->reqVal;
		int code =(int) r->arg2;
			
		int PTID = t->TID;
		TD * childTD = setTask(ks,TID, PTID,priority,code);   //if TID == , it is created by kernel
		kernel_queuePush(ks, childTD);
		}
	}
	
	return 1;
}