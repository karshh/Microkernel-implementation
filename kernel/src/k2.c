#include "ts7200.h"

#include "bwio.h"
#include "userRequestCall.h"
#include "kernelHandler.h"
#include "kernelMacros.h"
#include "buffer.h"



void menu() {
}

void nameServer() {
	runNameServer();
}

void firstUserTask() {
	circularBuffer waitList;
	circularBufferInit(&waitList);
	bwprintf(COM2, "ROCK PAPER SCISSORS!\r\n");
	bwprintf(COM2, "By: Paily & Karsh\r\n\r\n");  
	bwprintf(COM2, "Creating NameServer...\r\n");
	// insert nameserver creation code here.
	bwprintf(COM2, "Getting requests...\r\n");

	volatile int error = 0;
	volatile int rtid = 0;
	volatile char message[16];
	volatile int messagelen = 16;
	volatile char response[16];
	volatile int responselen = 16;
	while(1) {
		error = Receive(&rtid, message, messagelen);
		bwassert(error < 0, COM2, "ERROR FROM TID %d: %d", rtid, error);

		if () 

	}
}


int main() {

	int main(void) {
	

	kernelRun(MEDIUM, (int) firstUserTask);
	
	return 0;
}
}

