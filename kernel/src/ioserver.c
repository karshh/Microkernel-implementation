#include "ts7200.h"
#include "dictionary.h"
#include "buffer.h"
#include "userRequestCall.h"
#include "trackGraph.h"
#include "bwio.h"
#include "server.h"
#include "ui.h"
#include "pkstring.h"
#include "icu.h"
#include "controller.h"
#include "time.h"


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
			
			if(!Send(iosTID, msg, 2, rpl, rplLen)) Exit();
			//bwassert(Send(iosTID, msg, 2, rpl, rplLen) >= 0, COM2, "<UART1Receive_Notifier>: Error with send.\r\n");
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
			if(!Send(iosTID, msg, 2, rpl, rplLen)) Exit();
			//bwassert(Send(iosTID, msg, 2, rpl, rplLen) >= 0, COM2, "<UART2Receive_Notifier>: Error with send.\r\n");
		}
	}
}

void UART1_SendServer() {
	bigCircularBuffer UART1_sendQ;
	bwassert(!RegisterAs("UART1S"), COM2, "Failed to register Uart1SendServer.\r\n");
	// create and init circular buffer queues.

	circularBufferInitB(&UART1_sendQ);
	
	// create notifier tasks
	volatile int UART1Send_TID = Create(1, (void *) UART1Send_Notifier);

	// variables to block notifiers
	volatile int UART1Send_blocked = 0;
	volatile int alive = 1;
	volatile int death_tid=-1;
	// message passing required variables.
    int _tid = -1;
    char msg[7];
    int msgCap = 7;
    char reply[6];

    // extra variables used.
	char c = 0;
	int msgLen = 0;

	while(1) {
		msgLen =Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<UART1SendServer>: Receive error.\r\n");
		if (_tid == UART1Send_TID) {
			if (getFromBufferB(&c, &UART1_sendQ)) {
				reply[0] = (char) c;
				reply[1] = 0;
            			Reply(UART1Send_TID, reply, 2);
			} else {
				UART1Send_blocked = 1;
				if(alive != 1){
					//once all characters in output queue is cleared, exit
					Reply(death_tid,"1",2);
					Exit();
				}
			}
			c = 0;
		} else {
			 switch((int) msg[0]) {
			    case 'Q': // Angel of Death
				death_tid = _tid;
				alive = 0;
				if(UART1Send_blocked){
					Reply(death_tid,"1",2);
					Exit();
				}
			    case 11: // UART1 Putc
				if(alive){
				//if dead rplyblcpli	
					msgLen -= 2;
					bwassert(addToBufferB((BUFFER_TYPE) msg[1], &UART1_sendQ), COM2, "<UART1SendServer>: Buffer full. Could not add %c[%d]\r\n", msg[1], msg[1]);
					if (UART1Send_blocked && getFromBufferB(&c, &UART1_sendQ)) {
								reply[0] = (char) c;
								reply[1] = 0;
						Reply(UART1Send_TID, reply, 2);
						UART1Send_blocked = 0;
					}
					Reply(_tid, "1", 2);
				}
				break;
			    default:
				bwassert(0, COM2, "<Uart1SendServer>: Illegal request code from userTask <%d>.\r\n", _tid);
				break;
        		}

		}

	}
}

void UART2_SendServer() {
	bigCircularBuffer UART2_sendQ;
	bwassert(!RegisterAs("UART2S"), COM2, "Failed to register Uart2SendServer.\r\n");
	// create and init circular buffer queues.

	circularBufferInitB(&UART2_sendQ);
	
	// create notifier tasks
	volatile int UART2Send_TID = Create(1, (void *) UART2Send_Notifier);

	// variables to block notifiers
	volatile int UART2Send_blocked = 0;
	volatile int alive = 1;
	volatile int death_tid=-1;
	
	// message passing required variables.
    int _tid = -1;
    char msg[66]; //messages in blocks of 66 (char 0= messgae type, char 65 = 0, 1-64 possibly null terminated string
    int msgCap = 66;
	int msgLen =0;
	volatile int i;
    char reply[6];

    // extra variables used.
	char c = 0;
	char * str = 0;
	while(1) {
		msgLen =Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<UART2SendServer>: Receive error.\r\n");
		if (_tid == UART2Send_TID) {
			if (getFromBufferB(&c, &UART2_sendQ)) {
				reply[0] = (char) c;
				reply[1] = 0;
            			Reply(UART2Send_TID, reply, 2);
			} else {
				UART2Send_blocked = 1;
				if(alive != 1){
					//once all characters in output queue is cleared, exit
					Reply(death_tid,"1",2);
					Exit();
				}

			}
			c = 0;
		} else {
			switch((int) msg[0]) {
				case 'Q': // Angel of Death
				death_tid = _tid;
				alive = 0;
				if(UART2Send_blocked){
					Reply(death_tid,"1",2);
					Exit();
				}

	     			case 21: // UART2 Putstr
					if(alive){
						msgLen -= 2;
						str = &msg[1];
						for(i=0;i<msgLen;i++){
						
							bwassert(addToBufferB((BUFFER_TYPE) str[i], &UART2_sendQ), COM2, "<UART2Server>: Buffer full. Could not add %c[%d]\r\n", msg[1], msg[1]);
							if (UART2Send_blocked && getFromBufferB(&c, &UART2_sendQ)) {
								reply[0] = (char) c;
								reply[1] = 0;
								Reply(UART2Send_TID, reply, 2);
								UART2Send_blocked = 0;
							}
						}

						Reply(_tid, "1", 2);
					}
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
				bwassert(addToBuffer(_tid, &UART2_receiveTIDQ), COM2, "<UART2ReceiveServer>: UART2_receiveTIDQ Buffer full. Cannot add <%d>.\r\n", _tid);
				break;
				case 'Q':// Death Command.
					//just quit
		
					Reply(_tid,"1",2);
					Exit();
					break;
	

				    default:
				bwassert(0, COM2, "<UART2ReceiveServer>: Illegal request code from userTask <%d>.\r\n", _tid);
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
				case 'Q':// Death Command.
					//just quit
		
					Reply(_tid,"1",2);
					Exit();
					break;
	
				default:
				bwassert(0, COM2, "<UART1ReceiveServer>: Illegal request code from userTask <%d> :%d.\r\n", _tid,msg[0]);
				break;
        		}

		}

	}
}


