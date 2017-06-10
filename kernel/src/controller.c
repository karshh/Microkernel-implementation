#include "controller.h"

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
#define DFA_SENSOR_PING 90


int parseCommand(char * input, int * arg1, int * arg2){
	int state = DFA_INIT;
	int terminator = 0;
	int counter = 0; //?
	int train=0;
	int speed =0;
	int sw = 0; //switch
	char swd =0;
	//if character is null terminator, its a empty string
	if(input[0] == '\0') { return COMMAND_EMPTY;}
	while(1){
		//if(input[counter] == '\0') { state = -2; break;}
		state = nextState(state,input[counter], &terminator, &train, &speed, &sw, &swd);
		if(state < 0 ) 
			break;
		if(input[counter+1] == '\0')
			 break;
		counter ++;
	}

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
						//assume train is at speed 0;
						*arg1 = train;
/*
						ccbuff_push(&(glbv->train_command_ccb),'L');
						ccbuff_push(&(glbv->train_command_ccb),16);
						ccbuff_push(&(glbv->train_command_ccb),train);
						ccbuff_push(&(glbv->train_command_ccb),1);
*/
						return COMMAND_LI;
						break;
					case(DFA_RV_1):
					case(DFA_RV_2):
					case(DFA_RV_3):
						//Reverses train
						//go to speed 0

						*arg1 = train;
/*
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
*/
						return COMMAND_RV;
						break;

					case(DFA_TR_1):
					case(DFA_TR_2):
					case(DFA_TR_3):
						//sets speed of train
						*arg1 = train;
						*arg2 = speed;
/*						
						ccbuff_push(&(glbv->train_command_ccb),'T');
						ccbuff_push(&(glbv->train_command_ccb),speed);
						ccbuff_push(&(glbv->train_command_ccb),train);
						ccbuff_push(&(glbv->train_command_ccb),1);
*/
						return COMMAND_TR;
						break;
					case(DFA_SW_1):

						*arg1 = sw;
						*arg2 = swd;
/*
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
*/
						return COMMAND_SW;
						break;
					case(DFA_SENSOR_PING):
						//poll_sensor(glbv);
						return COMMAND_PN;
						break;
	
					default:
						break;
			}
	}else{
		return COMMAND_INVALID;

	}
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


