

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

void UART1Send_Notifier();

void UART1Receive_Notifier();

void UART2Send_Notifier();

void UART2Receive_Notifier();

#define UART1_FLAG ((int *) (UART1_BASE + UART_FLAG_OFFSET))
#define UART2_FLAG ((int *) (UART2_BASE + UART_FLAG_OFFSET))
#define UART1_DATA ((int *) (UART1_BASE + UART_DATA_OFFSET))
#define UART2_DATA ((int *) (UART2_BASE + UART_DATA_OFFSET))

void ioServer();



#endif



