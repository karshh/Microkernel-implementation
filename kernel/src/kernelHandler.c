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
	volatile TD * task = 0;
	if(!free_Pop(ks,&task)) return -1;
	*TID = task->TID;
	return 0;
}

void exitKernel(kernelHandler * ks){
	//clean up after kernel when exiting.
	disableInterrupts();
	stopTimer(TIMER1_BASE);
	stopTimer(TIMER4_BASE);
}
int initKernel(kernelHandler * ks, int priority, int code){
	//reset previous IRQ state, in case if last run state is bad
	disableInterrupts();
	//turn off fifos
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
	
	//avait event tasks
	ks->await_TIMER = -1;

	int memOffset = (int) &(ks->taskSpace[MAX_STACKSIZE-1]);
	memOffset = memOffset - (memOffset%16);
	ks->memOffset = memOffset;

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
	//stopTimer(TIMER4_BASE);
	stopTimer(TIMER4_BASE);
	//start timers now
/*
Timer clock speeds
508.4689 KHz
1.9939 KHz
983 KHz
*/
	startTimer(TIMER1_BASE, 508, 5084,PERIODIC);
	startTimer(TIMER4_BASE, 0,0,0); //TIMER 4 cares not for other arguments
	ks->idleTaskRunning = 0;
	ks->clockTaskRunning = 0;
	ks->clockNotifierTaskRunning= 0;
	ks->totalIdleRunningTime =0;
	

	//everthing good by this point


	return 0;
}


void kernelRun(int priority, int code) {

	kernelHandler ks;
	if(initKernel(&ks, priority, code)){
		//if we return non-zero initialization failed and we don't go further
		return;
	}
	
	request * r;
	
	message m;
	volatile TD * task =0;
	int old_idle;
	while(kernel_queuePop(&ks, &task)) {
		task->state = ACTIVE;
		ks.activeTask = task;
		TD *td = (TD *)task;
	 	if(ks.activeTask->priority ==31){
			 //makes assumption a 31 prioty task is an idle task
			ks.idleTaskRunning = 1;
		 	ks.lastIdleRunningTime = getTicks4(0);
			
		}


		r = activate(ks.activeTask);
		if(ks.idleTaskRunning ){
					ks.totalIdleRunningTime += getTicks4(0) -ks.lastIdleRunningTime;
					ks.idleTaskRunning = 0;
		}

		if(r == 0){
		//if interupt print diagnostic info.
		//print only if diagnostic info changes:
			int new_idle = 100 * ks.totalIdleRunningTime / getTicks4(0);
		 	if(old_idle - new_idle){
				old_idle = new_idle;
		 		bwprintf(COM2,"\033[s\033[?25l\033[1;90H idle:%d%% \033[u\033[?25h",old_idle);
			}
		}



/*************************************
end diagnostic code
*************************************/





		if(!processRequest(&ks, td, r, &m)){
			bwprintf(COM2,"PROCESS request failed!\n\r");
			 break;
		}
		if(task->state == ACTIVE)kernel_queuePush(&ks, task);




		//we are done with task so setting active task to null
		ks.activeTask = 0;
	}
	exitKernel(&ks);

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

int kernel_queuePush(kernelHandler * ks, volatile TD * task){
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
		task->prevTD = 0;
		task->state = READY;
	}else{
		volatile TD * prevHead = ks->priorityHead[priority];
		prevHead->nextTD = task;
		task->prevTD = prevHead;
		task->nextTD = 0;
		task->state = READY;
		ks->priorityHead[priority] = task;
	}
	return 1;
	
}

int free_Push(kernelHandler * ks, volatile TD * task){
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
		volatile TD * prevHead = ks->freeHead;
		prevHead->nextTD = task;
		task->prevTD = prevHead;
		task->nextTD = 0;
		task->state = FREE;
		ks->freeHead = task;
	}
	return 1;
	
}


int kernel_queuePop_priority(kernelHandler * ks, volatile TD ** task, volatile int priority){
	if (!ks->priorityTail[priority] ) return 0;
	
	volatile TD * poppedtask =  ks->priorityTail[priority];
	volatile TD * nextTail = poppedtask->nextTD;

	if(nextTail == 0){
		//set bit for this priority
		unsigned int mask = 1 <<priority;
		int  f=0;         // conditional flag
		ks->priotiyBitLookup ^= (-f ^ ks->priotiyBitLookup) & mask;
		//finish setting bit



		ks->priorityTail[priority] = 0;
		ks->priorityHead[priority] = 0;
	}
	else{
		nextTail->prevTD = 0;
		ks->priorityTail[priority] = nextTail;
	}

	poppedtask->nextTD = 0;
	poppedtask->prevTD = 0;
	*task = poppedtask;
	return 1;
}

int free_Pop(kernelHandler * ks, volatile TD ** task){
	if (!ks->freeTail ) return 0;
	
	volatile TD * poppedtask =  ks->freeTail;
	volatile TD * nextTail = poppedtask->nextTD;

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
int kernel_queuePop(kernelHandler * ks, volatile TD ** task){

	unsigned int v = ks->priotiyBitLookup;     // 32-bit word input to count zero bits on right
	unsigned int c;     // c will be the number of zero bits on the right,
			    // so if v is 1101000 (base 2), then c will be 3
	if(v == 0) return 0;//if bit string is zero then no flags are checked
	//bit hack to count trailing zeroes. # of trailing zeroes are the first free priority queue
	//33% faster than 3 * lg(N) + 4 for N bit words
	// NOTE: if 0 == v, then c = 31.dd
	if (v & 0x1) 
	{
	  // special case for odd v (assumed to happen half of the time)
	  c = 0;
	}
	else
	{
	  c = 1;
	  if ((v & 0xffff) == 0) 
	  {  
	    v >>= 16;  
	    c += 16;
	  }
	  if ((v & 0xff) == 0) 
	  {  
	    v >>= 8;  
	    c += 8;
	  }
	  if ((v & 0xf) == 0) 
	  {  
	    v >>= 4;
	    c += 4;
	  }
	  if ((v & 0x3) == 0) 
	  {  
	    v >>= 2;
	    c += 2;
	  }
	  c -= v & 0x1;
	}	

	//priority queue c
	kernel_queuePop_priority(ks,task,c);
	return 1;
}

