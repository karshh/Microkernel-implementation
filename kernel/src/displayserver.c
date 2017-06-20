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

    char rpl[64];
    int rpllen = 64;
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

	int Grid_TID = Create(4, (void *) Grid);
	//int Prompt_TID = Create(4, (void *) UserPrompt);
	int Prompt_TID = -1;
	int Death_TID = -1;
	int Sensors_TID = Create(4, (void *) displaySensors);
	int Clock_TID = Create(4, (void *) displayClock);
	int Train_TID = Create(4, (void *) trainServer);


    int _tid = -1;
    char msg[64];
    int msgCap = 64;
    int msgLen = -1;
    char rpl[4];
    int rplLen = 4;
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

	        	case COMMAND_SS:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KPath for train %d set up en route to sensor %d.\033[34;1H>",msg[1],msg[2]);
	                break;

	        	case COMMAND_SSW:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KSS Could not set up path for train %d to sensor %d.\033[34;1H>",msg[1],msg[2]);
	                break;

	        	case COMMAND_IS:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KProgram is now awaiting train %d to flick sensor %d in order to complete registration.\033[34;1H>",msg[1],msg[2]);
	                break;
            		case COMMAND_Q:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KQuiting Kernel.\033[34;1H>");
					Death_TID = Create(0,(void*) DeathServer);
	            	break;

	        	default:
	                Printf(iosTID, COM2, "\033[34;1H\033[K\033[35;1H\033[KIncorrect Command.\033[34;1H>");
	                break;
			}

			Reply(_tid, "1", 2);
		} else if (_tid == Death_TID){
			char delMsg[2];
			char rep[2];


			delMsg[0] = msg[0]; 
			delMsg[1] = 0; 
			Send(iorTID, delMsg, 2, rep, 2);

			delMsg[0] = msg[0]; 
			delMsg[1] = 0; 
			Send(iosTID, delMsg, 2, rep, 2);
			//Putc(iosUS1TID, COM1, msg[0]);
			//inform angel of death that uart1 servers are dead
			Reply(_tid, "1", 2);
			//Command server dies
			Exit();
		} else if (_tid == Sensors_TID){

			for (i = 0; i < msgLen; i++) {


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
			// for (i = 0; i < rplLen; i += 2) {
   //  			Printf(iosTID, COM2,"\033[%d;30H%d: ", rpl[i] - 54, rpl[i+1]);
			// }
			Reply(_tid, "1", 2);

		} else if (_tid == Train_TID){
			if (msg[0] == 2){ //2 used for initiliziation code
				if(msg[1] == 0)
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInitializing Trains %d.\033[34;1H>\033[u\033[?25h",msg[2]);
				else if(msg[1] == 1)
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInitializing Switches.\033[34;1H>\033[u\033[?25h");
				else{
	                		Printf(iosTID, COM2, "\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[K\033[34;1H>\033[u\033[?25h");
					Prompt_TID = Create(4, (void *) UserPrompt);
				}
					
			} else if (msg[0] == 3) {//3 is train sensor update
				Printf(iosTID, COM2,"\033[s\033[?25l\033[%d;30H%c%d%d\033[u\033[?25h", msg[1] - 52, ((msg[2]-1)/16)+'A',((msg[2]-1)%16+1)/10, ((msg[2]-1)%16+1)%10);

			} else if (msg[0] == 1) {//1 is switch mode warning
	       			switchLocation = msg[2] + 6;
       				Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;11H\033[1m\033[31m%c\033[0m\033[u\033[?25h", switchLocation, msg[1]);
			} else {
				//0 is for switch mode normal text
	       			switchLocation = msg[2] + 6;
       				Printf(iosTID, COM2, "\033[s\033[?25l\033[%d;11H%c\033[u\033[?25h", switchLocation, msg[1]);
			}
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
