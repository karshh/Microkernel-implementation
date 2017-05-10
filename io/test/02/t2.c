 /*
 * t2.c
 */

#include <bwio.h>
#include <ts7200.h>
#define	TERMINAL_WIDTH 80
#define	TERMINAL_HEIGHT 30


int bwpgetc( int channel ) {
	int *flags, *data;
	unsigned char c;

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
		c = *data;
		return c;
	}
	else{ 
		return 0;
	}
}

void printBuf(char * c, int * buf_length, char * cbuf){
	bwprintf(COM2, "\033[%d;2H last character value entered %d",TERMINAL_HEIGHT,c);
	bwprintf(COM2, "\033[%d;2H>\033[K",TERMINAL_HEIGHT+1);
	bwputc( COM2, '*' );
	bwputw( COM2, TERMINAL_WIDTH -5, ' ', "*" );
	bwprintf(COM2, "\033[%d;2H>%s",TERMINAL_HEIGHT +1, cbuf);
}

int main( int argc, char* argv[] ) {
char c;
int buf_length = 0;
int buf_changed = 0;
char cbuf[TERMINAL_WIDTH-5];
	
	cbuf[0] = '\0';
	//init screenA
	bwsetfifo( COM2, OFF );
	bwprintf(COM2, "\033[2J\033[H");
	bwputw( COM2, TERMINAL_WIDTH, '*', "\n\r" );
	int i = 0;
	while(i<TERMINAL_HEIGHT) {
		bwputc( COM2, '*' );
		bwputw( COM2, TERMINAL_WIDTH -1, ' ', "*\n\r" );
		i++;
	}
	bwputw( COM2, TERMINAL_WIDTH, '*', "\n\r" );
	bwprintf(COM2, "\033[%d;2H>",TERMINAL_HEIGHT+1);

	bwprintf(COM2, "\033[?25l"); // removes cursor

	
	while(1){
		c = bwpgetc( COM2);
		if(c != 0){
			//bwputc( COM2,  c);
			if(c == 'q') break;
			if(buf_length < TERMINAL_WIDTH -5 ){
				cbuf[buf_length] = c;
				buf_length++;
				cbuf[buf_length] = '\0';
				buf_changed = 1;
			}
		}
		if(buf_changed){
/*
			bwprintf(COM2, "\033[%d;2H last character value entered %d",TERMINAL_HEIGHT,c);
			bwprintf(COM2, "\033[%d;2H>\033[K",TERMINAL_HEIGHT+1);
			bwputc( COM2, '*' );
			bwputw( COM2, TERMINAL_WIDTH -5, ' ', "*" );
			bwprintf(COM2, "\033[%d;2H>%s",TERMINAL_HEIGHT +1, cbuf);
			buf_changed = 0;
*/
			printBuf(c, buf_length, cbuf);
			buf_changed = 0;
	}
		
	
	}
	

	bwprintf(COM2, "\033[%d;1H",TERMINAL_HEIGHT+3);
	return 0;
}

