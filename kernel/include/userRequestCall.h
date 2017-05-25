

#ifndef _USER_REQUEST_CALL

#define _USER_REQUEST_CALL

int Create( int priority, void (*code));

int MyTid( );

int MyParentTid( );

void Pass( );

void Exit( );

int Send(int tid, void *msg, int msglen, void *reply, int replylen);

int Receive(int *tid, void *msg, int msglen);

int Reply(int tid, void *reply, int replylen);

#endif
