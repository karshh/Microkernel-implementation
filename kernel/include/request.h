

#ifndef _REQUEST_

#define _REQUEST_
typedef enum requestType {
	NONE,
	SEND,
	RECEIVE,
	REPLY,
	MYTID,
	MYPARENTID,
	CREATE,
	CREATENAMESERVER,
	CREATECLOCKSERVER,
	CREATEIOSERVER,
	PASS,
	EXIT,
	WHOIS,
	REGISTER,
	AWAITEVENT,
	INTERRUPT,
	CLOCK,
	IO,
	IDLEPERCENTAGE,
	QUIT
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
