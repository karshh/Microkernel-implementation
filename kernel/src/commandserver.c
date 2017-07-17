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

//train profile codes
#define COMMAND_RV_DELAY 10
#define COMMAND_RV_INIT 16
//#define COMMAND_RV 12 //reverse train (controller)
//#define COMMAND_TR 13 //set train speed   (controller)
//#define COMMAND_LI  14 //turn on lights    (controller)
//#define COMMAND_SW			11 //change switch (controller)
//#define COMMAND_DEATH			28 (controller)
//#define COMMAND_PN 			15 //sensor ping       (controller)
void commandServer() {
	bwassert(!RegisterAs("commandServer"), COM2, "Could not register as command server.\r\n");
	int cDelTid = -1;
	int cDelTid58 =  Create(5, (void *) commandReverseDelayServer);
	int cDelTid76 =  Create(5, (void *) commandReverseDelayServer);
	int cDelTid70 =  Create(5, (void *) commandReverseDelayServer);
	int cDelTid69 =  Create(5, (void *) commandReverseDelayServer);
	
	int csTID = WhoIs("clockServer");
	int iosUS1TID = WhoIs("UART1S");
	int iosUR1TID = WhoIs("UART1R");
	volatile int trainMutex[80];
	volatile int i = 0;
	for(i=0; i<80;i++){
		trainMutex[i] = 1;
	}
	i = 0;


	bwassert(csTID >= 0, COM2, "<commandServer>: clockServer has not been set up.\r\n");
	bwassert(iosUS1TID >= 0, COM2, "<commandServer>: UART1 Send IOServer has not been set up.\r\n");
	bwassert(iosUR1TID >= 0, COM2, "<commandServer>: UART1 Receive IOServer has not been set up.\r\n");


    int _tid = -1;
    char msg[64];
    int msgCap = 64;
    int msgLen = -1;
	char delMsg[10];
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
				
			
			case COMMAND_SW: // switches
				Putc(iosUS1TID, COM1, msg[1]);
				Putc(iosUS1TID, COM1, msg[2]);
				Delay(csTID, 15);//wait 150 ms //critical delay //cannot delay like reverse code.
				Putc(iosUS1TID, COM1, 32);//turn off solonoids
				Reply(_tid, "1", 2);
				break;

			case COMMAND_RV: // reverse part 1
				if(trainMutex[(int)msg[1]] ==1){
					Reply(_tid, "0", 2);
				}
				else{
					Reply(_tid, "1", 2);
	
				Putc(iosUS1TID, COM1, 0);
				Putc(iosUS1TID, COM1, msg[1]);
				//since the delay is not critical (the reverse command can occur much longer than the delay time without consequence)
				//the code is sent to a seperate task to delay
				//thus sensors can still run even when waiting for a long delay for train to stop (max 4.36 seconds).
				//might change when we start train specific realtime speeds.
				//note the reverse server does the delay.
				//proper code is that the reverse server has its own notifier, allowing it to queue up multiple delays.
				//delays use delayUntil, not delay. to minimize number of delays
			
									 
					delayReverse = Time(csTID) + (msg[2]*19)+270;
					//calculate the time (in ticks, based on a 24 hr time period, when the delay should end
					delMsg[0] = msg[1]; //set train
					delMsg[1] = msg[2]; //set trainspeed
					switch(msg[1]){
						case 58:
							cDelTid = cDelTid58;
							break;
						case 69:
							cDelTid = cDelTid69;
							break;
						case 70:
							cDelTid = cDelTid70;
							break;
						case 76:
							cDelTid = cDelTid76;
							break;
						default:
							cDelTid = -1;
							break;
					}
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
						int err = Reply(cDelTid, delMsg, 10);
						bwassert(err >= 0, COM2, "<Command Server>: could not send second part of reverse to reverse delay server.[%d] \r\n", err);

				}
			
				break;
			case COMMAND_RV_DELAY: // reverse part 2
				trainMutex[(int)msg[1]] = 0;
				Putc(iosUS1TID, COM1, 15);
				Putc(iosUS1TID, COM1, msg[1]);
				Putc(iosUS1TID, COM1, msg[2]);
				Putc(iosUS1TID, COM1, msg[1]);
				//Reply(_tid, "1", 2);
				break;
			case COMMAND_RV_INIT:
				if(_tid == cDelTid58){
					trainMutex[58] = 0;
				}
				else if(_tid == cDelTid69){
					trainMutex[69] = 0;
				}
				else if(_tid == cDelTid70){
					trainMutex[70] = 0;
				}
				else if(_tid == cDelTid76){
					trainMutex[76] = 0;
				}else{
					//????
				}


				break;
			case COMMAND_RVT:
			case COMMAND_TR: // train speed
			case COMMAND_LI:
 
				//bwassert(0, COM2, "                              \033[100;0H <Command Server>: could not send second part of reverse to reverse delay server.[%d] \r\n",!trainMutex[msg[2]-1]);
					//trainMutex[train] = 0;
					if(trainMutex[(int)msg[2]] == 0){
						for(i = 1; i < msgLen - 1; i++) Putc(iosUS1TID, COM1, msg[i]);
						Reply(_tid, "1", 2);
						break;
					}
					else{
						Reply(_tid, "0", 2);
						break;
					}

			case COMMAND_PN: // polling sensors
				Putc(iosUS1TID,COM1,0x85);
				//for(i = 1; i < msgLen - 1; i++) Putc(iosUS1TID, COM1, msg[i]);
				Reply(_tid, "1", 2);
				break;
			default:
				Reply(_tid, "0", 2);//why are we here?
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
/*
    char rpl[10];
    int rpllen = 10;
*/
	commandMsg[0] = COMMAND_RV_INIT;
	bwassert(Send(parent, commandMsg, 1, msg, msgCap) >= 0, COM2, "<commandReverseDelayServer>: Error sending message to CommandServer (init).\r\n");

	while(1) {

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

		DelayUntil(csTID,delayReverse);

		commandMsg[0] = COMMAND_RV_DELAY;
		commandMsg[1] = train;
		commandMsg[2] = trainspeed;
		commandMsg[3] = 0;
		bwassert(Send(parent, commandMsg, 4, msg, msgCap) >= 0, COM2, "<commandReverseDelayServer>: Error sending message to CommandServer (delay).\r\n");

	}
}


