

#ifndef _SERVER_H_
#define _SERVER_H_

// #include "kernelMacros.h"
// // defining all the servers here. 


// //
// // NAMESERVER
// //
// typedef struct nameRecord {
// 	volatile int tid;
// 	volatile char name[MAX_NAME + 1];
// 	volatile int namelen;

// } nameRecord;


// typedef struct nameServer {
// 	volatile nameRecord record[MAX_TID + 1];
// } nameServer;




void NameServerTask();
#endif



