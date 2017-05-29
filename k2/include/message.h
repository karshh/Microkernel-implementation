#ifndef _MESSAGE_
#define _MESSAGE_


#define MESSAGE_CAPACITY 128

typedef struct message {
	int senderTID;
	char msg[MESSAGE_CAPACITY + 1];
	int msglen;
	int receiverTID;

} message;

int messageInit(message * m);

#endif

