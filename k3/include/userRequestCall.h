

#ifndef _USER_REQUEST_CALL

#define _USER_REQUEST_CALL

int Create( int priority, void (*code));

int CreateNameServer( int priority, void (*code));

int CreateClockServer( int priority, void (*code));

int MyTid( );

int MyParentTid( );

void Pass( );

void Exit( );

int Send(int tid, char *msg, int msglen, char *reply, int rplen);

int Receive(int *tid, char *msg, int msglen);

int Reply(int tid, char *reply, int rplen);

int WhoIs( char *name );

int RegisterAs( char *name );

int AwaitEvent(int eventid);

int Delay(int tid, int ticks);

int Time(int tid);

int DelayUntil(int tid, int ticks);

#endif
