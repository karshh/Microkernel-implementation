 /*
 * t2.c
 */

#include <bwio.h>
#include <ts7200.h>

#define	TERMINAL_WIDTH 150
#define	TERMINAL_HEIGHT 37
#define DFA_INIT 0
#define DFA_ERROR -1
#define DFA_QUIT_TERMINATOR 1
#define DFA_TR_1 10
#define DFA_TR_2 11
#define DFA_TR_3 12
#define DFA_RV_1 16
#define DFA_RV_2 17
#define DFA_RV_3 18
#define DFA_SW_1 28
#define DFA_L_1 31
#define DFA_L_2 32
#define DFA_L_3 33
#define MESSAGE_WARN 0
#define MESSAGE_VALID 1
#define TRAIN_MAX 80
#define DFA_SENSOR_PING 90

#define SENSOR_BIT_MASK_1 0x80
#define SENSOR_BIT_MASK_2 0x40
#define SENSOR_BIT_MASK_3 0x20
#define SENSOR_BIT_MASK_4 0x10
#define SENSOR_BIT_MASK_5 0x08
#define SENSOR_BIT_MASK_6 0x04
#define SENSOR_BIT_MASK_7 0x02
#define SENSOR_BIT_MASK_8 0x01


//   define TIMER_MAX 0x01d11680; //using a 508kHz Timer, timer resets every minute
#define TIMER_MAX 0x6d014600; //using a 508kHz Timer, timer resets every 10 minutes
#define FOREVER for( ; ; )
/********************************************************************************************************/
//structs
/********************************************************************************************************/
#define CCBUFFER_MAX_LENGTH  4096 
#define CCBUFFER_SENSOR_MAX_LENGTH 10 
//circular character buffer
struct ccbuffer{
        unsigned char cbuf[CCBUFFER_MAX_LENGTH];
        int head, tail;
};
	int ccbuff_isEmpty(struct ccbuffer * ccb){
		if (ccb->head == ccb->tail) return 1;
		else return 0;
	}


	void ccbuff_init(struct ccbuffer * ccb){
	 ccb->head = 0;
	 ccb->tail = 0; 
	}

	int ccbuff_pop(volatile struct ccbuffer* ccb, char  *c){
	    if(ccb->head == ccb->tail) return -1;
	    int next = ccb->tail+1;
	    if(next == CCBUFFER_MAX_LENGTH ) next = 0;
	    *c = ccb->cbuf[ccb->tail];
	    ccb->tail = next;
	    return 0;
	}
	
	int ccbuff_push(struct ccbuffer* ccb, char   c){
	 int next = ccb->head +1;
	 if(next == CCBUFFER_MAX_LENGTH ) next = 0;
	// if(next == ccb->tail) return -1; 
	//if buffer is going to be full stuff at the tail of the buffer is too old anyway..so pop it.
	 if(next == ccb->tail) {char trash; ccbuff_pop(ccb, &trash);} 

	 ccb->cbuf[ccb->head] = c;
	 ccb->head = next;
	 return 0;
	}

struct ccbufferS{
	//ccbuffer used specifically for sensor display
        unsigned char cbuf[CCBUFFER_SENSOR_MAX_LENGTH];
        int head, tail;
};
	int ccbuffS_isEmpty(struct ccbufferS * ccb){
		if (ccb->head == ccb->tail) return 1;
		else return 0;
	}


	void ccbuffS_init(struct ccbufferS * ccb){
	 ccb->head = 0;
	 ccb->tail = 0; 
	}

	int ccbuffS_pop(volatile struct ccbufferS* ccb, char  *c){
	    if(ccb->head == ccb->tail) return -1;
	    int next = ccb->tail+1;
	    if(next == CCBUFFER_SENSOR_MAX_LENGTH ) next = 0;
	    *c = ccb->cbuf[ccb->tail];
	    ccb->tail = next;
	    return 0;
	}
	
	int ccbuffS_push(struct ccbufferS* ccb, char   c){
	 int next = ccb->head +1;
	 if(next == CCBUFFER_SENSOR_MAX_LENGTH ) next = 0;
	// if(next == ccb->tail) return -1; 
	//if buffer is going to be full stuff at the tail of the buffer is too old anyway..so pop it.
	 if(next == ccb->tail) {char trash; ccbuffS_pop(ccb, &trash);} 

	 ccb->cbuf[ccb->head] = c;
	 ccb->head = next;
	 return 0;
	}

	int ccbuffS_peak(struct ccbufferS * ccb, char   *c, int index ){
		if(ccb->head == ccb->tail) return -1;
		int length = ccb->head - ccb->tail;
		if(ccb->head < ccb->tail) length = CCBUFFER_SENSOR_MAX_LENGTH - length;
		if (index >= length) return -1;

		int cindex =( index + ccb->tail-1) % CCBUFFER_SENSOR_MAX_LENGTH;
		*c = ccb->cbuf[cindex];
			return 0;
	}




struct glbs{
	//output buffers
	struct ccbuffer train_command_ccb; //a buffer that holds train commands
	struct ccbuffer COM1_ccb;//output to trains
	struct ccbuffer COM2_ccb;//output to terminal
	struct ccbufferS last_sensor1_ccb;
	struct ccbufferS last_sensor2_ccb;
	//input buffers
	struct ccbuffer command_ccb;
	struct ccbuffer sensor_ccb;

	int command_length;
	volatile int sensor_bytes_recieved;
	int message_present;
	int kill;
	volatile int timer;  //used for processing train commands
	volatile int delay;  //used for processing train commands in ms
	volatile int timerS;  //used for processing train commands
	volatile int delayS;  //used for processing train commands in ms
	int ds;
	int sec;
	int min;
	int hours;
	int train_speed_current[TRAIN_MAX];
	int switch_states_current[22];
	//int train_speed_next[TRAIN_MAX];
	int timer_check[10];
	int max_loop[10];
	int last_loop[10];
	int last_poll_completed; //last sensor poll
	int last_module;
	int last_sensor;
	int sensor_count;
};


	void glbs_init(struct glbs * glbv){
		ccbuff_init(&(glbv->COM1_ccb));
		ccbuff_init(&(glbv->COM2_ccb));
		ccbuff_init(&(glbv->command_ccb));
		ccbuff_init(&(glbv->train_command_ccb));
		ccbuff_init(&(glbv->sensor_ccb));
		ccbuffS_init(&(glbv->last_sensor1_ccb));
		ccbuffS_init(&(glbv->last_sensor2_ccb));
		glbv->command_length = 0;
		glbv->kill = 0;
		glbv->message_present =0;
		glbv->timer = TIMER_MAX; //using a 508kHz Timer, timer resets every minute
		glbv->delay = 0;
		glbv->timerS = TIMER_MAX; //using a 508kHz Timer, timer resets every minute used for sensor delay
		glbv->delayS = 0;
		glbv->ds = 0;
		glbv->sec = 0;
		glbv->min = 0;
		glbv->hours = 0;
		glbv->sensor_bytes_recieved = 0;
		int i;
		for( i =0; i< 10; i++){
		glbv->max_loop[i] = 0;
		glbv->last_loop[i] = 0;
		}
		glbv->last_poll_completed = 1;
		glbv->last_module = 0;
		glbv->sensor_count = 0;
	
	}
/********************************************************************************************************
	DFA function
********************************************************************************************************/
        int nextState(int state, char c, int * terminator, int *train, int * speed, int *sw , char *swd){
            switch(state){
                case DFA_INIT:
                    switch(c){
			case 'p':
                            *terminator = 1;
                            return DFA_SENSOR_PING;
                            break;

                        case 'q':
                            *terminator = 1;
                            return DFA_QUIT_TERMINATOR;
                            break;
                        case 't':
                            return 2; //t
                            break;
                        case 'r':
                            return 13; //r
                            break; 
                        case 's':
                            return 19; //r
                            break;  
                        case 'l':
                            return 29; //r
                            break;      
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;
                case 2: //just a t
                    switch(c){
                        case 'r':
                            return 3; //tr
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;
                case 3: //just a tr
                    switch(c){
                        case ' ':
                            return 4; //'tr '
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;
                case 4: //just a 'tr '
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                            { *train = c- '0';

                            }
                            return 5; //'tr #[0-7]'                          
                            break;
                        case '8':    
                            { *train = c- '0';

                            }
                            return 6;
                            break;
                        case '9':
                            { *train = c- '0';
      
                            }
                            return 7;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;
                case 5: //just a 'tr #[0-7]'
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            { *train = (*train *10 ) + (c- '0');

                            }
                            return 7; //'tr #[07][09]'                          
                            break;
                        case ' ':    
                            return 9; //'tr #[07] '
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;
                case 6: //just a 'tr #[8]'
                    switch(c){
                        case '0':
                            { *train = (*train *10 ) + (c- '0');
                            }
                            return 8; //'tr #[8][0]'                          
                            break;
                        case ' ':    
                            return 9; //'tr #[8] '
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;  
                case 7: //just a 'tr #[9] or tr #[07][09]'
                    switch(c){
                        case ' ':    
                            return 9; //'tr #[8] '
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 8: //just a 'tr #[8][0]'
                    switch(c){
                        case ' ':    
                            return 9; //'tr #[8][0] '
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 9: //just a 'tr ### '
                    switch(c){
                        case '0':
                            { *speed = (c- '0');
                            }
                            *terminator = 1;
                            return 10; //tr ### [0];
                            break;
                        case '1':
                            { *speed = (c- '0');
                            }
                            *terminator = 1;
                            return 11;//tr ### [1];
                            break;
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            { *speed = (c- '0');
                            }
                            *terminator = 1;
                            return 12;//tr ### [29];
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;
                case 10: //just a 'tr ### [0]'
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            { *speed = (*speed * 10) +(c- '0');
                            }
                            *terminator = 1;
                            return 12;//tr ### [0][09];
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;       
                case 11: //just a 'tr ### [1]'
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                            { *speed = (*speed * 10) +(c- '0');
                            }
                            *terminator = 1;
                            return 12;//tr ### [0][09];
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;   
                case 13: //just a 'r'
                    switch(c){
                        case 'v':
                            return 14;//rv;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;                
                case 14: //just a 'rv'
                    switch(c){
                        case ' ':
                            return 15;//'rv ';
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 15: //just a 'rv '
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                            { *train = c- '0';

                            }
                            *terminator = 1;
                            return 16; //'rv #[0-7]'                          
                            break;
                        case '8':    
                            { *train = c- '0';

                            }
                            *terminator = 1;
                            return 17;
                            break;
                        case '9':
                            { *train = c- '0';
      
                            }
                            *terminator = 1;                            
                            return 18;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;  
                case 16: //just a 'rv [0-7]'
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            { *train =(*train *10) +(c- '0');
      
                            }
                            *terminator = 1;                            
                            return 18;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;  
                case 17: //just a 'rv [0-7]'
                    switch(c){
                        case '0':
                        { *train =(*train *10) +(c- '0');
      
                         }
                            *terminator = 1;                            
                            return 18;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;  
                case 19: //just a 's'
                    switch(c){
                        case 'w':
                            return 20;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 20: //just a 'sw'
                    switch(c){
                        case ' ':
                            return 21;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 21: //just a 'sw '
                    switch(c){
                        case '0':
                        case '1':
                            { *sw = (c- '0');
      
                            }
                            return 22;
                            break;
                        
                        case '2':
                           { *sw = (c- '0');
 
                            }
                            return 23;
                            break;
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            { *sw = (c- '0');
 
                            }
                            return 24;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;    
                case 22: //just a 'sw [01]'
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            { *sw = (*sw * 10) + (c- '0');
 
                            }
                            return 24;
                            break;
                        case ' ':
                            return 27;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;      
                case 23: //just a 'sw [2]'
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                            { *sw = (*sw * 10) + (c- '0');
                            }
                            return 24;
                            break;
                        case '5':
                            { *sw = (*sw * 10) + (c- '0');
 
                            }
                            return 25;
                            break;
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            { *sw = (*sw * 10) + (c- '0');
 
                            }
                            return 26;
                            break;
                        case ' ':
                            return 27;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 24: //just a 'sw [2]'
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            { *sw = (*sw * 10) + (c- '0');
 
                            }
                            return 26;
                            break;
                        case ' ':
                            return 27;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 25: //just a 'sw [2][5]'
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':

                            { *sw = (*sw * 10) + (c- '0');
 
                            }
                            return 26;
                            break;
                        case ' ':
                            return 27;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 26: //just a 'sw [2][5]'
                    switch(c){
                        case ' ':
                            return 27;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 27: //just a 'sw ### '
                    switch(c){
                        case 'C':
                        case 'S':
                            *swd = c;
                            *terminator = 1;
                            return 28;
                            break;
                                                        
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 29: //just a 'l'
                    switch(c){
                        case ' ':
                            return 30;
                            break;
                                                        
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 30: //just a 'l '
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                            { *train = c- '0';

                            }
                            *terminator = 1;
                            return 31; //'tr #[0-7]'                          
                            break;
                        case '8':    
                            { *train = c- '0';

                            }
                            *terminator = 1;
                            return 32;
                            break;
                        case '9':
                            { *train = c- '0';
      
                            }
                            *terminator = 1;
                            return 33;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 31: //just a 'l '
                    switch(c){
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':    
                        case '9':
                            { *train = (*train*10)+(c- '0');
      
                            }
                            *terminator = 1;
                            return 33;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break; 
                case 32: //just a 'l 8'
                    switch(c){
                        case '0':
                            { *train = (*train*10)+(c- '0');
      
                            }
                            *terminator = 1;
                            return 33;
                            break;
                        default :
                            return DFA_ERROR;
                            break;  
                    }
                    break;     
                default:
                    return DFA_ERROR;
                    break;
            } 
        }

/********************************************************************************************************
	Helpers
	Note pie_* functions replace equivilent bw* functions

********************************************************************************************************/

int pie_putc(int channel, struct glbs * glbv, char c ) {
	switch(channel){
	case COM1:
		return ccbuff_push(&(glbv->COM1_ccb), c);
		break;
	case COM2:
		return ccbuff_push(&(glbv->COM2_ccb), c);
		break;
	default:
		return -1;
		break;
	}

}



void pie_putw( int channel, struct glbs * glbv, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) pie_putc(channel, glbv, fc);
	while( ( ch = *bf++ ) ) pie_putc(channel, glbv, ch );
}

int pie_putstr( int channel, struct glbs * glbv, char *str ) {
	while( *str ) {
		if( pie_putc(channel, glbv, *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

char pie_c2x( char ch ) {
	if ( (ch <= 9) ) return '0' + ch;
	return 'a' + ch - 10;
}

int pie_putx( int channel, struct glbs * glbv, char c ) {
	char chh, chl;

	chh = pie_c2x( c / 16 );
	chl = pie_c2x( c % 16 );
	
	pie_putc(channel, glbv,  chh );
	return pie_putc(channel, glbv,  chl );
}

int pie_putr( int channel, struct glbs * glbv, unsigned int reg ) {
	int byte;
	char *ch = (char *) &reg;

	for( byte = 3; byte >= 0; byte-- ) pie_putx(channel, glbv, ch[byte] );
	return pie_putc(channel, glbv, ' ' ); //why is there a space character???? hmmmmmm
	//#TODO check if this fucks up train signal.....
}

int pie_a2d( char ch ) {
	if( ch >= '0' && ch <= '9' ) return ch - '0';
	if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
	if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
	return -1;
}
char pie_a2i( char ch, char **src, int base, int *nump ) {
	int num, digit;
	char *p;

	p = *src; num = 0;
	while( ( digit = pie_a2d( ch ) ) >= 0 ) {
		if ( digit > base ) break;
		num = num*base + digit;
		ch = *p++;
	}
	*src = p; *nump = num;
	return ch;
}

void pie_ui2a( unsigned int num, unsigned int base, char *bf ) {
	int n = 0;
	int dgt;
	unsigned int d = 1;
	
	while( (num / d) >= base ) d *= base;
	while( d != 0 ) {
		dgt = num / d;
		num %= d;
		d /= base;
		if( n || dgt > 0 || d == 0 ) {
			*bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
			++n;
		}
	}
	*bf = 0;
}

void pie_i2a( int num, char *bf ) {
	if( num < 0 ) {
		num = -num;
		*bf++ = '-';
	}
	pie_ui2a( num, 10, bf );
}



void pie_format ( int channel, struct glbs * glbv,  char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;

	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
			pie_putc(channel, glbv, ch );
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
				ch = pie_a2i( ch, &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				pie_putc( channel, glbv, va_arg( va, char ) );
				break;
			case 's':
				pie_putw(channel, glbv,  w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				pie_ui2a( va_arg( va, unsigned int ), 10, bf );
				pie_putw( channel, glbv, w, lz, bf );
				break;
			case 'd':
				pie_i2a( va_arg( va, int ), bf );
				pie_putw(channel, glbv,  w, lz, bf );
			        break;
			case 'x':
				pie_ui2a( va_arg( va, unsigned int ), 16, bf );
				pie_putw(channel, glbv, w, lz, bf );
				break;
			case '%':
				pie_putc(  channel, glbv, ch );
				break;
			}
		}
	}
}
void pie_printf( int channel,struct glbs * glbv , char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        pie_format( channel, glbv , fmt, va );
        va_end(va);
}

int push_character(int channel,struct glbs * glbv){
	
	volatile int  *data;
	volatile int *flags;
	struct ccbuffer * ccb;
	switch( channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		
		ccb = &(glbv->COM1_ccb);
		if( !(*flags & CTS_MASK)) return -1;
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );

		ccb = &(glbv->COM2_ccb);
		break;
	default:
		return -1;
		break;
	}
	if( !( *flags & TXFF_MASK   )){ 
		char c ;
		if (ccbuff_pop(ccb, &c) ==0){
			if(channel == COM1){
/*
				volatile int j=0;
				while(j < 100000){
					j++;	
			}
*/
				
	//	{int j= 0; for(j=0;j<10000;j++) ;//push next char to terminal
			}
		*data = c;
		return 0;
		}
		return -1;
	}else{
		return -1;
	}

}
int pie_setfifo( int channel, int state ) {
	volatile int *line;
	volatile int buf;
	switch( channel ) {
	case COM1:
		line = (int *)( UART1_BASE + UART_LCRH_OFFSET );
	        break;
	case COM2:
	        line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
	        break;
	default:
	        return -1;
	        break;
	}
	buf = *line;
	buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
	*line = buf;
	return 0;
}
	
int pie_setspeed( int channel, struct glbs * glbv, int speed ) {
	volatile int *high;
	volatile int *low;
	switch( channel ) {
	case COM1:
		high = (int *)( UART1_BASE + UART_LCRM_OFFSET );
		low = (int *)( UART1_BASE + UART_LCRL_OFFSET );
	        break;
	case COM2:
		high = (int *)( UART2_BASE + UART_LCRM_OFFSET );
		low = (int *)( UART2_BASE + UART_LCRL_OFFSET );
	        break;
	default:
	        return -1;
	        break;
	}
	switch( speed ) {
	case 115200:
		*high = 0x0;
		*low = 0x3;
		return 0;
	case 2400:
		*high = 0x0;
		*low = 0xBF;
		//*low = 0x90;
		return 0;
	default:
		return -1;
	}
}

int flush_ccb(int channel, struct glbs * glbv){
	//flushes everything from ccb into the com port 
	//busy wait (used only on initialization and exit code)
	struct ccbuffer * ccb;
	switch( channel ) {
	case COM1:
		ccb = &(glbv->COM1_ccb);
	        break;
	case COM2:
		ccb = &(glbv->COM2_ccb);
	        break;
	default:
	        return -1;
	        break;
	}
	FOREVER{
		if(ccbuff_isEmpty(ccb)) break;
		push_character(channel, glbv);
	}
	return 0;
}

void screen_init(struct glbs * glbv, int state){
	//init screenA
	pie_setfifo( COM2, state ); //turn of COM2 fifos
	pie_printf(COM2, glbv, "\033[2J\033[H"); 
	// clear screen and move to begging of line
	pie_putw(COM2, glbv, TERMINAL_WIDTH, '*', "\n\r" );

	//interface cieling border
	int i = 0;
	//interface wall border
	while(i<TERMINAL_HEIGHT-1) {

		pie_printf(COM2, glbv, "*\033[%d;%dH*\n\r",i,TERMINAL_WIDTH -2); 
		//flush cbuffer every 2 lines
		if(i % 2 == 0){
			flush_ccb(COM2,glbv);
		}
		i++;
	}

	pie_putw(COM2, glbv,  TERMINAL_WIDTH, '*', "\n\r" );
	//interface floor border

	flush_ccb(COM2,glbv);

	pie_printf(COM2, glbv, "\033[%d;%dH Switches", 5, 22 );

		for (i=0; i < 9; i++){
			pie_printf(COM2, glbv, "\033[%d;%dH %d", 6, 22 + (i*5) , i+1);
		}
	flush_ccb(COM2,glbv);
		for (i=0; i < 9; i++){
			pie_printf(COM2, glbv, "\033[%d;%dH %d", 8, 22 + (i*5) , i+10);
		}
	
			pie_printf(COM2, glbv, "\033[%d;%dH %x", 10, 22 + (0) , 153);
			pie_printf(COM2, glbv, "\033[%d;%dH %x", 10, 22 + (5) , 154);

			pie_printf(COM2, glbv, "\033[%d;%dH %x", 12, 22 + (0) , 155);
			pie_printf(COM2, glbv, "\033[%d;%dH %x", 12, 22 + (5) , 156);
	pie_printf(COM2, glbv, "\033[%d;40H                \033[%d;40HSensors",19 ,  19);
	pie_printf(COM2, glbv, "\033[%d;2H%c", TERMINAL_HEIGHT-2,'>');
	//display command prompt
	pie_printf(COM2, glbv, "\033[?25l"); // removes cursor

	flush_ccb(COM2,glbv);
	
}

void flush_message_display(struct glbs * glbv){
//used to clear reset command line
	//go to begging of command line 
	pie_printf(COM2, glbv, "\033[%d;1H\033[K*\033[%d;%dH*\033[%d;%dH",TERMINAL_HEIGHT-3,TERMINAL_HEIGHT-3,TERMINAL_WIDTH -2,TERMINAL_HEIGHT-2, 2+ glbv->command_length); 
	glbv->message_present = 0;
	//display command prompt
	
}
void flush_command_display(struct glbs * glbv){
//used to clear reset command line
	//go to begging of command line 
	pie_printf(COM2, glbv, "\033[%d;1H\033[K*\033[%d;%dH*\n\r",TERMINAL_HEIGHT-2,TERMINAL_HEIGHT-2,TERMINAL_WIDTH -2); 
	pie_printf(COM2, glbv, "\033[%d;2H%c", TERMINAL_HEIGHT-2,'>');
	//display command prompt
	
}

void push_message(struct glbs * glbv, char * message ,int  formating){
	if(glbv->message_present) flush_message_display(glbv);
	switch(formating){
		case MESSAGE_WARN:
	pie_printf(COM2, glbv,"\033[%d;2H\033[31m\033[1m%s\033[0m", TERMINAL_HEIGHT -3,  message);
			break;
		case MESSAGE_VALID:
	pie_printf(COM2, glbv,"\033[%d;2H\033[32m\033[1m%s\033[0m", TERMINAL_HEIGHT -3,  message);
			break;
		default:
			break;
		
	}
	glbv->message_present =1;
	//display command prompt
	
}
int push_sensor (struct glbs * glbv,int module,int  bit){
	if(glbv->last_module == module && glbv->last_sensor == bit) return -1;
	if(glbv->sensor_count < 10) glbv->sensor_count ++;
				ccbuffS_push(&(glbv->last_sensor1_ccb),module);
				ccbuffS_push(&(glbv->last_sensor2_ccb),bit);
				glbv->last_module = module;
				glbv->last_sensor = bit;
	return 0;

}
int parse_sensors(struct glbs * glbv, char module, char b1, char b2){
	//first parse first bit;
	if (b1 & SENSOR_BIT_MASK_1){ 
			push_sensor(glbv,module,1);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),1);
	 }
	if (b1 & SENSOR_BIT_MASK_2){ 
			push_sensor(glbv,module,2);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),2);
	 }
	if (b1 & SENSOR_BIT_MASK_3){ 
			push_sensor(glbv,module,3);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),3);
	 }
	if (b1 & SENSOR_BIT_MASK_4){ 
			push_sensor(glbv,module,4);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),4);
	 }
	if (b1 & SENSOR_BIT_MASK_5){ 
			push_sensor(glbv,module,5);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),5);
	 }
	if (b1 & SENSOR_BIT_MASK_6){ 
			push_sensor(glbv,module,6);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),6);
	 }
	if (b1 & SENSOR_BIT_MASK_7){ 
			push_sensor(glbv,module,7);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),7);
	 }
	if (b1 & SENSOR_BIT_MASK_8){ 
			push_sensor(glbv,module,8);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),8);
	 }
	if (b2 & SENSOR_BIT_MASK_1){ 
			push_sensor(glbv,module,9);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),9);
	 }
	if (b2 & SENSOR_BIT_MASK_2){ 
			push_sensor(glbv,module,10);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),10);
	 }
	if (b2 & SENSOR_BIT_MASK_3){ 
			push_sensor(glbv,module,11);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),11);
	 }
	if (b2 & SENSOR_BIT_MASK_4){ 
			push_sensor(glbv,module,12);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),12);
	 }
	if (b2 & SENSOR_BIT_MASK_5){ 
			push_sensor(glbv,module,13);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),13);
	 }
	if (b2 & SENSOR_BIT_MASK_6){ 
			push_sensor(glbv,module,14);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),14);
	 }
	if (b2 & SENSOR_BIT_MASK_7){ 
			push_sensor(glbv,module,15);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),15);
	 }
	if (b2 & SENSOR_BIT_MASK_8){ 
			push_sensor(glbv,module,16);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),module);
	//			ccbuffS_push(&(glbv->last_sensor_ccb),16);
	 }

		return 0;
	
}
int set_timer_delay(struct glbs * glbv, int delay,int sensor){
	//update global delay timer for train
	//delay in ms
	volatile int *VALUE_R;
	
	//get address of timer init value

	VALUE_R = (int *)( TIMER3_BASE + VAL_OFFSET );
	if(sensor){
		glbv->timerS = *VALUE_R;
		glbv->delayS =  508 * delay;
		return 0;
	}
		glbv->timer = *VALUE_R;
		glbv->delay =  508 * delay;
	return 0;
}

int timer_passed(struct glbs * glbv, int sensor){
	if (glbv->delay == 0) return 1;
	//update global delay timer for train
	//delay in ms
	volatile int *VALUE_R;	
	volatile int timer_val;
	VALUE_R = (int *)( TIMER3_BASE + VAL_OFFSET );
	//get address of timer init value
	if(sensor){
		timer_val = *VALUE_R;
		if(glbv->timerS <= glbv->delayS){
			if( (timer_val > glbv->timerS) && (timer_val < 0x6d014600 - ( glbv->delayS - glbv->timerS))){
				return 1;
			}
			else{ return 0;
			}
		}
		else{
			if( timer_val < glbv->timerS - glbv->delayS){
				flush_ccb(COM2, glbv); 
				return 1;
			}
			else{ return 0;
			}
		}

	} 
	else{
	
		timer_val = *VALUE_R;
		if(glbv->timer <= glbv->delay){
			if( (timer_val > glbv->timer) && (timer_val < 0x6d014600 - ( glbv->delay - glbv->timer))){
				return 1;
			}
			else{ return 0;
			}
		}
		else{
			if( timer_val < glbv->timer - glbv->delay){
				flush_ccb(COM2, glbv); 
				return 1;
			}
			else{ return 0;
			}
		}
	}
}

int poll_sensor(struct glbs *glbv){
	//if(glbv->last_poll_completed == 0 && !(timer_passed(glbv,1))) return -1;
	if(ccbuff_isEmpty(&(glbv->COM1_ccb)) && (timer_passed(glbv,1))) {
	ccbuff_push(&(glbv->train_command_ccb),'P'); //flip switch
	ccbuff_push(&(glbv->train_command_ccb),0x85);//query first 1 sensors
	ccbuff_push(&(glbv->train_command_ccb),0);
	ccbuff_push(&(glbv->train_command_ccb),0);
	glbv->last_poll_completed = 0;
	set_timer_delay(glbv, 500, 1);
	glbv->sensor_bytes_recieved = 0;

	return 0;
	}
	else{return -1;}
}


int process_command_char(int channel, struct glbs * glbv , char c){
	struct ccbuffer * ccb;
	switch( channel ) {
	case COM1:
		ccb = &(glbv->sensor_ccb);
		break;
	case COM2:
		ccb = &(glbv->command_ccb);
		break;
	default:
		return -1;
		break;
	}
	if(channel == COM1){
		ccbuff_push(&(glbv->sensor_ccb),c);
		glbv->sensor_bytes_recieved ++;
		
		if(glbv->sensor_bytes_recieved == 10){
			//lets assume we get 10 bytes

			int i;

			for(i=0; i< 5; i++){
	//			char module = i + 65;
				char s1,s2;
					ccbuff_pop(&(glbv->sensor_ccb), &s1);
					ccbuff_pop(&(glbv->sensor_ccb), &s2);
					parse_sensors(glbv,i+65, s1, s2);
			}
			for(i=0; i< (CCBUFFER_SENSOR_MAX_LENGTH); i++){
				if (ccbuffS_isEmpty(&(glbv->last_sensor1_ccb)))  break;
				if (ccbuffS_isEmpty(&(glbv->last_sensor2_ccb)))  break;
				//don't pop buffer just use it as circular array
				char module =0;
				char sensor =0;
				
				if(ccbuffS_peak(&(glbv->last_sensor1_ccb),&module,i) < 0) break;
				if(ccbuffS_peak(&(glbv->last_sensor2_ccb),&sensor,i) < 0 ) break;
				pie_printf(COM2, glbv, "\033[%d;40H                \033[%d;40H%c%d",20+i ,  20+i, module, sensor);
				
				//if nothing to then peak no further
			
				
			}
			
			//ccbuff_init(&(glbv->sensor_ccb));
			
						//glbv->sensor_bytes_recieved = 0;
						//ccbuff_init(&(	glbv->sensor_ccb));

		}
		if(glbv->sensor_bytes_recieved > 10){
						push_message(glbv, "RECIEVED MORE COMMANDS THAN HOLES TO FILL", MESSAGE_WARN);
		}
		return 0;
	
	}

	//assume we are only dealing with keyboard (COM2) input 
	switch(c){
		// parse commands if somone pressed enter
		case (13):
			if(ccbuff_isEmpty(ccb)) {
				return -1; 
			}

			int state = DFA_INIT;
			int terminator = 0;
			int counter = 0;
			int train=0;
			int speed =0;
			int sw = 0;
			char swd =0;
			FOREVER{
				if (counter == ccb->head ) { state = -2; break;}
				state = nextState(state,ccb->cbuf[ccb->tail+counter], &terminator, &train, &speed, &sw, &swd);
				if (state < 0 ) break;
				if( counter == ccb->head -1) break;
				counter ++;
			}

			if(state > 0 && terminator == 1){
						push_message(glbv, "VALID COMMAND! CHOO CHOO MOTHERFUCKA!!", MESSAGE_VALID);
				switch(state){
					case(DFA_QUIT_TERMINATOR):
						push_message(glbv, "Quiting!", MESSAGE_VALID);
						
						glbv->kill =1;
						break;
					case(DFA_L_1):
					case(DFA_L_2):
					case(DFA_L_3):
						//turn on lights for train.
						//assume train is at speed 0;
						ccbuff_push(&(glbv->train_command_ccb),'L');
						ccbuff_push(&(glbv->train_command_ccb),16);
						ccbuff_push(&(glbv->train_command_ccb),train);
						ccbuff_push(&(glbv->train_command_ccb),1);
		
						break;
					case(DFA_RV_1):
					case(DFA_RV_2):
					case(DFA_RV_3):
						//Reverses train
						//go to speed 0
						ccbuff_push(&(glbv->train_command_ccb),'T');
						ccbuff_push(&(glbv->train_command_ccb),0);
						ccbuff_push(&(glbv->train_command_ccb),train);
						ccbuff_push(&(glbv->train_command_ccb),0); 
						//reverse
						ccbuff_push(&(glbv->train_command_ccb),'T');
						ccbuff_push(&(glbv->train_command_ccb),15);
						ccbuff_push(&(glbv->train_command_ccb),train);
						ccbuff_push(&(glbv->train_command_ccb),0);
						//return to previous speed
						ccbuff_push(&(glbv->train_command_ccb),'T');
						ccbuff_push(&(glbv->train_command_ccb),0);
						ccbuff_push(&(glbv->train_command_ccb),train);
						ccbuff_push(&(glbv->train_command_ccb),2);

						break;

					case(DFA_TR_1):
					case(DFA_TR_2):
					case(DFA_TR_3):
						//sets speed of train
						ccbuff_push(&(glbv->train_command_ccb),'T');
						ccbuff_push(&(glbv->train_command_ccb),speed);
						ccbuff_push(&(glbv->train_command_ccb),train);
						ccbuff_push(&(glbv->train_command_ccb),1);
						break;
					case(DFA_SW_1):
						ccbuff_push(&(glbv->train_command_ccb),'S'); //flip switch
						if(swd == 'C')
						ccbuff_push(&(glbv->train_command_ccb),0x22);
						else
						ccbuff_push(&(glbv->train_command_ccb),0x21);
						ccbuff_push(&(glbv->train_command_ccb),sw);
						ccbuff_push(&(glbv->train_command_ccb),0);
						ccbuff_push(&(glbv->train_command_ccb),'O'); //turn off solonoid
						ccbuff_push(&(glbv->train_command_ccb),0x20);
						ccbuff_push(&(glbv->train_command_ccb),0);
						ccbuff_push(&(glbv->train_command_ccb),0);


						break;
					case(DFA_SENSOR_PING):
						poll_sensor(glbv);
						break;
	
					default:
						break;
			}
			}else{
				push_message(glbv, "INVALID COMMAND! CHECK DOCUMENTATION", MESSAGE_WARN);

			}		
			//clear command buffer
			ccbuff_init(ccb);
			glbv->command_length =0;
			flush_command_display(glbv);
	
			return 0;
			break;
		default:
			if (channel == COM2){
				ccbuff_push(ccb,c);
				glbv->command_length ++;
				pie_printf(COM2, glbv, "%c",c);
				//flush any command level messages
				//flush_ccb(COM2,glbv);
				//if input from COM2, refresh line (assume not enter, arrow keys, backspace...)
				//right now only append
			}
			return 0;
			break;
	}
	

}



int pull_character(int channel,struct glbs * glbv){
	//checks if there is a response from COM channel
	volatile int  *data;
	volatile int *flags;
	switch( channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		break;
	default:
		return -1;
		break;
	}

	if( *flags & RXFF_MASK ){
		int c;
		c = *data;
		
		
		process_command_char(channel, glbv,c);
		return 0;
	}
	else{ 
		//nothing to recieve
		return -1;
	}

}

int init_clock(struct glbs * glbv){
	volatile int *LOAD_R;
	volatile int *CRTL_R;

	//get address of timer init value
	LOAD_R = (int *)( TIMER3_BASE + LDR_OFFSET );
	CRTL_R = (int *)( TIMER3_BASE + CRTL_OFFSET );

	

	*LOAD_R = glbv->timer  ;


        *CRTL_R = *CRTL_R | MODE_MASK; //Set to periodic mode
        *CRTL_R = *CRTL_R | CLKSEL_MASK; //set timer to run at 508kHz
        *CRTL_R = *CRTL_R | ENABLE_MASK; //enable timer

		pie_printf(COM2,  glbv, "\033[2;2H00:00:00.0");
	return 0;	
}
int set_timer_check(struct glbs * glbv, int timer){
	//purpose is to determine how long a loop in main takes, and how the individual actions take
	//update global delay timer for train
	//delay in ms
	volatile int *VALUE_R;
	
	//get address of timer init value

	VALUE_R = (int *)( TIMER3_BASE + VAL_OFFSET );
		glbv->timer_check[timer] = *VALUE_R;
	return 0;
}

int output_max_check(struct glbs * glbv, int timer){
	//first calculate last timer info:
	volatile int diff;
	//get address of timer init value

	int i;
	for(i=1; i< timer+1; i++){
		diff = glbv->timer_check[i-1] - glbv->timer_check[i];
		if( glbv->timer_check[i] > glbv->timer_check[i-1]) diff = 0x6d014600 - diff;
		diff /= 508;
		if(glbv->max_loop[i] < diff){
			glbv->max_loop[i] = diff;
			pie_printf(COM2, glbv, "\033[6;%dH%d", 72 +( (i - 1)  *5) , i);
			pie_printf(COM2, glbv, "\033[7;%dH%d", 72 +( (i - 1)  *5) , diff);
		}
		if(glbv->last_loop[i] != diff){
		 	glbv->last_loop[i] = diff;
			pie_printf(COM2, glbv, "\033[8;%dH     \033[8;%dH%d", 72 +( (i - 1)  *5) ,72 +( (i - 1)  *5) , diff);
		}
	}
	i = timer +1;
	diff = glbv->timer_check[0] - glbv->timer_check[i-1];
	if( glbv->timer_check[i-1] > glbv->timer_check[0]) diff = 0x6d014600 - diff;
	diff /= 508;
	if(glbv->max_loop[i] < diff){
		glbv->max_loop[i] = diff;
		pie_printf(COM2, glbv, "\033[6;%dH%d", 72 +( (i - 1)  *5) , i);
		pie_printf(COM2, glbv, "\033[7;%dH%d", 72 +( (i - 1)  *5) , diff);
	}
	if(glbv->last_loop[i] != diff){
	 	glbv->last_loop[i] = diff;
		pie_printf(COM2, glbv, "\033[8;%dH     \033[8;%dH%d", 72 +( (i - 1)  *5) ,72 +( (i - 1)  *5) , diff);
	}

	//pie_printf(COM2, glbv, "\033[%d;%dH %x", 6, 42 , diff);


/*
	if(glbv->max_loop < diff){
		 glbv->max_loop = diff;
		pie_printf(COM2, glbv, "\033[%d;%dH %c", 7, 62 +( (sw - 1)  *5) , c);
	}

	if(glbv->last_loop != diff){
		 glbv->last_loop = diff;
		pie_printf(COM2, glbv, "\033[6;72H MAX LOOP:%d", diff);
		pie_printf(COM2, glbv, "\033[%d;%dH",TERMINAL_HEIGHT-2, 3+ glbv->command_length); 
	}
*/
return 0;
}



//
int update_switch(struct glbs * glbv, int sw,int swd){

	if(sw <= 9){
		char c;
		if( swd == 0x22) c = 'C';
		else
		c = 'S';

		pie_printf(COM2, glbv, "\033[%d;%dH %c", 7, 22 +( (sw - 1)  *5) , c);
	}
	else if(sw <= 18 ){
		char c;
		if( swd == 0x22) c = 'C';
		else
		c = 'S';

		pie_printf(COM2, glbv, "\033[%d;%dH %c", 9, 22 +( (sw - 10)  *5) , c);
	}
	else if(sw <= 154){
		char c;
		if( swd == 0x22) c = 'C';
		else
		c = 'S';

		pie_printf(COM2, glbv, "\033[%d;%dH %c", 11, 22 +( (sw - 153)  *5) , c);
		if (glbv->switch_states_current[18] == glbv->switch_states_current[19] && c == 'C')
		pie_printf(COM2, glbv, "\033[%d;%dH\033[31m DOUBLE CURVE\033[0m", 11, 22 + 10 , c);
		else
		pie_printf(COM2, glbv, "\033[%d;%dH             ", 11, 22 + 10 , c);
	}
	else if(sw <= 156){
		char c;
		if( swd == 0x22) c = 'C';
		else
		c = 'S';

		pie_printf(COM2, glbv, "\033[%d;%dH %c", 13, 22 +( (sw - 155)  *5) , c);
		if (glbv->switch_states_current[21] == glbv->switch_states_current[20] && c == 'C')
		pie_printf(COM2, glbv, "\033[%d;%dH\033[31m DOUBLE CURVE\033[0m", 13, 22 + 10 , c);
		else
		pie_printf(COM2, glbv, "\033[%d;%dH             ", 13, 22 + 10 , c);
	}

		return 0;

}


int process_train_command(struct glbs * glbv){
	if(ccbuff_isEmpty(&(glbv->train_command_ccb))) return -2;
	if(ccbuff_isEmpty(!(&(glbv->COM1_ccb)))) return -3;
	if(!timer_passed(glbv,0) ) return -1; //check if delay timer has passed or not
			
		char command = 0;
		char arg1 =0; //first byte to send 
		char arg2 =0; //2nd byte to send (if valid)
		char arg3 =0; //3nd byte checks to update train speed (if valid)
			      // 0 don't update but use speed
			      // 1 update but use speed
			      // 2 use old speed
		struct ccbuffer * ccb = &(glbv->train_command_ccb);
		ccbuff_pop(ccb, &command) ;
		ccbuff_pop(ccb, &arg1) ;
		ccbuff_pop(ccb, &arg2) ;
		ccbuff_pop(ccb, &arg3) ;
		switch(command){
			case('S'):
	pie_printf(COM2,  glbv, "\033[3;8H%c %d %d",command, arg1, arg2);
				pie_putc(COM1,glbv,arg1);
				pie_putc(COM1,glbv,arg2);
				//stop/start
				if(arg2 <= 21)
				{
					glbv->switch_states_current[arg2-1]= arg1;
				}else{
					glbv->switch_states_current[arg2-135]= arg1;
				}
				update_switch(glbv, arg2,arg1);
				set_timer_delay(glbv,200,0);
				break;
			case('O'):
	pie_printf(COM2,  glbv, "\033[3;8H%c %d",command, arg1);
				pie_putc(COM1,glbv,arg1);
				set_timer_delay(glbv,150,0);

			case('I'): 
				pie_putc(COM1,glbv,arg1);
				//stop/start
				set_timer_delay(glbv,150,0);
				break;
			case('P'): 
				pie_putc(COM1,glbv,arg1);
				//query first n sensors
				//set_timer_delay(glbv,200,0);
				break;
			case('T'):
			case('L'):
				if(arg3 == 1) glbv->train_speed_current[arg2-1] = arg1; //set current speed
				if(arg3 == 2) arg1 = glbv->train_speed_current[arg2-1] ; //use old speed
	pie_printf(COM2,  glbv, "\033[3;8H%c %d %d",command, arg1, arg2);
				pie_putc(COM1,glbv,arg1);
				pie_putc(COM1,glbv,arg2);
				if(arg3 == 0  && arg1 ==0)
					//on slow down before reverse, delay for 2 seconds to allow for train to 
					//stop
					{
						set_timer_delay(glbv,3000, 0);
						set_timer_delay(glbv,3000, 1);
					}
				else
				set_timer_delay(glbv,150,0);
				break;
			default:
				break;
		}
	return 0;
}

int update_clock(struct glbs * glbv){
	volatile int *VALUE_R;

	//get address of timer init value
	VALUE_R = (int *)( TIMER3_BASE + VAL_OFFSET );
	volatile int diff;
	volatile int changed=0;
 	diff =0x6d014600 - *VALUE_R;
	diff /= 50800;
	int ds = diff % 10;
	diff /= 10;
	int sec = diff % 60;
	diff /= 60;
	int m = diff  % 60;
 	//diff = glbv->timer - new;
	
	if(ds != glbv->ds){
		glbv->ds = ds;
		pie_printf(COM2,  glbv, "\033[2;11H%d",ds);
		changed =1;
	}
	if(sec != glbv->sec){
		//pie_printf(COM2,  glbv, "\033[1;4H");
		if (sec < 10)pie_printf(COM2,  glbv, "\033[2;8H00\033[2;9H%d",sec);
		else
		pie_printf(COM2,  glbv, "\033[2;8H%d",sec);
		//pie_putw(COM2,  glbv, 2, '0' "\033[1;7H %d",pie_i2a(sec));
		glbv->sec = sec;
		changed =1;
	}
	if(m != glbv->min){
		//pie_printf(COM2,  glbv, "\033[1;4H");
		if (m < 10)pie_printf(COM2,  glbv, "\033[2;5H00\033[2;6H%d",m);
		else
		pie_printf(COM2,  glbv, "\033[2;5H%d",m);

		if (m == 0 && glbv->min != 0)
		{
			glbv->hours ++;
			glbv->hours = glbv->hours % 100;
			
			if (glbv->hours < 10) pie_printf(COM2,  glbv, "\033[2;3H%d",glbv->hours);
			else
			pie_printf(COM2,  glbv, "\033[2;2H%d",glbv->hours);

		}
		glbv->min = m;
		changed =1;
	}


		if(changed)
	pie_printf(COM2, glbv, "\033[%d;%dH",TERMINAL_HEIGHT-2, 3+ glbv->command_length); 
	
	
	
	//pie_printf(COM2,  glbv, "%x\n\r", *VALUE_R);
	//pie_printf(COM2,  glbv, "%d",sec);
	return 0;	

}


int train_init( struct glbs * glbv, int full_init){
	//first set speed 
	if(pie_setspeed(COM1, glbv, 2400) < 0) return -1;
	volatile int * high;
	high = (int *)( UART1_BASE + UART_LCRH_OFFSET );

        *high = *high | STP2_MASK; //Sets stop bits to 2
	//Note: according to EP93xx doc, LCRH must be updated for speed settings to set correctly
	//start trains while init

	if(pie_setfifo(COM1,  OFF))return -1;
	ccbuff_push(&(glbv->train_command_ccb),'I'); // I command used for stop and go 
	ccbuff_push(&(glbv->train_command_ccb),0x60);
	ccbuff_push(&(glbv->train_command_ccb),0);
	ccbuff_push(&(glbv->train_command_ccb),0); 

	push_message(glbv, "Start Trains", MESSAGE_VALID);
	flush_ccb(COM2, glbv);
	FOREVER {
		if ( ccbuff_isEmpty(&(glbv->train_command_ccb)) && ccbuff_isEmpty(&(glbv->COM1_ccb)) ) break;
		process_train_command(glbv);
		push_character(COM1,glbv);//push next char to terminal
	}


	push_message(glbv, "Setting Trains to speed 0", MESSAGE_VALID);
	flush_ccb(COM2, glbv);
	if(full_init){
	int i =0;
	//set all trains to speed 0;
	for (i=0; i <80; i++){
			ccbuff_push(&(glbv->train_command_ccb),'T'); // I command used for stop and go 
			ccbuff_push(&(glbv->train_command_ccb),0);
			ccbuff_push(&(glbv->train_command_ccb),i +1);
			ccbuff_push(&(glbv->train_command_ccb),1); 
	}
	//executes all stop train commands

	FOREVER {
		if ( ccbuff_isEmpty(&(glbv->train_command_ccb)) && ccbuff_isEmpty(&(glbv->COM1_ccb)) ) break;
		process_train_command(glbv);
		flush_ccb(COM1, glbv);
	//	push_character(COM1,glbv);//push next char to terminal
	}

	push_message(glbv, "Setting Switches", MESSAGE_VALID);
	flush_ccb(COM2, glbv);
	//set all trains to speed 0;
	for (i=0; i <18; i++){
			ccbuff_push(&(glbv->train_command_ccb),'S'); // I command used for stop and go 
			ccbuff_push(&(glbv->train_command_ccb),0x22);
			ccbuff_push(&(glbv->train_command_ccb),i +1);
			ccbuff_push(&(glbv->train_command_ccb),1); 
	
			ccbuff_push(&(glbv->train_command_ccb),'O'); //turn off solonoid
			ccbuff_push(&(glbv->train_command_ccb),0x20);
			ccbuff_push(&(glbv->train_command_ccb),0);
			ccbuff_push(&(glbv->train_command_ccb),0);

	}
	for (i=0; i <2; i++){
			ccbuff_push(&(glbv->train_command_ccb),'S'); // I command used for stop and go 
			ccbuff_push(&(glbv->train_command_ccb),0x22);
			ccbuff_push(&(glbv->train_command_ccb),153+(i*2));
			ccbuff_push(&(glbv->train_command_ccb),1); 
	
			ccbuff_push(&(glbv->train_command_ccb),'O'); //turn off solonoid
			ccbuff_push(&(glbv->train_command_ccb),0x20);
			ccbuff_push(&(glbv->train_command_ccb),0);
			ccbuff_push(&(glbv->train_command_ccb),0);

			ccbuff_push(&(glbv->train_command_ccb),'S'); // I command used for stop and go 
			ccbuff_push(&(glbv->train_command_ccb),0x21);
			ccbuff_push(&(glbv->train_command_ccb),154+(i*2));
			ccbuff_push(&(glbv->train_command_ccb),1); 
	
			ccbuff_push(&(glbv->train_command_ccb),'O'); //turn off solonoid
			ccbuff_push(&(glbv->train_command_ccb),0x20);
			ccbuff_push(&(glbv->train_command_ccb),0);
			ccbuff_push(&(glbv->train_command_ccb),0);

	}

	//executes all stop train commands

	FOREVER {
		if ( ccbuff_isEmpty(&(glbv->train_command_ccb)) && ccbuff_isEmpty(&(glbv->COM1_ccb)) ) break;
		process_train_command(glbv);
		flush_ccb(COM1, glbv);
	//	push_character(COM1,glbv);//push next char to terminal
	}
	}

			flush_command_display(glbv);


	return 0;
	
}

int main( int argc, char* argv[] ) {
	struct glbs glbv;
	glbs_init(&glbv);
	screen_init(&glbv, OFF);

	init_clock(&glbv);
	train_init(&glbv,0); //initializes UART1 to correct settings (change later to reset switches)...
	FOREVER{
	//set_timer_check(&glbv,0);
		update_clock(&glbv);
		pull_character(COM1,&glbv)  ;
		push_character(COM2,&glbv);//push next char to terminal
		push_character(COM1,&glbv);//push next char to terminal
//	set_timer_check(&glbv,1);
		process_train_command(&glbv);
//	set_timer_check(&glbv,2);
		pull_character(COM1,&glbv)  ;
//	set_timer_check(&glbv,3);
		push_character(COM2,&glbv);//push next char to terminal
		push_character(COM1,&glbv);//push next char to terminal
		//used to flush character every 10000 cycles....might cause issues in future
/*
		if(j  == 10000) {
			//busy wait 
			flush_ccb(COM2, &glbv); j = 0;
		}
*/
	//	j++;
//	set_timer_check(&glbv,4);

		pull_character(COM2,&glbv)  ;
		if(glbv.kill) break;
		pull_character(COM1,&glbv)  ;
		push_character(COM2,&glbv);
		push_character(COM1,&glbv);
//	set_timer_check(&glbv,5);
		pull_character(COM1,&glbv)  ;
		push_character(COM2,&glbv);
		push_character(COM1,&glbv);
//	set_timer_check(&glbv,6);
		poll_sensor(&glbv);
		pull_character(COM1,&glbv)  ;
		push_character(COM2,&glbv);
		push_character(COM1,&glbv);
//	set_timer_check(&glbv,7);

//	output_max_check(&glbv, 7);

	}


/*
	FOREVER{
		//push COM2 char if possible
		//if(ccbuff_isEmpty(&(glbv.COM2_ccb))) break;
		push_character(COM2,&glbv);

		//check fo COM2/command prompt char if possible
		
		if(	pull_character(COM2,&glbv) ==0) ;
		if(glbv.kill) break;
		//break;
		if(j > 1000000) break;
		j++;
	}

*/
	//clear character buffer for closing remarks
	ccbuff_init(&(glbv.COM1_ccb));
	ccbuff_init(&(glbv.COM2_ccb));
	pie_printf(COM2, &glbv, "\033[%d;1H",TERMINAL_HEIGHT+3);
	flush_ccb(COM2,&glbv);
	//bwprintf(COM2, "%d ",glbv.command_ccb.head);
//	bwprintf(COM2, "%d",glbv.command_ccb.tail);
	return 0;
}

