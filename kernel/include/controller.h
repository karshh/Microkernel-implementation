

#ifndef _CONTROLLER_
#define _CONTROLLER_

#include "trackGraph.h"
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
#define CLOCK_U 			18 //for displayServer purposes
#define DELAY_U				19 //change switch
#define COMMAND_LOADING		20
#define COMMAND_SS			21 //Stop at sensor "SS <TR> <SEN>"
#define COMMAND_IS			22 //Init at sensor "IS <TR> <SEN>"
#define COMMAND_SSW			23// Path failed.
#define COMMAND_LOCKEDTRAINL	24
#define COMMAND_LOCKEDTRAINT	25
#define COMMAND_LOCKEDTRAINR	26
#define COMMAND_SENSOREDGE		27
#define COMMAND_DEATH			28
#define ALERT_SENSORPING		29
#define COMMAND_TRAIN_INIT		30
#define COMMAND_TRAIN_SENS		31
#define COMMAND_TRAIN_SWWAR		32
#define COMMAND_TRAIN_SWNOR		33
#define VELOCITY_DEBUG			34
#define COMMAND_ISW				36 //Init at sensor "IS <TR> <SEN>"
#define COMMAND_RVT				37
#define TRACK_CSPING			38
#define COMMAND_TRBATCH			39
#define COMMAND_DEBUG			68

#define TRACK_INITSW 			1
#define TRACK_VELOCITY			2
#define TRACK_SENSORUPDATE		35
#define TRACK_SS				4
#define TRACK_IS				5
#define TRACK_SW				6
#define TRACK_TRLOC_NUM			7
#define TRACK_TRLOC_VEL			8
#define TRACK_TRLOC_EXPSENSOR	9
#define TRACK_NEXTNODE			10
#define TRACK_GETNEXTSENSOR			11 //adjust if conflict
#define TRACK_TR			12 //adjust if conflict


#define SENSOR_CURRENT_SENSOR_STATUS		1 //adjust if conflict
#define SENSOR_RAW_SINGLE 			2 //(controller.h)
#define SENSOR_REGISTER_WORKER 			5 //(controller.h)
#define SENSOR_BOOT_WORKERS 			6 //(controller.h)

#define DFA_INIT 0
#define DFA_ERROR -1
#define DFA_QUIT_TERMINATOR 1
#define DFA_TR_1 10
#define DFA_TR_2 11
#define DFA_TR_3 12
#define DFA_RV_1 16
#define DFA_RV_2 17
#define DFA_RV_3 18
#define DFA_SW_1 28 	//normal sw ## c/s
#define DFA_SW_2 61	//mutiswitch sw 19/20 CS/SC note: swd = D when CS, swd = T when SC
#define DFA_L_1 31
#define DFA_L_2 32
#define DFA_L_3 33
#define DFA_SS_1 44 //SS ### ###
#define DFA_SS_2 43 //ss ### #1
#define DFA_SS_3 62 //ss ### #1 [#]^[1-*]
#define DFA_IS_1 56 //change
#define DFA_MP_1 69 //mp <SEN>
#define DFA_QUIT_TERMINATOR_HARD 70 //HARD QUIT to test on trackless computer. (Capital Q)
#define DFA_SENSOR_PING 90



// This is the maximum number of recent sensor triggers that are to be returned.
// Note that the actual recent sensors can be less than that number.
#define SENSOR_LIST_SIZE 22


// Passing in a integer  buffer of size 28
inline int getSensorData(char * s);

// This function parses the input, and then based on the command typed by the user,
// returns one of the command macros above. The menu will use the macro response to
// determine the appropriate acknowledgement message to display to the user.
//
// The parameters of the user input are to be passed into arg1 and arg2 so that the 
// View can incorporate them into the message.
int parseCommand(char * input, int * arg1, int * arg2, int * arg3);


int nextState(int state, char c, int * terminator, int *train, int * speed, int *sw , char *swd,int *sens, int * dist);

void update_switch(int sw, TrackGraph * t, int * trainExpectedSensor);
#endif



