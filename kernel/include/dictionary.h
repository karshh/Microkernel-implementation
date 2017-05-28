#include "kernelMacros.h"
#include "pkstring.h"


typedef struct{
   volatile  int TID;
   volatile char key[MAX_NAME_LENGTH];
} hashEntry;

typedef struct{
	volatile  hashEntry hte[MAX_HASH];
} hashMap;

typedef struct {
   volatile char key[MAX_NAME_LENGTH];
   volatile  int registered;
} TIDLookup;

typedef struct{
    volatile hashMap hmp;
    volatile TIDLookup td[MAX_TID];
} dictionary;


void initHashEntry(volatile hashEntry * he);

void initHashMap(volatile hashMap * hmp);

void initTIDLookup(volatile TIDLookup * td);

void initDictionary(dictionary *d);

int hashCode(volatile char key[]);

int searchHashMap(volatile hashMap * hmp, volatile char key[]) ;

int insertHashMap(volatile hashMap * hmp, volatile char key[],const int TID) ;
 
int deleteHashMap(volatile hashMap * hmp, volatile char key[]) ;

int searchDictionary(dictionary *d, volatile char key[], volatile int * TID);

int addDictionary(dictionary *d, volatile char key[], int  TID);


void deleteDictionary(dictionary *d, int  TID);

