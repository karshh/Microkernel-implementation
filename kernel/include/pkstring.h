

#ifndef _P_K_STRING_
#define _P_K_STRING_

void pkmemcpy2(void *dest, const void *source, unsigned int size);
void pkmemcpy(void *dest, const void *source, unsigned int size);

int pkstrlen(void * buffer);

void pkstrcpy(void *dest, const void *source);
void pkstrcpy_volatile(volatile void *dest, volatile void *source);

int pkstrcmp(const char string1[], const char string2[] );
int pkstrcmp_volatile(volatile char string1[], volatile char string2[] );


int pkstreq(const char string1[], const char string2[] );
int pkstreq_volatile(volatile char string1[], volatile char string2[] );


void pkstrcpy_firstn(volatile char * string1, volatile char *string2 , const int n);
//copies the first n characters or until it hits null terminator
//eg
// pkstring_firstn(A, "01ABCDE",2)
// A = "01"

void pkstrcpy_aftern(volatile char *string1, volatile char string2[] ,const int n);
//copies the characters after character n, coppies null terminator if string2 is shorter than n
//eg
// pkstring_afternn(A, "01ABCDE",2)
// A = "ABCDE"



void pkstrcpy_aftern_append(volatile char *string1, volatile char string2[] ,const int n,const int len);
//appends string2 at pos n on string 1
//eg A= "TTTTTTTTTTTTTTT"
// pkstring_afternn_padd(A, "01ABCDE",2)
// A =  "TT01ABCDE"


int pkstreql(const void *str1, const void *str2);

#endif
