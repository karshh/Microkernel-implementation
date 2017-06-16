#include "controller.h"
#include "userRequestCall.h"

void update_switch(int sw,int swd, int * switch_states_current){
	//updates the display
	int dspTID = WhoIs("displayServer");
	char msg[4];
	int msgLen = 4;
    char rpl[3];
    int rpllen = 3;


	if(sw <= 18 ){
			msg[0] = '0'; //no warning
			msg[1] = swd;
			msg[2] = sw-1;//position (0..17)
			msg[3] = 0;

		bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 
	}
	else if(sw <= 154){
		//warns the user if we have a double curve switch
		if (switch_states_current[18] == switch_states_current[19] && swd == 'C'){
			msg[0] = 1; // warning
			msg[1] = 'C';
			msg[2] = 18;
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 
			msg[0] = 1; // warning
			msg[1] = 'C';
			msg[2] = 19;
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

		}
		else{
			msg[0] = '0'; //no warning
			msg[1] = switch_states_current[18];
			msg[2] = 18;
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 
			msg[0] = '0'; //no warning
			msg[1] = switch_states_current[19];
			msg[2] = 19;
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 


		}
		
	//	pie_printf(COM2, glbv, "\033[%d;%dH             ", 11, 22 + 10 , c);
	}
	else if(sw <= 156){
		//warns the user if we have a double curve switch
		if (switch_states_current[20] == switch_states_current[21] && swd == 'C'){
			msg[0] = 1; // warning
			msg[1] = 'C';
			msg[2] = 20;
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 
			msg[0] = 1; // warning
			msg[1] = 'C';
			msg[2] = 21;
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

		}
		else{
			msg[0] = '0'; //no warning
			msg[1] = switch_states_current[20];
			msg[2] = 20;
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 
			msg[0] = '0'; //no warning
			msg[1] = switch_states_current[21];
			msg[2] = 21;
			msg[3] = 0;
			bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

		}

	}
}



int parseCommand(char * input, int * arg1, int * arg2){
	int trainTID = WhoIs("trainServer");
    bwassert(trainTID >= 0, COM2, "<parseCommand>: trainServer has not been set up.\r\n");
	int state = DFA_INIT;
	int terminator = 0;
	int counter = 0; //?
	int train=0;
	int speed =0;
	int sw = 0; //switch
	char swd =0;
	int sens =0;
	//if character is null terminator, its a empty string
	if(input[0] == '\0') { return COMMAND_EMPTY;}
	while(1){
		//if(input[counter] == '\0') { state = -2; break;}
		state = nextState(state,input[counter], &terminator, &train, &speed, &sw, &swd, &sens);
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
						
						msg[0] = 'L';
						msg[1] = train;
						msg[2] = '\0';
						msg[3] = '\0';
						bwassert(Send(trainTID, &msg[0], 4, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Lights command.\r\n");

						return COMMAND_LI;
						break;
					case(DFA_RV_1):
					case(DFA_RV_2):
					case(DFA_RV_3):
						//Reverses train
						msg[0] = 'R';
						msg[1] = train;
						msg[2] = '\0';
						msg[3] = '\0';
						bwassert(Send(trainTID, &msg[0], 4, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Reverse command.\r\n");

					//go to speed 0

						*arg1 = train;
						*arg2 = reply[0];
						return COMMAND_RV;
						break;

					case(DFA_TR_1):
					case(DFA_TR_2):
					case(DFA_TR_3):
						//sets speed of train
						*arg1 = train;
						msg[0] = 'T';
						msg[1] = speed;
						msg[2] = train;
						msg[3] = '\0';
						bwassert(Send(trainTID, &msg[0], 4, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Trains command.\r\n");


						*arg2 = speed;

						return COMMAND_TR;
						break;
					case(DFA_SW_1):

						*arg1 = sw;
						*arg2 = swd;

                        			msg[0] = 'S';
						msg[1] = sw;
						msg[2] = swd;
						msg[3] = '\0';
						if( sw > 18  && sw < 153)return COMMAND_INVALID;
					
						bwassert(Send(trainTID, &msg[0], 4, reply, 2) >= 0, COM2, "<Parse_Command>: Error with send Switch command.\r\n");

						return COMMAND_SW;
						break;
					case(DFA_SENSOR_PING):
						//poll_sensor(glbv);
						return COMMAND_PN;
						break;
					case(DFA_SS_1):
						*arg1 = train;
						*arg2 = sens;
						return COMMAND_SS;
						break;
					case(DFA_IS_1):
						*arg1 = train;
						*arg2 = sens;
						return COMMAND_IS;
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
int nextState(int state, char c, int * terminator, int *train, int * speed, int *sw , char *swd, int * sens){
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
                case 'i':
                    return 45; //t
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
                    return 43;//ss ### #1;
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
                    return 44;//ss ### #0[19];
                    break;
                default :
                    return DFA_ERROR;
                    break;  
            }
            break;
        case 43: //just a 'ss ### #1'
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

        default:
            return DFA_ERROR;
            break;
    } 
}


