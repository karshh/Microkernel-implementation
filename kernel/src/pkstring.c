
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



int pkstreql(const void *str1, const void *str2) {
	volatile char *cstr1 = (char *) str1;
	volatile char *cstr2 = (char *) str2;
	volatile int i = 0;
	for (i = 0; cstr1[i] != 0 && cstr2[i] != 0; i++) {
		if (cstr1[i] != cstr2[i]) return 0;
	} 
	
	// if one of the variables isn't a null terminator, then this
	// will return false.
	return !(cstr1[i] || cstr2[i]);   
	
}

