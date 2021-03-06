

#ifndef _KERNEL_HANDLER_

#define _KERNEL_HANDLER_

#include "queue.h"
#include "td.h"
#include "kernelMacros.h"

typedef enum KERNELSTATEtype {
	KERINIT,
	KERACTIVE,
	KERQUIT
} KERNELSTATEtype ;

typedef enum U1S_State {
	TX_NOT_ASSERTED,
	TX_ASSERTED,
	CTS_ASSERTED,
	TX_CTS_ASSERTED,
} U1S_STATE ;



typedef struct kernelHandler{
	int KernelState;
	TD * activeTask;
	//priority queues
	unsigned int priotiyBitLookup;  
	//int Mod37BitPosition[37] ; // map a bit value mod 37 to its position

	int MultiplyDeBruijnBitPosition[32];
	TD * priorityHead[32];
	TD * priorityTail[32];


	//list of TD's
	TD TDList[MAX_TID];
			
	volatile int nameServer; //k2
	volatile int clockServer;//k3
	volatile int ioServerUART1S;//k4
	volatile int ioServerUART1R;//k4
	volatile int ioServerUART2S;//k4
	volatile int ioServerUART2R;//k4
	volatile int ioServer;//k4

	volatile int idleTaskRunning;//k3
	volatile int clockTaskRunning;//k3
	volatile int clockNotifierTaskRunning;//k3

	volatile unsigned long lastIdleRunningTime;//k3

	volatile unsigned long totalIdleRunningTime;//k3

	/******************************
		we need to figure for each possible wait event, if there can only be one
		task for each interupt, or if multiple tasks should wait for a particular event.
		i.e should only the clock notifier care about the timer wait event, or can other tasks be put on wait as well?
		if so, do they all get unblocked or do they get poped one at a time?

		for now, im going to assume there is only one task waiting on a prarticular event at a time.
		if we need to allow mutliple, we should do something like freeHead, free tail, where we push these tasks to a
		list/queue.
	*/

	volatile int await_TIMER;
	volatile int await_UART1SEND;
	volatile int await_UART1RECEIVE;
	volatile int await_UART2SEND;
	volatile int await_UART2RECEIVE; 
	volatile int uart1_TX;
	volatile int uart1_MX;

	//memm offset for user task space
	int memOffset;
//free list
	TD * freeHead;
	TD * freeTail;
/*
*/	
} kernelHandler;

// return 1 if kernel handler was succesfully initialized. 
int initKernel(kernelHandler * ks, int priority, int code,int memOffset);

void  exitKernel(kernelHandler * ks);

// run the kernel
void kernelRun(int priority, int code) ;
void kernelExecute(kernelHandler *ks); 

inline int getNextTID(kernelHandler  * ks, int * TID); //inline to make cache checks better

void kernelTestRun(int priority, int code);

TD * setTask(kernelHandler * ks,  int TID, int parentTID,int priority, int code);


// Abstracting queue code away.
//int kernel_queuePush(kernelHandler * ks, BUFFER_TYPE task);
//int kernel_queuePop(kernelHandler * ks, BUFFER_TYPE * task);


//temporary queue functions for now
inline int kernel_queuePush(kernelHandler * ks, TD * task);
//inline int kernel_queuePop_priority(kernelHandler * ks, TD ** task, int priority);
inline int kernel_queuePop(kernelHandler * ks, TD ** task);

int free_Push(kernelHandler * ks, TD * task);
int free_Pop(kernelHandler * ks, TD ** task);

#endif

