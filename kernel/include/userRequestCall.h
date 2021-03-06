

#ifndef _USER_REQUEST_CALL

#define _USER_REQUEST_CALL

#include "bwio.h"

int Create( int priority, void (*code));

int CreateNameServer( int priority, void (*code));

int CreateClockServer( int priority, void (*code));

int CreateIOServer( int priority, void (*code), int ioserverType);

int MyTid( );

int MyParentTid( );

void Pass( );

void Exit( );
void Quit( );

int Send(int tid, char *msg, int msglen, char *reply, int rplen);

int Receive(int *tid, char *msg, int msglen);

int Reply(int tid, char *reply, int rplen);

int WhoIs( char *name );

int RegisterAs( char *name );

int AwaitEvent(int eventid);

int Delay(int tid, int ticks);

int Time(int tid);

int IdlePercentage();

int DelayUntil(int tid, int ticks);

char Getc(int tid, int uart);

int Putc(int tid, int uart, char ch);

int Putx( int tid, int channel, char c );
int sPutx( int tid, int channel, char c ,char *buff);

int Putr( int tid, int channel, unsigned int reg );

int Putstr( int tid, int channel, char *str );

void Putw( int tid, int channel, int n, char fc, char *bf );
int sPutw(int n, char fc, char *bf, char *buff);

void IOFormat ( int tid, int channel, char *fmt, va_list va );

void Printf( int tid, int channel, char *fmt, ... );




#endif
