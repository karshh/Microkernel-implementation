

#ifndef _USER_REQUEST_CALL

#define _USER_REQUEST_CALL

int Create( int priority, void (*code));

int MyTid( );

int MyParentTid( );

void Pass( );

void Exit( );

#endif
