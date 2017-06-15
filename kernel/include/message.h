#ifndef _MESSAGE_
#define _MESSAGE_

typedef struct message {
	int senderTID;
	char * msg;//ptr to msg
	int msglen;

} message;

int messageInit(message * m);

#endif

