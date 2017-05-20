

#ifndef _REQUEST_

#define _REQUEST_
typedef enum requestType {
	NONE,
	MYTID,
	MYPARENTID,
	CREATE,
	PASS,
	EXIT
} requestType;

typedef struct request{
	requestType reqType;
	void * arg1;
	void * arg2;
} request;


// return 1 if kernel handler was succesfully initialized. 
int kernelHandlerInit();

#endif
