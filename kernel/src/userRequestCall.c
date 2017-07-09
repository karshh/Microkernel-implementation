#include "userRequestCall.h"
#include "request.h"
#include "pkstring.h"
#include "time.h"
#include "bwio.h"
//SWI caller
int user_contextswitch(int dummy, request * r) {
	asm ("swi 0");
	register int r_ asm("r0");	
	return r_;
	
}

//Creation
int Create( int priority, void (*code)){
	request myRequest;
	myRequest.reqType = CREATE;
	myRequest.arg1 = (void *) priority;
	myRequest.arg2 = code;
	return user_contextswitch(0xdeadbeef, &myRequest);
}

int CreateNameServer( int priority, void (*code)){
	request myRequest;
	myRequest.reqType = CREATENAMESERVER;
	myRequest.arg1 = (void *) priority;
	myRequest.arg2 = code;
	return user_contextswitch(0xdeadbeef, &myRequest);
}

int CreateClockServer( int priority, void (*code)){
	request myRequest;
	myRequest.reqType = CREATECLOCKSERVER;
	myRequest.arg1 = (void *) priority;
	myRequest.arg2 = code;
	return user_contextswitch(0xdeadbeef, &myRequest);
}


int CreateIOServer(int priority, void (*code), int ioserverType ){
	request myRequest;
	myRequest.reqType = CREATEIOSERVER;
	myRequest.arg1 = (void *) priority;
	myRequest.arg2 = code;
	myRequest.arg3 = (void *) ioserverType;
	return user_contextswitch(0xdeadbeef, &myRequest);
}

//Basic primitives
int MyTid(){
	
	request myRequest;
	myRequest.reqType = MYTID;
	
	return user_contextswitch(0xdeadbeef, &myRequest);

}

int MyParentTid(){
	
	request myRequest;
	myRequest.reqType = MYPARENTID;
	
	return user_contextswitch(0xdeadbeef, &myRequest);
}

void Pass(){


	request myRequest;
	myRequest.reqType = PASS;

	user_contextswitch(0xdeadbeef, &myRequest);
}


void Exit(){
	
	request myRequest;
	myRequest.reqType = EXIT;
	
	user_contextswitch(0xdeadbeef, &myRequest);
}

void Quit(){
	
	request myRequest;
	myRequest.reqType = QUIT;
	
	user_contextswitch(0xdeadbeef, &myRequest);
}

int Send(int tid, char *msg, int msglen, char *reply, int rplen){
	
	request myRequest;
	myRequest.reqType = SEND;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msglen;
	myRequest.arg4 = (void *) reply;
	myRequest.arg5 = (void *) rplen;
	
	return user_contextswitch(0xdeadbeef, &myRequest);
}

int Receive(int *tid, char *msg, int msglen){
	
	request myRequest;
	myRequest.reqType = RECEIVE;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msglen;
	
	return user_contextswitch(0xdeadbeef, &myRequest);
}


int Reply(int tid, char *reply, int rplen){
	
	request myRequest;
	myRequest.reqType = REPLY;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) reply;
	myRequest.arg3 = (void *) rplen;
	
	return user_contextswitch(0xdeadbeef, &myRequest);
}


int WhoIs(char *name){
	volatile char * name2 = (volatile char *) name;
	volatile char name1[18];
	name1[0] ='0';
	name1[1] ='1';
	pkstrcpy_aftern_append(name1,name2,2,17);

	request myRequest;

	myRequest.reqType = WHOIS;
    	char _reply[2];
	_reply[0] = 0;
	_reply[1] = 0;
    	int _rplen = 2;
	myRequest.arg1 = (void *) 0;
	myRequest.arg2 = (void *) name1;
	myRequest.arg3 = (void *) 18;
	myRequest.arg4 = (void *) _reply;
	myRequest.arg5 = (void *) _rplen;
	volatile int result =  user_contextswitch(0xdeadbeef, &myRequest);
	
	if(result < 0) return result;

	if(_reply[0] > 127) return _reply[0] -256;
	return _reply[0];
}

int RegisterAs(char *name){
	volatile char * name2 = (volatile char *) name;
	volatile char name1[18];
	name1[0] ='1';
	name1[1] ='0';
	pkstrcpy_aftern_append(name1,name2,2,17);
	request myRequest;

	myRequest.reqType = REGISTER;
    char _reply[2];
	_reply[0] = 0;
	_reply[1] = 0;
    int _rplen = 2;
	myRequest.arg1 = (void *) 0;
	myRequest.arg2 = (void *) name1;
	myRequest.arg3 = (void *) 18;
	myRequest.arg4 = (void *) _reply;
	myRequest.arg5 = (void *) _rplen;
	volatile int result =  user_contextswitch(0xdeadbeef, &myRequest);
	
	if(result < 0) return result;

	if(_reply[0] > 127) return _reply[0] -256;
	return _reply[0];
}

int AwaitEvent( int eventid){
	request myRequest;
	myRequest.reqType = AWAITEVENT;
	myRequest.arg1 = (void *) eventid;
	return user_contextswitch(0xdeadbeef, &myRequest);
}


int Delay(int tid, int ticks) { 
	if (ticks <= 0) return -2;
	char msg[7];
	msg[0] = 10;
	msg[1] = (ticks / 100000000) % 100;
	msg[2] = (ticks / 1000000) % 100;
	msg[3] = (ticks / 10000) % 100;
	msg[4] = (ticks / 100) % 100;
	msg[5] = ticks % 100;
	msg[6] = 0;
	int msgLen = 7;
	char rpl[2];
	int rplLen = 2;

	request myRequest;

	myRequest.reqType = CLOCK;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msgLen;
	myRequest.arg4 = (void *) rpl;
	myRequest.arg5 = (void *) rplLen;
	return user_contextswitch(0xdeadbeef, &myRequest) == 2 ? 0 : -3;

}

int Time(int tid) {
	char msg[2];
	msg[0] = 11;
	msg[1] = 0;
	int msgLen = 2;
	char rpl[6];
	int rplLen = 6;

	request myRequest;
	myRequest.reqType = CLOCK;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msgLen;
	myRequest.arg4 = (void *) rpl;
	myRequest.arg5 = (void *) rplLen;
	return user_contextswitch(0xdeadbeef, &myRequest) == 6 
			? 	((((int)rpl[0]) * 100000000) + 
				(((int)rpl[1]) * 1000000) + 
				(((int)rpl[2]) * 10000) + 
				(((int)rpl[3]) * 100) + 
				((int)rpl[4])) 
			: 	-1;
}

int IdlePercentage() {
	//get the idle percentage from kernel
	request myRequest;
	myRequest.reqType = IDLEPERCENTAGE;
	return user_contextswitch(0xdeadbeef, &myRequest);
}

int DelayUntil(int tid, int ticks) {
	char msg[7];
	msg[0] = 12;
	msg[1] = (ticks / 100000000) % 100;
	msg[2] = (ticks / 1000000) % 100;
	msg[3] = (ticks / 10000) % 100;
	msg[4] = (ticks / 100) % 100;
	msg[5] = ticks % 100;
	msg[6] = 0;
	int msgLen = 7;
	char rpl[2];
	int rplLen = 2;

	request myRequest;
	myRequest.reqType = CLOCK;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msgLen;
	myRequest.arg4 = (void *) rpl;
	myRequest.arg5 = (void *) rplLen;
	return user_contextswitch(0xdeadbeef, &myRequest) == 2 ? 0 : -3;

}

char Getc(int tid, int uart) {	
	if (uart < 0 || uart > 1) return -1;
	char msg[2];
	msg[0] = (char)((1+uart) * 10);
	msg[1] = 0;
	int msgLen = 2;
	char rpl[3];
	int rplLen = 3;

	request myRequest;
	myRequest.reqType = IO;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msgLen;
	myRequest.arg4 = (void *) rpl;
	myRequest.arg5 = (void *) rplLen;
	return user_contextswitch(0xdeadbeef, &myRequest) == 2 ? rpl[0] : -3;
}

int Putc(int tid, int uart, char ch) {
	if (uart < 0 || uart > 1) return -1;
	char msg[3];
	msg[0] = (char)(((1+uart) * 10) + 1); //kk, still useful but not so much.
	msg[1] = ch;
	msg[2] = 0;
	int msgLen = 3;
	char rpl[3];
	int rplLen = 3;

	request myRequest;
	myRequest.reqType = IO;
	myRequest.arg1 = (void *) tid;
	myRequest.arg2 = (void *) msg;
	myRequest.arg3 = (void *) msgLen;
	myRequest.arg4 = (void *) rpl;
	myRequest.arg5 = (void *) rplLen;
	return user_contextswitch(0xdeadbeef, &myRequest) == 2 ? 0 : -3;

}

/*

int Putx( int tid, int channel, char c ) {
	char chh, chl;

	chh = c2x( c / 16 );
	chl = c2x( c % 16 );
	Putc(tid, channel, chh );
	return Putc(tid, channel, chl );
}

int Putr( int tid,  int channel, unsigned int reg ) {
	int byte;
	char *ch = (char *) &reg;

	for( byte = 3; byte >= 0; byte-- ) Putx(tid, channel, ch[byte] );
	return Putc(tid, channel, ' ' );
}

int Putstr( int tid,  int channel, char *str ) {
	while( *str ) {
		if( Putc(tid, channel, *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

void Putw( int tid,  int channel, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) Putc(tid, channel, fc );
	while( ( ch = *bf++ ) ) Putc(tid, channel, ch );
}

void IOFormat ( int tid,  int channel, char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;

	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
			Putc(tid, channel, ch );
		else {
			lz = 0; w = 0;
			ch = *(fmt++);
			switch ( ch ) {
			case '0':
				lz = 1; ch = *(fmt++);
				break;
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				ch = bwa2i( ch, &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				Putc(tid, channel, va_arg( va, char ) );
				break;
			case 's':
				Putw(tid, channel, w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				bwui2a( va_arg( va, unsigned int ), 10, bf );
				Putw(tid, channel, w, lz, bf );
				break;
			case 'd':
				bwi2a( va_arg( va, int ), bf );
				Putw(tid, channel, w, lz, bf );
				break;
			case 'x':
				bwui2a( va_arg( va, unsigned int ), 16, bf );
				Putw(tid, channel, w, lz, bf );
				break;
			case '%':
				Putc(tid, channel, ch );
				break;
			}
		}
	}
}
*/


//all further functions should call putstr not putc
int Putx( int tid, int channel, char c ) {
	//prints hex version of given character
	//char chh, chl;
	char ch[3];
	ch[0] =  c2x( c / 16 );
	ch[1] =  c2x( c % 16 );
	ch[2] =  0;


	//chh = c2x( c / 16 );
	//chl = c2x( c % 16 );
	//Putc(tid, channel, chh );
	//return Putc(tid, channel, chl );
	return Putstr(tid, channel, &ch[0] );
}

int sPutx( int tid, int channel, char c, char * buff ) {
	//returns number of characters inputted
	// buff is the pointer to a string
	
	//char ch[3];
	buff[0] =  c2x( c / 16 );
	buff[1] =  c2x( c % 16 );
	//ch[2] =  0;


	//chh = c2x( c / 16 );
	//chl = c2x( c % 16 );
	//Putc(tid, channel, chh );
	//return Putc(tid, channel, chl );
	return 2;
}

int Putr( int tid,  int channel, unsigned int reg ) {
	//prints the hex of an entire 32 bit integer
	int byte;
	char *ch = (char *) &reg;
	char buffer[10];
	buffer[0] = 0;
	buffer[8] = ' ';
	buffer[9] = 0;
	char * buff = &buffer[0];
	//for( byte = 3; byte >= 0; byte-- ) Putx(tid, channel, ch[byte] );
	for( byte = 3; byte >= 0; byte-- ){ 
		buff +=	sPutx(tid, channel, ch[byte] , buff);
	}
	return Putstr(tid, channel, &buffer[0] );
}



int Putstr( int tid,  int channel, char *str ) {
	//assuming you are given a null terminated string
	int uart = channel;
	if (uart < 0 || uart > 1) return -1;

	char msg[66]; 
	int msgLen = 2;

	char rpl[3];
	int rplLen = 3;
	int lastBlock =0;

	int strCount = 0;
	char * strTmp = str;
	//char * recall = str;
	while( *strTmp ) {
		//if( Putc(tid, channel, *str ) < 0 ) return -1;
		msg[strCount+1] = *strTmp;
		strCount++;
		//find length till next batch of 64.
		//if(strCount == 64){ //should not be called
		if(strCount == 64){ //should not be called
			msg[0] = (char)(((1+uart) * 10) + 1); //kk, still useful but not so much.
			//pkmemcpy(&msg[1],str,64);//copy last 64 bytes into msg
			msg[65] = 0;
			//msg[65] = 0;
			// *str +=64;
			msgLen = 66;
			request myRequest;
			myRequest.reqType = IO;
			myRequest.arg1 = (void *) tid;
			myRequest.arg2 = (void *) msg;
			myRequest.arg3 = (void *) msgLen;
			myRequest.arg4 = (void *) rpl;
			myRequest.arg5 = (void *) rplLen;
			lastBlock = user_contextswitch(0xdeadbeef, &myRequest) == 2 ? 0 : -3;
			if (lastBlock) return -1;
			strCount = 0;
		}
		strTmp++;
	}
	if (strCount > 0){	
			msg[0] = (char)(((1+uart) * 10) + 1); //kk, still useful but not so much.
			//pkmemcpy(&msg[1],str,strCount);//copy leftover bytes into msg
			msg[strCount +1] = 0;
			// *str +=strCount;
			msgLen = 2 + strCount;
			request myRequest;
			myRequest.reqType = IO;
			myRequest.arg1 = (void *) tid;
			myRequest.arg2 = (void *) msg;
			myRequest.arg3 = (void *) msgLen;
			myRequest.arg4 = (void *) rpl;
			myRequest.arg5 = (void *) rplLen;
			lastBlock = user_contextswitch(0xdeadbeef, &myRequest) == 2 ? 0 : -3;
			if (lastBlock) return -1;
			strCount = 0;
	}
	//if len = 0, do nothing.
	return lastBlock;
}




void Putw( int tid,  int channel, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;
	char buffer[1024]; //a 1kb buffer.
	buffer[0] = 0;
	int length = 0;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ){
		buffer[length] = fc;
		length ++;
		//Putc(tid, channel, fc );
	}
	while( ( ch = *bf++ ) ){
		buffer[length] = ch;
		length ++;
		//Putc(tid, channel, ch );
	}
	buffer[length] = 0;
	Putstr(tid, channel, &buffer[0] );
}

int sPutw(int n, char fc, char *bf ,char * buff) {
	//bf is the string to append after padding
	//buff is the string you want to write this to.
	char ch;
	char *p = bf;

	char *b = buff;
	int count = 0;
	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ){
		*b = fc;
		b++;
		count ++;
	}
	while( ( ch = *bf++ ) ){
		*b = ch;
		b++;
		count ++;
		//buffer[length] = ch;
		//length ++;
		//Putc(tid, channel, ch );
	}
	return count;
	//buffer[length] = 0;
}
void IOFormat ( int tid,  int channel, char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;

	char bigBuffer[4096]; //max string for printf is 4k
	bigBuffer[0] =0; //pointer to current character in buffer
	char *b = &bigBuffer[0];
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' ){
			//Putc(tid, channel, ch );
			*b = ch;
			b++;
		}
		else {
			lz = 0; w = 0;
			ch = *(fmt++);
			switch ( ch ) {
			case '0':
				lz = 1; ch = *(fmt++);
				break;
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				ch = bwa2i( ch, &fmt, 10, &w );
				//Ai have absolutly no idea what this is supposed to do...but ok.
				//used to pad output. example %5d with integer value 100 should output 00010.
				//bwio code was off because lz wasnt set properly
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				*b = va_arg(va,char);
				b++;
				//Putc(tid, channel, va_arg( va, char ) ); //print char
				break;
			case 's':
				lz = ' ';
				b += sPutw( w, lz, va_arg( va, char* ) ,b); //prints string
				break;
			case 'u':
				lz = '0';
				bwui2a( va_arg( va, unsigned int ), 10, bf ); //print unsigned int
				b += sPutw( w, lz, bf,b); //prints string
				//Putw(tid, channel, w, lz, bf );
				break;
			case 'd':
				lz = '0';
				bwi2a( va_arg( va, int ), bf ); 
				//Putw(tid, channel, w, lz, bf ); //prints signed int
				b += sPutw(w, lz, bf,b); //prints string
				break;
			case 'x':
				lz = '0';
				bwui2a( va_arg( va, unsigned int ), 16, bf );
				//Putw(tid, channel, w, lz, bf ); //prints hex
				b += sPutw( w, lz, bf,b); //prints string
				break;
			case '%':
				*b = ch;
				b++;
				//Putc(tid, channel, ch ); //prints % character
				break;
			}
		}
	}
	*b = 0; //puts null terminator at the end
	b ++;
	Putstr(tid,channel,&bigBuffer[0]); //prints it
}
void Printf( int tid,  int channel, char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        IOFormat(tid, channel, fmt, va );
        va_end(va);
}


