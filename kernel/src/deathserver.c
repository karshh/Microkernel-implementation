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


/*****************************************************************************
Death Server: Angel of Death
*****************************************************************************/

void DeathServer(){
	int disTID = MyParentTid();
	int cmTID = WhoIs("commandServer");
    	char commandMsg[64];
    	char rpl[3];
    	int rpllen = 3;

	commandMsg[0] = COMMAND_DEATH;
	commandMsg[1] = 0;
	bwassert(Send(cmTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<DeathServer>: Error sending message to CommandServer.\r\n");
	//return when UART1 Servers and Command Server is dead
	commandMsg[0] = COMMAND_DEATH;
	commandMsg[1] = 0;
	bwassert(Send(disTID, commandMsg, 2, rpl, rpllen) >= 0, COM2, "<DeathServer>: Error sending message to CommandServer.\r\n");


	//now safe to quit
	Quit();

}
