

#ifndef _SERVER_H_
#define _SERVER_H_



#include "bwio.h"
//#define ALERT_SENSORPING		29
//note only used in this particular group of tasks
#define SENSOR_RAW_BATCH 1
#define SENSOR_RAW_SINGLE 2
#define SENSOR_COURIER_TO_SENSOR_SERVER 3
#define SENSOR_COURIER_TO_DISPLAY_SERVER 4

#define SENSOR_BIT_MASK_1 0x80
#define SENSOR_BIT_MASK_2 0x40
#define SENSOR_BIT_MASK_3 0x20
#define SENSOR_BIT_MASK_4 0x10
#define SENSOR_BIT_MASK_5 0x08
#define SENSOR_BIT_MASK_6 0x04
#define SENSOR_BIT_MASK_7 0x02
#define SENSOR_BIT_MASK_8 0x01


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



