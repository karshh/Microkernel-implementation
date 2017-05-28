

#ifndef _P_K_STRING_
#define _P_K_STRING_

void pkmemcpy(void *dest, const void *source, int size);

void pkstrlen(void * buffer, int * size);

void pkstrcpy(void *dest, const void *source);
void pkstrcpy_volatile(volatile void *dest, volatile void *source);

int pkstrcmp(const char string1[], const char string2[] );
int pkstrcmp_volatile(volatile char string1[], volatile char string2[] );


int pkstreq(const char string1[], const char string2[] );

int pkstreql(const void *str1, const void *str2);

#endif
