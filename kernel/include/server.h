

#ifndef _SERVER_H_
#define _SERVER_H_

/*************************************************
 NAMESERVER
**************************************************/

typedef struct nameServer {
	volatile int serverTID; // upon initialization.
	// add data structure here.

} nameServer;


int nameServerInit(nameServer * ns);

int nameServerRun();

void NameServerTask();


/*************************************************
 CLOCKSERVER
**************************************************/
// storage data structure.
#define STORAGE_CAPACITY 128

typedef struct StorageNode {
	int tid;
	volatile int delayTime;
} StorageNode;

typedef struct TimeStorage {
	StorageNode store[STORAGE_CAPACITY];
	int size;
} TimeStorage;
void initStorage(TimeStorage * t);
int insertIntoStorage(TimeStorage * t, StorageNode * n);
int deleteFromStorage(TimeStorage * t, StorageNode * n);

// clockserver code.

void idleTask();

void clockNotifier();

void clockServer();


/******************************************************************************
FIRST USER TASK
*****************************************************************************/

void FirstUserTask();

/*****************************************************************************
IOSERVER
*****************************************************************************/
typedef enum IOSERVERType {
	DEFAULTIOSERVER,
	UART1S,
	UART1R,
	UART2S,
	UART2R
} IOSERVERType;
void UART1Send_Notifier();

void UART1Receive_Notifier();

void UART2Send_Notifier();

void UART2Receive_Notifier();


void ioServer();
void UART1_SendServer();
void UART1_ReceiveServer();
void UART2_SendServer();
void UART2_ReceiveServer();

/*****************************************************************************
TRAINSERVER
*****************************************************************************/

void trainServer();

/*****************************************************************************
DISPLAYSERVER
*****************************************************************************/

void Grid();

void UserPrompt();

void Sensors();

void displayServer();

void commandServer();

void commandReverseDelayServer();

#endif



