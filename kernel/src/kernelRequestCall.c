#include "kernelRequestCall.h"
#include "kernelHandler.h"
#include "bwio.h"
#include "td.h"
#include "kernelMacros.h"
#include "ts7200.h"


int processRequest(kernelHandler * ks, TD * t, request * r, message * m) {

	request irq;
	irq.reqType = INTERRUPT;

	if(!r){ 	
		r = &irq;
		t->interupted = 1;
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
	case(INTERRUPT):
		return processInterupt(ks);
		break;
	case(CREATECLOCKSERVER):
		return kernel_CreateClockServer(t,r,ks);
		break;
	case(AWAITEVENT):
		return kernel_AwaitEvent(t,r,ks);
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
		ks->nameServer = TID;
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
	//		2. Message is too long [> MESSAGE_CAPACITY]
	//	Send this error in any situation where the transaction can't be completed.
	if (tid == t->TID || msglen > MESSAGE_CAPACITY || replylen > MESSAGE_CAPACITY) {
		t->reqVal = -3;
		return 1;
	}

    // bwprintf(COM2, "Kernel: Case 11.\r\n");
	//empty out all garbage in the message pointer.
	m->senderTID = 0;
	volatile int i = 0;
    // bwprintf(COM2, "Kernel: Case 111.\r\n");
	for (i = 0; i < MESSAGE_CAPACITY; i++) m->msg[i] = 0;
    // bwprintf(COM2, "Kernel: Case 112.\r\n");
	m->msglen = 0;
	m->receiverTID = 0;
	
	//put request information in message.
	m->senderTID = t->TID;
	m->receiverTID = tid;
	m->msglen = msglen;
	for (i = 0; i < msglen; i++) {
		m->msg[i] = ((char *) r->arg2)[i];
	}
	

    // bwprintf(COM2, "Kernel: Case 14.\r\n");
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

int processInterupt(kernelHandler *ks){
	bwprintf(COM2,"Processing request \n\r");
	volatile unsigned int vic_status = 0;
	int vic = 1;

	volatile int * line = (int *)( VIC1_BASE + VIC_IRQ_STATUS);
	//first check vic1 for interupts
	if(*line) vic_status = *line;
	//if zero check vic2
	else{
		line = (int *)( VIC2_BASE + VIC_IRQ_STATUS);
		vic_status = *line;
		vic = 2;
	}
	unsigned int c;     // c will be the number of zero bits on the right,

	//find priority of highest asserted interupt;
	if(vic_status == 0) {
		bwprintf(COM2,"phantom interupt\n\r");
		return 0;//if bit string is zero then no flags are checked
	}
	bwprintf(COM2,"vic:%d status%x \n\r",vic,vic_status);
	//bit hack to count trailing zeroes. # of trailing zeroes are the first free priority queue
	//33% faster than 3 * lg(N) + 4 for N bit words
	// NOTE: if 0 == v, then c = 31.dd
	unsigned v = vic_status;
	if (v & 0x1) 
	{
	  // special case for odd v (assumed to happen half of the time)
	  c = 0;
	}
	else
	{
	  c = 1;
	  if ((v & 0xffff) == 0) 
	  {  
	    v >>= 16;  
	    c += 16;
	  }
	  if ((v & 0xff) == 0) 
	  {  
	    v >>= 8;  
	    c += 8;
	  }
	  if ((v & 0xf) == 0) 
	  {  
	    v >>= 4;
	    c += 4;
	  }
	  if ((v & 0x3) == 0) 
	  {  
	    v >>= 2;
	    c += 2;
	  }
	  c -= v & 0x1;
	}
	
	bwprintf(COM2,"c:%d\n\r",c);
	//c is the bit that 
	switch(vic){
		case(1)://vic1
			switch(c){
				case(4): //timer3
					bwprintf(COM2,"TIMER 1!\n\r");
					int * TIMER1CTL = (int *)( TIMER1_BASE+CRTL_OFFSET);
					int * TIMER1CLR = (int *)( TIMER1_BASE+CLR_OFFSET);

					int * line = (int *)( VIC2_BASE + VIC_INT_ENCLEAR);
					*line ^= (-1 ^ *line) & VIC2_TIMER3_MASK; //disable TIMER 3 interupt

					*TIMER1CTL = *TIMER1CTL & ~ENABLE_MASK; //disable timer
					*TIMER1CLR = 1; //clear interupt on  timer

					//for now we turn off softare interupt. in the future we must set clear register for timer 2
					if(ks->await_TIMER > -1){
						//if there is a waiting task
						TD * waitingTask =&ks->TDList[ks->await_TIMER];
						ks->await_TIMER = -1; //no one is waiting on this task anymore
						waitingTask->state = READY;
						waitingTask->reqVal = 0; //it finished timer. no "volatile" data to push for this event type.
						//need to push this task back into it's ready queue
						kernel_queuePush(ks, waitingTask);

					}
					return 1;
					break;
				default: 
					break;
			}


			break;
		case(2)://vic2
			switch(c){
				case(19): //timer3
					bwprintf(COM2,"TIMER 3!\n\r");
					int * TIMER1CTL = (int *)( TIMER1_BASE+CRTL_OFFSET);
					int * TIMER1CLR = (int *)( TIMER1_BASE+CLR_OFFSET);

					int * line = (int *)( VIC2_BASE + VIC_INT_ENCLEAR);
					*line ^= (-1 ^ *line) & VIC2_TIMER3_MASK; //disable TIMER 3 interupt

					*TIMER1CTL = *TIMER1CTL & ~ENABLE_MASK; //disable timer
					*TIMER1CLR = 1; //clear interupt on  timer

					//for now we turn off softare interupt. in the future we must set clear register for timer 2
					if(ks->await_TIMER > -1){
						//if there is a waiting task
						TD * waitingTask =&ks->TDList[ks->await_TIMER];
						ks->await_TIMER = -1; //no one is waiting on this task anymore
						waitingTask->state = READY;
						waitingTask->reqVal = 0; //it finished timer. no "volatile" data to push for this event type.
						//need to push this task back into it's ready queue
						kernel_queuePush(ks, waitingTask);

					}
					return 0;
					break;
				default: 
					break;
			}

			break;
		default:
			break;
	}

	//if you got here you fucked up
	return 0;

	
}

int kernel_AwaitEvent(TD * t, request * r, kernelHandler * ks){
	bwprintf(COM2,"await event");
	int eventid = (int) r->arg1;
	//first check if await event is correct (modify when needed)
	switch(eventid){
		case TIMER_TICK:
	bwprintf(COM2,"await event clock timer\n\r ");
			//put state into event blocked 
			t->state = EVENT_BLOCKED;
			ks->await_TIMER = t->TID; //might need to use pointer if allowing multiuple tasks on single event
			//enable timer interupt flag
			int * line = (int *)( VIC1_BASE + VIC_INT_ENABLE);
			*line ^= (-1 ^ *line) & VIC1_TIMER1_MASK; //enable TIMER 3 interupt
			//setup and start timer (lets use timer 3) 
			//timer tick is once every 10ms.
			
			int * TIMER1LD = (int *)( TIMER1_BASE+LDR_OFFSET);
			int * TIMER1VAL = (int *)( TIMER1_BASE+VAL_OFFSET);
			int * TIMER1CTL = (int *)( TIMER1_BASE+CRTL_OFFSET);
			int * TIMER1CLR = (int *)( TIMER1_BASE+CLR_OFFSET);
			*TIMER1CLR = 1;
			*TIMER1LD = 0x0Dff; //with 508KHZ, 10 ms
			*TIMER1CTL = *TIMER1CTL | MODE_MASK;//periodic mode
			*TIMER1CTL = *TIMER1CTL & ~CLR_OFFSET; //set timer to run at 508khz
			line = (int *)( VIC1_BASE + VIC_IRQ_STATUS);
			bwprintf(COM2," status vic1_base %x \n\r",*line);
			bwprintf(COM2," status vic1_base %x \n\r",*TIMER1VAL);
			*TIMER1CTL = *TIMER1CTL | ENABLE_MASK; //enable timer
			bwprintf(COM2," status vic1_base %x \n\r",*line);
			bwprintf(COM2," val of timer 1 %x \n\r",*TIMER1VAL);
			bwprintf(COM2," val of timer 1 %x \n\r",*TIMER1VAL);
			bwprintf(COM2," val of timer 1 %x \n\r",*TIMER1VAL);
			//we are agooo
			//return value handled by processInterupt command
			return 1;
			break;
		default:
			t->reqVal = -1; //invalid event
			break;
	}
	return 1;
	


	


}
