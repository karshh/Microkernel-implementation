#include <stdio.h>
#define MAX_HASH 347
#define MAX_TID 128

void strcpy1(char dest[], const char source[]) {
int i = 0;
   while (1) {
      dest[i] = source[i];
      if (dest[i] == '\0') break;
      i++;
} }

int strcmp1(const char string1[], const char string2[] )
{   int i;
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


int streq(const char string1[], const char string2[] )
{   int i = strcmp1(string1,string2);
    if(!i) return 1;
    else
    return 0;
}


typedef struct{
    int TID;
    char key[16];
} hashEntry;

typedef struct{
    hashEntry hte[MAX_HASH];
} hashMap;

typedef struct {
    char key[16];
    int registered;
} TIDLookup;

typedef struct{
    hashMap hmp;
    TIDLookup td[MAX_TID];
} dictionary;



void initHashEntry(hashEntry * he){
    he->TID = -1;
    strcpy1(he->key,"");
}


void initHashMap(hashMap * hmp){
    int i;
    for(i=0;i<MAX_HASH;i++){
        initHashEntry(&hmp->hte[i]);
    }
}

void initTIDLookup(TIDLookup * td){
    td->registered = 0;
    strcpy1(td->key,"");
    
}

void initDictionary(dictionary *d){
    initHashMap(&d->hmp);
    int i;
    for(i=0;i<MAX_TID;i++){
        initTIDLookup(&d->td[i]);
    }
}

int hashCode(const char key[]){
    int i=0;
    unsigned long hash = 73;
    while(1){
        int c = key[i];
        hash = (hash <<  5) + hash + c;
        if(key[i] == '\0') break;
        i++;
    }
   return hash % MAX_HASH;
}

int searchHashMap(hashMap * hmp, const char key[]) {
   //get the hash 
   int hashIndex = hashCode(key);
	int firstIndex = hashIndex;
   //move in array until an empty 
   while(1) {
	
      if(!strcmp1(hmp->hte[hashIndex].key,key))
         return hmp->hte[hashIndex].TID;
			
      //go to next cell
      ++hashIndex;
		
      //wrap around the table
      hashIndex %= MAX_HASH;
      if( firstIndex == hashIndex) return -1; //full
   }
 
}


int insertHashMap(hashMap * hmp, const char key[],const int TID) {
   int exist = searchHashMap(hmp,key);
   if (exist == TID) return 0; //this TID is already named key. NOP
   if (exist >= 0) return -2; //already exists for another TID
   //get the hash 
   int hashIndex = hashCode(key);
    int firstIndex = hashIndex;
   //move in array until an empty or deleted cell
   while(strcmp1(hmp->hte[hashIndex].key,"")){
      //go to next cell
      ++hashIndex;
		
      //wrap around the table
      hashIndex %= MAX_HASH;
      if( firstIndex == hashIndex) return -1; //full
   }
	
   hmp->hte[hashIndex].TID = TID;        
   strcpy1(hmp->hte[hashIndex].key,key);
 
}

 
int deleteHashMap(hashMap * hmp, const char key[]) {
   
   int hashIndex = hashCode(key);
	int firstIndex = hashIndex;

   //move in array until an empty 
   while(1) {
	
      if(!strcmp1(hmp->hte[hashIndex].key,key)) {
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

int searchDictionary(dictionary *d, const char key[], int * TID){
    
    //retruns negative number if not found
    // 0...128 if TID found
    int err = searchHashMap(&d->hmp, key); 
    if (err < 0) return 0;
    else *TID = err;
    return 1;
}


int addDictionary(dictionary *d, const char key[], int  TID){
    //first check if it exists

    if(d->td[TID].registered == 0 ){
        int err =insertHashMap(&d->hmp, key,TID);
        if(!err){ 
            d->td[TID].registered = 1;
            strcpy1(d->td[TID].key,key);
            return 1;
        }
        return 0; //failed to add
    }else{
    
        if(!strcmp1(d->td[TID].key,key)){
            return 1; //key is the same for this TID NOP
        }
    
        deleteHashMap(&d->hmp, d->td[TID].key); //delete it if its there
        int err =insertHashMap(&d->hmp, key,TID);
        if(!err){ 
            d->td[TID].registered = 1;
            strcpy1(d->td[TID].key,key);
            return 1;
        }
        return 0; //failed to add

        
        
    }
}
int main()
{
    hashMap hmp;
    initHashMap(&hmp);
    printf("size of hash map %dkb \n\r",sizeof(hmp)/1024);
    printf("search for DOG %d \n\r",searchHashMap(&hmp,"DOG"));
    printf("Add DOG 100 %d \n\r",insertHashMap(&hmp,"DOG",100));
    printf("Add DOG 100 %d \n\r",insertHashMap(&hmp,"DOG",100));
    printf("Add DOG 102 %d \n\r",insertHashMap(&hmp,"DOG",102));
    printf("Add DIG 101 %d \n\r",insertHashMap(&hmp,"DIG",101));
    printf("Add DOGOMYTE 102 %d \n\r",insertHashMap(&hmp,"DOGOMYTE",102));
    printf("search for DOG %d \n\r",searchHashMap(&hmp,"DOG"));
    printf("search for DIG %d \n\r",searchHashMap(&hmp,"DIG"));
    printf("search for DOGOMYTE %d \n\r",searchHashMap(&hmp,"DOGOMYTE"));
    printf("DELETE D2OGOMYTE 102 %d \n\r",deleteHashMap(&hmp,"D2OGOMYTE"));
    printf("DELETE DOGOMYTE 102 %d \n\r",deleteHashMap(&hmp,"DOGOMYTE"));
    printf("search for DOGOMYTE %d \n\r",searchHashMap(&hmp,"DOGOMYTE"));
printf("Add DOGOMYTE 15 %d \n\r",insertHashMap(&hmp,"DOGOMYTE",15));
printf("search for DOGOMYTE %d \n\r",searchHashMap(&hmp,"DOGOMYTE"));
printf("--------------------------------------------------------------------\n\r");

    dictionary d;
    initDictionary(&d);
    printf("size of dictionary %dkb \n\r",sizeof(dictionary)/1024);
    int TID ;
    TID = -1;
    printf("search for DOGOMYTE %d \n\r",searchDictionary(&d,"DOGOMYTE",&TID));
    printf("TID result %d \n\r",TID);
    printf("add DOGOMYTE for 100 %d \n\r",addDictionary(&d,"DOGOMYTE",100));
    printf("add DOGOMYTE for 100 (again) %d \n\r",addDictionary(&d,"DOGOMYTE",100));
    printf("add DOGOMYTE for 101 %d \n\r",addDictionary(&d,"DOGOMYTE",101));
    printf("add FIRE for 102 %d \n\r",addDictionary(&d,"FIRE",102));
    printf("add TRAIN for 103 %d \n\r",addDictionary(&d,"TRAIN",103));
    TID = -1;
    printf("search for DOGOMYTE %d \n\r",searchDictionary(&d,"DOGOMYTE",&TID));
    printf("TID result %d \n\r",TID);
    TID = -1;
    printf("search for FIRE %d \n\r",searchDictionary(&d,"FIRE",&TID));
    printf("TID result %d \n\r",TID);
    TID = -1;
    printf("search for TRAIN%d \n\r",searchDictionary(&d,"TRAIN",&TID));
    printf("TID result %d \n\r",TID);
    printf("add DRAGON (replace name) for 103 %d \n\r",addDictionary(&d,"DRAGON",103));
TID = -1;
    printf("search for TRAIN%d \n\r",searchDictionary(&d,"TRAIN",&TID));
    printf("TID result %d \n\r",TID);
    TID = -1;
    printf("search for DRAGON%d \n\r",searchDictionary(&d,"DRAGON",&TID));
    printf("TID result %d \n\r",TID);

    return 0;
}
