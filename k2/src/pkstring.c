
#include "pkstring.h"
#include "bwio.h"
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

void pkstrcpy_volatile(volatile void *dest, volatile void *source) {
	char *cdest = (char *) dest;
	char *csource = (char *) source;
	volatile int i = 0;
	for (i = 0; csource[i] != 0; i++) {
		cdest[i] = csource[i];
	} 
	cdest[i] = 0;
	
}

int pkstrcmp_volatile(volatile char string1[], volatile char string2[] )
{   volatile int i;
    for ( i = 0; ; i++)
    {
        if (string1[i] != string2[i])
        {
            return string1[i] < string2[i] ? -1 : 1;
        }

        if (string1[i] == '\0')
        {
            return 0;
        }
    }
}



int pkstrcmp(const char string1[], const char string2[] )
{   volatile int i;
    for ( i = 0; ; i++)
    {
        if (string1[i] != string2[i])
        {
            return string1[i] < string2[i] ? -1 : 1;
        }

        if (string1[i] == '\0')
        {
            return 0;
        }
    }
}


int pkstreq(const char string1[], const char string2[] )
{  volatile int i = pkstrcmp(string1,string2);
    if(!i) return 1;
    else
    return 0;
}

int pkstreq_volatile(volatile char string1[], volatile char string2[] )
{  volatile int i = pkstrcmp_volatile(string1,string2);
    if(!i) return 1;
    else
    return 0;
}



void pkstrcpy_firstn(volatile char * string1, volatile char * string2 , const int n){
	volatile int i = 0;
	
	for(i=0; i < n; i++){
		if(string2[i] == '\0') break;
		string1[i] = string2[i];
	}
	string1[i] = '\0';
//copies the first n characters or until it hits null terminator
}

void pkstrcpy_aftern(volatile char * string1, volatile char string2[] ,const int n){
//copies the characters after character n, coppies null terminator if string2 is shorter than n

	volatile int indexSource = 0;
	volatile int nullBeforeN=0;
	for(indexSource=0; indexSource < n; indexSource++){
		if(string2[indexSource] == '\0') {
			nullBeforeN = 1;
			break;
		}
	}

	if(nullBeforeN){
		string1[0] = '\0';
	}else{
		while(1){

			string1[indexSource-n] = string2[indexSource];
			if(string2[indexSource] == '\0') break;
			indexSource++;
		}
		
	}
}

void pkstrcpy_aftern_append(volatile char * string1,volatile char string2[] ,const int n, const int len){
//copies the characters after character n, coppies null terminator if string2 is shorter than n

	volatile int indexSource = 0;
		while(1){

			string1[indexSource+n] = string2[indexSource];
			if(string2[indexSource] == '\0') break;
			indexSource++;
			if (indexSource+n == len){string1[indexSource+n] = '\0'; break;}
		}
		
}
