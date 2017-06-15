
#include "pkstring.h"
#include "bwio.h"

void pkmemcpy2(void *dest, const void *source, unsigned int size) {
	//old. there to compare
	//one byte at a time
	char *cdest = (char *) dest;
	char *csource = (char *) source;
	asm volatile ("pkmemcpybefcpy:");
	volatile int i = 0;
	for (i = 0; i < size; i++) {
		cdest[i] = csource[i];
	}
	asm volatile ("pkmemcpyaftercpy:");
}


void pkmemcpy(void *dest, const void *source, unsigned int size) {
//r0 = *dest
//r1 = *src
//r2 = *size
//code based on http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.faqs/ka13544.html
	asm volatile (
	".pkmemmodcheck:\n"
	"	AND	r3, r0, #3\n"
	"	cmp	r3, #0\n"
	"	BGT	.pkmem1\n"//if size >= 32 loop
	"	AND	r3, r1, #3\n"
	"	cmp	r3, #0\n"
	"	BGT	.pkmem1\n"//if size >= 32 loop
	".pkmem32:\n"
	"	cmp	r2, #32\n" //if size < 32 (8 words)
	"	BLT	.pkmem4\n" //go to pkmem4
	"	stmfd	sp!, {r4-r10}\n"//save r4-r10 on stack
	".pkmemWord32:\n"
	"	LDMIA	r1!,{r3-r10}\n" //load 32 bytes, add 32 to r1.
	"	STMIA	r0!,{r3-r10}\n" //save 32 bytes, add 32 to r0.
	"	SUB r2, r2, #32\n" //subtract size by 32 and run compare
	"	cmp	r2, #32\n"//if size < 1 (1 byte)
	"	BGE 	.pkmemWord32\n"//if size >= 32 loop
	"	ldmfd	sp!, {r4-r10}\n" //load r4-r10 back;
	".pkmem4:	\n" //if size < 4 (1 word)
	"	cmp	r2, #4\n"//go to pkmem1
	"	BLT	.pkmem1\n"
	".pkmemWord4:\n"
	"	LDR r3,	[r1],#4\n" //(post indexed)) load r1[i] into r3. add 4 to i
	"	STR r3,	[r0],#4\n" //save r3 into r0[i]. add 4 to i.
	"	SUB r2, r2, #4\n" //subtract size by 4 and run compare
	"	cmp	r2, #4\n"//if size < 1 (1 byte)
	"	BGE 	.pkmemWord4\n"//if size >= 4 loop
	".pkmem1:	\n"
	"	cmp	r2, #1\n"//if size < 1 (1 byte)
	"	BLT	.pkmem0\n" //go to pkmem0
	".pkmemWord1:\n"
	"	LDRB 	r3,[r1],#1\n" //(post indexed)) load 1 byte r1[i] into r3. add 1 to i
	"	STRB	r3,[r0],#1\n" //save 1 byte r3 into r0[i]. add 1 to i.
	"	SUB	r2, r2, #1\n" //subtract size by 4 and run compare
	"	cmp	r2, #1\n"//if size < 1 (1 byte)
	"	BGE 	.pkmemWord1\n"//if size >= 1 loop
	".pkmem0:	\n"//nothing left to cpy
	);
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
