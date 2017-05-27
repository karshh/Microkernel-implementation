#include "ts7200.h"

#include "bwio.h"
#include "userRequestCall.h"
#include "kernelHandler.h"
#include "kernelMacros.h"
#include "dictionary.h"


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

void userTaskName(){

    int myTid = MyTid();
    int Tid = 0;
    dictionary d;
    initDictionary(&d);
    bwprintf(COM2, "init dictionary", myTid, Tid);

    int TID ;
    TID = -1;
    bwprintf(COM2,"search for DOGOMYTE %d \n\r",searchDictionary(&d,"DOGOMYTE",&TID));
    bwprintf(COM2,"TID result %d \n\r",TID);
    bwprintf(COM2,"add DOGOMYTE for 100 %d \n\r",addDictionary(&d,"DOGOMYTE",100));
    bwprintf(COM2,"add DOGOMYTE for 100 (again) %d \n\r",addDictionary(&d,"DOGOMYTE",100));
    bwprintf(COM2,"add DOGOMYTE for 101 %d \n\r",addDictionary(&d,"DOGOMYTE",101));
    bwprintf(COM2,"add FIRE for 102 %d \n\r",addDictionary(&d,"FIRE",102));
    bwprintf(COM2,"add TRAIN for 103 %d \n\r",addDictionary(&d,"TRAIN",103));
    TID = -1;
    bwprintf(COM2,"search for DOGOMYTE %d \n\r",searchDictionary(&d,"DOGOMYTE",&TID));
   bwprintf(COM2,"TID result %d \n\r",TID);
    TID = -1;
    bwprintf(COM2,"search for FIRE %d \n\r",searchDictionary(&d,"FIRE",&TID));
    bwprintf(COM2,"TID result %d \n\r",TID);
    TID = -1;
    bwprintf(COM2,"search for TRAIN%d \n\r",searchDictionary(&d,"TRAIN",&TID));
    bwprintf(COM2,"TID result %d \n\r",TID);
    bwprintf(COM2,"add DRAGON (replace name) for 103 %d \n\r",addDictionary(&d,"DRAGON",103));
TID = -1;
    bwprintf(COM2,"search for TRAIN%d \n\r",searchDictionary(&d,"TRAIN",&TID));
    bwprintf(COM2,"TID result %d \n\r",TID);
    TID = -1;
    bwprintf(COM2,"search for DRAGON%d \n\r",searchDictionary(&d,"DRAGON",&TID));
    bwprintf(COM2,"TID result %d \n\r",TID);
    TID = -1;
    bwprintf(COM2,"search for FIRE %d \n\r",searchDictionary(&d,"FIRE",&TID));
    bwprintf(COM2,"TID result %d \n\r",TID);
    deleteDictionary(&d,102);
    bwprintf(COM2,"unregistered TID 102  \n\r");
    TID = -1;
    bwprintf(COM2,"search for FIRE %d \n\r",searchDictionary(&d,"FIRE",&TID));
    bwprintf(COM2,"TID result %d \n\r",TID);

 


    Exit();
}

void userTask11(void) {    
    //bwprintf(COM2, "HERE\r\n");    
    //bwprintf(COM2, "USER TASK 1 MIDDLE \r\n");    
    // bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING TID.\r\n");     
     int tid = MyTid();     
     bwprintf(COM2, "USER TASK 1 GOT TID = %d.\r\n", tid);     
   //  bwprintf(COM2, "USER TASK 1 EXIT, REQUESTING Parent TID.\r\n");    
   // int parentTid = MyParentTid();     
   // bwprintf(COM2, "USER TASK 1 GOT Parent TID = %d.\r\n", parentTid); 
     Exit();
}

int main(void) {

	int code  = ((int) userTaskName);
	kernelRun(5, code);
	return 0;
}
