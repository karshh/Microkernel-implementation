

#ifndef _CONTROLLER_
#define _CONTROLLER_





// Returns from parser
#define COMMAND_Q 	10
#define COMMAND_SW	11
#define COMMAND_RV 	12
#define COMMAND_TR 	13

#define COMMAND_EMPTY	2
#define COMMAND_INVALID 3


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

#endif



