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
#include "trackGraph.h"
#include "pkstring.h"
#include "controller.h"



int markedOutSensor(int sensor) {
    return 0;
}

void testTrackPathRevAndEX(){
	TrackGraph t;
	TrackGraphInitA(&t);
	int pathLength=0;
	int path[150];
	exclusionEdge exclusionList[10];
	
	int exclusionCount = 0;
	exclusionList[0].currentNode = sensor2i("E07");
	exclusionList[0].nextNode = sensor2i("D07");

	exclusionList[1].currentNode = sensor2i("E11");
	exclusionList[1].nextNode = sensor2i("D10");

	exclusionList[2].currentNode = sensor2i("A04");
	exclusionList[2].nextNode = sensor2i("B16");
    
	exclusionList[3].currentNode = sensor2i("E16");
	exclusionList[3].nextNode = sensor2i("E01");
 
	bwprintf(1,"has path[%s] to [%s]: %d\n\r","C13", "D07", getShortestPathPlus(&t, sensor2i("C13"), sensor2i("D07"), path, &pathLength,exclusionList,exclusionCount));
	Exit();

}


void drawTrack(int iosTID) {

      Printf(iosTID, COM2, "\033[10;45H       +___ O______O_+_______________+_______+\n");
      Printf(iosTID, COM2, "\033[11;45H           /      /                           \\\n");
      Printf(iosTID, COM2, "\033[12;45H     +___ O      O___+_____O_+___+_O___+___+___O\n");
      Printf(iosTID, COM2, "\033[13;45H         /      /           +     +            |\n");
      Printf(iosTID, COM2, "\033[14;45H        +      +             + | +             |\n");
      Printf(iosTID, COM2, "\033[15;45H        |      |              O|O              | \n");
      Printf(iosTID, COM2, "\033[16;45H        |      |               |               | \n");
      Printf(iosTID, COM2, "\033[17;45H        |      |              O|O              | \n");
      Printf(iosTID, COM2, "\033[18;45H        +      +             + | +             |\n");
      Printf(iosTID, COM2, "\033[19;45H         \\      \\           +     +            |\n");
      Printf(iosTID, COM2, "\033[20;45H +___+___ O      O___+_____O_+___+_O___+___+___O\n");
      Printf(iosTID, COM2, "\033[21;45H           \\      \\                           /\n");
      Printf(iosTID, COM2, "\033[22;45H    +___+___O      +___O_____+___+_____O_____+\n");
      Printf(iosTID, COM2, "\033[23;45H             \\          \\             /\n");
      Printf(iosTID, COM2, "\033[24;45H      +___+___O______+___O___________O___+         \n");
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
    //Create(4, (void *) displaySensors); //this will fail if the computer has no train track
    Exit();
}


void testTaskPass3(){
    unsigned int initTick;
    unsigned int endTick;
    int i;
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
    bwprintf(COM2, "Avg Time1: %10d \r\n",(int)( total));
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
/*

void testClockStorage(){
	StorageNode s;
	TimeStorage t;
	initStorage(&t);
    	unsigned int initTick;
    	unsigned int endTick;
    	int i;
    	int total=0;
    	bwprintf(COM2, "Old Storage algos\r\n");
	
    	//stopTimer(TIMER4_BASE);
    	//startTimer(TIMER4_BASE, 0,0,0);
    	for(i=0;i<125;i++){
    		initTick = getTicks4us(0);
		s.tid = i; 
		s.delayTime = getTicks4us(0) % 37; // get number based on delay time
		bwassert(insertIntoStorage(&t, &s), COM2, "<ClockServer>: DelayUntil storage error. Could not put TD<%d> into storage.\r\n", s.tid);
    		endTick = getTicks4us(0);
		total += endTick - initTick;
    	}
    	bwprintf(COM2, "Time: Insert %d \r\n",(int)( total));
int total2 = total;	
	total = 0;
    	for(i=0;i<125;i++){
    		initTick = getTicks4us(0);
			if (!deleteFromStorage(&t, &s)) break;
    		endTick = getTicks4us(0);
		total += endTick - initTick;
    	}

    	bwprintf(COM2, "Time: Delete %d \r\n",(int)( total));
    	bwprintf(COM2, "Total Time to fill and unfill %d \r\n",(int)( total+total2));
    	Exit();

}
*/
void testClockStorage2(){
	StorageNode s;
	TimeStorage t;
	initStorage(&t);
    	unsigned int initTick;
    	unsigned int endTick;
    	int i;
    	int total=0;
	
    	bwprintf(COM2, "New Storage algos\r\n");
    	//stopTimer(TIMER4_BASE);
    	//startTimer(TIMER4_BASE, 0,0,0);
    	for(i=0;i<125;i++){
    		initTick = getTicks4us(0);
		s.tid = i; 
		s.delayTime = getTicks4us(0) % 37; // get number based on delay time
		bwassert(minHeapInsert(&t, &s), COM2, "<ClockServer>: DelayUntil storage error. Could not put TD<%d> into storage.\r\n", s.tid);
    		endTick = getTicks4us(0);
		total += endTick - initTick;
    	}

    	bwprintf(COM2, "Time: Insert %d \r\n",(int)( total));
int total2 = total;	
	total = 0;
    	for(i=0;i<125;i++){
    		initTick = getTicks4us(0);
			int peak;
			if(!minHeapPeak(&t,&peak)){  
				endTick = getTicks4us(0);
				total += endTick - initTick;
				break;}
			if (peak >= 25){ 
				endTick = getTicks4us(0);
				total += endTick - initTick;
				break;}
			if (!minHeapDelete(&t, &s)){ 
    			bwprintf(COM2, "heap empty\r\n"); break;}

    		endTick = getTicks4us(0);
		total += endTick - initTick;
    	}

    	bwprintf(COM2, "Time: Delete %d \r\n",(int)( total));
    	bwprintf(COM2, "Total Time to fill and unfill %d \r\n",(int)( total+total2));
    	Exit();

}

void U2Test(){
	//lightwave U2 io server for debug purposes
	
    int _tid = -1;
    char msg[66];
    int msgCap = 66;
    //char reply[6];

    // extra variables used.

					int count =0;
					char * str = 0;
	while(1) {
		bwassert(Receive(&_tid, msg, msgCap) >= 0, COM2, "<UART1SendServer>: Receive error.\r\n");
		switch((int) msg[0]) {
			    case 'Q': // Angel of Death
					bwprintf( COM2, "<Uart1SendServer>: Quiting.\r\n");
					Reply(_tid, "1", 2);
					Exit();
			    case 21: // UART1 Putc
				//if dead rplyblck
					count =0;
					str = &msg[1];
					while(*str){ 
						count ++;
						str++;
					}
					bwprintf(COM2, "count = %d\n\r", count);
					bwprintf(COM2, "[%s] \n\r",&msg[1]);
					Reply(_tid, "1", 2);
				break;
			    default:
				bwassert(0, COM2, "<Uart1SendServer>: Illegal request code from userTask <%d>.\r\n", _tid);
				break;
		}
     	}
}



void testPrintf(){
	int uprint = CreateIOServer(1, (void *) U2Test, UART2S);
	bwassert(uprint >=0, COM2, "Failed Create UART2TS Server.\n\r");
	Putc(uprint, COM2, 'C');
	Putstr(uprint, COM2, "C");
	Putstr(uprint, COM2, "CAMERA");
	Putstr(uprint, COM2, "CAMERA");
	Putstr(uprint, COM2, "123456789012345678901234567890123456789012345678901234567890"); //60
	Putstr(uprint, COM2, "1234567890123456789012345678901234567890123456789012345678901"); //61
	Putstr(uprint, COM2, "12345678901234567890123456789012345678901234567890123456789012"); //62
	Putstr(uprint, COM2, "123456789012345678901234567890123456789012345678901234567890123"); //63
	Putstr(uprint, COM2, "1234567890123456789012345678901234567890123456789012345678901234"); //64


	Putstr(uprint, COM2, "Under = 64");
	Putstr(uprint, COM2, "12345678901234567890123456789012345678901234567890123456789012345"); //65
	Putstr(uprint, COM2, "1234567890123456789012345678901234567890123456789012345678901234A234567890123456789012345678901234567890123456789012345678901234ABCDE"); //69
bwprintf(COM2,"Testing Putx\n\r");
bwprintf(COM2,"Testing Putx A\n\r");
	Putx(uprint,COM2,'A');
bwprintf(COM2,"Testing Putx B\n\r");
	Putx(uprint,COM2,'B');
bwprintf(COM2,"Testing Putr\n\r");
unsigned int tmp= 1;
	Putr(uprint,COM2,tmp);
tmp= 1;
	Putr(uprint,COM2,tmp);
 tmp= 2;
	Putr(uprint,COM2,tmp);

bwprintf(COM2,"putw\n\r");
	Putw(uprint,COM2,10,'W',"tmp");

bwprintf(COM2,"test printf numbers[%8x]TEST\n\r",10);
Printf(uprint,COM2,"test");
Printf(uprint,COM2,"test%c",'A');
Printf(uprint,COM2,"test%c%%",'A');
Printf(uprint,COM2,"test [%7s] !","string");
Printf(uprint,COM2,"test [%7s] %x  !","string",10);
Printf(uprint,COM2,"test [%7s] %x %d %d %u!","string",16,16,-16,-16);
Printf(uprint,COM2,"**********************************");



    Printf(uprint, COM2, "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\n\r\n");




Printf(uprint,COM2,"**********************************");
bwprintf(COM2,"Quiting\n\r");
	//quit
    	char msg[2];
    	int msgCap = 2;
	Send(uprint,"Q",2,&msg[2],msgCap);
	Exit();
}

void sensTest(){
	CreateNameServer(1, (void *) NameServerTask);
	CreateClockServer(2, (void *) clockServer);
	Create(31, (void *) idleTask);



	 CreateIOServer(2, (void *) UART1_ReceiveServer, UART1R);
	 CreateIOServer(2, (void *) UART1_SendServer, UART1S);



	Create(3, (void *) commandServer);
	int j;
	int startTime =0;
	int total =0;
	char recentSensors[64];
	for(j=0;j<100;j++){
		startTime = getTicks4us(0);
/*
		Putc(ios,COM1,0x85);
		bwprintf(COM2, "putc \n\r");
		Getc(ior,COM1);
		Getc(ior,COM1);
		bwprintf(COM2, "2 gets!!!!! \n\r");
		//getSensorData(recentSensors);
		Getc(ior,COM1);
		Getc(ior,COM1);
		bwprintf(COM2, "2 gets!!!!! \n\r");
		//getSensorData(recentSensors);
		Getc(ior,COM1);
		Getc(ior,COM1);
		bwprintf(COM2, "2 gets!!!!! \n\r");
		//getSensorData(recentSensors);
		Getc(ior,COM1);
		Getc(ior,COM1);
		bwprintf(COM2, "2 gets!!!!! \n\r");
		Getc(ior,COM1);
		Getc(ior,COM1);
		bwprintf(COM2, "2 gets!!!!! \n\r");
*/
		//getSensorData(recentSensors);
		total += getTicks4us(startTime);
		//getSensorData(recentSensors);
		bwprintf(COM2, "poll: %d\n\r",j);
	}
		bwprintf(COM2, "average time: %d\n\r",total/100);

Quit();
}


void graphTestTask() {

    TrackGraph t;
    TrackGraphNode * node = t.node;
    int path[100];
    int distanceList[100];
    int infoLength = 0;
    volatile int i = 0;
    volatile int j = 0;
    int pathLength;
    TrackGraphInit(&t);
    if (!getShortestPath(&t, sensor2i("E13"), sensor2i("C11"), path, &pathLength)) {
        bwprintf(COM2, "DEAD END.\r\n");
        Exit();
    }

    
    // bwprintf(COM2, "edge nuumber A3 C13:%d \n\r ",findNextSensor(&t, sensor2i("E07")));
    // bwprintf(COM2, "edge nuumber A3 C13:%d \n\r ",getEdgeDistance((&t.vm), sensor2i("E07"), sensor2i("D07")));
    // bwprintf(COM2, "edge nuumber C13 E07:%d \n\r ",getEdgeDistance((&t.vm), sensor2i("C13"), sensor2i("E07")));
    // bwprintf(COM2, "edge nuumber A3 E07:%d \n\r ",getEdgeDistance((&t.vm), sensor2i("C13"), sensor2i("D07")));
    bwprintf(COM2, "Ans: ");
    for (i = pathLength - 1; i >= 0; i--) {
        bwprintf(COM2, " %d ", path[i]);
    }


    getEdgeInfo(&t, path, pathLength, distanceList, &infoLength);


    bwprintf(COM2, "\r\nDistance[length=%d]: ", infoLength);
    for ( i = 0; i < infoLength; i++) {
        bwprintf(COM2, " %d ", distanceList[i]);
    }

    int dist = 0;
    for ( i = 0; i < infoLength; i++) {
        dist += distanceList[i];
    }

    bwprintf(COM2, "\r\nTotal distance = %d\r\n", dist);

    bwprintf(COM2, "\r\nBeginning next sensor test.\r\n");

    int nextSensor = 0;
    int nextSensorDist = 0;

    nextSensor = findNextSensor(&t, sensor2i("A02"), &nextSensorDist);
    bwprintf(COM2, "Next sensor from E06 is %c%d%d[distance=%d]\r\n", ((nextSensor-1)/16)+'A',((nextSensor-1)%16+1)/10, ((nextSensor-1)%16+1)%10, nextSensorDist);

    nextSensor = findNextSensor(&t, switch2i(10), &nextSensorDist);
    bwprintf(COM2, "Next sensor from sw10 is %c%d%d[distance=%d]\r\n", ((nextSensor-1)/16)+'A',((nextSensor-1)%16+1)/10, ((nextSensor-1)%16+1)%10, nextSensorDist);
    nextSensor = findAltSensor(&t, switch2i(10), &nextSensorDist);
    bwprintf(COM2, "Alt sensor from sw10 is %c%d%d[distance=%d]\r\n", ((nextSensor-1)/16)+'A',((nextSensor-1)%16+1)/10, ((nextSensor-1)%16+1)%10, nextSensorDist);
    
    Exit(); 
    bwprintf(COM2, "Commencing Djikstra's algorithm.\r\n");

    for (i = 1; i <= 100; i++) {
        for (j = 1; j <= 100; j++) {
            bwprintf(COM2, "Finding path between %d and %d: ", i, j); //((i-1)/16)+'A',((i-1)%16+1)/10, ((i-1)%16+1)%10, ((j-1)/16)+'A',((j-1)%16+1)/10, ((j-1)%16+1)%10);
            if (!getShortestPathDjikstra(&t, i, j, path, &pathLength)) {
                bwprintf(COM2, "NOT FOUND.\r\n");
            } else {
                bwprintf(COM2, "FOUND.\r\n");

            }
        }
        if (!(i%16)) bwgetc(COM2);

    }

    Exit();

    if (!getShortestPathDjikstra(&t, sensor2i("A05"), sensor2i("A01"), path, &pathLength)) {
        bwprintf(COM2, "DEAD END.\r\n");
        Exit();
    }
    bwprintf(COM2, "Ans: ");
    for (i = pathLength - 1; i >= 0; i--) {
        bwprintf(COM2, " %d ", path[i]);
    }

    getEdgeInfo(&t, path, pathLength, distanceList, &infoLength);

    bwprintf(COM2, "\r\nDistance[length=%d]: ", infoLength);
    for ( i = 0; i < infoLength; i++) {
        bwprintf(COM2, " %d ", distanceList[i]);
    }

    dist = 0;
    for ( i = 0; i < infoLength; i++) {
        dist += distanceList[i];
    }

    bwprintf(COM2, "\r\nTotal distance = %d\r\n", dist);

    Exit();

}


void graphTestTask2() {

    TrackGraph t;
    TrackGraphInit(&t);
    TrackGraphNode * node = t.node;

    volatile int i = 0;
    for ( i = 1; i <= sensor2i("E16"); i++) {
        bwprintf(COM2, "%c%d%d.nextNode:%c%d%d ", ((i-1)/16)+'A',((i-1)%16+1)/10, ((i-1)%16+1)%10, ((node[i].nextNodeIndex-1)/16)+'A',((node[i].nextNodeIndex-1)%16+1)/10, ((node[i].nextNodeIndex-1)%16+1)%10); 
        bwprintf(COM2, "%c%d%d.Inverse:%c%d%d\r\n", ((i-1)/16)+'A',((i-1)%16+1)/10, ((i-1)%16+1)%10, ((node[i].inverse-1)/16)+'A',((node[i].inverse-1)%16+1)/10, ((node[i].inverse-1)%16+1)%10); 

        if (!(i % 16)) bwgetc(COM2);
    }


    Exit();

}


void TrackGraphInit(TrackGraph * t) {
    TrackGraphInitA(t);
}


void drawTrackB(int iosTID) {

}


/*------------------------------------------------------------------------*/
//testing struct message passing
//instead of sending nicly formated string, send a specialized message struct




typedef struct tempMsgStruct {
	//order stuf so non-word-alligned stuff is on bottom of struct
	char msgType[4]; //word alligned. Used to hold message code. can move to int in future.
	int vals[10];
	char temp1;
} tempMsgStruct;



void testStructS() {
	char _msg[64];
	tempMsgStruct testS;
	testS.msgType[0] = 0;
	testS.msgType[1] = 'B';
	testS.msgType[2] = 'C';
	testS.msgType[3] = 'D';
	int i= 0;
	for(i=0;i<10;i++){
		testS.vals[i] = 10 - i;
	}
	testS.temp1 = 'Q';
	Send(1, (char *) &testS, sizeof(tempMsgStruct), (char *) &testS, sizeof(tempMsgStruct));
	bwprintf(COM2,"after rply temp1 %c \n\r",testS.temp1);
    //bwassert(Send(1, (char *) &testS, sizeof(tempMsgStruct), _msg, 64)>= 0, COM2, "TEST FAILED!\r\n");
    Exit();
}

void testStructR() {
	int _tid = 0;
	char _msg[64];

	tempMsgStruct testR;
	if (Receive(&_tid, _msg, 64) >= 0) {
		//void pkmemcpy(void *dest, const void *source, unsigned int size);
		bwprintf(COM2,"%c\n\r",_msg[0]);
		if(_msg[0] == 0){
			//if message code is 'A' then its a struct
			pkmemcpy((void *) &testR, _msg, sizeof(tempMsgStruct));
			bwprintf(COM2,"temp1 %c \n\r",testR.temp1);
			bwprintf(COM2,"msg type 3rd %c \n\r",testR.msgType[2]);
			bwprintf(COM2,"value[3]:%d \n\r",testR.vals[3]);
			testR.temp1 = 'X';
			Reply(_tid, (char * ) &testR, sizeof(tempMsgStruct));
		}
	}
	Exit();

}

void testStructPass() {
    Create(6, (void*) testStructR);
    Create(6, (void*) testStructS);
    Exit( );
}

/*------------------------------------------------------------------------*/

int main(void) {
    // turning on data and instruction cache.
     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<30 \n"
        "ORR r0, r0, #0x1 <<12 \n"
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");

    kernelRun(2,(int) testTrackPathRevAndEX);
	


    return 0;

}



