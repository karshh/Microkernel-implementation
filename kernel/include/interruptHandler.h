

#ifndef INTERRUPT_HANDLER

#define INTERRUPT_HANDLER

#include "request.h"

request * activate(request * req, int ** sp);

void swiHandler();



#endif
