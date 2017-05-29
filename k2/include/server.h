

#ifndef _SERVER_H_
#define _SERVER_H_

//
// NAMESERVER
//
typedef struct nameServer {
	volatile int serverTID; // upon initialization.
	// add data structure here.

} nameServer;


int nameServerInit(nameServer * ns);

int nameServerRun();



//
// CLOCKSERVER
//


void NameServerTask();
#endif



