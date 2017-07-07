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



void UserPrompt() {
	int parentTID = MyParentTid();
	int iosTID = WhoIs("UART2R");
	bwassert(iosTID >= 0, COM2, "<UserPrompt>: UART2ReceiveServer has not been set up.\r\n");


	char terminalInput[124];
	int terminalInputIndex = 0;
	int cursorCol = 2;
	volatile char c = 0;
	
	// messaging purposes
    char msg[64];

    char rpl[64];
    int rpllen = 64;
	while (1) {
		c = Getc(iosTID, COM2);

	    if (c <= 0 || (terminalInputIndex >= 32 && c != 8)) continue;
	    else if (c == '\r') {
	        int cleanup = 0;
	        terminalInput[terminalInputIndex] = 0;
	        int arg1;
	        int arg2;
	        int arg3;

	        msg[0] = COMMAND_LOADING;
	        msg[1] = 0;
	        bwassert(Send(parentTID, msg, 2, rpl, rpllen) >= 0, COM2, "<UserPrompt>: could not send prompt response to server. \r\n");

		msg[0] = parseCommand(terminalInput, &arg1, &arg2, &arg3);
	        msg[1] = arg1;
	        msg[2] = arg2;
	        msg[3] = (arg3 / 1000000) % 100;
	        msg[4] = (arg3 / 10000) % 100;
	        msg[5] = (arg3 / 100) % 100;
	        msg[6] = arg3 % 100;
	        msg[7] = 0;
	        bwassert(Send(parentTID, msg, 8, rpl, rpllen) >= 0, COM2, "<UserPrompt>: could not send prompt response to server. \r\n");
            for (; cleanup <= terminalInputIndex; cleanup++) terminalInput[cleanup] = '\0';
            terminalInputIndex = 0;
            cursorCol = 2;
		if(msg[0] == COMMAND_Q) Exit();

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
	int iorTID = WhoIs("UART2R");
	bwassert(iorTID >= 0, COM2, "<displayGrid>: UART2SReceiveServer has not been set up.\r\n");

	int Prompt_TID = -1; //created when train init is done
	int Death_TID = -1; //created with quit command issued

	//Create(14, (void *) displaySensors); //will be moved later to train server
	Create(15, (void *) displayClock); //displays clock
	Create(4, (void *) trainTask); //creates and runs this task imediatly
	//since this task is higher than any in display server side, trainserver should be registered to nameserver when we return
	//int Train_TID = Create(4, (void *) trainServer);


    int _tid = -1;
    char msg[64];
    int msgCap = 64;
    int msgLen = -1;
    int cursorCol = 0;
    // sensor variables'
    const int maxCursor = SENSOR_LIST_SIZE + 5;
    const int minCursor = 6;
    int prevSensor = 0; 
    int prevSensorCursor = maxCursor;
    int sensorCursor = minCursor;
    unsigned int sensorPingLast = getTicks4(0);
    unsigned int sensorPingCurrent = 0;
    //int sensorTimer = getTicks4(0);


    char c = 0;
    volatile int i = 0;

    int switchLocation = 0;
	displayGrid();

	while(1) {

		msgLen = Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<displayServer>: Receive error.\r\n");

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

        	case COMMAND_SS:

                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KPath for train %d set up en route to sensor %d and stop %d mm\033[34;1H>",msg[1],msg[2],(msg[3] * 1000000) + (msg[4] * 10000) + (msg[5] * 100) + msg[6]);
                break;

        	case COMMAND_SSW:
                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KCould not set up path for train %d to sensor %d.\033[34;1H>",msg[1],msg[2]);
                break;

        	case COMMAND_IS:
                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KProgram is now awaiting train %d to flick sensor %d in order to complete registration.\033[34;1H>",msg[1],msg[2]);
                break;
    		case COMMAND_Q:
                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KQuiting Kernel.\033[34;1H>");
				Death_TID = Create(0,(void*) DeathServer);
            	break;
		
			case COMMAND_LOCKEDTRAINL:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KTrain Reverse Locked.Cannot turn on Train %d's lights.\033[34;1H>",  msg[1]);
			break;

			case COMMAND_LOCKEDTRAINT:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KTrain Reverse Locked.Cannot Change Train %d's speed.\033[34;1H>",  msg[1]);
			break;

			case COMMAND_LOCKEDTRAINR:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KTrain Reverse Locked.Cannot Reverse Train %d.\033[34;1H>",  msg[1]);
			break;

			case COMMAND_DEATH:
				{
					char delMsg[2];
					char rep[2];


					delMsg[0] = msg[0]; 
					delMsg[1] = 0; 
					Send(iorTID, delMsg, 2, rep, 2);

					delMsg[0] = msg[0]; 
					delMsg[1] = 0; 
					Send(iosTID, delMsg, 2, rep, 2);
					//inform angel of death that uart1 servers are dead
					Reply(_tid, "1", 2);
					//Command server dies
					Exit();
					break;
				}

			case ALERT_SENSORPING:
				for (i = 1; i < msgLen; i++) {
					if (prevSensor != msg[i]) {
						sensorPingCurrent = getTicks4(0);
						Printf(iosTID,COM2,"\033[s\033[?25l\033[1;10HSensor ping elapse:%dms \033[u\033[?25h",sensorPingCurrent-sensorPingLast);
					}
					prevSensor = msg[i];
					Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;13H--->%c%d%d<---\033[u\033[?25h", sensorCursor,((msg[i]-1)/16)+'A',((msg[i]-1)%16+1)/10, ((msg[i]-1)%16+1)%10);
					Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;13H    \033[%d;20H    \033[u\033[?25h", prevSensorCursor, prevSensorCursor);
					prevSensorCursor = sensorCursor;
					sensorCursor = sensorCursor + 1 > maxCursor ? minCursor : sensorCursor + 1;
					sensorPingLast = getTicks4(0);
				}
				break;

			case COMMAND_TRAIN_INIT:
				if(msg[1] == 0)
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInitializing Trains %d.\033[34;1H>\033[u\033[?25h",msg[2]);
				else if(msg[1] == 1)
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInitializing Switches.\033[34;1H>\033[u\033[?25h");
				else{
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[K\033[34;1H>\033[u\033[?25h");
					Prompt_TID = Create(15, (void *) UserPrompt);
				}

				break;
			case COMMAND_TRAIN_SENS:
				Printf(iosTID, COM2,"\033[s\033[?25l\033[%d;30H%c%d%d\033[u\033[?25h", msg[1] - 52, ((msg[2]-1)/16)+'A',((msg[2]-1)%16+1)/10, ((msg[2]-1)%16+1)%10);
				break;
			case COMMAND_TRAIN_SWWAR:
				switchLocation = msg[2] + 6;
   				Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;11H\033[1m\033[31m%c\033[0m\033[u\033[?25h", switchLocation, msg[1]);
				break;
			case COMMAND_TRAIN_SWNOR:
				switchLocation = msg[2] + 6;
   				Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;11H%c\033[u\033[?25h", switchLocation, msg[1]);
				break;
			case COMMAND_SENSOREDGE:
				{
					int t = ((msg[3]*10000) + (msg[4]*100) + msg[5]);
					int d = ((msg[6]*10000) + (msg[7]*100) + msg[8]) * 1000;
					Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;%dH                 \033[s\033[?25l\033[%d;%dH%dms[%dum/ms]\033[u\033[?25h", msg[1], 53+(30*msg[2]),msg[1], 53+(30*msg[2]), t, t==0 ? 0 : d/t);
				}
				break;

			case CLOCK_U:
	 				Printf(iosTID,COM2,"\033[s\033[?25l\033[1;125H%d%d:%d%d:%d%d.%d\033[u\033[?25h",msg[1],msg[2],msg[3],msg[4],msg[5],msg[6],msg[7]);
	 				break;
			case DELAY_U:
	  			Printf(iosTID,COM2,"\033[s\033[?25l\033[1;68H%d%% \033[u\033[?25h",msg[1]);
	  			break;
			case VELOCITY_DEBUG:
				{
					int v = ((msg[2]*10000) + (msg[3]*100) + msg[4]);
					int a = ((msg[5]*10000) + (msg[6]*100) + msg[7]);
					int p = ((msg[8]*10000) + (msg[9]*100) + msg[10]);
				Printf(iosTID, COM2,"\033[s\033[?25l\033[%d;35H%d\033[u\033[?25h", msg[1] - 52, v) ;
	  			Printf(iosTID,COM2,"\033[s\033[?25l\033[2;68HDelta Time: %10d Delta Dist:%10d \033[u\033[?25h", a-p ,(v*(a-p))/1000);
				}
	  			break;

        	default:
                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KIncorrect Command.\033[34;1H>");
                break;
		}

		Reply(_tid, "1", 2);
	}

	Exit();



}
