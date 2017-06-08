#include "ts7200.h"
#include "time.h"
#include "bwio.h"
#include "userRequestCall.h"
#include "kernelHandler.h"
#include "kernelMacros.h"
#include "server.h"
#include "dictionary.h"
#include "icu.h"

void userTask3() {
    bwprintf(COM2, "USER TASK 3 EXIT, REQUESTING TID.\r\n");
    int tid = MyTid();
    bwprintf(COM2, "USER TASK 3 GOT TID = %d.\r\n", tid);
    bwprintf(COM2, "USER TASK 3 EXIT, REQUESTING to get off the train.\r\n");
    Exit();
}

void userTask2() {

    bwprintf(COM2, "USER TASK 2 MIDDLE \r\n");
    bwprintf(COM2, "USER TASK 2 EXIT, REQUESTING TID.\r\n");
    int tid = MyTid();

    bwprintf(COM2, "USER TASK 2 GOT TID = %d.\r\n", tid);
    bwprintf(COM2, "USER TASK 2 EXIT, REQUESTING Parent TID.\r\n");
    int parentTid = MyParentTid();
    bwprintf(COM2, "USER TASK 2 GOT Parent TID = %d.\r\n", parentTid);
    bwprintf(COM2, "USER TASK 2 EXIT, REQUESTING to Pass the train.\r\n");
    Pass();
    bwprintf(COM2, "USER TASK has had a nap but is awake  \r\n" );
	int create =-1;
int j =0;
while(j < 2){
	j++;
    bwprintf(COM2, "USER TASK 2 EXIT, REQUESTING to birth a child.\r\n");
	create  = Create(3,(void *)userTask3 );
	if(create == -1){
    		bwprintf(COM2, "USER TASK 2' child never born. no father: %d.\r\n", create);
	}
	else if(create == -2){
    		bwprintf(COM2, "world is overpopulated. train gods refuse Task's 2 offer: %d.\r\n", create);
	}else if(create >= 0){
    		bwprintf(COM2, "USER TASK 2 gave birth to a bouncing baby task named: %d.\r\n", create);
	}else{
    		bwprintf(COM2, "USER TASK 2's fucked up when fucking: %d.\r\n", create);
	}
}
    bwprintf(COM2, "USER TASK 2 EXIT, REQUESTING to get off the train.\r\n");
    Exit();
    bwprintf(COM2, "USER TASK 2fucked up. Train don't stop here  \r\n" );
}


void userTask1() {

    bwprintf(COM2, "USER TASK 1 MIDDLE \r\n");
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING TID.\r\n");
    int tid = MyTid();

    bwprintf(COM2, "USER TASK 1 GOT TID = %d.\r\n", tid);
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING Parent TID.\r\n");
    int parentTid = MyParentTid();
    bwprintf(COM2, "USER TASK 1 GOT Parent TID = %d.\r\n", parentTid);
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING to Pass the train.\r\n");
    Pass();
    bwprintf(COM2, "USER TASK has had a nap but is awake  \r\n" );
	int create =-1;
int j =0;
while(j < 150){
	j++;
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING to birth a child.\r\n");
	create  = Create(j,(void *) userTask3 );
	if(create == -1){
    		bwprintf(COM2, "USER TASK 1' child never born. no father: %d.\r\n", create);
	}
	else if(create == -2){
    		bwprintf(COM2, "world is overpopulated. train gods refuse Task's 1offer: %d.\r\n", create);
	}else if(create >= 0){
    		bwprintf(COM2, "USER TASK 1gave birth to a bouncing baby task named: %d.\r\n", create);
	}else{
    		bwprintf(COM2, "USER TASK 1's fucked up when fucking: %d.\r\n", create);
	}
}
    bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING to get off the train.\r\n");
    Exit();
    bwprintf(COM2, "USER TASK 1fucked up. Train don't stop here  \r\n" );
}

void userTask61() {
    int Tid = MyTid();


    int _tid = 2;
    char * _msg = "Hi!";
    int _msglen = 4;
    char _reply[7];
    int _rplen = 7;
    bwprintf(COM2, "<%d>: Sending a message to %d: %s.\r\n", Tid, _tid, _msg);
    int ret = Send(_tid, _msg, _msglen, _reply, _rplen);
    if (ret == -3) {
        bwprintf(COM2, "<%d>: Send-recieve-reply transaction failed.\r\n", Tid);
    } else if (ret == -2) {
        bwprintf(COM2, "<%d>: Invalid Task %d.\r\n", Tid, _tid);
    } else {
        bwprintf(COM2, "<%d>: Got the following reply: %s[%d].\r\n", Tid, _reply, ret);
    }
    Exit();
}

void userTask62() {

    int Tid = MyTid();

    bwprintf(COM2, "<%d>: Requesting a message.\r\n", Tid);


    int _tid = 0;
    char _msg[5];
    int _msglen = 5;

    Receive(&_tid, _msg, _msglen);

    bwprintf(COM2, "<%d>: Got the following message from %d: %s.\r\n", Tid, _tid, _msg);



    char * _reply = "Bye!";
    int _rplen = 5;
    bwprintf(COM2, "<%d>: Replying the following: %s.\r\n", Tid, _reply);

    Reply( _tid, _reply, _rplen);


    bwprintf(COM2, "<%d>: Exitting now.\r\n", Tid);
    Exit();
}

void userTask60() {
    int myTid = MyTid();
    int Tid = 0;
    bwprintf(COM2, "<%d>: Creating 2 children. \r\n", myTid);
    Tid = Create(6, (void *) userTask61);
    bwprintf(COM2, "<%d>: Created %d. \r\n", myTid, Tid);
    Tid = Create(6, (void *) userTask62);
    bwprintf(COM2, "<%d>: Created %d. \r\n", myTid, Tid);
    Exit();
}



void userTaskClient(){

	
	int myTID = MyTid();
	int tid_search = 0;
	bwprintf(COM2, "<%d> got tid, now passing passing \n\r",myTID);
Pass();
	bwprintf(COM2, "<%d> finished passing Going to register name as TASK1 \n\r",myTID);
 	int err = RegisterAs("TASK1");
	bwprintf(COM2, "<%d> returned for register command. result:%d  \n\r",myTID,err);
	bwprintf(COM2, "<%d> searching for THE MAN \n\r",myTID);
	tid_search = WhoIs("THE MAN");
	bwprintf(COM2, "<%d>searched for THE MAN:%d \n\r",myTID, tid_search);

	bwprintf(COM2, "<%d> searching for TASK2 \n\r",myTID);
	tid_search = WhoIs("TASK2");
	bwprintf(COM2, "<%d>searched for TASK2:%d \n\r",myTID, tid_search);

/*
Pass();
 	tid_search = RegisterAs("JOHN");
Pass();

	tid_search = WhoIs("THE MAN");
	bwprintf(COM2, "<%d>searched for THE MAN:%d \n\r",myTID, tid_search);
	tid_search = WhoIs("THE MAN");
	bwprintf(COM2, "<%d>searched for THE MAN:%d \n\r", myTID,tid_search);*/
	bwprintf(COM2, "<%d> exiting  \n\r",myTID);
	Exit();}

void userTaskClient1(){

	int myTID = MyTid();
	int tid_search = 0;
	bwprintf(COM2, "<%d> got tid, now passing \n\r",myTID);
Pass();
	bwprintf(COM2, "<%d> finished passing Going to register name as TASK2 \n\r",myTID);
 	int err = RegisterAs("TASK2");
	bwprintf(COM2, "<%d> returned for register command. result: %d \n\r",myTID,err);
	bwprintf(COM2, "<%d> searching for THE MAN \n\r",myTID);
	tid_search = WhoIs("THE MAN");
	bwprintf(COM2, "<%d>searched for THE MAN:%d \n\r",myTID, tid_search);


	bwprintf(COM2, "<%d> searching for TASK3 \n\r",myTID);
	tid_search = WhoIs("TASK3");
	bwprintf(COM2, "<%d>searched for TASK3:%d \n\r",myTID, tid_search);
/*
 	int tid_search = RegisterAs("THE OTHER MAN");
Pass();
 	tid_search = RegisterAs("JOHN");
Pass();

	tid_search = WhoIs("THE MAN");
	bwprintf(COM2, "<%d>searched for THE MAN:%d \n\r",myTID, tid_search);
	tid_search = WhoIs("THE MAN");
	bwprintf(COM2, "<%d>searched for THE MAN:%d \n\r", myTID,tid_search);*/
	bwprintf(COM2, "<%d> exiting  \n\r",myTID);
	Exit();
}

void userTaskClient2(){

	int myTID = MyTid();
	int tid_search = 0;
	bwprintf(COM2, "<%d> got tid, now passing \n\r",myTID);
Pass();
	bwprintf(COM2, "<%d> finished passing Going to register name as TASK3 \n\r",myTID);
 	int err = RegisterAs("TASK3");
	bwprintf(COM2, "<%d> returned for register command. result: %d \n\r",myTID,err);
	bwprintf(COM2, "<%d> searching for THE MAN \n\r",myTID);
	tid_search = WhoIs("THE MAN");
	bwprintf(COM2, "<%d>searched for THE MAN:%d \n\r",myTID, tid_search);

	bwprintf(COM2, "<%d> searching for TASK1 \n\r",myTID);
	tid_search = WhoIs("TASK1");
	bwprintf(COM2, "<%d>searched for TASK1:%d \n\r",myTID, tid_search);

	bwprintf(COM2, "<%d> exiting  \n\r",myTID);
	Exit();
}


void userTask01(){
	int myTid = MyTid();
	int childTID =-1;
	childTID = CreateNameServer(1,(void *) NameServerTask);
	bwprintf(COM2, "<%d>: Creating name server 1:%d. \r\n", myTid,childTID);

	childTID =-1;
	childTID = Create(2,(void *) userTaskClient);
	bwprintf(COM2, "<%d>: Creating child process that will request name server <%d>. \r\n", myTid,childTID);
	childTID =-1;
	childTID = Create(2,(void *) userTaskClient1);
	bwprintf(COM2, "<%d>: Creating child process that will request name server <%d>. \r\n", myTid,childTID);
	childTID =-1;
	childTID = Create(2,(void *) userTaskClient2);
	bwprintf(COM2, "<%d>: Creating child process that will request name server <%d>. \r\n", myTid,childTID);


	Exit();
}

void userTask11(void) {    
     int tid = MyTid();     
     bwprintf(COM2, "USER TASK 1 GOT TID = %d.\r\n", tid);     


    dictionary d;
    initDictionary(&d);
	int TID = -1;
     bwprintf(COM2, "Seaching empty dictionary for [BOOK]  %d.\r\n", searchDictionary(&d, "BOOK", &TID));     
     bwprintf(COM2, "Search results %d.\r\n", TID);     
     bwprintf(COM2, "USER TASK 1 GOT TID = %d.\r\n", tid);     
     bwprintf(COM2, "ADDING  [BOOK] for tid 1 %d.\r\n", addDictionary(&d, "BOOK",1));     
     bwprintf(COM2, "ADDING  [BOOK1] for tid 1 %d.\r\n",addDictionary(&d, "BOOK1",1));     
     bwprintf(COM2, "ADDING  [BOOKW] for tid 1 %d.\r\n", addDictionary(&d, "BOOKW",1));     
     bwprintf(COM2, "ADDING  [BOOK2] for tid 2 %d.\r\n", addDictionary(&d, "BOOK2",2));     
	TID = -1;
     bwprintf(COM2, "Seaching empty dictionary for [BOOK]  %d.\r\n", searchDictionary(&d, "BOOK", &TID));     
     bwprintf(COM2, "Search results %d.\r\n", TID);     
	TID = -1;
     bwprintf(COM2, "Seaching dictionary for [BOOK1]  %d.\r\n", searchDictionary(&d, "BOOK1", &TID));     
     bwprintf(COM2, "Search results %d.\r\n", TID);     
	 TID = -1;
     bwprintf(COM2, "Seaching dictionary for [BOOKW]  %d.\r\n", searchDictionary(&d, "BOOKW", &TID));     
     bwprintf(COM2, "Search results %d.\r\n", TID);     
	 TID = -1;
     bwprintf(COM2, "Seaching dictionary for [BOOK2]  %d.\r\n", searchDictionary(&d, "BOOK2", &TID));     
     bwprintf(COM2, "Search results %d.\r\n", TID);     

     bwprintf(COM2, "ADDING  [BOOKW] for tid 2 %d.\r\n", addDictionary(&d, "BOOKW",2));     
	 TID = -1;
     bwprintf(COM2, "Seaching dictionary for [BOOK2]  %d.\r\n", searchDictionary(&d, "BOOK2", &TID));     
     bwprintf(COM2, "Search results %d.\r\n", TID);     

	char c = 'C';
     bwprintf(COM2, "testing errors in C %d.\r\n", c);     
	c = 3;
     bwprintf(COM2, "testing errors in C %d.\r\n", c);     
	c = -10;
     bwprintf(COM2, "testing errors in C %d.\r\n", c);     
     Exit();
}


// MAKE SURE TO PLACE SENDTIMER IN RECEIVE TASK WHEN YOU TEST RSR.
void testTaskSend64() {
    char _msg[64];
    Send(1, "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", 64, _msg, 64);
    Exit();
}

void testTaskReceive64() {
    int _tid = 0;
    char _msg[64];
    if (Receive(&_tid, _msg, 64) >= 0) {
        Reply(_tid, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 64);
    }
    Exit();
}

void testTaskGod64() {
    Create(6, (void*) testTaskSend64);
    Create(6, (void*) testTaskReceive64);
    Exit( );
}


void testTaskSend4() {
    char _msg[4];
    Send(2, "bbb", 4, _msg, 4);
    Exit();


}

void testTaskReceive4() {
    int _tid = 0;
    char _msg[4];
    Receive(&_tid, _msg, 4);
    Reply(_tid, "aaa", 4);
    Exit();
}

void testTaskGod4() {
    Create(6, (void*) testTaskSend4);
    Create(6, (void*) testTaskReceive4);
    Exit( );
}

void userinfinitiPass(){
	//bwprintf(COM2, "\033[2J\033[H infini task running \r\n");
	int i=0;
	//while(1){
	for(i=0; i<10000; i++){
		bwprintf(COM2, "%d\r\n" ,i);
	}
	Exit();
}


void taskTestInt(){
	//bwprintf(COM2, "\033[2J\033[H  \r\n");
	bwprintf(COM2,"creating infiniPass \n\r");
    Create(31, (void*) userinfinitiPass);
	volatile int c;
	asm volatile(
	"mrs %[c], cpsr"
	:[c] "=r" (c));
	bwprintf(COM2,"CPSR :%x\n\r",c);
	int a = 100;
	bwprintf(COM2,"a :%d\n\r",a);
	MyParentTid(); //sabotaging code to add interupt to check if things worked.
	bwprintf(COM2,"a :%d\n\r",a);
	int i = 0;
	for(i=0; i < 2; i++){
		bwprintf(COM2,"taskTest try:%d\n\r",i);
		int j = AwaitEvent(TIMER_TICK);
		bwprintf(COM2,"returned from await:%d\n\r",j);
	}
	Exit();
}


void taskTestInt2(){

    toggleTimer1Interrupt(1);

    startTimer(TIMER1_BASE, 508, 508,PERIODIC);

    volatile int i = 0;
    for(i=0; i < 10000; i++);

    Exit();
}


// void testTaskReceive() {

//     int iosTID = WhoIs("ioServer");

//     Exit( );

// }
void testTaskIO1() {
    Create(3, (void *) FirstUserTask);



    int iosTID = WhoIs("ioServer");
    int csTID = WhoIs("clockServer");
     
    // testing UART1
    Putc(iosTID, COM1 , 0x61);
    Delay(csTID, 100);
    Putc(iosTID, COM1 , 0x60);
    Delay(csTID, 100);
    Putc(iosTID, COM1 , 0x61);
    Delay(csTID, 100);
    Putc(iosTID, COM1 , 0x60);
    Delay(csTID, 100);
    Putc(iosTID, COM1 , 0x61);
    Delay(csTID, 100);
    Putc(iosTID, COM1 , 0x60);

    Printf(iosTID, COM2, "\033[2J");

    // putc test.
    Putc(iosTID, COM2, 'h');
    Putc(iosTID, COM2, 'e');
    Putc(iosTID, COM2, 'l');
    Putc(iosTID, COM2, 'l');
    Putc(iosTID, COM2, 'o');
    Putc(iosTID, COM2, 'w');
    Putc(iosTID, COM2, 'o');
    Putc(iosTID, COM2, 'r');
    Putc(iosTID, COM2, 'l');
    Putc(iosTID, COM2, 'd');
    Putc(iosTID, COM2, '\r');
    Putc(iosTID, COM2, '\n');

    // printf test.
    Printf(iosTID, COM2, "Printing a long message:\r\n\r\n");

    // stress test.
    Printf(iosTID, COM2, "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\n\r\n");
    
    // getc test.
    Printf(iosTID, COM2, "Type something here --> ");
      while(1) {
            Putc(iosTID, COM2, Getc(iosTID, COM2));
        }

    Exit();


}


int main(void) {
    // turning on data and instruction cache.

     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<12 \n"
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");
    kernelRun(4,(int) testTaskIO1);
	return 0;
}
