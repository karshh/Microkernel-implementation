#include "kernelRequestCall.h"
#include "kernelHandler.h"
#include "bwio.h"
#include "td.h"
#include "kernelMacros.h"


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
		break;
	case(RECEIVE):
		return kernel_Receive(t, r, ks, m);
		break;
	case (REPLY):
		return kernel_Reply(t, r, ks, m);
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

	// Cases where we return a -2 to the user task:
	// 		1. TID is out of bounds.
	//		2. User task is sending to a task which is a zombie or is free.
	if ((tid > MAX_TID - 1) || tid < 0 || 
		(ks->TDList[tid]).state == ZOMBIE || 
		 (ks->TDList[tid]).state == FREE) {
		t->reqVal = -2;
		return 1;
	}


	// Cases where we return a -3 to the user task:
	// 		1. User is trying to send a message to itself.
	//		2. Message is too long [> MESSAGE_CAPACITY]
	//	Send this error in any situation where the transaction can't be completed.
	if (tid == t->TID || msglen > MESSAGE_CAPACITY || replylen > MESSAGE_CAPACITY) {
		t->reqVal = -3;
		return 1;
	}

    //bwprintf(COM2, "Kernel: Case 11.\r\n");
	//empty out all garbage in the message pointer.
	m->senderTID = 0;
	int i = 0;
	for (i = 0; i < m->msglen; i++) m->msg[i] = 0;
	m->msglen = 0;
	m->receiverTID = 0;
	
	//put request information in message.
	m->senderTID = t->TID;
	m->receiverTID = tid;
	m->msglen = msglen;
	for (i = 0; i < msglen; i++) {
		m->msg[i] = ((char *) r->arg2)[i];
	}
	

    //bwprintf(COM2, "Kernel: Case 14.\r\n");
	// empty out all garbage in the sender's composebox.
	t->compose = 0;
	t->composelen = 0;

	
	//point task's compose to reply buffer.
	t->compose = (char *) r->arg4;
	t->composelen = replylen;

    //bwprintf(COM2, "Kernel: Case 12[TID:%d, Msg:%s, Msglen:%d, reqVal:%d]\r\n",
    //	m->receiverTID, m->msg, m->msglen, 0xdeadbeef);
	
	//If the mail isn't sent, just return an error code that the transaction couldn't be completed.
	if (!putMail(&(ks->TDList[tid]), m)) {
		t->reqVal = -3;
		return 1;
	}


    //bwprintf(COM2, "Kernel: Case 13.\r\n");
	if ((ks->TDList[tid]).state == SEND_BLOCKED) {
		// push into queue during this statement execution.
		t->state = RECEIVE_BLOCKED;
		processMail(tid, ks, m, 1);
	} else {
		t->state = REPLY_BLOCKED;
	}


    //bwprintf(COM2, "Kernel: Case 15.\r\n");
	// block task.
	return 1;

}

int kernel_Receive(TD * t, request * r, kernelHandler * ks, message * m) {
	
	// point compose and tid to the buffer.
	t->compose = (char*) r->arg2;
	t->composelen = (int) r->arg3;
	t->tidBuffer = (int*) r->arg1;
	
    //bwprintf(COM2, "Kernel: Case 21.\r\n");
	// we don't push into queue here during this statement execution.
	return processMail(t->TID, ks, m, 0);
	

}


int kernel_Reply(TD * t, request * r, kernelHandler * ks, message * m) {
	// TODO: implement corner cases.
	int tid = (int) r->arg1;
	TD * sender = &(ks->TDList[tid]);
	int replylen = (int) r->arg3;
	
	if (sender->state != RECEIVE_BLOCKED && sender->state != REPLY_BLOCKED) {
		t->reqVal = -3;
		return 1;
	}
    //bwprintf(COM2, "Kernel: Case 31.\r\n");
	volatile int i = 0;
	for (i = 0; i < replylen && i < sender->composelen; i++) {
                sender->compose[i] = ((char*) (r->arg2))[i];
        }

	if (replylen > sender->composelen) {
		sender->compose[sender->composelen - 1] = 0;
		t->reqVal = -1;
		sender->reqVal = -1;
	} else {
		t->reqVal = 0;
		sender->reqVal = replylen;
	}
	
    //bwprintf(COM2, "Kernel: Case 32[TID:%d, Msg:%s, Msglen:%d, reqVal:%d].\r\n", 
    //	sender->TID, sender->compose, sender->composelen, sender->reqVal);
	sender->state = ACTIVE;
	kernel_queuePush(ks, sender);
    //bwprintf(COM2, "Kernel: Case 33.\r\n");
	return 1;
	
	
}


// this is called AFTER task requests a mail receiver.
int processMail(int receiver, kernelHandler * ks, message * m, int pushIntoQueue) {
	TD * receiverTD = &(ks->TDList[receiver]);
   // bwprintf(COM2, "Kernel: Case 210.\r\n");
	if (!checkMail(receiverTD, m)) {
		// no mail, just block.
		receiverTD->state = SEND_BLOCKED;
		return 1;
	}
	
    //bwprintf(COM2, "Kernel: Case 211.\r\n");
	// if there was a mail, the m pointer would be assigned that within the if statement parameter. 
	
	volatile int i = 0;
	for (i = 0; i < m->msglen && i < receiverTD->composelen; i++) {
		receiverTD->compose[i] = m->msg[i];
	}

    //bwprintf(COM2, "Kernel: Case 212.\r\n");
	if (m->msglen > receiverTD->composelen) {
		receiverTD->compose[receiverTD->composelen - 1] = 0;
		receiverTD->reqVal = -1;
	} else {
		receiverTD->reqVal = m->msglen;	
	}

	*(receiverTD->tidBuffer) = m->senderTID;
	
    //bwprintf(COM2, "Kernel: Case 213[TID:%d, Msg:%s, Msglen:%d, reqVal:%d].\r\n", 
    //	receiverTD->TID, receiverTD->compose, receiverTD->composelen, receiverTD->reqVal);
	receiverTD->state = ACTIVE;
	if (pushIntoQueue) kernel_queuePush(ks, receiverTD);
	return 1;
	
}



