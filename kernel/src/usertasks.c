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


void FirstUserTask() {
	CreateNameServer(1, (void *) NameServerTask);
	CreateClockServer(2, (void *) clockServer);
	Create(31, (void *) idleTask);

	bwassert(CreateIOServer(2, (void *) UART1_ReceiveServer, UART1R)>=0, COM2, "Failed Create UART1TR Server.\n\r");
	bwassert(CreateIOServer(12, (void *) UART2_ReceiveServer, UART2R)>=0, COM2, "Failed Create UART2TR Server.\n\r");
	bwassert(CreateIOServer(2, (void *) UART1_SendServer, UART1S)>=0, COM2, "Failed Create UART1TS Server.\n\r");
	bwassert(CreateIOServer(12, (void *) UART2_SendServer, UART2S)>=0, COM2, "Failed Create UART2TS Server.\n\r");



	Create(3, (void *) commandServer);
	Create(14, (void *) displayServer);
	Exit();
}

void trainTask() {
	//patriarch of train servers
	//children:
		//NOTE: ALL OF THESE TASKS AND THIER CHILDREN SHOULD BE AT HIGHER PRIORITY THAN DISPLAYSERVER AND UART2 BASED SERVERS
		// RUNNING THE PROGRAM IS HIGHER PRIORITY THAN DISPLAYING INFO
		//don't want trainserver/track server calculations delayed because i need to print info on screen.
		//timer based polling must be low priority, but not all of them
		bwassert(Create(5, (void *) trackServer)>=0, COM2, "Failed Create trackServer.\n\r");
		//sensorServer
		bwassert(Create(5, (void *) sensorServer)>=0, COM2, "Failed Create sensorServer.\n\r");
		
		//trainServer
		bwassert(Create(5, (void *) trainServer)>=0, COM2, "Failed Create trainServer.\n\r");
		//trackServer
	Exit();
}






void idleTask() {
	//idle task does absolutly nothing but spin
	while(1){

	} 
	//gets into infinite loop that spins. only way out is an interrupt
}

