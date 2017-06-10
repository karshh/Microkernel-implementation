

#ifndef _CONTROLLER_
#define _CONTROLLER_

// Returns from parser
#define COMMAND_BACKSPACE 	1
#define COMMAND_CHAR	  	2
#define COMMAND_INVALID 	3
#define COMMAND_EMPTY		4
#define COMMAND_Q 		  	10 //quit macro
#define COMMAND_SW			11 //change switch
#define COMMAND_RV 			12 //reverse train
#define COMMAND_TR 			13 //set train speed   "
#define COMMAND_LI 			14 //turn on lights    "l TR"
#define COMMAND_PN 			15 //sensor ping       "p"
#define DISPLAY_SENSORS 	16 //for displayServer purposes
#define COMMAND_SWLOC		17 //change switch



// This is the maximum number of recent sensor triggers that are to be returned.
// Note that the actual recent sensors can be less than that number.
#define SENSOR_LIST_SIZE 22


// Passing in a integer  buffer of size 28
void getSensorData(int * s);

// This function parses the input, and then based on the command typed by the user,
// returns one of the command macros above. The menu will use the macro response to
// determine the appropriate acknowledgement message to display to the user.
//
// The parameters of the user input are to be passed into arg1 and arg2 so that the 
// View can incorporate them into the message.
int parseCommand(char * input, int * arg1, int * arg2);


int nextState(int state, char c, int * terminator, int *train, int * speed, int *sw , char *swd);

#endif



