
#include "pkstring.h"

void pkmemcpy(void *dest, const void *source, int size) {
	char *cdest = (char *) dest;
	char *csource = (char *) source;
	volatile int i = 0;
	for (i = 0; i < size; i++) {
		cdest[i] = csource[i];
	}
}


void pkstrlen(void * buffer, int * size) {
	char *cbuffer = (char *) buffer;
	*size = 0;
	volatile int i = 0;
	for (i = 0; cbuffer[i] != 0; i++) {
		(*size) += 1;
	}
}


void pkstrcpy(void *dest, const void *source) {
	char *cdest = (char *) dest;
	char *csource = (char *) source;
	volatile int i = 0;
	for (i = 0; csource[i] != 0; i++) {
		cdest[i] = csource[i];
	} 
	cdest[i] = 0;
	
}
