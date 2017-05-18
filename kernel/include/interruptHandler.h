

#ifndef INTERRUPT_HANDLER

#define INTERRUPT_HANDLER

#include "request.h"

request * activate(int reqVal, int ** sp);

request * swiHandler(request * req);



#endif
