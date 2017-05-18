


#include "kernelRequestCall.h"
#include "queue.h"


int processRequest(TD * t, request * r) {
	switch(r->reqType){
	case(MYTID):
		return kernel_MyTid(t);
		break;
	case(MYPARENTID):
		return kernel_MyParentTid(t);
		break;
	case(CREATE):
		//return kernel_Create(t, r);
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
	t->priority = ZOMBIE;
	t->reqVal = 0;
	return 1;
}
