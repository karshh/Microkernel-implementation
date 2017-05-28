#include "ts7200.h"
#include "debugtime.h"
#include "bwio.h"
#include "userRequestCall.h"
#include "kernelHandler.h"
#include "kernelMacros.h"
#include "buffer.h"
#include "pkstring.h"
#include "server.h"






#define MSG_CAPACITY 64


int strlength(char* buf) {
	int ans = 0;
	pkstrlen((void*) buf, &ans);
	return ans + 1; // null terminator added.
}

int strequal(char * c1, char * c2) {
	return pkstreql((void*) c1, (void *) c2);
}


// Implementation missing:	
// 	- Players cannot call quit if they're in the circular buffer waiting.
// 	  They must be an active player.
//  - Once a player makes a choice, he can't change it. He'll be blocked till
//	  the choice results.
//	- If one player quits and another joins, and the opponent had already cast 
//	  in a choice, he still cannot change it!


void referee() {
	bwprintf(COM2, "ROCK, PAPER & SCISSORS\r\nBy: Paily & Karsh\r\n\r\n");
	while(RegisterAs("REFEREE")){Pass();}

	circularBuffer cb;
	circularBufferInit(&cb);
	int player1TID = -1;
	int player2TID = -1;
	int rtid = -1;
	char msg[MSG_CAPACITY];
	int msglen = 0;
	int msgcap = MSG_CAPACITY;
	volatile int i = 0;
	// request types.
	 char *signup = "signup";
	 char *rock = "rock";
	 char *paper = "paper";
	 char *scissors = "scissors";
	 char *quit = "quit";
	// reply types.
	 char *fail = "fail";
	 char *success = "success";
	 char *win = "win";
	 char *lose = "lose";
	 char *tie = "tie";

	 // a bunch of state variables.
	 // ROCK BEATS SCISSORS, SCISSORS BEATS PAPER, PAPER BEATS ROCK
	 int player1Choice = 0; // 1 = ROCK, 2 = PAPER, 3 = SCISSORS 
	 int player2Choice = 0; // 1 = ROCK, 2 = PAPER, 3 = SCISSORS
	 int winner = 0; // 1 = PLAYER1 wins, 2 = PLAYER 2 wins. 

	while(1) {
		// clear out the message and message length.
		for (i = 0; i < MSG_CAPACITY; i++) msg[i] = 0;
		msglen = 0;
		// recieve a message.
		msglen = Receive(&rtid, msg, msgcap);

		// Here we make sure the recieve went through.
		bwassert(msglen >= 0, COM2, "ERROR: Task %d returned the following code: %d\r\n", rtid, msglen);

		// Continue with the process of meeting player requests.
		if (strequal(msg, signup))  {
			// we got a signup request.
			if (rtid == player1TID || rtid == player2TID) {
				Reply(rtid, fail, strlength(fail)); // you're already in the game. Don't sign up again!
			} else {
				bwassert(addToBuffer((void *) rtid, &cb), COM2, "COULD NOT ADD %d, BUFFER IS FULL.", rtid);
			}

		} else if (strequal( msg, rock)) {
			// we got a rock request.
			if (rtid != player1TID && rtid != player2TID) Reply(rtid, fail, strlength(fail)); // you're not playing yet
			if (rtid == player1TID && !player1Choice) {
				player1Choice = 1;
			} else if (rtid == player2TID && !player2Choice) {
				player2Choice = 1;
			} else {
				// They already chose an argument. Respond with a fail. We should technically never get here.
				Reply(rtid, fail, strlength(fail));
			}
		} else if (strequal( msg, paper)) {
			// we got a paper request.
			if (rtid != player1TID && rtid != player2TID) Reply(rtid, fail, strlength(fail)); // you're not playing yet
			if (rtid == player1TID && !player1Choice) {
				player1Choice = 2;
			} else if (rtid == player2TID && !player2Choice) {
				player2Choice = 2;
			} else {
				// They already chose an argument. Respond with a fail. We should technically never get here.
				Reply(rtid, fail, strlength(fail));
			}
		} else if (strequal( msg, scissors)) {
			// we got a scissors request.
			if (rtid != player1TID && rtid != player2TID) Reply(rtid, fail, strlength(fail)); // you're not playing yet
			if (rtid == player1TID && !player1Choice) {
				player1Choice = 3;
			} else if (rtid == player2TID && !player2Choice) {
				player2Choice = 3;
			} else {
				// They already chose an argument. Respond with a fail. We should technically never get here.
				Reply(rtid, fail, strlength(fail));
			}
		} else if (strequal( msg, quit)) {
			// we got a quit call.
			// we check which player did it, and then gracefully release him/her/it into the wilderness of redboot memory
			// as a zombie.
			if (rtid == player1TID) {
				player1Choice = 0;
				bwprintf(COM2, "\r\nTID <%d> quits.\r\n", player1TID);
				player1TID = -1;
				Reply(rtid, success, strlength(success));
				if (player2TID == -1) {
					bwprintf(COM2, "\r\nNo more players left. Quitting...\r\n");
					Exit( );
				}
			} else if (rtid == player2TID) {
				player2Choice = 0;
				bwprintf(COM2, "\r\nTID <%d> quits.\r\n", player2TID);
				player2TID = -1;
				Reply(rtid, success, strlength(success));
				if (player1TID == -1) {
					bwprintf(COM2, "\r\nNo more players left. Quitting...\r\n");
					Exit( );
				}
			} else {
				// some waste yute replied quit when he ain't even playin. A high-ego task, but nevertheless, send a fail.
				Reply(rtid, fail, strlength(fail));
			} 

		} else {
				// we got utter garbage from client. Reply with a fail. 
				Reply(rtid, fail, strlength(fail));
		}

		// see if we need to get a player.
		if (player1TID == -1 && getFromBuffer((void **) (&player1TID),&cb)) {
			Reply(player1TID, success, strlength(success));
			player1Choice = 0;
			bwprintf(COM2, "TID <%d> enters the game.\r\n", player1TID);
		}
		if (player2TID == -1 && getFromBuffer((void **) (&player2TID),&cb)) {
			Reply(player2TID, success, strlength(success));
			player2Choice = 0;
			bwprintf(COM2, "TID <%d> enters the game.\r\n", player2TID);
		}


		// Play a round!

		if (player1Choice && player2Choice) {
			bwprintf(COM2, "\r\nGAME:\r\n");
			if (player1Choice == player2Choice) {
				bwprintf(COM2, "    TID <%d> chooses %s.\r\n", player1TID, ((player1Choice == 1) ? rock : (player1Choice == 2 ? paper : scissors)));
				bwprintf(COM2, "    TID <%d> chooses %s.\r\n", player2TID, ((player2Choice == 1) ? rock : (player2Choice == 2 ? paper : scissors)));
				bwprintf(COM2, "RESULT: Tie!.\r\n");
				Reply(player1TID, tie, strlength(tie));
				Reply(player2TID, tie, strlength(tie));
			} else {
				winner = 1 + ((player1Choice == 1 && player2Choice == 2) ||
								(player1Choice == 2 && player2Choice == 3) ||
								(player1Choice == 3 && player2Choice == 1));

				bwprintf(COM2, "    TID <%d> chooses %s.\r\n", player1TID, ((player1Choice == 1) ? rock : (player1Choice == 2 ? paper : scissors)));
				bwprintf(COM2, "    TID <%d> chooses %s.\r\n", player2TID, ((player2Choice == 1) ? rock : (player2Choice == 2 ? paper : scissors)));
				bwprintf(COM2, "RESULT: TID <%d> wins!.\r\n", (winner == 1 ? player1TID : player2TID));
				Reply((winner == 1 ? player1TID : player2TID), win, strlength(win));
				Reply((winner == 1 ? player2TID : player1TID), lose, strlength(lose));
			}
			// reset all values.
			winner = 0;
			player1Choice = 0;
			player2Choice = 0;
			bwprintf(COM2, "Press any key to continue...\r\n");
			bwgetc(COM2);
		}
	}
}

void player1() {
	
	//int myTID = MyTid();
	int refereeTID = -1;
	while( refereeTID <0){
		Pass();
		refereeTID =  WhoIs("REFEREE");
	}
	char reply[16];
	int replycap = 16;
	int replylen = 0;

	volatile int i = 0;
	volatile int game = 0;

	while(1) {
		for (i = 0; i < 16; i++) reply[i] = 0;
		bwassert(Send(refereeTID, "signup", strlength("signup"), reply, replycap) >= 0, 
			COM2, "Player 1 Error sending signup to referee.\r\n");
		if (strequal(reply, "success")) break;
	}


	for (game = 0; game < 30; game++) {
		for (i = 0; i < 16; i++) reply[i] = 0;
		int t = getTime();
		char * c = t % 3 == 0 ? "rock" : (t % 3 == 1 ? "paper" : "scissors"); 
		bwassert(Send(refereeTID, c, strlength(c), reply, replycap) >= 0, 
			COM2, "Player 1 Error sending %s to referee on game %d.\r\n", c, t);
	}

	for (i = 0; i < 16; i++) reply[i] = 0;
	replylen = Send(refereeTID, "quit", strlength("quit"), reply, replycap);


	//bwprintf(COM2, "<%d> Exitting...\r\n", myTID);
	Exit( );
}

void player2() {
	//int myTID = MyTid();
	int refereeTID = -1;
	while( refereeTID <0){
		Pass();
		refereeTID =  WhoIs("REFEREE");
	}
	char reply[16];
	int replycap = 16;
	int replylen = 0;
	volatile int game = 0;
	volatile int i = 0;

	while(1) {
		for (i = 0; i < 16; i++) reply[i] = 0;
		bwassert(Send(refereeTID, "signup", strlength("signup"), reply, replycap) >= 0, 
			COM2, "Player 1 Error sending signup to referee.\r\n");
		if (strequal(reply, "success")) break;
	}


	for (game = 0; game < 20; game++) {
		for (i = 0; i < 16; i++) reply[i] = 0;
		int t = getTime();
		char * c = t % 3 == 0 ? "rock" : (t % 3 == 1 ? "paper" : "scissors"); 
		bwassert(Send(refereeTID, c, strlength(c), reply, replycap) >= 0, 
			COM2, "Player 1 Error sending %s to referee on game %d.\r\n", c, t);
	}

	for (i = 0; i < 16; i++) reply[i] = 0;

	replylen = Send(refereeTID, "quit", strlength("quit"), reply, replycap);

	Exit( );
}


void player3() {
	int refereeTID = -1;
	while( refereeTID <0){
		Pass();
		refereeTID =  WhoIs("REFEREE");
	}
	char reply[16];
	int replycap = 16;
	int replylen = 0;
	volatile int game = 0;
	volatile int i = 0;

	while(1) {
		for (i = 0; i < 16; i++) reply[i] = 0;
		bwassert(Send(refereeTID, "signup", strlength("signup"), reply, replycap) >= 0, 
			COM2, "Player 1 Error sending signup to referee.\r\n");
		if (strequal(reply, "success")) break;
	}


	for (game = 0; game < 20; game++) {
		for (i = 0; i < 16; i++) reply[i] = 0;
		int t = getTime();
		char * c = t % 3 == 0 ? "rock" : (t % 3 == 1 ? "paper" : "scissors"); 
		bwassert(Send(refereeTID, c, strlength(c), reply, replycap) >= 0, 
			COM2, "Player 1 Error sending %s to referee on game %d.\r\n", c, t);
	}

	for (i = 0; i < 16; i++) reply[i] = 0;

	replylen = Send(refereeTID, "quit", strlength("quit"), reply, replycap);

	Exit( );
}



void player4() {
	int refereeTID = -1;
	while( refereeTID <0){
		Pass();
		refereeTID =  WhoIs("REFEREE");
	}
	char reply[16];
	int replycap = 16;
	int replylen = 0;
	volatile int game = 0;
	volatile int i = 0;

	while(1) {
		for (i = 0; i < 16; i++) reply[i] = 0;
		bwassert(Send(refereeTID, "signup", strlength("signup"), reply, replycap) >= 0, 
			COM2, "Player 1 Error sending signup to referee.\r\n");
		if (strequal(reply, "success")) break;
	}


	for (game = 0; game < 10; game++) {
		for (i = 0; i < 16; i++) reply[i] = 0;
		int t = getTime();
		char * c = t % 3 == 0 ? "rock" : (t % 3 == 1 ? "paper" : "scissors"); 
		bwassert(Send(refereeTID, c, strlength(c), reply, replycap) >= 0, 
			COM2, "Player 1 Error sending %s to referee on game %d.\r\n", c, t);
	}

	for (i = 0; i < 16; i++) reply[i] = 0;

	replylen = Send(refereeTID, "quit", strlength("quit"), reply, replycap);

	Exit( );
}




void God() {
	CreateNameServer(1,(void *) NameServerTask);
	Create(5, (void *)referee);
	Create(6, (void *)player1);
	Create(6, (void *)player2);
	Create(6, (void *)player3);
	Create(6, (void *)player4);
	Exit();
}

int main(void) {


    // turning on data and instruction cache.
        
     asm volatile (
        "MRC p15, 0, r0, c1, c0, 0 \n"
        "ORR r0, r0, #0x1 <<12 \n" 
        "ORR r0, r0, #0x1 <<2 \n"
        "MCR p15, 0, r0, c1, c0, 0 \n");

    startTime();
	kernelRun(1, (int) God);

	return 0;
}

