#ifndef _MESSAGE_
#define _MESSAGE_

typedef struct message {
	int senderTID;
	char * msg;
	int msglen;

} message;

int messageInit(message * m);

#endif

