


#include "server.h"
#include "pkstring.h"

typedef struct nameServer {
	volatile int serverTID; // upon initialization.
	// add data structure here.

} nameServer;


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
}



