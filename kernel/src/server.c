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
	//		bwprintf(COM2, "clockServer: NOTIFIED BY THE GREAT NOTIFIER\r\n");
			tick++;
/*
			//used to check timer speed. 
			switch(tick %2){
			case 0:
				bwprintf(COM2,"\033[s\033[?25l\033[1;100H           \033[u\033[?25h");
				break;
			case 1:
				bwprintf(COM2,"\033[s\033[?25l\033[1;100H >        \033[u\033[?25h");
				break;
			default:
				break;
			}
*/
			while(1) {
				if (!deleteFromStorage(&t, &s)) break;
				if (s.delayTime > tick) {
					bwassert(insertIntoStorage(&t, &s), COM2, "<ClockServer>: Reinsertion error: Could not put back TD<%d> into storage.\r\n", s.tid);
					break;
				}
				Reply(s.tid, "1", 2);
			}
	//		bwprintf(COM2, "clockServer: BACK TO RECEIVE MODE\r\n");
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
/******************************************************************************
FIRST USER TASK
*****************************************************************************/


void FirstUserTask() {
	CreateNameServer(1, (void *) NameServerTask);
	CreateClockServer(2, (void *) clockServer);
	Create(31, (void *) idleTask);
	CreateIOServer(2, (void *) ioServer);
	Create(3, (void *) displayServer);
	Create(2, (void *) commandServer);
	Create(3, (void *) trainServer);
	Exit();
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

void ioServer() {
	bwassert(!RegisterAs("ioServer"), COM2, "Failed to register ioServer.\r\n");
	// create and init circular buffer queues.
	circularBuffer UART1_sendQ;
	circularBuffer UART1_receiveTIDQ;
	circularBuffer UART2_sendQ;
	circularBuffer UART2_receiveTIDQ;

	circularBufferInit(&UART1_sendQ);
	circularBufferInit(&UART1_receiveTIDQ);
	circularBufferInit(&UART2_sendQ);
	circularBufferInit(&UART2_receiveTIDQ);
	
	// create notifier tasks
	volatile int UART1Send_TID = Create(1, (void *) UART1Send_Notifier);
	volatile int UART1Receive_TID = Create(1, (void *) UART1Receive_Notifier);
	volatile int UART2Send_TID = Create(1, (void *) UART2Send_Notifier);
	volatile int UART2Receive_TID = Create(1, (void *) UART2Receive_Notifier);

	// variables to block notifiers
	volatile int UART1Send_blocked = 0;
	volatile int UART2Send_blocked = 0;
	
	// message passing required variables.
    int _tid = -1;
    char msg[7];
    int msgCap = 7;
    char reply[6];

    // extra variables used.
	int c = 0;
	int utid = -1;

	while(1) {
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "<ioServer>: Receive error.\r\n");
		if (_tid == UART1Send_TID) {
			if (getFromBuffer(&c, &UART1_sendQ)) {
				reply[0] = (char) c;
				reply[1] = 0;
            	Reply(UART1Send_TID, reply, 2);
			} else {
				UART1Send_blocked = 1;
			}
			c = 0;
		
		} else if (_tid == UART1Receive_TID) {
			if (getFromBuffer(&utid, &UART1_receiveTIDQ)) {
            	reply[0] = (char) msg[0];
            	reply[1] = 0;
            	Reply(utid, reply, 2);
            }
            c = 0;
            utid = -1;
            Reply(UART1Receive_TID, "1", 2);

		} else if (_tid == UART2Send_TID) {
			if (getFromBuffer(&c, &UART2_sendQ)) {
				reply[0] = (char) c;
				reply[1] = 0;
            	Reply(UART2Send_TID, reply, 2);
			} else {
				UART2Send_blocked = 1;
			}
			c = 0;

		} else if (_tid == UART2Receive_TID) {
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
	            case 10: // UART1 Getc
	                bwassert(addToBuffer(_tid, &UART1_receiveTIDQ), COM2, "<ioServer>: UART1_receiveTIDQ Buffer full. Cannot add <%d>.\r\n", _tid);
	                break;

	            case 11: // UART1 Putc
	                bwassert(addToBuffer((BUFFER_TYPE) msg[1], &UART1_sendQ), COM2, "<IOServer>: Buffer full. Could not add %c[%d]\r\n", msg[1], msg[1]);

	                if (UART1Send_blocked && getFromBuffer(&c, &UART1_sendQ)) {
						reply[0] = (char) c;
						reply[1] = 0;
		            	Reply(UART1Send_TID, reply, 2);
		            	UART1Send_blocked = 0;
	                }
	                Reply(_tid, "1", 2);
	                break;

	            case 20: // UART2 Getc
	                bwassert(addToBuffer(_tid, &UART2_receiveTIDQ), COM2, "<ioServer>: UART2_receiveTIDQ Buffer full. Cannot add <%d>.\r\n", _tid);
	                break;

	            case 21: // UART2 Putc
	            	if (msg[1]) {
		                bwassert(addToBuffer((BUFFER_TYPE) msg[1], &UART2_sendQ), COM2, "<IOServer>: Buffer full. Could not add %c[%d]\r\n", msg[1], msg[1]);
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
	                bwassert(0, COM2, "<ioServer>: Illegal request code from userTask <%d>.\r\n", _tid);
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
	//keep track of train speeds
	int trainSpeed[80];


    int _tid = -1;
    char msg[4];
    int msgCap = 4;

    char commandMsg[64];
    char rpl[3];
    int rpllen = 3;

	volatile int i=0;
	for (; i < 80; i++) trainSpeed[0] = 0;
	int train;
	int speed;

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
			commandMsg[1] = 0;
			commandMsg[2] = train;
			commandMsg[3] = 15;
			commandMsg[4] = train;
			commandMsg[5] = trainSpeed[train];
			commandMsg[6] = train;
			commandMsg[7] = 0;
			bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	        Reply(_tid, "1", 2);
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
	int iosTID = WhoIs("ioServer");
	bwassert(iosTID >= 0, COM2, "<UserPrompt>: IOServer has not been set up.\r\n");


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
	int iosTID = WhoIs("ioServer");
	bwassert(iosTID >= 0, COM2, "<displayGrid>: IOServer has not been set up.\r\n");

	int Grid_TID = Create(4, (void *) Grid);
	int Prompt_TID = Create(4, (void *) UserPrompt);
	int Sensors_TID = Create(4, (void *) displaySensors);
	int Clock_TID = Create(4, (void *) displayClock);


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
	        		switchLocation = msg[1] >= 153 ?  (msg[1] - 134) + 5 : msg[1] + 5;
	        		Printf(iosTID, COM2, "\033[%d;11H%c", switchLocation, msg[2]);
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KSwitch %d is configured as %c now.\033[34;1H>", msg[1], msg[2]);
		    		break;

	        	case COMMAND_RV:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KReversed train %d.\033[34;1H>",  msg[1], msg[2]);
	                break;

	        	case COMMAND_TR:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KUpdated train %d's speed to %d.\033[34;1H>",  msg[1], msg[2]);
	                break;

	        	case COMMAND_LI:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KSet Train's %d lights on.\033[34;1H>",  msg[1], msg[2]);
	                break;

	        	case COMMAND_PN:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KPinging Sensors manually.\033[34;1H>");
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
			for (i = 0; i < msgLen; i++) Printf(iosTID, COM2, "\033[%d;17H%c%d \033[?25l", i+6,((msg[i]-1)/16)+'A',((msg[i]-1)%16+1));
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

	int csTID = WhoIs("clockServer");
	int iosTID = WhoIs("ioServer");
	bwassert(csTID >= 0, COM2, "<commandServer>: clockServer has not been set up.\r\n");
	bwassert(iosTID >= 0, COM2, "<commandServer>: IOServer has not been set up.\r\n");


    int _tid = -1;
    char msg[64];
    int msgCap = 64;
    int msgLen = -1;

    volatile int i = 0;
	while(1) {
		msgLen = Receive(&_tid, msg, msgCap);

		bwassert(msgLen >= 0, COM2, "<commandServer>: Receive error.\r\n");
		switch(msg[0]) {
			case 'S': // sensors
				Putc(iosTID, COM1, msg[1]);
				Putc(iosTID, COM1, msg[2]);
				Delay(csTID, 15);
				Putc(iosTID, COM1, 32);
				break;

			case 'R': // reverse
				Putc(iosTID, COM1, msg[1]);
				Putc(iosTID, COM1, msg[2]);
				Delay(csTID, (msg[5] * 19) + 175);
				Putc(iosTID, COM1, msg[3]);
				Putc(iosTID, COM1, msg[4]);
				Putc(iosTID, COM1, msg[5]);
				Putc(iosTID, COM1, msg[6]);
				break;
			case 'P': // polling sensors
			case 'T': // train speed
			case 'L': 
			default:
				for(i = 1; i < msgLen - 1; i++) Putc(iosTID, COM1, msg[i]);
				break;
		}
		// Send commands to io in batches.

		Reply(_tid, "1", 2);

	}
}

