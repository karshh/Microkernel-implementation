

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
	volatile int delayTime;
	int tid;
} StorageNode;

typedef struct TimeStorage {
	StorageNode store[STORAGE_CAPACITY];
	int size;
} TimeStorage;
void initStorage(TimeStorage * t);
/*
int insertIntoStorage(TimeStorage * t, StorageNode * n);
int deleteFromStorage(TimeStorage * t, StorageNode * n);
*/
inline int heapParent(int i);

inline int heapLeft(int i);

inline int heapRight(int i);

//min heap so A[parent(i)] <= A[i];

//peak
inline int minHeapPeak(TimeStorage *t, int * peak);

void minHeapify(TimeStorage *t,int i);
//delete
int minHeapDelete(TimeStorage *t, StorageNode *n);
//insert
int minHeapInsert(TimeStorage *t, StorageNode *n);
	
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

void trainVelocityServer(); //holds velocity/position information for mutiple trains
void trainStopServer(); 

int stopDistance(int velocity);

/*****************************************************************************
DISPLAYSERVER
*****************************************************************************/

void Grid();

void UserPrompt();

void Sensors();

void displayServer();

void commandServer();

void commandReverseDelayServer();
/*****************************************************************************
Death Server: Angel of Death
*****************************************************************************/

void DeathServer();

#endif



