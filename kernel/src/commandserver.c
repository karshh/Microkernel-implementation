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


void commandServer() {
	bwassert(!RegisterAs("commandServer"), COM2, "Could not register as command server.\r\n");
	int cDelTid =  Create(5, (void *) commandReverseDelayServer);
	int csTID = WhoIs("clockServer");
	int iosUS1TID = WhoIs("UART1S");
	int iosUR1TID = WhoIs("UART1R");
	volatile int trainMutex[80];
	volatile int i = 0;
	for(i=0; i<80;i++){
		trainMutex[i] = 0;
	}
	i = 0;


	bwassert(csTID >= 0, COM2, "<commandServer>: clockServer has not been set up.\r\n");
	bwassert(iosUS1TID >= 0, COM2, "<commandServer>: UART1 Send IOServer has not been set up.\r\n");
	bwassert(iosUR1TID >= 0, COM2, "<commandServer>: UART1 Receive IOServer has not been set up.\r\n");


    int _tid = -1;
    char msg[64];
    int msgCap = 64;
    int msgLen = -1;
	char r[2];
	r[0] = 0;
	r[1] = 0;
	char delMsg[10];
	char rep[2];
	int delayReverse ;


	while(1) {
		msgLen = Receive(&_tid, msg, msgCap);

		bwassert(msgLen >= 0, COM2, "<commandServer>: Receive error.\r\n");
		switch(msg[0]) {
			case COMMAND_DEATH: // Call of Death
				{
					//Angel of Death has appeated

					char delMsg[2];
					char rep[2];


					delMsg[0] = msg[0]; 
					delMsg[1] = 0; 
					Send(iosUR1TID, delMsg, 2, rep, 2);

					delMsg[0] = msg[0]; 
					delMsg[1] = 0; 
					Send(iosUS1TID, delMsg, 2, rep, 2);
					//Putc(iosUS1TID, COM1, msg[0]);
					//inform angel of death that uart1 servers are dead
					Reply(_tid, "1", 2);
					//Command server dies
					Exit();
					break;
				}
				
			
			case 'S': // switches
				Putc(iosUS1TID, COM1, msg[1]);
				Putc(iosUS1TID, COM1, msg[2]);
				Delay(csTID, 15);//wait 150 ms //critical delay //cannot delay like reverse code.
				Putc(iosUS1TID, COM1, 32);//turn off solonoids
				Reply(_tid, "1", 2);
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
			
									 
					delayReverse = Time(csTID) + (msg[2]*19)+170;
					//calculate the time (in ticks, based on a 24 hr time period, when the delay should end
					delMsg[0] = msg[1]; //set train
					delMsg[1] = msg[2]; //set trainspeed
					if(trainMutex[(int)msg[1]] ==0){
						Reply(_tid, "1", 2);
					}
					else{
						Reply(_tid, "0", 2);
					}
			
					if(trainMutex[(int)msg[1]]==0){
						trainMutex[(int)msg[1]] = 1;
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
					//	Reply(_tid, "1", 2);
					}else
					;//	Reply(_tid, "0", 2);
			
				break;
			case 'r': // reverse part 2
				trainMutex[(int)msg[1]] = 0;
				Putc(iosUS1TID, COM1, 15);
				Putc(iosUS1TID, COM1, msg[1]);
				Putc(iosUS1TID, COM1, msg[2]);
				Putc(iosUS1TID, COM1, msg[1]);
				Reply(_tid, "1", 2);
				break;
			case 'T': // train speed
			case 'L': 
				//bwassert(0, COM2, "                              \033[100;0H <Command Server>: could not send second part of reverse to reverse delay server.[%d] \r\n",!trainMutex[msg[2]-1]);
					//trainMutex[train] = 0;
					if(trainMutex[(int)msg[2]] == 0){
						for(i = 1; i < msgLen - 1; i++) Putc(iosUS1TID, COM1, msg[i]);
						Reply(_tid, "1", 2);
				break;
					}
					else{
						r[0]=1;
						Reply(_tid, "0", 2);
				break;
					}

			case 'P': // polling sensors
			default:
				for(i = 1; i < msgLen - 1; i++) Putc(iosUS1TID, COM1, msg[i]);
				Reply(_tid, "1", 2);
				break;
		}
		// Send commands to io in batches.


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


