

#ifndef _SERVER_H_
#define _SERVER_H_



#include "bwio.h"
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
TRACKSERVER
*************************************************/
typedef struct trackNextSensorstruct {
	int curSensor ; //4
	int nextSensor; //4
	int dist ; //4
	//12 bytes
} trackNextSensorstruct;


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
void trainWorker(); // child worker used to do work for any given train

typedef enum WORKER_STATE {
	WORKER_INIT,
	WORKER_READY,
	WORKER_IS1,
	WORKER_IS2,
	WORKER_VELE, //worker waiting on expected sensor
	WORKER_VELN, //worker waiting on next sensor (broken sensor case)
	WORKER_VELS //worker waiting on sensor on other side of switch (broken switch cases)
} WORKER_STATE;

typedef enum trainTasks {
	TTK_NONE,
	TTK_IS,
	TTK_VEL
} trainTasks;

typedef enum trainWorkerSensorReportStatus {
	TWSR_SUCCESS,
	TWSR_INVALID_SENSOR,
	TWSR_TIMEOUT
} trainWorkerSensorReportStatus;


typedef struct trainWorkerSensorReportStruct {
	//used by trainworker to pass latest sensor ping info to it's train
	char message[4];
	int trainTask;
	int taskStatus;
	int  error;
	int  sensor;
	int  lastSensorTime;
} trainWorkerSensorReportStruct;

typedef struct trainWorkerSensorTask {
	//used by trainworker to pass latest sensor ping info to it's train
	char message[4];
	int trainTask;
	int taskStatus;
	int  sensor;
	int  expectedTime;
} trainWorkerSensorTask;


typedef struct trainWorkerListItem {
	int  tid;
	int  taskStatus;
} trainWorkerListItem;

void initTrainWorker(trainWorkerListItem * workerList);
int Worker(trainWorkerListItem * workerList);
int setTrainWorkerStatus(trainWorkerListItem * workerList, int tid, int taskStatus);
int trainWorkerIndex(trainWorkerListItem * workerList, int tid);
int nextFreeTrainWorker(trainWorkerListItem * workerList);

void trainVelocityServer(); //holds velocity/position information for mutiple trains //will be replaced by trainProfile
void trainStopServer(); 


int stopDistance(int velocity);
void initTrains(int csTID, int commandServerTID, int dspTID, int trackServerTID);


/*****************************************************************************
SENSORSERVER
*****************************************************************************/
typedef struct sensorWarehouseStruct {
//even passing this along a message should take less than 10 microseconds (with go fast button on)
	int  lastSensorTime[80]; //80*4 =320
	char sensorHeld[80]; //80
	int counter; //4
	char recentSensors[81];//81
	//485 bytes
} sensorWarehouseStruct;

typedef struct sensorCourierStruct {
//even passing this along a message should take less than 10 microseconds (with go fast button on)
	char message[4]; //4
	sensorWarehouseStruct sw; //485
	//489 bytes
} sensorCourierStruct;

typedef struct sensorCurrentStatusStruct {
	int sensor;
	char sensorHeld;
	int lastSensorTime;
} sensorCurrentStatusStruct;


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


void ioformat(int dspTID, char *fmt, va_list va);

void iodebug(int dspTID, char *fmt, ... );


void displayServer();

void commandServer();

void commandReverseDelayServer();
/*****************************************************************************
Death Server: Angel of Death
*****************************************************************************/

void DeathServer();

#endif



