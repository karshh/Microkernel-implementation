


#import "kernelRequestCall.h"



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
		//return kernel_Pass(t, r);
		break;
	case(EXIT):
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
