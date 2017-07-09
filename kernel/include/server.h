

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

/************************************************
TRAINSERVER
*************************************************/
void trackServer();

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
void trainTask(); //will be called by displayServer, code in userTasks

void trainServer();
void trainProfile(); //will replace trainVelocityServer


void trainVelocityServer(); //holds velocity/position information for mutiple trains //will be replaced by trainProfile
void trainStopServer(); 


int stopDistance(int velocity);
void initTrains(int csTID, int commandServerTID, int dspTID, int trackServerTID);

/*****************************************************************************
SENSORSERVER
*****************************************************************************/

void sensorServer(); //holds sensor database and communicates to outside (usually train specific servers)
void sensorNotifier(); //polls COM1 for sensor info. Sends data to sensorProcessor();
void sensorProcessor(); //gets raw info from Terminal/Notifier, processes it and sends it to Sensor Server
void sensorCourier(); //passes data from sensorProcessor and sensor Server;
void sensorDisplayCourier(); //passes sensor data from sensorProcessor to display server. possibly from sensorServer to display 

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



