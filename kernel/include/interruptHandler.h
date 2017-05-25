

#ifndef INTERRUPT_HANDLER

#define INTERRUPT_HANDLER

#include "request.h"
#include "td.h"

request *  activate(int reqVal, TD * td);
/*
request * activate(int reqVal, int ** sp);

request * swiHandler(request * req);
*/


#endif
