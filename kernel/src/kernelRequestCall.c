#include "kernelRequestCall.h"
#include "kernelHandler.h"
#include "bwio.h"



int processRequest(kernelHandler * ks, TD * t, request * r, message * m) {
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
	case(SEND):
		return kernel_Send(t, r, ks, m);
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
	volatile int p = ZOMBIE_PRIORITY;
	t->priority = (int) p;
	t->state = ZOMBIE;
	t->reqVal = 0;
	return 1;
}


int kernel_Create(TD * t, request * r, kernelHandler * ks) {
	int priority =(int) r->arg1;
	if (priority <0 || priority >31){
		 //change to 
		t->reqVal = -1;
	}else{
		int TID  =0;
		//int err = getNextTID(ks, &(t->reqVal));
		int err = getNextTID(ks, &(TID));
		//got a live child
		if (err) 
		{ t->reqVal  = -2;}
		else{
		t->reqVal= TID;
		int code =(int) r->arg2;
			
		int PTID = t->TID;
		TD * childTD = setTask(ks,TID, PTID,priority,code);   //if TID == , it is created by kernel
	//	kernel_queuePush(ks, childTD);
		 kernel_queuePush(ks, childTD);
		}
	}
	
	return 1;
}

int kernel_Send(TD * t, request * r, kernelHandler * ks, message * m) {
	int tid = (int) r->arg1;
	int msglen = (int) r->arg3;
	int replylen = (int) r->arg5;

	//empty out all garbage in the message pointer.
	m->senderTID = 0;
	m->msg = 0;
	m->msglen = 0;
	m->receiverTID = 0;
	
	//put request information in message.
	m->senderTID = t->TID;
	m->receiverTID = tid;
	m->msg = r->arg2;
	m->msglen = msglen;
	
	//send mail.
	putMail(&(ks->TDList[tid]), *m);

	// empty out all garbage in the sender's composebox.
	t->compose = 0;
	t->composelen = 0;

	
	//point task's compose to reply buffer.
	t->compose = r->arg4;
	t->composelen = replylen;
	
	// block task.
	t->state = SEND_BLOCKED;
	return 1;

}

