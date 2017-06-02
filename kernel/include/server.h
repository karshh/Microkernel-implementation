

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

void NameServerTask();


//
// CLOCKSERVER
//

// storage data structure.
#define STORAGE_CAPACITY 128

typedef struct StorageNode {
	int tid;
	int delayTime;
} StorageNode;

typedef struct TimeStorage {
	StorageNode store[STORAGE_CAPACITY];
	int size;
} TimeStorage;


void initStorage(TimeStorage * t);
int insertIntoStorage(TimeStorage * t, StorageNode * n);
int deleteFromStorage(TimeStorage * t, StorageNode * n);

// clockserver code.
void clockNotifier();

void clockServer();


#endif



