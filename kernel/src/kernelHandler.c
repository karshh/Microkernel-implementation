#include "kernelHandler.h"
#include "kernelRequestCall.h"
#include "td.h"
#include "interruptHandler.h"
#include "request.h"
#include "bwio.h"
#include "message.h"
#include "ts7200.h"
#include "icu.h"
#include "time.h"


int getNextTID(kernelHandler  * ks, int * TID){
	TD * task = 0;
	if(!free_Pop(ks,&task)) {

		bwassert(0,COM2, "getNextTID: WE RAN OUT OF FREE TID's. PAILY:IMPLIMENT DESTROY, DIVIDE STACK FARTHER OR ALLOCATE MORE SPACE!\r\n");
		return -1;
	}
	*TID = task->TID;
	return 0;
}

int free_Pop(kernelHandler * ks, TD ** task){
	if (!ks->freeTail ) return 0;
	
	TD * poppedtask =  ks->freeTail;
	TD * nextTail = poppedtask->nextTD;

	if(nextTail == 0){
		ks->freeTail = 0;
		ks->freeHead = 0;
	}
	else{
		nextTail->prevTD = 0;
		ks->freeTail = nextTail;
	}

	poppedtask->nextTD = 0;
	poppedtask->prevTD = 0;
	*task = poppedtask;
	return 1;
}

int free_Push(kernelHandler * ks, TD * task){
	//puts or priority queue at task's priority

	if(ks->freeHead == 0){
		//this priority is empty
		//will modify to modify bitstring later
		ks->freeHead = task;
		ks->freeTail = task;
		task->nextTD = 0;
		task->prevTD = 0;
		task->state = FREE;
	}else{
		TD * prevHead = ks->freeHead;
		prevHead->nextTD = task;
		task->prevTD = prevHead;
		task->nextTD = 0;
		task->state = FREE;
		ks->freeHead = task;
	}
	return 1;
	
}


int initKernel(kernelHandler * ks, int priority, int code,int memOffset){
	ks->memOffset = memOffset;

	//reset previous IRQ state, in case if last run state is bad
	ks->KernelState = KERINIT;
	disableInterrupts();
	// make sure speed and fifo are set IN THE RIGHT ORDER!!! MY MAN WHY YA GWANNIN BARE WASTE, MANZ SPENT TOO LONG FIXING RELATED BUG 
    	bwsetspeed(COM1, 2400);
    	bwsetfifo(COM1, OFF);
    	bwsetspeed(COM2, 115200);
    	bwsetfifo(COM2, OFF);
	initHandlers();
	ks->activeTask = 0;
	int TID = 0;
	/******************************************************
	a suggestion by ben the TA
	i've allocated a subset of the kernel stack in a 16M array of characters.
	I use the memory location of this array as the space available for task memory
	That way we are sure never to touch actual used memory
	note: i set the max number of tasks to 128; so each task should have 128kb of space
	as part of the init and push/pop of register in the context switch it might be a good idea 
	to set a stack limit (r10) for each task on init.....i might even do that.....
	not going to do so now unless if program is unrunable
     *****************************************************/


	ks->freeHead = 0;
	ks->freeTail = 0;

	//servers
	ks->nameServer = -1;
	ks->clockServer = -1;
	ks->ioServer = -1;
	ks->ioServerUART1S = -1;//k4
	ks->ioServerUART1R = -1;//k4
	ks->ioServerUART2S = -1;//k4
	ks->ioServerUART2R = -1;//k4

	
	//avait event tasks
	ks->await_TIMER = -1;
    	ks->await_UART1SEND = -1;
    	ks->await_UART1RECEIVE = -1;
    	ks->await_UART2SEND = -1;
    	ks->await_UART2RECEIVE = -1;

	for (TID = 0; TID<MAX_TID;TID++){
		initTD(&ks->TDList[TID],TID,memOffset);
		free_Push(ks,&ks->TDList[TID]);
	}
	
	int queue =0;
	for (queue = 0; queue<32; queue++){
		ks->priorityHead[queue] = 0;
		ks->priorityTail[queue] = 0;
	}
	ks->priotiyBitLookup = 0;

	// initialize kernel's queue.
	//queueInit(&(ks->Q));

	//set first task
	TID =0;
	if(getNextTID(ks, &TID)) {
		bwprintf(COM2,"error getting TID\n\r"); //see sl
		return -1;
	}
 

	TD * td = setTask(ks,TID,KERNAL_CHILD,priority,code);   //if PTID == -1 , it is created by kernel
	if (!(kernel_queuePush(ks, td))){
		 bwprintf(COM2, "Kernel:failed to push TD %d on the queue\n\r", td->TID);
		return -2;
	}



	//init timers 
	//first stop any timers than might be running.
	stopTimer(TIMER1_BASE);
	stopTimer(TIMER3_BASE);
	//stopTimer(TIMER4_BASE);
	stopTimer(TIMER4_BASE);
	//start timers now
/*
Timer clock speeds
508.4689 KHz
1.9939 KHz
983 KHz
*/
	startTimer(TIMER3_BASE, 508, 5084689,PERIODIC);//used to prevent clock skew every 10s
	//startTimer(TIMER1_BASE, 508, 508469,PERIODIC);//tmer 1 used to keep track of clock ticks every 10ms
	startTimer(TIMER1_BASE, 508, 5085,PERIODIC);//tmer 1 used to keep track of clock ticks every 10ms
	//startTimer(TIMER1_BASE, 508, 5084,PERIODIC);//tmer 1 used to keep track of clock ticks every 10ms
	toggleTimer3Interrupt(1);//timer3 to keep timer 1 from clock skewing
	startTimer(TIMER4_BASE, 0,0,0); //TIMER 4 cares not for other arguments
	ks->idleTaskRunning = 0;
	ks->clockTaskRunning = 0;
	ks->clockNotifierTaskRunning= 0;
	ks->totalIdleRunningTime =0;
	
	//needed for fast priority queue pop
	ks->MultiplyDeBruijnBitPosition[ 0] = 0;
	ks->MultiplyDeBruijnBitPosition[ 1] = 1;
	ks->MultiplyDeBruijnBitPosition[ 2] = 28;
	ks->MultiplyDeBruijnBitPosition[ 3] = 2;
	ks->MultiplyDeBruijnBitPosition[ 4] = 29;

	ks->MultiplyDeBruijnBitPosition[ 5] = 14;
	ks->MultiplyDeBruijnBitPosition[ 6] = 24;
	ks->MultiplyDeBruijnBitPosition[ 7] = 3;
	ks->MultiplyDeBruijnBitPosition[ 8] = 30;
	ks->MultiplyDeBruijnBitPosition[ 9] = 22;

	ks->MultiplyDeBruijnBitPosition[10] = 20;
	ks->MultiplyDeBruijnBitPosition[11] = 15;
	ks->MultiplyDeBruijnBitPosition[12] = 25;
	ks->MultiplyDeBruijnBitPosition[13] = 17;
	ks->MultiplyDeBruijnBitPosition[14] = 4;

	ks->MultiplyDeBruijnBitPosition[15] = 8;
	ks->MultiplyDeBruijnBitPosition[16] = 31;
	ks->MultiplyDeBruijnBitPosition[17] = 27;
	ks->MultiplyDeBruijnBitPosition[18] = 13;
	ks->MultiplyDeBruijnBitPosition[19] = 23;

	ks->MultiplyDeBruijnBitPosition[20] = 21;
	ks->MultiplyDeBruijnBitPosition[21] = 19;
	ks->MultiplyDeBruijnBitPosition[22] = 16;
	ks->MultiplyDeBruijnBitPosition[23] = 7;
	ks->MultiplyDeBruijnBitPosition[24] = 26;

	ks->MultiplyDeBruijnBitPosition[25] = 12;
	ks->MultiplyDeBruijnBitPosition[26] = 18;
	ks->MultiplyDeBruijnBitPosition[27] = 6;
	ks->MultiplyDeBruijnBitPosition[28] = 11;
	ks->MultiplyDeBruijnBitPosition[29] = 5;

	ks->MultiplyDeBruijnBitPosition[30] = 10;
	ks->MultiplyDeBruijnBitPosition[31] = 9;


	//everthing good by this point

	ks->KernelState = KERACTIVE;

	return 0;
}


void kernelRun(int priority, int code) {

	kernelHandler ks;

	//an idea from ben to safely allocate space is to have 
	//wondering if this should be placed in another datastructure to limit cache misses
	char taskSpace[MAX_STACKSIZE+16];//add extra padding to deal with wierd offsets

	int memOffset = (int) &(taskSpace[MAX_STACKSIZE-1]);
	memOffset = memOffset - (memOffset%16);


	if(initKernel(&ks, priority, code,memOffset)){
		//if we return non-zero initialization failed and we don't go further
		return;
	}
	kernelExecute(&ks);
}
	

TD * setTask(kernelHandler * ks,  int TID, int parentTID,int priority, int code){
	TD * td = &(ks->TDList[TID]);
	td->priority = priority;
	td->parentTID = parentTID;
	if(parentTID == KERNAL_CHILD) td->parent = 0;
	else td->parent = &(ks->TDList[parentTID]);

	td->state = READY;
	td->reqVal = -1;
	volatile int mem = (volatile int) (TID * (MAX_STACKSIZE/MAX_TID));//giving stack space of 1kb
	td->sp  = (int *) (ks->memOffset -(int) mem);
	*(td->sp - 11) = code+REDBOOT_LOAD_OFFSET; //assumes redboot is loaded at 0x21000
 	*(td->sp - 12) = td->spsr; 	
		td->sp -= 12;
return  td;

}




void exitKernel(kernelHandler * ks){
	//clean up after kernel when exiting.
	disableInterrupts();
	stopTimer(TIMER1_BASE);
	stopTimer(TIMER4_BASE);
}



void kernelExecute(kernelHandler * ks) {
	request * r;
	
	//message m;
	//TD * task =0;
	//int old_idle = 0;


/*
*/


	while(kernel_queuePop(ks, &ks->activeTask)) {

	
		//task->state = ACTIVE;
		ks->activeTask->state = ACTIVE;
		//ks.activeTask = task;
		//TD *td = (TD *)task;
/*************************************
 diagnostic code
*************************************/

	  	if(ks->activeTask->priority ==31){
		// 	 //makes assumption a 31 prioty task is an idle task
		 	ks->idleTaskRunning = 1;
		  	ks->lastIdleRunningTime = getTicks4(0);
			
		 }

/*************************************
end diagnostic code
*************************************/


		r = activate(ks->activeTask);

		if(ks->idleTaskRunning ){
					ks->totalIdleRunningTime += getTicks4(0) -ks->lastIdleRunningTime;
					ks->idleTaskRunning = 0;
		}

/*************************************
 diagnostic code
*************************************/
/*
		 if(r == 0){
		 //if interupt print diagnostic info.
		 //print only if diagnostic info changes:
		 	int new_idle = 100 * ks->totalIdleRunningTime / getTicks4(0);
		 	if(old_idle - new_idle){
		 		old_idle = new_idle;
		  		bwprintf(COM2,"\033[s\033[?25l\033[1;90H idle:%d%% \033[u\033[?25h",old_idle);
		 	}
		 }

*/

/*************************************
end diagnostic code
*************************************/

		processRequest(ks, ks->activeTask, r);
		/*
		if(!processRequest(ks, ks->activeTask, r)){
			bwprintf(COM2,"PROCESS request failed[TID:%d]!\n\r", ks->activeTask->TID);
			break;
		}
*/
		if(ks->activeTask->state == ACTIVE)kernel_queuePush(ks, ks->activeTask);

		if (ks->KernelState == KERQUIT){
			//hard quit for now
			break;
		}


		//we are done with task so setting active task to null
	//	ks->activeTask = 0;
	}
	exitKernel(ks);

}
int kernel_queuePush(kernelHandler * ks, TD * task){
	//puts or priority queue at task's priority
	int priority = task->priority;

	if(ks->priorityHead[priority] == 0){
		//this priority is empty

		//set bit for this priority
		unsigned int mask = 1 <<priority;
		int  f=1;         // conditional flag
		ks->priotiyBitLookup ^= (-f ^ ks->priotiyBitLookup) & mask;
		//finish setting bit

		ks->priorityHead[priority] = task;
		ks->priorityTail[priority] = task;
		task->nextTD = 0;
		//task->prevTD = 0;
		task->state = READY;
	}else{
		TD * prevHead = ks->priorityHead[priority];
		prevHead->nextTD = task;
	//	task->prevTD = prevHead;
		task->nextTD = 0;
		task->state = READY;
		ks->priorityHead[priority] = task;
	}
	return 1;
	
}
int kernel_queuePop(kernelHandler * ks, TD ** task){
	//unsigned int v = ks->priotiyBitLookup;     // 32-bit word input to count zero bits on right
	unsigned int c;     // c will be the number of zero bits on the right,
			    // so if v is 1101000 (base 2), then c will be 3
	if(ks->priotiyBitLookup == 0) return 0;//if bit string is zero then no flags are checked
	c = ks->MultiplyDeBruijnBitPosition[((unsigned int)((-(ks->priotiyBitLookup) & (ks->priotiyBitLookup)) * 0x077CB531U)) >>27];

	if (!ks->priorityTail[c] ) return 0;
	
	TD * poppedtask =  ks->priorityTail[c];
	TD * nextTail = poppedtask->nextTD;

	if(nextTail == 0){
		//set bit for this priority
		unsigned int mask = 1 <<c;
		int  f=0;         // conditional flag
		ks->priotiyBitLookup ^= (-f ^ ks->priotiyBitLookup) & mask;
		//finish setting bit
		ks->priorityTail[c] = 0;
		ks->priorityHead[c] = 0;
	}
	else{
	//	nextTail->prevTD = 0;
		ks->priorityTail[c] = nextTail;
	}
	poppedtask->nextTD = 0;
	//poppedtask->prevTD = 0;
	*task = poppedtask;
	return 1;
}


