

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
} request;


// return 1 if kernel handler was succesfully initialized. 
int kernelHandlerInit();

#endif
