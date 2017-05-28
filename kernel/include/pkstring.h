

#ifndef _P_K_STRING_
#define _P_K_STRING_

void pkmemcpy(void *dest, const void *source, int size);

void pkstrlen(void * buffer, int * size);

void pkstrcpy(void *dest, const void *source);

int pkstreql(const void *str1, const void *str2);

#endif
