

#ifndef _KERNEL_REQUEST_CALL

#define _KERNEL_REQUEST_CALL



// the context switch will execute one of the following code based on the
// sw code. 

int kernel_Create(int priority, void (*code));

int kernel_MyTid( );

int kernel_MyParentTid( );

void kernel_Pass( );

void kernel_Exit( ); 

#endif
