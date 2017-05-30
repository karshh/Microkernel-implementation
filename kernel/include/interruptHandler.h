

#ifndef INTERRUPT_HANDLER

#define INTERRUPT_HANDLER

#include "request.h"
#include "td.h"
/*
request *  activate( int reqVal, TD * td);
request * swiHandler(int reqVal, TD * td);
*/
request *  activate(volatile TD * td);
//request * swiHandler(volatile TD * td, request * irq_r);
request * swiHandler(volatile TD * td);
void initHandlers();

/*
request * activate(int reqVal, int ** sp);

request * swiHandler(request * req);
*/


#endif
