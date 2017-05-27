#include "ts7200.h"

#include "bwio.h"
#include "userRequestCall.h"
#include "kernelHandler.h"
#include "kernelMacros.h"

void otherUserTask() {
	int tid = MyTid();
	int parenttid = MyParentTid();
	bwprintf(COM2,"mytid:%d.        myparenttid:%d.\r\n", tid, parenttid);
	
	Pass();
	
	tid = MyTid();
	parenttid = MyParentTid();
	bwprintf(COM2,"MyTid:%d.        MyParentTid:%d.\r\n", tid, parenttid);
	Exit();
}

void firstUserTask() {
	int priority = LOW;

	int i = 1;
	for (; i <= 4; i++) {

		int r = Create(priority, (void *)otherUserTask);
		if (r == -1) {
			bwprintf(COM2,"Invalid priority.\r\n");
			Exit();
		} else if (r == -2) {
			bwprintf(COM2,"Out of task descriptors.\r\n");
			Exit();
		} else {
			bwprintf(COM2,"Created:<%d>.\r\n", r);
		}
		if (i == 2) priority = HIGH;
	}

	bwprintf(COM2,"FirstUserTask: exiting.\r\n");
	Exit();

}

int main(void) {
	
	kernelRun(MEDIUM, (int) firstUserTask);
	
	return 0;
}
