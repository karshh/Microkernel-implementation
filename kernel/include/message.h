#ifndef _MESSAGE_
#define _MESSAGE_


typedef struct message {
	int senderTID;
	char * sendMsg;
	int sendMsgLen;

	int recieverTID;
	char * recieveMsg;
	int recieveMsgLen;
} message;


#endif

