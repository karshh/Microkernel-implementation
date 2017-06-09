

#ifndef _REQUEST_

#define _REQUEST_
typedef enum requestType {
	NONE,
	MYTID,
	MYPARENTID,
	CREATE,
	CREATENAMESERVER,
	CREATECLOCKSERVER,
	CREATEIOSERVER,
	PASS,
	EXIT,
	SEND,
	RECEIVE,
	REPLY,
	WHOIS,
	REGISTER,
	AWAITEVENT,
	INTERRUPT,
	CLOCK,
	IO,
	IDLEPERCENTAGE
} requestType;

typedef struct request{
	requestType reqType;
	void * arg1;
	void * arg2;
	void * arg3;
	void * arg4;
	void * arg5;
} request;



#endif
