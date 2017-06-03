#include "kernelRequestCall.h"
#include "kernelHandler.h"
#include "bwio.h"
#include "td.h"
#include "time.h"
#include "kernelMacros.h"
#include "ts7200.h"


int processRequest(kernelHandler * ks, TD * t, request * r, message * m) {

	if(!r){ 	
		t->interupted = 1;
		return processInterrupt(ks);
	}
	
	
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
	case(CREATENAMESERVER):
		return kernel_CreateNameServer(t,r,ks);
		break;
	case(PASS):
		return kernel_Pass(t);
		break;
	case(EXIT):
		if( t->TID == ks->nameServer) ks->nameServer = -1;
		return kernel_Exit(t);
		break;
	case(SEND):
		return kernel_Send(t, r, ks, m);
		break;
	case(WHOIS):
		return kernel_WhoIs(t, r, ks, m);
		break;
	case(REGISTER):
		return kernel_RegisterAs(t, r, ks, m);
		break;
	case(RECEIVE):
		return kernel_Receive(t, r, ks, m);
		break;
	case (REPLY):
		return kernel_Reply(t, r, ks, m);
		break;
	case(CREATECLOCKSERVER):
		return kernel_CreateClockServer(t,r,ks);
		break;
	case(AWAITEVENT):
		return kernel_AwaitEvent(t,r,ks);
		break;
	case(DELAY):
		return kernel_RequestClockServer(t,r,ks,m);
		break;
	case(TIME):
		return kernel_RequestClockServer(t,r,ks, m);
		break;
	case(DELAYUNTIL):
		return kernel_RequestClockServer(t,r,ks, m);
		break;
	default:
		break;
	}
	return 0;


}


// Extra error case added:
// 		-3 : The send-recieve-reply transmission could not be completed.
//
int kernel_RequestClockServer(TD * t, request * r, kernelHandler * ks, message * m) {
	if (ks->clockServer == -1 || (ks->clockServer != ((int) r->arg1))) {
		t->reqVal = -1;
		return 1;
	}

	return kernel_Send(t, r, ks, m);
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


int kernel_CreateNameServer(TD * t, request * r, kernelHandler * ks){
	int priority =(int) r->arg1;
	if (priority <0 || priority >31){
		 //change to 
		t->reqVal = -1;
	}else if(ks->nameServer != -1 && ks->TDList[ks->nameServer].state != ZOMBIE){
		t->reqVal = -3; //-3 if name servre exists
		//check if there exists a living nameserver;
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
		//set name sever;
		ks->nameServer = TID;
		}
	}
	return 1;


}

int kernel_CreateClockServer(TD * t, request * r, kernelHandler * ks){
	int priority =(int) r->arg1;
	if (priority <0 || priority >31){
		 //change to 
		t->reqVal = -1;
	}else if(ks->clockServer != -1 && ks->TDList[ks->clockServer].state != ZOMBIE){
		t->reqVal = -3; //-3 if clock servre exists
		//check if there exists a living clockserver;
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
		//set name sever;
		ks->clockServer = TID;
		}
	}
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

int kernel_WhoIs(TD * t, request * r, kernelHandler * ks, message * m){
	int nameServer = ks->nameServer;
	if (nameServer != -1 && ks->TDList[nameServer].state != ZOMBIE && ks->TDList[nameServer].state != FREE){
		//set name server
		r->arg1 = (void *) nameServer;

		return kernel_Send(t,r,ks,m);
	}else{
		t->reqVal = -1;
		//nameserver does not exist;
	}
	return 1;
}

int kernel_RegisterAs(TD * t, request * r, kernelHandler * ks, message * m){
	int nameServer = ks->nameServer;
	if (nameServer != -1 && ks->TDList[nameServer].state != ZOMBIE && ks->TDList[nameServer].state != FREE){
		//set name server
		r->arg1 = (void *) nameServer;
		return kernel_Send(t,r,ks,m);
	}else{
		t->reqVal = -1;
		//nameserver does not exist;
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
	//		2. Message is too long [> MESSAGE_CAPACITY] (Deprecated)
	//	Send this error in any situation where the transaction can't be completed.
	if (tid == t->TID) {
		t->reqVal = -3;
		return 1;
	}
	
	//put request information in message.
	m->senderTID = t->TID;
	m->msglen = msglen;
	m->msg = (char *) r->arg2;

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

    ////bwprintf(COM2, "Kernel: Case 13.\r\n");
	if ((ks->TDList[tid]).state == SEND_BLOCKED) {
		// push into queue during this statement execution.
		processMail(tid, ks, m, 1);
	} else {
		t->state = RECEIVE_BLOCKED;
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
	
	int tid = (int) r->arg1;
	if (tid > MAX_TID - 1 || tid < 0 || (ks->TDList[tid]).state == ZOMBIE || (ks->TDList[tid]).state == FREE ) {
		t->reqVal = -2;
		return 1;
	}
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
    ////bwprintf(COM2, "Kernel: Case 33.\r\n");
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

	(ks->TDList[m->senderTID]).state = REPLY_BLOCKED;
	
    // bwprintf(COM2, "Kernel: Case 211.\r\n");
	//if there was a mail, the m pointer would be assigned that within the if statement parameter. 
	
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
	
    // bwprintf(COM2, "Kernel: Case 213[TID:%d, Msg:%s, Msglen:%d, reqVal:%d].\r\n", 
    	// receiverTD->TID, receiverTD->compose, receiverTD->composelen, receiverTD->reqVal);
	receiverTD->state = ACTIVE;
	if (pushIntoQueue) kernel_queuePush(ks, receiverTD);
	return 1;
	
}

int processInterrupt(kernelHandler *ks){
	// bwprintf(COM2,"Processing request \n\r");
	volatile int x = checkInterrupts();
	switch(x) {
		case TIMER1_INT:
		//	bwprintf(COM2, "Kernel: TIMER 1 INTERRUPT, BITCHES\r\n");
		//	bwprintf(COM2, "Kernel: Currently listening TID: %d\r\n", ks->await_TIMER);
		//	bwprintf(COM2, "Kernel: Stopping Timer1.\r\n");
		//	stopTimer(TIMER1_BASE); //don't stop it, but let it run 
			toggleTimer1Interrupt(0);//disables interupt on icu
			clearTimerInterrupt(TIMER1_BASE); //unasserts interupt on timer (note timer still runs)
			if (ks->await_TIMER > -1) {
				(ks->TDList[ks->await_TIMER]).state = ACTIVE;
				kernel_queuePush(ks, &(ks->TDList[ks->await_TIMER]));
				ks->await_TIMER = -1;
			}

/*
			ks->clockNotifierTaskRunning = 1;

			{
				int * ld = (int *) (TIMER3_BASE + LDR_OFFSET);
				int * ctrl = (int *) (TIMER3_BASE + CRTL_OFFSET);
					*ctrl &= ~ENABLE_MASK;
					*ld = 0x77777777;
					*ctrl |= CLKSEL_MASK ;
					*ctrl |= ENABLE_MASK ;

			}
*/
			return 1;
			break;
		case TIMER2_INT:
			stopTimer(TIMER2_BASE);
			clearTimerInterrupt(TIMER2_BASE);
			bwprintf(COM2, "TIMER 2 INTERRUPT, BITCHES\r\n");
			startTimer(TIMER2_BASE, 508, 5080,PERIODIC);
			return 1;
			break;
		case TIMER3_INT:
			bwprintf(COM2, "Kernel: TIMER 1 INTERRUPT, BITCHES\r\n");
			bwprintf(COM2, "Kernel: Currently listening TID: %d\r\n", ks->await_TIMER);
			bwprintf(COM2, "Kernel: Stopping Timer1.\r\n");
		//	stopTimer(TIMER1_BASE); //don't stop it, but let it run 
			//toggleTimer1Interrupt(0);//disables interupt on icu
			clearTimerInterrupt(TIMER3_BASE); //unasserts interupt on timer (note timer still runs)
			if (ks->await_TIMER > -1) {
				(ks->TDList[ks->await_TIMER]).state = ACTIVE;
				kernel_queuePush(ks, &(ks->TDList[ks->await_TIMER]));
				ks->await_TIMER = -1;
			}
			return 1;
		case UART1_INT:
		case UART2_INT:
		default:
			return 0;
			break;

	}
	//bwprintf(COM2, "Invalid interrupt code: %d\r\n", x);
	return 0;
}
int kernel_AwaitEvent(TD * t, request * r, kernelHandler * ks){
	int eventid = (int) r->arg1;
	//bwprintf(COM2, "Kernel: Await event on code: %d %d\r\n", eventid,ks->clockNotifierTaskRunning);
	switch(eventid){
		case TIMER_TICK:
/*
			if(ks->clockNotifierTaskRunning==1){
				//int * val = (int*) (TIMER3_BASE + VAL_OFFSET);
			
	 	
				//bwprintf(COM2,"Time between last wake up and current sleep %dms \n\r", (0x77777777 - *val)/508);
				ks->clockNotifierTaskRunning = 0;
			}
*/
			bwassert(ks->await_TIMER  == -1, COM2, "Another task is waiting on this event: %d.\r\n", ks->await_TIMER);
			//put state into event blocked 
		//	bwprintf(COM2, "Kernel: Blocking TD %d...\r\n", t->TID);
			t->state = EVENT_BLOCKED;
			ks->await_TIMER = t->TID; //might need to use pointer if allowing multiuple tasks on single event
			//enable timer interupt flag
		//	bwprintf(COM2, "Starting Timer1...\r\n", t->TID);
			toggleTimer1Interrupt(1);//enables interupt on icu
			clearTimerInterrupt(TIMER1_BASE); //unasserts interupt on timer from previous tick
			//note timer 1 was started in the kernel initiatilzation,
			// timer 1 is set to to tick every 10 ms periodically
			// so the the task will wait until next tick <= 10 ms.
			return 1;
			break;
		default:
			t->reqVal = -1; //invalid event
			break;
	}
	return 1;


}
