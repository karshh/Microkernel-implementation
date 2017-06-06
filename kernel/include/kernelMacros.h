//Keep a list of macros used in kernal

#ifndef KERNEL_MACROS

#define KERNEL_MACROS


//Redboot macros
#define REDBOOT_LOAD_OFFSET 0x218000

//Priority queue macros
#define HIGH	1
#define MEDIUM	2
#define LOW	3
#define ZOMBIE_PRIORITY	4 // Zombie queueE 

//TID macros
#define KERNAL_CHILD -1 
//set PTID in setTask fuction to Kernal Child if task is created by kernal instead of another task
#define MAX_TID 128  //max number of TIDS
#define MAX_HASH 347
#define MAX_NAME_LENGTH 16
#define MAX_STACKSIZE  1024*1024*16  // 16MBytes (space allocated for tasks

typedef enum awaitEventType {
	TIMER_TICK,
	UART1_SEND,
	UART1_RECEIVE,
	UART2_SEND,
	UART2_RECEIVE
} awaitEventType;

#endif
