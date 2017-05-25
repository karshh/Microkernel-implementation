#ifndef _MESSAGE_
#define _MESSAGE_


typedef struct message {
	int senderTID;
	void* msg;
	int msglen;
	int receiverTID;

} message;


#endif

