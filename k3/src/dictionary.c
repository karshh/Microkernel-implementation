#include "kernelMacros.h"
#include "dictionary.h"
#include "pkstring.h"
#include "bwio.h"


void initHashEntry(volatile hashEntry * he){
    he->TID = -1;
    pkstrcpy_volatile(he->key,"");
}


void initHashMap(volatile hashMap * hmp){
   volatile int i;
    for(i=0;i<MAX_HASH;i++){
        initHashEntry(&hmp->hte[i]);
    }
}

void initTIDLookup(volatile TIDLookup * td){
    td->registered = 0;
    pkstrcpy_volatile(td->key,"");
    
}

void initDictionary(dictionary *d){
    initHashMap(&d->hmp);
    volatile int i;
    for(i=0;i<MAX_TID;i++){
        initTIDLookup(&d->td[i]);
    }
}

int hashCode(volatile char key[]){
    volatile int i=0;
    volatile unsigned long hash = 73;
    while(1){
        volatile int c = key[i];
        hash = (hash <<  5) + hash + c;
        if(key[i] == '\0') break;
        i++;
    }
   return hash % MAX_HASH;
}

int searchHashMap(volatile hashMap * hmp, volatile char key[]) {
   //get the hash 

   volatile int hashIndex = hashCode(key);
   volatile int firstIndex = hashIndex;
   //move in array until an empty 
   while(1) {
	
      if(!pkstrcmp_volatile(hmp->hte[hashIndex].key,key)){
         return hmp->hte[hashIndex].TID;
	}
			
      //go to next cell
      ++hashIndex;
		
      //wrap around the table
      hashIndex %= MAX_HASH;
      if( firstIndex == hashIndex){ 
	return -1; //could not find
      }
   }
 
}


int insertHashMap(volatile hashMap * hmp, volatile char key[],const int TID) {
	//multiple names possible for hash
	//iif name exists, overide it
  volatile int exist = searchHashMap(hmp,key);
   if (exist == TID) return 0; //this TID is already named key. NOP
   if (exist >= 0) return -2; //already exists for another TID
   //get the hash 
   volatile int hashIndex = hashCode(key);
    volatile int firstIndex = hashIndex;
   //move in array until an empty or deleted cell
   while(pkstrcmp_volatile(hmp->hte[hashIndex].key,"")){
      //go to next cell
      ++hashIndex;
		
      //wrap around the table
      hashIndex %= MAX_HASH;
      if( firstIndex == hashIndex) return -1; //full
   }
	
   hmp->hte[hashIndex].TID = TID;        
   pkstrcpy_volatile(hmp->hte[hashIndex].key,key);
   return 0;
}

 
int deleteHashMap(volatile hashMap * hmp, volatile char key[]) {
   
  volatile  int hashIndex = hashCode(key);
  volatile int firstIndex = hashIndex;

   //move in array until an empty 
   while(1) {
	
      if(!pkstrcmp_volatile(hmp->hte[hashIndex].key,key)) {
         initHashEntry(&hmp->hte[hashIndex]);
         return 0;
      } 
		
      //go to next cell
      ++hashIndex;
		
      //wrap around the table
      hashIndex %= MAX_HASH; 
      if( firstIndex == hashIndex) return -1; //couldn't find it
   }  
	
   
}

int searchDictionary(dictionary *d, volatile char key[], volatile int * TID){
    
    //retruns negative number if not found
    // 0...128 if TID found
    volatile int err = searchHashMap(&d->hmp, key); 

    if (err < 0) return 0;
    else *TID = err;
    return 1;
}


int addDictionary(dictionary *d, volatile  char key[], int  TID){
    //first check if it exists
    //first check if key exists it exists
	int tmp;
	if(searchDictionary(d,key,&tmp)){
        	deleteHashMap(&d->hmp,key); //delete it if its there
	}

        volatile int err =insertHashMap(&d->hmp, key,TID);

	if(!err){ 
            return 1;
        }
        return 0; //failed to add

/*
    if(d->td[TID].registered == 0 ){
       volatile int err =insertHashMap(&d->hmp, key,TID);
        if(!err){ 
            d->td[TID].registered = 1;
            pkstrcpy_volatile(d->td[TID].key,key);
            return 1;
        }
        return 0; //failed to add
    }else{
    
        if(!pkstrcmp_volatile(d->td[TID].key,key)){
            return 1; //key is the same for this TID NOP
        }
    
        deleteHashMap(&d->hmp, d->td[TID].key); //delete it if its there
        volatile int err =insertHashMap(&d->hmp, key,TID);
        if(!err){ 
            d->td[TID].registered = 1;
            pkstrcpy_volatile(d->td[TID].key,key);
            return 1;
        }
        return 0; //failed to add

        
        
    }
*/
}

void deleteDictionary(dictionary *d, int  TID){
	if(d->td[TID].registered){
		deleteHashMap(&d->hmp, d->td[TID].key) ;
		initTIDLookup(&d->td[TID]);
	}
}
