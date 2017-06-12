#include "ts7200.h"
#include "dictionary.h"
#include "buffer.h"
#include "userRequestCall.h"
#include "bwio.h"
#include "server.h"
#include "ui.h"
#include "pkstring.h"
#include "icu.h"
#include "controller.h"
/******************************************************************************
FIRST USER TASK
*****************************************************************************/


void FirstUserTask() {
	CreateNameServer(1, (void *) NameServerTask);
	CreateClockServer(2, (void *) clockServer);
	Create(31, (void *) idleTask);

	bwassert(CreateIOServer(2, (void *) UART1_ReceiveServer, UART1R)>=0, COM2, "Failed Create UART1TR Server.\n\r");
	bwassert(CreateIOServer(2, (void *) UART2_ReceiveServer, UART2R)>=0, COM2, "Failed Create UART2TR Server.\n\r");
	bwassert(CreateIOServer(2, (void *) UART1_SendServer, UART1S)>=0, COM2, "Failed Create UART1TS Server.\n\r");
	bwassert(CreateIOServer(2, (void *) UART2_SendServer, UART2S)>=0, COM2, "Failed Create UART2TS Server.\n\r");



	Create(3, (void *) commandServer);
	Create(3, (void *) displayServer);
	Exit();
}



int nameServerInit(nameServer * ns) {
	volatile int myTid = MyTid();
	ns->serverTID = myTid;

	// initialize data structure.

	return 1;
}

int nameServerRun() {
	nameServer ns;

	// initialize nameserver.
	bwassert(nameServerInit(&ns), COM2, "Failed NameServer initialization.\n\r");
	return 1;
}


void NameServerTask(){

    dictionary d;
    initDictionary(&d);

    while(1){
   	int _tid = 0;
    	char _msg[20];
    	int _msglen = 20;

    	volatile char _type[3];
    	volatile char _name[16];

    	volatile int rcvLen = Receive(&_tid, _msg, _msglen);
	if(rcvLen >=4){
		_type[0] = _msg[0];
		_type[1] = _msg[1];
		_type[2] = '\0';
		volatile int i = 0;
		for(i=0;i<15;i++){
			_name[i] = _msg[2+i];
		}



		if(pkstreq_volatile(_type,"01")) {
			//whois
			//bwprintf(COM2, "NameServer:who is  %s\r\n", _name);
			volatile int whoisTid =0;
			volatile int err = 0;
			err =searchDictionary(&d,_name, &whoisTid);
			if(!err) whoisTid = -2; 

			char _reply[2] = "1";
			_reply[0] = whoisTid;
			int _rplen = 2;
			//bwprintf(COM2, "NameServer:Replying to <%d>the following: %d %d.\r\n", _tid, _reply[0], _reply[1]);
			Reply( _tid, _reply, _rplen);
		}
		else if(pkstreq_volatile(_type,"10")) {
			//add name
			//bwprintf(COM2, "NameServer: register TID  %d %s, \r\n", _tid,_name);
			int err = addDictionary(&d,_name,_tid);
			char _reply[2] = "1";
			if(err) _reply[0] = 0;
			else _reply[0] = -2;
			int _rplen = 2;
			//bwprintf(COM2, "NameServer:Replying to <%d>the following: %d %d.\r\n", _tid, _reply[0], _reply[1]);
			Reply( _tid, _reply, _rplen);
		}
		else{
			char * _reply = "DO NOT SEND TO NAME SERVER";
			int _rplen = 27;
			Reply( _tid, _reply, _rplen);
		}
	}else{
			char * _reply = "DO NOT SEND TO NAME SERVER";
			int _rplen = 27;
			Reply( _tid, _reply, _rplen);
	}
	
	//forever 
    }
 
}



void initStorage(TimeStorage * t) {
	t->size = 0;
}

int insertIntoStorage(TimeStorage * t, StorageNode * n) {
	
	if (t->size >= STORAGE_CAPACITY) return 0;

	volatile int low = 0;
	volatile int high = t->size;
	volatile int mid = (low + high - 1) / 2;
	while (low != high) {
		mid = (low + high - 1) / 2;
		if ((t->store[mid]).delayTime > n->delayTime) {
			low = mid + 1;
		} else {
			high = mid;
		}
	}
	// delayTime-index relationship instability fix
	while ((mid < t->size) && ((t->store[mid]).delayTime > n->delayTime)) mid++;
    
    if (t->size != 0) {

		volatile int i = t->size - 1;
		for (; i >= mid; i--) t->store[i+1] = t->store[i];
    }
	t->store[mid].tid = n->tid;

	t->store[mid].delayTime = n->delayTime;
    (t->size)++;
    
	return 1;
}

int deleteFromStorage(TimeStorage * t, StorageNode * n) {
	if (t->size <= 0) return 0;
	n->tid = t->store[t->size - 1].tid;
	n->delayTime = t->store[t->size - 1].delayTime;
	(t->size)--;
	return 1;
}


void idleTask() {
	//idle task does absolutly nothing but spin
	while(1){

	} 
	//gets into infinite loop that spins. only way out is an interrupt
}
	



void clockNotifier() {

	int csTID = MyParentTid();
	// avoiding corruption of memory regarding null char pointer passing.
	char msg[3];
	int msgLen = 3;
	while(1) {

		AwaitEvent(TIMER_TICK);
		//bwprintf(COM2, "clockNotifier: TIMER INTERRUPT\r\n");
		Send(csTID, 0, 0, msg, msgLen);
		//bwprintf(COM2, "clockNotifier: BACK TO AWAITING EVENT\r\n");

	}
}

void clockServer() {
	bwassert(!RegisterAs("clockServer"), COM2, "Failed to register clockServer.\r\n");
	int notifierTID = Create(1, (void *) clockNotifier);
	StorageNode s;
	TimeStorage t;
	initStorage(&t);

	int _tid = -1;
	char msg[7];
	int msgCap = 7;
	volatile int tick = 0;
	char reply[6];

	while(1) {
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "Invalid code received\r\n");
		if (_tid == notifierTID) {
			tick++;

			while(1) {
				if (!deleteFromStorage(&t, &s)) break;
				if (s.delayTime > tick) {
					bwassert(insertIntoStorage(&t, &s), COM2, "<ClockServer>: Reinsertion error: Could not put back TD<%d> into storage.\r\n", s.tid);
					break;
				}
				Reply(s.tid, "1", 2);
			}
			Reply(notifierTID, "1", 2);
		} else {
			volatile int requestCode = (int) msg[0];
			switch(requestCode) {
				case 10: // Delay code.
					s.tid = _tid;
					s.delayTime = tick + ((((int)msg[1]) * 100000000) + 
									(((int)msg[2]) * 1000000) + 
									(((int)msg[3]) * 10000) + 
									(((int)msg[4]) * 100) + 
									((int)msg[5]));
					bwassert(s.delayTime >= 0, COM2, "<ClockServer>: Delay overflow error. Could not delay TD<%d>.\r\n", _tid);
					bwassert(insertIntoStorage(&t, &s), COM2, "<ClockServer>: Delay storage error. Could not put %d into storage.\r\n", s.tid);
					break; 

				case 11: // Time code.
					bwassert(tick >= 0, COM2, "<ClockServer>: Time overflow error. Could not send time to TD<%d>.\r\n", _tid);
					reply[0] = (tick / 100000000) % 100;
					reply[1] = (tick / 1000000) % 100;
					reply[2] = (tick / 10000) % 100;
					reply[3] = (tick / 100) % 100;
					reply[4] = tick % 100;
					reply[5] = 0;
					Reply(_tid, reply, 6);
					break;

				case 12: // DelayUntil code.
					s.tid = _tid;
					s.delayTime = ((((int)msg[1]) * 100000000) + 
									(((int)msg[2]) * 1000000) + 
									(((int)msg[3]) * 10000) + 
									(((int)msg[4]) * 100) + 
									((int)msg[5]));
					bwassert(s.delayTime >= 0, COM2, "<ClockServer>: DelayUntil overflow error. Could not delay TD<%d>.\r\n", _tid);
					if (s.delayTime <= tick) {
						Reply(_tid, "1", 2);
					}
					bwassert(insertIntoStorage(&t, &s), COM2, "<ClockServer>: DelayUntil storage error. Could not put TD<%d> into storage.\r\n", s.tid);
					break;
				default:
					bwassert(0, COM2, "<ClockServer>: Invalid code: %d.\r\n", requestCode);
					break;
			}

		}

	}
}

/****************************************************************************
IOSERVER
*****************************************************************************/

void UART1Send_Notifier() {
    int iosTID = MyParentTid();
   int csTID = WhoIs("clockServer");
    char msg[3];
    int msgLen = 3;

    // Get the first character to block on before entering the loop.
	bwassert(Send(iosTID, "1", 2, msg, msgLen) >= 0, COM2, "<UART1Send_Notifier>: Error with send.\r\n");
	while(1) {
		Delay(csTID,5);
		AwaitEvent(UART1_SEND);
		if ((*UART1_FLAG & TXFE_MASK) && (*UART1_FLAG & CTS_MASK)) {
			*UART1_DATA = msg[0];
			bwassert(Send(iosTID, "1", 2, msg, msgLen) >= 0, COM2, "<UART1Send_Notifier>: Error with send.\r\n");
		}
	}
}


void UART1Receive_Notifier() {
	int iosTID = MyParentTid();
    char msg[3];
    char rpl[3];
    int rplLen = 3;

	while(1) {
		AwaitEvent(UART1_RECEIVE);
		if (*UART1_FLAG & RXFF_MASK) {
			msg[0] = *UART1_DATA;
			msg[1] = 0;
			bwassert(Send(iosTID, msg, 2, rpl, rplLen) >= 0, COM2, "<UART1Receive_Notifier>: Error with send.\r\n");
		}
	}
}


void UART2Send_Notifier() {
	int iosTID = MyParentTid();
    char msg[3];
    int msgLen = 3;

    // Get the first character to block on before entering the loop.
	bwassert(Send(iosTID, "1", 2, msg, msgLen) >= 0, COM2, "<UART2Send_Notifier>: Error with send.\r\n");
	while(1) {
		AwaitEvent(UART2_SEND);
		if (*UART2_FLAG & TXFE_MASK) {
			*UART2_DATA = msg[0];
			bwassert(Send(iosTID, "1", 2, msg, msgLen) >= 0, COM2, "<UART2Send_Notifier>: Error with send.\r\n");
		}
	}
}


void UART2Receive_Notifier() {
	int iosTID = MyParentTid();
    char msg[3];
    char rpl[3];
    int rplLen = 3;

	while(1) {
		AwaitEvent(UART2_RECEIVE);
		if (*UART2_FLAG & RXFF_MASK) {
			msg[0] = *UART2_DATA;
			msg[1] = 0;
			bwassert(Send(iosTID, msg, 2, rpl, rplLen) >= 0, COM2, "<UART2Receive_Notifier>: Error with send.\r\n");
		}
	}
}

void UART1_SendServer() {
	bwassert(!RegisterAs("UART1S"), COM2, "Failed to register Uart1SendServer.\r\n");
	// create and init circular buffer queues.
	circularBuffer UART1_sendQ;

	circularBufferInit(&UART1_sendQ);
	
	// create notifier tasks
	volatile int UART1Send_TID = Create(1, (void *) UART1Send_Notifier);

	// variables to block notifiers
	volatile int UART1Send_blocked = 0;
	
	// message passing required variables.
    int _tid = -1;
    char msg[7];
    int msgCap = 7;
    char reply[6];

    // extra variables used.
	int c = 0;

	while(1) {
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "<UART1SendServer>: Receive error.\r\n");
		if (_tid == UART1Send_TID) {
			if (getFromBuffer(&c, &UART1_sendQ)) {
				reply[0] = (char) c;
				reply[1] = 0;
            			Reply(UART1Send_TID, reply, 2);
			} else {
				UART1Send_blocked = 1;
			}
			c = 0;
		} else {
			 switch((int) msg[0]) {
			    case 11: // UART1 Putc
				bwassert(addToBuffer((BUFFER_TYPE) msg[1], &UART1_sendQ), COM2, "<UART1SendServer>: Buffer full. Could not add %c[%d]\r\n", msg[1], msg[1]);

				if (UART1Send_blocked && getFromBuffer(&c, &UART1_sendQ)) {
							reply[0] = (char) c;
							reply[1] = 0;
					Reply(UART1Send_TID, reply, 2);
					UART1Send_blocked = 0;
				}
				Reply(_tid, "1", 2);
				break;
			    default:
				bwassert(0, COM2, "<Uart1SendServer>: Illegal request code from userTask <%d>.\r\n", _tid);
				break;
        		}

		}

	}
}

void UART2_SendServer() {
	bwassert(!RegisterAs("UART2S"), COM2, "Failed to register Uart2SendServer.\r\n");
	// create and init circular buffer queues.
	circularBuffer UART2_sendQ;

	circularBufferInit(&UART2_sendQ);
	
	// create notifier tasks
	volatile int UART2Send_TID = Create(1, (void *) UART2Send_Notifier);

	// variables to block notifiers
	volatile int UART2Send_blocked = 0;
	
	// message passing required variables.
    int _tid = -1;
    char msg[7];
    int msgCap = 7;
    char reply[6];

    // extra variables used.
	int c = 0;

	while(1) {
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "<UART2SendServer>: Receive error.\r\n");
		if (_tid == UART2Send_TID) {
			if (getFromBuffer(&c, &UART2_sendQ)) {
				reply[0] = (char) c;
				reply[1] = 0;
            			Reply(UART2Send_TID, reply, 2);
			} else {
				UART2Send_blocked = 1;
			}
			c = 0;
		} else {
			switch((int) msg[0]) {
	     			case 21: // UART2 Putc
					if (msg[1]) {
						bwassert(addToBuffer((BUFFER_TYPE) msg[1], &UART2_sendQ), COM2, "<UART2Server>: Buffer full. Could not add %c[%d]\r\n", msg[1], msg[1]);
						if (UART2Send_blocked && getFromBuffer(&c, &UART2_sendQ)) {
									reply[0] = (char) c;
									reply[1] = 0;
							Reply(UART2Send_TID, reply, 2);
							UART2Send_blocked = 0;
						}
					}
					Reply(_tid, "1", 2);
					break;

			    default:
				bwassert(0, COM2, "<Uart2SendServer>: Illegal request code from userTask <%d>.\r\n", _tid);
				break;
        		}

		}

	}
}

void UART2_ReceiveServer() {
	bwassert(!RegisterAs("UART2R"), COM2, "Failed to register UART2ReceiveServer.\r\n");
	// create and init circular buffer queues.
	circularBuffer UART2_receiveTIDQ;

	circularBufferInit(&UART2_receiveTIDQ);
	
	// create notifier tasks
	volatile int UART2Receive_TID = Create(1, (void *) UART2Receive_Notifier);
	
	// message passing required variables.
	int _tid = -1;
	char msg[7];
	int msgCap = 7;
	char reply[6];

    // extra variables used.
	int c = 0;
	int utid = -1;

	while(1) {
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "<UART2ReceiveServer>: Receive error.\r\n");
		if (_tid == UART2Receive_TID) {
			if (getFromBuffer(&utid, &UART2_receiveTIDQ)) {
				reply[0] = (char) msg[0];
				reply[1] = 0;
				Reply(utid, reply, 2);
			}
			c = 0;
			utid = -1;
			Reply(UART2Receive_TID, "1", 2);
		} else {
			 switch((int) msg[0]) {
			    case 20: // UART2 Getc
				bwassert(addToBuffer(_tid, &UART2_receiveTIDQ), COM2, "<ioServer>: UART2_receiveTIDQ Buffer full. Cannot add <%d>.\r\n", _tid);
				break;

				    default:
				bwassert(0, COM2, "<ioServer>: Illegal request code from userTask <%d>.\r\n", _tid);
				break;
        		}

		}

	}
}

void UART1_ReceiveServer() {
	bwassert(!RegisterAs("UART1R"), COM2, "Failed to register UART1ReceiveServer.\r\n");
	//bwassert(1, COM2, "ASSERT CHECK.\r\n");
	// create and init circular buffer queues.
	circularBuffer UART1_receiveTIDQ;

	circularBufferInit(&UART1_receiveTIDQ);
	
	// create notifier tasks
	volatile int UART1Receive_TID = Create(1, (void *) UART1Receive_Notifier);
	
	// message passing required variables.
	int _tid = -1;
	char msg[7];
	int msgCap = 7;
	char reply[6];

    // extra variables used.
	int c = 0;
	int utid = -1;

	while(1) {
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "<UART1ReceiveServer>: Receive error.\r\n");
		if (_tid == UART1Receive_TID) {
			if (getFromBuffer(&utid, &UART1_receiveTIDQ)) {
				reply[0] = (char) msg[0];
				reply[1] = 0;
				Reply(utid, reply, 2);
			}
		    	c = 0;
		    	utid = -1;
		    	Reply(UART1Receive_TID, "1", 2);
		} else {
			 switch((int) msg[0]) {
			    case 10: // UART1 Getc
				bwassert(addToBuffer(_tid, &UART1_receiveTIDQ), COM2, "<UART1ReceiveServer>: UART1_receiveTIDQ Buffer full. Cannot add <%d>.\r\n", _tid);
				break;

		       
			    default:
				bwassert(0, COM2, "<UART1ReceiveServer>: Illegal request code from userTask <%d>.\r\n", _tid);
				break;
        		}

		}

	}
}


/****************************************************************************
TRAINSERVER
*****************************************************************************/

void trainServer(){
//keep track of train speeds, and sends instructions to ioserver
	bwassert(!RegisterAs("trainServer"), COM2, "Failed to register trainServer.\r\n");
	int commandServerTID = WhoIs("commandServer");
	int csTID = WhoIs("clockServer");
	//keep track of train speeds
	int trainSpeed[80];
	int switch_states[22];


    int _tid = -1;
    char msg[4];
    int msgCap = 4;

    char commandMsg[64];
    char rpl[3];
    int rpllen = 3;

	volatile int i=0;
	int msgLen = 4;
	int dspTID = WhoIs("displayServer");

	
	for (i=0; i < 80; i++){
 			trainSpeed[i] = 0;
			commandMsg[0] = 'T';
			commandMsg[1] = trainSpeed[i];
			commandMsg[2] = i;
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
			//send message to display thaat trains are initilizaing
			msg[0] = 2; //no warning
			msg[1] = 0;
			msg[2] = i;//position (0..17)
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

			//Delay(csTID, (14 * 19) + 170);
			Delay(csTID, 5);
	}
			Delay(csTID,436);
			//send message to display thaat switches are initilizaing
			msg[0] = 2; //no warning
			msg[1] = 1;
			msg[2] = 0;//position (0..17)
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 


	//init switches
	for (i=1; i <= 18; i++){
		 switch_states[i-1] = 'C';//set it to curved
			commandMsg[0] = 'S';
			commandMsg[1] = switch_states[i-1] == 'S' ? 33 : 34;
			commandMsg[2] = i;
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
			update_switch(i, switch_states[i-1], &switch_states[0]); //updates the display
	}

	for (i=153; i <= 156; i++){
		 switch_states[i-135] = i%2? 'C':'S';//set it to curved
			commandMsg[0] = 'S';
			commandMsg[1] = switch_states[i-135] == 'S' ? 33 : 34;
			commandMsg[2] = i;
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
			update_switch(i, switch_states[i-135], &switch_states[0]); //updates the display
		
	}
			//send message to display that init is done. allow command line input
			msg[0] = 2; //no warning
			msg[1] = 2;
			msg[2] = 0;//position (0..17)
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

	int train;
	int speed;
	int sw;
	int swd;
	while(1){
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "<trainServer>: Receive error.\r\n");
		
		switch(msg[0]){
		case 'L':
			train = msg[1];
			trainSpeed[train] = 0;


			commandMsg[0] = 'L';
			commandMsg[1] = 16+trainSpeed[train];
			commandMsg[2] = train;
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	        Reply(_tid, "1", 2);
	        break;

		case 'T':
			speed = msg[1];
			train = msg[2];
			trainSpeed[train] = speed;

			commandMsg[0] = 'T';
			commandMsg[1] = trainSpeed[train];
			commandMsg[2] = train;
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	        Reply(_tid, "1", 2);
	        break;

		case 'R':
			train = msg[1];

			commandMsg[0] = 'R';
			commandMsg[1] = train;
			commandMsg[2] = trainSpeed[train];
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
			{ char c[2];
			 c[0] = trainSpeed[train];
			 c[1] = 0;
			
	        	Reply(_tid, &c[0], 2);
			}

	        break;
		case 'S':
			sw = msg[1];
			swd = msg[2];
			if(sw <= 18)
					switch_states[sw-1]= swd;
			else
					switch_states[sw-135]= swd;

			commandMsg[0] = 'S';
			commandMsg[1] = swd == 'S' ? 33 : 34;
			commandMsg[2] = sw;
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	        Reply(_tid, "1", 2);
			update_switch(sw, swd, &switch_states[0]); //updates the display
	        break;

		default:
	        bwassert(0, COM2, "<trainServer>: Illegal request code from userTask <%d>:[%s].\r\n", _tid,msg);
		}
	}

}


/****************************************************************************
DISPLAYSERVER
*****************************************************************************/



void Grid() {
	int iosTID = MyParentTid();
    char msg[3];
    int msgLen = 3;

	bwassert(Send(iosTID, "1", 2, msg, msgLen) >= 0, COM2, "<Grid>: Error with send.\r\n");

	Exit();
}

void UserPrompt() {
	int parentTID = MyParentTid();
	int iosTID = WhoIs("UART2R");
	bwassert(iosTID >= 0, COM2, "<UserPrompt>: UART2ReceiveServer has not been set up.\r\n");


	char terminalInput[1024];
	int terminalInputIndex = 0;
	int cursorCol = 2;
	volatile char c = 0;
	
	// messaging purposes
    char msg[64];

    char rpl[3];
    int rpllen = 3;

	while (1) {
		c = Getc(iosTID, COM2);

	    if (c <= 0 || terminalInputIndex >= 1020) continue;
	    else if (c == '\r') {
	        int cleanup = 0;
	        terminalInput[terminalInputIndex] = 0;
	        int arg1;
	        int arg2;

	        msg[0] = COMMAND_LOADING;
	        msg[1] = 0;
	        bwassert(Send(parentTID, msg, 2, rpl, rpllen) >= 0, COM2, "<UserPrompt>: could not send prompt response to server. \r\n");

	        msg[0] = parseCommand(terminalInput, &arg1, &arg2);
	        msg[1] = arg1;
	        msg[2] = arg2;
	        msg[3] = 0;
	        bwassert(Send(parentTID, msg, 4, rpl, rpllen) >= 0, COM2, "<UserPrompt>: could not send prompt response to server. \r\n");
            for (; cleanup <= terminalInputIndex; cleanup++) terminalInput[cleanup] = '\0';
            terminalInputIndex = 0;
            cursorCol = 2;

	    } else if (c == 8) { // backspace
	        if (cursorCol <= 2) continue;
	        terminalInputIndex -= 1;
	        terminalInput[terminalInputIndex] = 0;
	        cursorCol -= 1; 

	        msg[0] = COMMAND_BACKSPACE;
	        msg[1] = (cursorCol / 100);
	        msg[2] = cursorCol % 100;
	        msg[3] = 0;

	        bwassert(Send(parentTID, msg, 4, rpl, rpllen) >= 0, COM2, "<UserPrompt>: could not send backspace to server. \r\n");
	    } else {
    
		    terminalInput[terminalInputIndex] = c;
		    terminalInputIndex += 1;

	        msg[0] = COMMAND_CHAR;
	        msg[1] = (cursorCol / 100);
	        msg[2] = cursorCol % 100;
	        msg[3] = c;
	        msg[4] = 0;
	        int err = Send(parentTID, msg, 5, rpl, rpllen);
	        bwassert(err >= 0, COM2, "<UserPrompt>: could not send character to server.[%d] \r\n", err);
		    cursorCol += 1;

	    }

	}
}

void displayServer() {
	bwassert(!RegisterAs("displayServer"), COM2, "Failed to register displayServer.\r\n");
	int iosTID = WhoIs("UART2S");
	bwassert(iosTID >= 0, COM2, "<displayGrid>: UART2SendServer has not been set up.\r\n");

	int Grid_TID = Create(4, (void *) Grid);
	//int Prompt_TID = Create(4, (void *) UserPrompt);
	int Prompt_TID = -1;
	int Sensors_TID = Create(4, (void *) displaySensors);
	int Clock_TID = Create(4, (void *) displayClock);
	int Train_TID = Create(4, (void *) trainServer);


    int _tid = -1;
    char msg[64];
    int msgCap = 64;
    int msgLen = -1;

    int cursorCol = 0;
    char c = 0;
    volatile int i = 0;

    int switchLocation = 0;

	while(1) {
		msgLen = Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<displayServer>: Receive error.\r\n");

		if (_tid == Grid_TID) {
			displayGrid();
			Reply(Grid_TID, "1", 2);

		} else if (_tid == Prompt_TID) {
			switch((int) msg[0]) {

				case COMMAND_BACKSPACE: // backspace
					cursorCol = (msg[1] * 100) + msg[2];
	        		Printf(iosTID, COM2, "\033[34;%dH\033[K", cursorCol);
	        		cursorCol = 0;
	        		break;

	        	case COMMAND_CHAR: // add a character
					cursorCol = (msg[1] * 100) + msg[2];
					c = msg[3];
		    		Printf(iosTID, COM2, "\033[34;%dH%c", cursorCol, c);
		    		cursorCol = 0;
		    		c = 0;
		    		break;

	        	case COMMAND_SW:
				//i this comming from trainserver not directly as a return from promt tid. 
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KSwitch %d is configured as %c now.\033[34;1H>", msg[1], msg[2]);
		    		break;

	        	case COMMAND_RV:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KReversed train %d at speed %d\033[34;1H>",  msg[1], msg[2]);
	                break;

	        	case COMMAND_TR:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KUpdated train %d's speed to %d.\033[34;1H>",  msg[1], msg[2]);
	                break;

	        	case COMMAND_LI:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KSet Train's %d lights on.\033[34;1H>",  msg[1]);
	                break;

	        	case COMMAND_PN:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KPinging Sensors manually.\033[34;1H>");
	                break;

	        	case COMMAND_LOADING:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KExecuting, please wait.\033[34;1H>");
	                break;

	            case COMMAND_Q:
	            	Quit();
	            	break;
	        	default:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KIncorrect Command.\033[34;1H>");
	                break;
			}

			Reply(_tid, "1", 2);
		} else if (_tid == Sensors_TID){
			for (i = 0; i < msgLen; i++) Printf(iosTID, COM2, "\033[?25l\033[%d;17H%c%d \033[u\033[?25h", i+6,((msg[i]-1)/16)+'A',((msg[i]-1)%16+1));
			Reply(_tid, "1", 2);
		} else if (_tid == Train_TID){
	       		switchLocation = msg[2] + 6;
			if (msg[0] == 2){ //2 used for initiliziation code
				if(msg[1] == 0)
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInitializing Trains %d.\033[34;1H>\033[u\033[?25h",msg[2]);
				else if(msg[1] == 1)
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInitializing Switches.\033[34;1H>\033[u\033[?25h");
				else{
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[K\033[34;1H>\033[u\033[?25h");
					Prompt_TID = Create(4, (void *) UserPrompt);
				}
					
			}
			else if (msg[0] == 1)//1 is switch mode warning
       				Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;11H\033[1m\033[31m%c\033[0m\033[u\033[?25h", switchLocation, msg[1]);
			else
				//0 is for switch mode normal text
       				Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;11H%c\033[u\033[?25h", switchLocation, msg[1]);
			Reply(_tid, "1", 2);
		} else if (_tid == Clock_TID){
			switch((int) msg[0]) {
				case CLOCK_U:
 	 				Printf(iosTID,COM2,"\033[s\033[?25l\033[1;125H%d%d:%d%d:%d%d.%d\033[u\033[?25h",msg[1],msg[2],msg[3],msg[4],msg[5],msg[6],msg[7]);
 	 				break;
				case DELAY_U:
		  			Printf(iosTID,COM2,"\033[s\033[?25l\033[1;68H%d%% \033[u\033[?25h",msg[1]);
		  			break;
				default:
					break;
			}
			Reply(_tid, "1", 2);
		} else {
			Reply(_tid, "1", 2);
		}
	}

	Exit();



}


void commandServer() {
	bwassert(!RegisterAs("commandServer"), COM2, "Could not register as command server.\r\n");
	int cDelTid =  Create(4, (void *) commandReverseDelayServer);
	int csTID = WhoIs("clockServer");
	int iosUS1TID = WhoIs("UART1S");
	bwassert(csTID >= 0, COM2, "<commandServer>: clockServer has not been set up.\r\n");
	bwassert(iosUS1TID >= 0, COM2, "<commandServer>: UART1 Send IOServer has not been set up.\r\n");


    int _tid = -1;
    char msg[64];
    int msgCap = 64;
    int msgLen = -1;

    volatile int i = 0;
	while(1) {
		msgLen = Receive(&_tid, msg, msgCap);

		bwassert(msgLen >= 0, COM2, "<commandServer>: Receive error.\r\n");
		switch(msg[0]) {
			case 'S': // switches
				Putc(iosUS1TID, COM1, msg[1]);
				Putc(iosUS1TID, COM1, msg[2]);
				Delay(csTID, 15);//wait 150 ms //critical delay //cannot delay like reverse code.
				Putc(iosUS1TID, COM1, 32);//turn off solonoids
				break;

			case 'R': // reverse part 1
				Putc(iosUS1TID, COM1, 0);
				Putc(iosUS1TID, COM1, msg[1]);
				//since the delay is not critical (the reverse command can occur much longer than the delay time without consequence)
				//the code is sent to a seperate task to delay
				//thus sensors can still run even when waiting for a long delay for train to stop (max 4.36 seconds).
				//might change when we start train specific realtime speeds.
				//note the reverse server does the delay.
				//proper code is that the reverse server has its own notifier, allowing it to queue up multiple delays.
				//delays use delayUntil, not delay. to minimize number of delays
			
				{
					char delMsg[10];
					char rep[2];

					int delayReverse = Time(csTID) + (msg[2]*19)+170;
					//calculate the time (in ticks, based on a 24 hr time period, when the delay should end
					delMsg[0] = msg[1]; //set train
					delMsg[1] = msg[2]; //set trainspeed
					
					delMsg[2] = (delayReverse/10000000)%10; //set delay
					delMsg[3] = (delayReverse/1000000)%10; //set delay
					delMsg[4] = (delayReverse/100000)%10; //set delay
					delMsg[5] = (delayReverse/10000)%10; //set delay
					delMsg[6] = (delayReverse/1000)%10; //set delay
					delMsg[7] = (delayReverse/100)%10; //set delay
					delMsg[8] = (delayReverse/10)%10; //set delay
					delMsg[9] = delayReverse %10; //set delay
					delMsg[10] = 0; //set train
					int err = Send(cDelTid, delMsg, 10, rep, 2);
					bwassert(err >= 0, COM2, "<Command Server>: could not send second part of reverse to reverse delay server.[%d] \r\n", err);
				}
				break;
			case 'r': // reverse part 2
				Putc(iosUS1TID, COM1, 15);
				Putc(iosUS1TID, COM1, msg[1]);
				Putc(iosUS1TID, COM1, msg[2]);
				Putc(iosUS1TID, COM1, msg[1]);
				break;
			case 'P': // polling sensors
			case 'T': // train speed
			case 'L': 
			default:
				for(i = 1; i < msgLen - 1; i++) Putc(iosUS1TID, COM1, msg[i]);
				break;
		}
		// Send commands to io in batches.

		Reply(_tid, "1", 2);

	}
}
void commandReverseDelayServer() {
//problem is when you have


	int csTID = WhoIs("clockServer");
	bwassert(csTID >= 0, COM2, "<commandReverseDelayServer>: clockServer has not been set up.\r\n");
	int parent = MyParentTid();


    int _tid = -1;
    char msg[10];
    int msgCap = 10;
    int msgLen = -1;

	int train =0;
	int trainspeed =0;
	int delayReverse = 0;

    char commandMsg[64];
    char rpl[3];
    int rpllen = 3;


	while(1) {
		msgLen = Receive(&_tid, msg, msgCap);

		bwassert(msgLen >= 0, COM2, "<commandReverseDelayServer>: Receive error.\r\n");
		train = msg[0];
		trainspeed = msg[1];
		delayReverse =  msg[2]*10000000;
		delayReverse += msg[3]*1000000;
		delayReverse += msg[4]*100000;
		delayReverse += msg[5]*10000;
		delayReverse += msg[6]*1000;
		delayReverse += msg[7]*100;
		delayReverse += msg[8]*10;
		delayReverse += msg[9]*1;

	        Reply(_tid, "1", 2);
		DelayUntil(csTID,delayReverse);

		commandMsg[0] = 'r';
		commandMsg[1] = train;
		commandMsg[2] = trainspeed;
		commandMsg[3] = 0;
		bwassert(Send(parent, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<commandReverseDelayServer>: Error sending message to CommandServer.\r\n");

	}
}

