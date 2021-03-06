#include "controller.h"
#include "trackGraph.h"
#include "userRequestCall.h"

void update_switch(int sw, TrackGraph * t, int * trainExpectedSensor){
	//updates the display
    int distSensor = 0;
	int dspTID = WhoIs("displayServer");
    char dspMsg[64];
	char msg[4];
	int msgLen = 4;
    char rpl[3];
    int rpllen = 3;
    TrackGraphNode * node = t->node;

    volatile int i = 0;

	if(sw <= 18 ){
			msg[0] = COMMAND_TRAIN_SWNOR; //no warning
			msg[1] = node[80+sw].switchConfig == C ? 'C' : 'S' ;
			msg[2] = sw-1;//position (0..17)
			msg[3] = 0;

		bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 


        for (i = 58; i < 80; i++) {
            if (findAltSensor(t, sw+80, &distSensor) == trainExpectedSensor[i]) {
                trainExpectedSensor[i] = findNextSensor(t, sw+80, &distSensor);
                if (trainExpectedSensor[i] <= 0) break;
                dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
                dspMsg[1] = i;
                dspMsg[2] = trainExpectedSensor[i];
                dspMsg[3] = 0;
                bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
            }
        }

	}
	else if(sw <= 154){
		msg[0] = COMMAND_TRAIN_SWNOR; //no warning
		msg[1] = node[99].switchConfig == CS ? 'C' : 'S';
		msg[2] = 18;
		msg[3] = 0;
		bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 
		msg[0] = COMMAND_TRAIN_SWNOR; //no warning
        		msg[1] = node[99].switchConfig == SC  ? 'C' : 'S';
		msg[2] = 19;
		msg[3] = 0;
		bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed.");

		for (i = 58; i < 80; i++) {
    		if (findAltSensor(t, 99, &distSensor) == trainExpectedSensor[i]) {
        			trainExpectedSensor[i] = findNextSensor(t, 99, &distSensor);
        			if (trainExpectedSensor[i] <= 0) break;
        			dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
        			dspMsg[1] = i;
        			dspMsg[2] = trainExpectedSensor[i];
        			dspMsg[3] = 0;
        			bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
    		}
		}
		
	}

	else if(sw <= 156){
		msg[0] = COMMAND_TRAIN_SWNOR; //no warning
		msg[1] = node[100].switchConfig == CS ? 'C' : 'S';
		msg[2] = 20;
		msg[3] = 0;
		bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 
		msg[0] = COMMAND_TRAIN_SWNOR; //no warning
        		msg[1] = node[100].switchConfig == SC  ? 'C' : 'S';
		msg[2] = 21;
		msg[3] = 0;
		bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed.");
        
		for (i = 58; i < 80; i++) {
    		if (findAltSensor(t, 100, &distSensor) == trainExpectedSensor[i]) {
        			trainExpectedSensor[i] = findNextSensor(t, 100, &distSensor);
    		if (trainExpectedSensor[i] <= 0) break;
    		dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
    		dspMsg[1] = i;
    		dspMsg[2] = trainExpectedSensor[i];
    		dspMsg[3] = 0;
    		bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
    		}
		}

	}

}



int parseCommand(char * input, int * arg1, int * arg2, int * arg3){
	int trainTID = WhoIs("trainServer");
    int trackTID = WhoIs("trackServer");
	int spTID = WhoIs("sensorProcessor");
    bwassert(trainTID >= 0, COM2, "<parseCommand>: trainServer has not been set up.\r\n");
	int state = DFA_INIT;
	int terminator = 0;
	int counter = 0; //?
	int train=0;
	int speed =0;
	int sw = 0; //switch
	char swd =0;
	int sens =0;
	int dist = 0;
	//if character is null terminator, its a empty string
	if(input[0] == '\0') { return COMMAND_EMPTY;}
	while(1){
		//if(input[counter] == '\0') { state = -2; break;}
		state = nextState(state,input[counter], &terminator, &train, &speed, &sw, &swd, &sens, &dist);
		if(state < 0 ) 
			break;
		if(input[counter+1] == '\0')
			 break;
		counter ++;
	}

 	char msg[4] ;
 	char reply[2];

	if(state > 0 && terminator == 1){
				//push_message(glbv, "VALID COMMAND! CHOO CHOO MOTHERFUCKA!!", MESSAGE_VALID);
				switch(state){
					case(DFA_QUIT_TERMINATOR_HARD):
						Quit(); //hard quits
					case(DFA_QUIT_TERMINATOR):
						return COMMAND_Q;
					//	push_message(glbv, "Quiting!", MESSAGE_VALID);
						
						//glbv->kill =1;
						break;
					case(DFA_L_1):
					case(DFA_L_2):
					case(DFA_L_3):
						//turn on lights for train.
						*arg1 = train;
						//assume train is at speed 0;
						
						msg[0] = COMMAND_LI;
						msg[1] = train;
						bwassert(Send(trainTID, &msg[0], 2, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Lights command.\r\n");
						if(reply[0] == '1')
							 return COMMAND_LI;
						else
							 return COMMAND_LOCKEDTRAINL;
						break;
					case(DFA_TR_1):
					case(DFA_TR_2):
					case(DFA_TR_3):
						//sets speed of train
						*arg1 = train;
						*arg2 = speed;

						msg[0] = TRACK_TR;
						msg[1] = speed;
						msg[2] = train;
						bwassert(Send(trackTID, &msg[0], 3, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Trains command.\r\n");

						if(reply[0] == '1')
							 return COMMAND_TR;
						else
							 return COMMAND_LOCKEDTRAINT;
						break;

					case(DFA_RV_1):
					case(DFA_RV_2):
					case(DFA_RV_3):
						//Reverses train
						msg[0] = COMMAND_RV;
						msg[1] = train;
						bwassert(Send(trainTID, &msg[0], 2, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Reverse command.\r\n");

					//go to speed 0

						*arg1 = train;
						*arg2 = reply[0];	

						if(reply[1]-'0'){
							return COMMAND_RV;
						}
						else{
							 return COMMAND_LOCKEDTRAINR;
						}

						break;

					case(DFA_SW_1):
					case(DFA_SW_2):

						*arg1 = sw;
						*arg2 = swd;

            					msg[0] = TRACK_SW;
						msg[1] = sw;
						msg[2] = swd;
						msg[3] = '\0';
						if( sw > 20)return COMMAND_INVALID;
					
                        bwassert(Send(trackTID, msg, 4, reply, 2) >= 0, COM2, "<trainServer>: Error sending switch update to TrackServer.\r\n");

						return COMMAND_SW;
						break;
					//case(DFA_SENSOR_PING):
						//poll_sensor(glbv);
						//return COMMAND_PN;
						//break;
					case(DFA_SS_1):
					case(DFA_SS_2):
					case(DFA_SS_3):
						*arg1 = train;
						*arg2 = sens;
						*arg3 = dist;

                        			msg[0] = TRACK_SS;
                        			msg[1] = train;
                        			msg[2] = sens;
                        			msg[3] = (dist / 1000000) % 100;
                                    msg[4] = (dist / 10000) % 100;
                                    msg[5] = (dist / 100) % 100;
                                    msg[6] = dist;
                        			msg[7] = '\0';

                        bwassert(Send(trackTID, &msg[0], 7, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Init sensor command.\r\n");

						return reply[0] == '1' ? COMMAND_SS : COMMAND_SSW;
						break;
					case(DFA_IS_1):
						*arg1 = train;
						*arg2 = sens;
                        			msg[0] = TRACK_IS;
                        			msg[1] = train;
                        			msg[2] = sens;

                        			bwassert(Send(trackTID, &msg[0], 4, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Init sensor command.\r\n");

                        			 msg[0] = COMMAND_IS;
                        			 msg[1] = train;
                        			 msg[2] = sens;
                        			// bwassert(Send(trainTID, &msg[0], 3, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Init sensor command.\r\n");
                                    		return reply[0] == '1' ? COMMAND_IS : COMMAND_ISW;

						break;
					case(DFA_MP_1):
						//#define SENSOR_RAW_SINGLE 2
						*arg1 = sens;
                        			msg[0] = SENSOR_RAW_SINGLE;
                        			msg[1] = sens;

                        			bwassert(Send(spTID, &msg[0], 2, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send manual ping sensor command.\r\n");
						return COMMAND_PN;
						break;
					default:
						break;
			}
	}else{
		return COMMAND_INVALID;

	}

    // silencing warning.
    return COMMAND_INVALID;
}
/********************************************************************************************************
	DFA function
********************************************************************************************************/
int nextState(int state, char c, int * terminator, int *train, int * speed, int *sw , char *swd, int * sens, int * dist){
    switch(state){
        case DFA_INIT:
            switch(c){
	case 'p':
                    *terminator = 1;
                    return DFA_SENSOR_PING;
                 case 'Q':
                    *terminator = 1;
                    return DFA_QUIT_TERMINATOR_HARD;
                    break;
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
                    return 19; //s
                    break;  
                case 'l':
                    return 29; //l
                    break;      
                case 'i':
                    return 45; //i
                    break;
    		case 'm':
                    return 63; //m
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
             	case 's':
                    return 34;
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
		    { *sw = (*sw * 10) + (c- '0');

                    }
                    return 24;
                    break;

                case '9': 
                    { *sw = (*sw * 10) + (c- '0');

                    }
                    return 57; //sw [1][2]
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
                    { *sw = (*sw * 10) + (c- '0');
                    }
                    return 57; //sw [2][0]
                    break;
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
        case 34: //just a 'ss'
            switch(c){
                case ' ':
                    return 35;
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break; 
       case 35: //just a 'ss '
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
                    return 36; //'ss #[0-7]'                          
                    break;
                case '8':    
                    { *train = c- '0';

                    }
                    return 37;
                    break;
                case '9':
                    { *train = c- '0';

                    }
                    return 38;
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 36: //just a 'ss #[0-7]'
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
                    return 38; //'ss #[07][09]'                          
                    break;
                case ' ':    
                    return 40; //'ss #[07] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 37: //just a 'ss #[8]'
            switch(c){
                case '0':
                    { *train = (*train *10 ) + (c- '0');
                    }
                    return 39; //'ss #[8][0]'                          
                    break;
                case ' ':    
                    return 40; //'ss #[8] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;  
        case 38: //just a 'ss #[9] or ss #[07][09]'
            switch(c){
                case ' ':    
                    return 40; //'ss #[8] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break; 
        case 39: //just a 'ss #[8][0]'
            switch(c){
                case ' ':    
                    return 40; //'ss #[8][0] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break; 
        case 40: //just a 'ss ### '
            switch(c){
                case 'A':
                case 'B':
                case 'C':
                case 'D':
                case 'E':
                    { *sens = (c - 'A')*16;
                    }
                    return 41;//ss ### [ABCDE];
                    break;
                case 'N':
                    { *sens = 90;
                    }
			*dist = 0;
			*terminator = 1;
                    return 44;//ss ### [ABCDE];
                    break;

                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 41: //just a 'ss ### #'
            switch(c){
                case '0':
                    return 42;//ss ### #0;
                    break;
 
                case '1':
                    { *sens += (c - '0');
                    }
            	    *terminator = 1;
	 	    *dist = 0;
                    return 43;//ss ### #1;
                    break;
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
                    { *sens += (c - '0');
                    }

			*terminator = 1;
			*dist = 0;
                    	return 44;//ss ### #[29];
                    	break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 42: //just a 'ss ### #0'
            switch(c){
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    { *sens += (c - '0');
                    }
                    *terminator = 1;
		    *dist = 0;
                    return 44;//ss ### #0[19];
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 43: //just a 'ss ### #1'
            switch(c){
		case ' ':
                    *terminator = 0;
		    *dist = 0;
                    return 62;//'ss ### #1 '
                    break;
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                    { *sens -= 1;
                     *sens += (c - '0')+10;
                    }
		    *dist = 0;
                    *terminator = 1;
                    return 44;//ss ### #1[06];
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 45: //just a i
            switch(c){
                case 's':
                    return 46; //is
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 46: //just a is
            switch(c){
                case ' ':
                    return 47; //'is '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
       case 47: //just a 'ss '
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
                    return 48; //'ss #[0-7]'                          
                    break;
                case '8':    
                    { *train = c- '0';

                    }
                    return 49;
                    break;
                case '9':
                    { *train = c- '0';

                    }
                    return 50;
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 48: //just a 'ss #[0-7]'
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
                    return 50; //'ss #[07][09]'                          
                    break;
                case ' ':    
                    return 52; //'ss #[07] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 49: //just a 'ss #[8]'
            switch(c){
                case '0':
                    { *train = (*train *10 ) + (c- '0');
                    }
                    return 51; //'ss #[8][0]'                          
                    break;
                case ' ':    
                    return 52; //'ss #[8] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;  
        case 50: //just a 'ss #[9] or ss #[07][09]'
            switch(c){
                case ' ':    
                    return 52; //'ss #[8] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break; 
        case 51: //just a 'ss #[8][0]'
            switch(c){
                case ' ':    
                    return 52; //'ss #[8][0] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break; 
        case 52: //just a 'ss ### '
            switch(c){
                case 'A':
                case 'B':
                case 'C':
                case 'D':
                case 'E':
                    { *sens = (c - 'A')*16;
                    }
                    return 53;//ss ### [ABCDE];
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 53: //just a 'ss ### #'
            switch(c){
                case '0':
                    return 54;//ss ### #0;
                    break;
 
                case '1':
                    return 55;//ss ### #1;
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 54: //just a 'ss ### #0'
            switch(c){
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    { *sens += (c - '0');
                    }
                    *terminator = 1;
                    return 56;//ss ### #0[19];
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 55: //just a 'ss ### #1'
            switch(c){
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                    { *sens += (c - '0')+10;
                    }
                    *terminator = 1;
                    return 56;//ss ### #1[06];
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 57: //just a 'sw [[19][20]]'
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
                    return 26; // 'sw 19#' or 'sw 20#'
                    break;
                case ' ':
                    return 58;//'sw [[19][20]] '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 58: //just a 'sw [[19][20]] '
            switch(c){
                case 'C':
                   return 59; // 'sw 19/20 C'
                    break;
                case 'S':
                    return 60;//'sw 19/20 S'
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
        case 59: //just a 'sw [[19][20]] C'
            switch(c){
                case 'S':
                    *terminator = 1;
                    *swd = 'D';
                    return 61;//'sw 19/20 S'
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 60: //just a 'sw [[19][20]] S'
            switch(c){
                case 'C':
                    *terminator = 1;
                    *swd = c;
                    *swd = 'T';
                    return 61;//'sw 19/20 SC'
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 44: //just a 'ss ### ###'
            switch(c){
                case ' ':
                    *terminator = 0;
		    *dist = 0;
                    return 62;//'ss ### ### '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
        case 62: //just a 'ss ### ### [#]^[0-*]'
            switch(c){
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                case '0':
                    *terminator = 1;
		    *dist = *dist *10 + (c-'0');
                    return 62;//'ss ### ### [#]^[1-*]'
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 63: //just a m
            switch(c){
                case 'p':
                    return 64; //mp
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 64: //just a mp
            switch(c){
                case ' ':
                    return 65; //'mp '
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 65: //just a 'mp '
            switch(c){
                case 'A':
                case 'B':
                case 'C':
                case 'D':
                case 'E':
                    { *sens = (c - 'A')*16;
                    }
                    return 66;//mp [ABCDE];
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 66: //just a 'mp [A-E]'
            switch(c){
                case '0':
                    return 67;//mp #0;
                    break;
 
                case '1':
                    return 68;//mp #1;
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 67: //just a 'mp #0'
            switch(c){
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    { *sens += (c - '0');
                    }
                    *terminator = 1;
                    return 69;//mp #0[19];
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 68: //just a 'mp #1'
            switch(c){
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                    { *sens += (c - '0')+10;
                    }
                    *terminator = 1;
                    return 69;//mp #1[06];
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


