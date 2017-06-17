#include "ts7200.h"
#include "time.h"
#include "bwio.h"
#include "userRequestCall.h"
#include "kernelHandler.h"
#include "kernelMacros.h"
#include "server.h"
#include "dictionary.h"
#include "icu.h"
#include "ui.h"
#include "pkstring.h"

void displayTrack() {

}

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


//     Exit( );

// }
void testTaskIO1() {
    Create(1, (void *) FirstUserTask);



    int iosTID = WhoIs("ioServer");
    //int csTID = WhoIs("clockServer");
     
    Printf(iosTID, COM2, "The trains controller switch should turn on and off 3 times now..\r\n");

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

void kernelTest() {
        //server priorities
    //1 : name server,clock notifier,uart notifiers
    //2 : clockserver, ioserver
    //3 : display gird, clock display
    //4 : command line
    //5 : command display sensors
    //31: idle task

    Create(1, (void *) FirstUserTask);
    Create(3, (void *) displayGrid);

    Create(3, (void *) trainServer);
    Create(3, (void *) displayClock);
    Create(4, (void *) displaySensors); //this will fail if the computer has no train track
    Exit();
}


void testTaskPass3(){
    unsigned int initTick;
    unsigned int endTick;
    int i;
    int j;
    int total=0;

    stopTimer(TIMER4_BASE);
    startTimer(TIMER4_BASE, 0,0,0);
    for(i=0;i<10000;i++){
    initTick = getTicks4us(0);
	Pass();
	Pass();
	Pass();
    endTick = getTicks4us(0);
	total += endTick - initTick;
    //bwprintf(COM2, "Ticks taken to complete 3 passes: %d\r\n", endTick - initTick);
	//Pass();
    }
    bwprintf(COM2, "Avg Time: %d \r\n",(int)( total));
    Exit();

}

// MAKE SURE TO PLACE SENDTIMER IN RECEIVE TASK WHEN YOU TEST RSR.
void testTaskSend64() {
    char _msg[64];
    unsigned int initTick;
    unsigned int endTick;
    int i;
    int total=0;
    Pass();


    stopTimer(TIMER4_BASE);
    startTimer(TIMER4_BASE, 0,0,0);
    for(i=0;i<10000;i++){
    initTick = getTicks4us(0);
    bwassert(Send(2, "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", 64, _msg, 64)>= 0, COM2, "TEST FAILED!\r\n");
    endTick = getTicks4us(0);
	total += endTick - initTick;
    //bwprintf(COM2, "Ticks taken to complete: %d\r\n", endTick - initTick);
	//Pass();
    }
    bwprintf(COM2, "Avg Time: %d \r\n",(int)( total));
    Exit();
}

void testTaskReceive64() {
    int _tid = 0;
    char _msg[64];
	int i=0;
	Pass();
	for(i=0;i<10000;i++){
    if (Receive(&_tid, _msg, 64) >= 0) {
        Reply(_tid, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 64);
	//Pass();
    }
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
    unsigned int initTick;
    unsigned int endTick;
    int i;
    int total=0;
    Pass();


    //stopTimer(TIMER4_BASE);
    //startTimer(TIMER4_BASE, 0,0,0);
    for(i=0;i<10000;i++){
    initTick = getTicks4us(0);
    bwassert(Send(2, "bbb", 4, _msg, 4) >= 0, COM2, "TEST FAILED!\r\n");
    endTick = getTicks4us(0);
	total += endTick - initTick;
    //bwprintf(COM2, "Ticks taken to complete: %d \r\n", endTick - initTick);
    }
    bwprintf(COM2, "Avg Time: %d \r\n",(int)( total));
    Exit();


}

void testTaskReceive4() {
    int _tid = 0;
    char _msg[4];
	int i=0;
    Pass(); 
    for(i=0;i<10000;i++){
    if (Receive(&_tid, _msg, 4) >= 0) {
        Reply(_tid, "aaa", 4);
    }
    }


    Exit();
}

void testTaskGod4() {
    Create(6, (void*) testTaskSend4);
    Create(6, (void*) testTaskReceive4);

   Exit( );
}

void testTaskRSRend64() {
    char _msg[64];
    unsigned int initTick;
    unsigned int endTick;
    int i;
    int total=0;
    Pass();


    stopTimer(TIMER4_BASE);
    startTimer(TIMER4_BASE, 0,0,0);
    for(i=0;i<10000;i++){
    initTick = getTicks4us(0);
    bwassert(Send(1, "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", 64, _msg, 64)>= 0, COM2, "TEST FAILED!\r\n");
    endTick = getTicks4us(0);
	total += endTick - initTick;
    //bwprintf(COM2, "Ticks taken to complete: %d\r\n", endTick - initTick);
	//Pass();
    }
    bwprintf(COM2, "Avg Time: %d \r\n",(int)( total));
    Exit();
}

void testTaskRSReceive64() {
    int _tid = 0;
    char _msg[64];
	int i=0;
	Pass();
	for(i=0;i<10000;i++){
    if (Receive(&_tid, _msg, 64) >= 0) {
        Reply(_tid, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 64);
	//Pass();
    }
	}
    Exit();
}

void testTaskGodRSR64() {
    Create(6, (void*) testTaskRSReceive64);
    Create(6, (void*) testTaskRSRend64);
    Exit( );
}



void testTaskRSRend4() {
    char _msg[4];
    unsigned int initTick;
    unsigned int endTick;
    int i;
    int total=0;
    Pass();


    //stopTimer(TIMER4_BASE);
    //startTimer(TIMER4_BASE, 0,0,0);
    for(i=0;i<10000;i++){
    initTick = getTicks4us(0);
    bwassert(Send(1, "bbb", 4, _msg, 4) >= 0, COM2, "TEST FAILED!\r\n");
    endTick = getTicks4us(0);
	total += endTick - initTick;
    //bwprintf(COM2, "Ticks taken to complete: %d \r\n", endTick - initTick);
    }
    bwprintf(COM2, "Avg Time: %d \r\n",(int)( total));
    Exit();


}

void testTaskRSReceive4() {
    int _tid = 0;
    char _msg[4];
	int i=0;
    Pass(); 
    for(i=0;i<10000;i++){
    if (Receive(&_tid, _msg, 4) >= 0) {
        Reply(_tid, "aaa", 4);
    }
    }


    Exit();
}

void testTaskGodRSR4() {
    Create(6, (void*) testTaskRSReceive4);
    Create(6, (void*) testTaskRSRend4);

   Exit( );
}


void TESTold(char * a1, char * b1){
	bwprintf(COM2,"stringa:[%s]\n\r",a1);
	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy2(b1,a1,0);
	bwprintf(COM2,"stringa:[%s]\n\r",a1);
	bwprintf(COM2,"stringb:[%s]\n\r",b1);
    	int startTick = getTicks4us(0);
	pkmemcpy2(b1,a1,1);
    	int endTick = getTicks4us(0);
	bwprintf(COM2,"stringb:1 bytes:[%d]\n\r",endTick-startTick);
	bwprintf(COM2,"stringa:[%s]\n\r",a1);
	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy2(b1,a1,12);
	bwprintf(COM2,"stringa:[%s]\n\r",a1);
	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy2(b1,a1,24);
	bwprintf(COM2,"stringa:[%s]\n\r",a1);
	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy2(b1,a1,50);
	bwprintf(COM2,"stringa:[%s]\n\r",a1);
	bwprintf(COM2,"stringb:[%s]\n\r",b1);
    	startTick = getTicks4us(0);
	pkmemcpy2(b1,a1,63);
    	endTick = getTicks4us(0);
	bwprintf(COM2,"stringa:[%s]\n\r",a1);
	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	bwprintf(COM2,"stringb:64 bytes[%d]\n\r",endTick-startTick);

}
void TESTnew(char * a1, char * b1){
//	bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy(b1,a1,0);
//	bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
    	int startTick = getTicks4us(0);
	pkmemcpy(b1,a1,1);
    	int endTick = getTicks4us(0);
	bwprintf(COM2,"stringb:1 bytes:[%d]\n\r",endTick-startTick);
//	bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy(b1,a1,3);
//	bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy(b1,a1,4);
//	bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy(b1,a1,12);
//	bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy(b1,a1,24);
//	bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	pkmemcpy(b1,a1,50);
//	bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
    	startTick = getTicks4us(0);
	pkmemcpy(b1,a1,63);
    	endTick = getTicks4us(0);
	//bwprintf(COM2,"stringa:[%s]\n\r",a1);
//	bwprintf(COM2,"stringb:[%s]\n\r",b1);
	bwprintf(COM2,"stringb:64 bytes[%d]\n\r",endTick-startTick);
}

void testMemCpy(){
	char * a = "123456789012345678901234567890123456789012345678901234567890ABCD";

	char C1[76];
	int i =0;
	for(i = 0; i< 75; i++){
		C1[i] = ' ';
	}
		C1[75] = 0;
	
	
	char * c1  = &C1[1];
	char * c0  = &C1[0];
    	startTimer(TIMER4_BASE, 0,0,0);  
	bwprintf(COM2,"stringa:[%d]\n\r",c0);
	bwprintf(COM2,"stringa:[%d]\n\r",c1);
	TESTnew(a+1,c0+0);
	bwprintf(COM2,"stringa:[%s]\n\r",c0);
	for(i = 0; i< 75; i++){
		C1[i] = ' ';
	}
		C1[75] = 0;
	
	TESTnew(a+1,c0+1);
	bwprintf(COM2,"stringa:[%s]\n\r",c0);
	for(i = 0; i< 75; i++){
		C1[i] = ' ';
	}
		C1[75] = 0;
	
	TESTnew(a+1,c0+2);
	bwprintf(COM2,"stringa:[%s]\n\r",c0);
	for(i = 0; i< 75; i++){
		C1[i] = ' ';
	}
		C1[75] = 0;
	
	TESTnew(a+1,c0+3);

	bwprintf(COM2,"stringa:[%s]\n\r",c0);
	//bwprintf(COM2,"stringa:[%s]\n\r",a+1);
	//bwprintf(COM2,"stringa:[%s]\n\r",C1);
	//bwprintf(COM2,"stringa:[%s]\n\r",C2);

//	TESTnew(a,&C2[0]);
//	bwprintf(COM2,"stringa:[%s]\n\r",C1);
//	bwprintf(COM2,"stringa:[%s]\n\r",C2);
	//bwprintf(COM2,"stringa:[%s]\n\r",b1);
	//bwprintf(COM2,"stringa:[%s]\n\r",C2);
	//pkmemcpy(b2,a1,62);
	//bwprintf(COM2,"stringa:[%d]\n\r",&b1);
	//bwprintf(COM2,"stringa:[%d]\n\r",&b2);
	//TESTold(a1,b1);
}

int main(void) {
    // turning on data and instruction cache.
     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<12 \n"
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");
    //kernelRun(2,(int) FirstUserTask);
if(1){ //run pass3 test
	    bwprintf(COM2,"PASS 3\n\r");
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
    kernelRun(2,(int) testTaskPass3);
}
else{
	if(1){ //run rsr
		if(0){
		    bwprintf(COM2,"RSR God4\n\r");
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		    kernelRun(2,(int) testTaskGodRSR4);
		}
		else{
		    bwprintf(COM2,"RSR God64\n\r");
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		    kernelRun(2,(int) testTaskGodRSR64);
		}
	}else{ //run srr

	    if(0){//run 4 byte
		bwprintf(COM2,"SRR God4\n\r");
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
	    kernelRun(2,(int) testTaskGod4);
		}
		else{
		//run 64 byte
		bwprintf(COM2,"SRR God64\n\r");

	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
	    kernelRun(2,(int) testTaskGod64);
		}
		//testMemCpy();
		return 0;
	}
}


}



