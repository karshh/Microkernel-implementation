

#include "server.h"
#include "controller.h"
#include "trackGraph.h"
#include "userRequestCall.h"
#include "time.h"
#include "ui.h"


int shortEdge(TrackGraph * t, int sensor) {

	TrackGraphNode * node = t->node;

	return node[sensor].nextNodeDistance < 200;
}


void trackServer() {

	bwassert(!RegisterAs("trackServer"), COM2, "Failed to register trackServer.\r\n");
	int commandServerTID = WhoIs("commandServer");
	bwassert(commandServerTID >= 0, COM2, "Failed to get CommandServerTID.\r\n");

	int dspTID = WhoIs("displayServer");

	int trainTID = WhoIs("trainServer");
	while (trainTID < 0) {
		Pass();
		trainTID = WhoIs("trainServer");
	}
	int csTID = WhoIs("clockServer");

	TrackGraph t;
	TrackGraphInit(&t);
	TrackGraphNode * node = t.node;

	trackNextSensorstruct tns; //struct decleration in server.h
	const int tr58 = -1; //Create(23, (void*) trainLocation);
	const int tr76 = -1; //Create(23, (void*) trainLocation);

	int trainCurrentSensor[80];
	int trainExpectedSensor[80];
	int trainDestinationSensor[80];
	int trainSpeed[80];
	int trainVelocity[80];
	// reserve sensor and switch nodes here.
	int trackReservation[102];

	// used for initializing the spawns.
	int initExpectedSensor[80]; 


	int tr58switches[20];
	int tr58switchConfig[20];
	int tr58switchCount = 0;
	int tr69switches[20];
	int tr69switchConfig[20];
	int tr69switchCount = 0;
	int tr70switches[20];
	int tr70switchConfig[20];
	int tr70switchCount = 0;
	int tr76switches[20];
	int tr76switchConfig[20];
	int tr76switchCount = 0;


	int * trSwitches = 0;
	int * trSwitchConfig = 0;
	int * trSwitchCount = 0;


    int _tid = -1;
    char msg[64];
    int msgCap = 64;
    int msgLen = -1;

    char commandMsg[8];
    char rpl[32];
    int rpllen = 32;
    char dspMsg[128];

    volatile int i = 0;
	volatile int j = 0;


	for (i=0; i < 80; i++){
		trainCurrentSensor[i] = 0;
		trainExpectedSensor[i] = 0;
		trainDestinationSensor[i] = 0;
		trainSpeed[i] = 0;
		trainVelocity[i] = 0;
		initExpectedSensor[i] = 0;
	}


	for (i=0; i < 102; i++){
		trackReservation[i] = 0;
	}


	int prevSensor = 0;
	int curSensor = 0;
	int nextSensor = 0;
	int prevSensorTime = 0;
	int curSensorTime = 0;
	volatile int curSensorTimeT = 0;
	volatile int prevSensorTimeT = 0;
	int distSensor = 0;


	int train = 0;
	int speed = 0;
	int sens = 0;
	int dist = 0;
	int sw = 0;
	int swd = 0;

	while(1) {

		msgLen = Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<trackServer>: Receive error.\r\n");

		switch((int) msg[0]) {
			case TRACK_TR:
					msg[0] = COMMAND_TR;
					speed = msg[1];
					train = msg[2];
					bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
					if (rpl[0] == '1') trainSpeed[train] = speed;
	        		Reply(_tid, rpl, 2);
	        		break;

			case TRACK_GETNEXTSENSOR:
					tns.curSensor = msg[1];	
					tns.nextSensor = findNextSensor(&t, tns.curSensor, &(tns.dist)); //return -1 if i'm at a dead end and there are no more sensors on this route
					iodebug(dspTID, "D24GETNEXTSENSOR cur:%d, next:%d, dist:%d",tns.curSensor, tns.nextSensor, tns.dist);
		        		Reply(_tid, (char*)&tns, sizeof(trackNextSensorstruct)); //send the nextSEnsor Stuct (12 bytes). Note no need to format integers into characters, just send raw bytes.
					break;
			case TRACK_TRLOC_NUM:
				if (_tid == tr58) {
					rpl[0] = 58;
					Reply(_tid, rpl, 1);
					break;
				}
				if (_tid == tr76) {
					rpl[0] = 76;
					Reply(_tid, rpl, 1);
					break;
				}

				bwassert(0, COM2, "<trackServer>: Illegal spawn %d.", _tid);
				break;

			case TRACK_TRLOC_VEL:
				rpl[0] =  trainVelocity[(int) msg[1]];
				Reply(_tid, rpl, 1);
				break;

			case TRACK_TRLOC_EXPSENSOR:
				if (trainExpectedSensor[(int) msg[1]] == 0) {
					initExpectedSensor[(int) msg[1]] = _tid;
				} else {
					rpl[0] =  trainExpectedSensor[(int) msg[1]];
					rpl[1] =  trainCurrentSensor[(int) msg[1]];
					Reply(_tid, rpl, 2);
				}
				break;

			case TRACK_INITSW:

				//init switches
				for (i=1; i <= 18; i++){
					node[i+80].switchConfig = C;
					commandMsg[0] = COMMAND_SW;
					commandMsg[1] = node[i+80].switchConfig == S ? 33 : 34;
					commandMsg[2] = i;
					commandMsg[3] = 0;

					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
					update_switch(i, &t, &trainExpectedSensor[0]); //updates the display
				}

				for (i = 99; i <= 100; i++) {

					node[i].switchConfig = CS;
					commandMsg[0] = COMMAND_SW;
					commandMsg[1] = 34;
					commandMsg[2] = i == 99 ? 153 : 155;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
					
					commandMsg[0] = COMMAND_SW;
					commandMsg[1] = 33;
					commandMsg[2] = i == 99 ? 154 : 156;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
					update_switch(commandMsg[2], &t, &trainExpectedSensor[0]); //updates the display

				}
				Reply(_tid, "1", 2);
				break;

			case TRACK_VELOCITY:
				// will get to this once I begin on spawns.
				//velocity
				//sensor ping
				//
				break;

			case TRACK_NEXTNODE:
				switch(node[(int) msg[1]].type) {
					case Sensor:
						rpl[0] = node[(int) msg[1]].nextNodeIndex;
						break;
					case Switch:
						rpl[0] =  node[(int) msg[1]].switchConfig == C ? node[(int) msg[1]].CnextNodeIndex : node[(int) msg[1]].SnextNodeIndex;
						break;
					case MultiSwitch:
						rpl[0] =  node[(int) msg[1]].switchConfig == CS ? node[(int) msg[1]].CSnextNodeIndex : node[(int) msg[1]].CSnextNodeIndex;
						break;
					default:
						bwassert(0, COM2, "<trackServer> Invalid index %d.\r\n", msg[1]);
						break;

				}
				i =  getEdgeDistance(&t, (int) msg[1], (int) rpl[0]);
				rpl[1] = i / 100;
				rpl[2] = i % 100;
				Reply(_tid, rpl, 3);
				// will get to this once I begin on spawns.
				break;

			case TRACK_SENSORUPDATE:

				bwassert(Send(dspTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to display server.\r\n");

				for (j = 1; j < msgLen; j++) {
					
					// i gets updated to 58, 69, 70 and 76 in the loop.
					for (i = 58; i <= 76;) {

						if (trainDestinationSensor[i] == msg[j]) {
							trainDestinationSensor[i] = 0;
							trainSpeed[i] = 0;
							commandMsg[0] = COMMAND_TR;
							commandMsg[1] = 0;
							commandMsg[2] = i;
							commandMsg[3] = 0;
							bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
							msg[0] = COMMAND_TR;
							msg[1] = 0;
							msg[2] = i;
							bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
							iodebug(dspTID, "D1\033[s\033[%d;47H   \033[u", i - 52);

						}

						if (trainExpectedSensor[i] != 0 && (trainExpectedSensor[i] == msg[j] || msg[j] == findNextSensor(&t,trainExpectedSensor[i], &distSensor))) {

							// release tracksegments.
							volatile int k = 0;
							for (; k < 102; k++) if (trackReservation[k] == i) trackReservation[k] = 0;

							trainCurrentSensor[i] = msg[j];
							trainExpectedSensor[i] = findNextSensor(&t, msg[j], &distSensor);


							dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
							dspMsg[1] = i;
							dspMsg[2] = trainExpectedSensor[i];
							dspMsg[3] = 0;
							bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");

							trackReservation[trainCurrentSensor[i]] = i;	
							int farSensor = findNextSensor(&t, trainExpectedSensor[i], &distSensor);
							if (trackReservation[trainExpectedSensor[i]] == 0 && trackReservation[farSensor] == 0) {
								trackReservation[trainExpectedSensor[i]] = i;
								trackReservation[node[trainExpectedSensor[i]].inverse] = i;
								trackReservation[farSensor] = i;
								trackReservation[node[farSensor].inverse] = i;
								iodebug(dspTID, "D%d\033[s%d:%2d & %2d\033[u", i-52, i, trainExpectedSensor[i], farSensor);

							} else {
								trainSpeed[i] = 0;
								commandMsg[0] = COMMAND_TR;
								commandMsg[1] = 0;
								commandMsg[2] = i;
								commandMsg[3] = 0;
								bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
								msg[0] = COMMAND_TR;
								msg[1] = 0;
								msg[2] = i;
								bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
							}
							
							if (i == 58) {
								trSwitches = tr58switches;
								trSwitchConfig = tr58switchConfig;
								trSwitchCount = &tr58switchCount;
							} else if (i == 69) {
								trSwitches = tr69switches;
								trSwitchConfig = tr69switchConfig;
								trSwitchCount = &tr69switchCount;
							} else if (i == 70) {
								trSwitches = tr70switches;
								trSwitchConfig = tr70switchConfig;
								trSwitchCount = &tr70switchCount;
							} else {
								trSwitches = tr76switches;
								trSwitchConfig = tr76switchConfig;
								trSwitchCount = &tr76switchCount;
							}

							int rev = *trSwitchCount > 0 && node[node[trainCurrentSensor[i]].inverse].nextNodeIndex == trSwitches[*trSwitchCount - 1];
							if (*trSwitchCount > 0 && 
								((node[trainExpectedSensor[i]].nextNodeIndex == trSwitches[*trSwitchCount - 1] && shortEdge(&t, trainExpectedSensor[i])) || 
									node[trainCurrentSensor[i]].nextNodeIndex == trSwitches[*trSwitchCount - 1] ||
									node[node[trainCurrentSensor[i]].inverse].nextNodeIndex == trSwitches[*trSwitchCount - 1])) {

								if (trSwitches[*trSwitchCount - 1] <= 98) {
									node[trSwitches[*trSwitchCount - 1]].switchConfig = trSwitchConfig[*trSwitchCount - 1] == 33 ? S : C;
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = trSwitchConfig[*trSwitchCount - 1];
									commandMsg[2] = trSwitches[*trSwitchCount - 1] - 80;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(trSwitches[*trSwitchCount - 1] - 80, &t, &trainExpectedSensor[0]); //updates the display	
								} else {
									node[trSwitches[*trSwitchCount - 1]].switchConfig = trSwitchConfig[*trSwitchCount - 1] == 1 ? SC : CS;
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = trSwitchConfig[*trSwitchCount - 1] == 1 ? 33 : 34;
									commandMsg[2] = trSwitches[*trSwitchCount - 1] == 99 ? 153 : 155;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = trSwitchConfig[*trSwitchCount - 1] == 1 ? 34 : 33;
									commandMsg[2] = trSwitches[*trSwitchCount - 1] == 99 ? 154 : 156;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(trSwitches[*trSwitchCount - 1] == 99 ? 154 : 156, &t, &trainExpectedSensor[0]); //updates the display	
								}

								*trSwitchCount -= 1;


								while (*trSwitchCount > 0 && ((node[trSwitches[*trSwitchCount]].switchConfig == C && node[trSwitches[*trSwitchCount]].CnextNodeIndex == trSwitches[*trSwitchCount - 1])
															|| (node[trSwitches[*trSwitchCount]].switchConfig == S && node[trSwitches[*trSwitchCount]].SnextNodeIndex == trSwitches[*trSwitchCount - 1]))) {
									if (trSwitches[*trSwitchCount - 1] <= 98) {
										node[trSwitches[*trSwitchCount - 1]].switchConfig = trSwitchConfig[*trSwitchCount - 1] == 33 ? S : C;
										commandMsg[0] = COMMAND_SW;
										commandMsg[1] = trSwitchConfig[*trSwitchCount - 1];
										commandMsg[2] = trSwitches[*trSwitchCount - 1] - 80;
										commandMsg[3] = 0;
										bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
										update_switch(trSwitches[*trSwitchCount - 1] - 80, &t, &trainExpectedSensor[0]); //updates the display	
									} else {
										node[trSwitches[*trSwitchCount - 1]].switchConfig = trSwitchConfig[*trSwitchCount - 1] == 1 ? SC : CS;
										commandMsg[0] = COMMAND_SW;
										commandMsg[1] = trSwitchConfig[*trSwitchCount - 1] == 1 ? 33 : 34;
										commandMsg[2] = trSwitches[*trSwitchCount - 1] == 99 ? 153 : 155;
										commandMsg[3] = 0;
										bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
										commandMsg[0] = COMMAND_SW;
										commandMsg[1] = trSwitchConfig[*trSwitchCount - 1] == 1 ? 34 : 33;
										commandMsg[2] = trSwitches[*trSwitchCount - 1] == 99 ? 154 : 156;
										commandMsg[3] = 0;
										bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
										update_switch(trSwitches[*trSwitchCount - 1] == 99 ? 154 : 156, &t, &trainExpectedSensor[0]); //updates the display	
									}

									*trSwitchCount -= 1;
								}

								if (rev) {
									iodebug(dspTID, "D1\033[s\033[%d;60HReversing train..\033[u", train - 52);

									trainExpectedSensor[i] = node[trainCurrentSensor[i]].inverse;
									dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
									dspMsg[1] = i;
									dspMsg[2] = trainExpectedSensor[i];
									dspMsg[3] = 0;
									bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");

									commandMsg[0] = COMMAND_RV;
									commandMsg[1] = i;
									bwassert(Send(commandServerTID, commandMsg, 2, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
								}

							} 
						}

						if (i == 58) {
							i = 69;
						} else if (i == 69) {
							i = 70;
						} else if (i == 70) {
							i = 76;
						} else {
							i = 99;
						}
					}
				}
				Reply(_tid, "1", 2);
				break;

			case TRACK_IS:

				train = msg[1];
				sens = msg[2];


				if (train >= 58 && train < 80) {

					// track reservation code.
					
					// release tracksegments.
					volatile int k = 0;
					for (; k < 102; k++) if (trackReservation[k] == i) trackReservation[k] = 0;

					
					if (trackReservation[sens] != 0 || trackReservation[node[sens].nextNodeIndex] != 0) {
						// track segment is reserved. Decline the IS command.
						Reply(_tid, "0", 2);
						break;
					}

					//iodebug(dspTID, "D1\033[s\033[%d;60H%d & %d\033[u", train - 52, sens, node[sens].nextNodeIndex);
					trainCurrentSensor[train] = -1;
					trainExpectedSensor[train] = sens;	

					trackReservation[trainExpectedSensor[train]] = train;
					trackReservation[node[trainExpectedSensor[train]].inverse] = train;

					if (initExpectedSensor[train]) {
						rpl[0] = sens;
						rpl[1] = -1;
						Reply(initExpectedSensor[train], rpl, 2);
						initExpectedSensor[train] = 0;
					}
					dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
					dspMsg[1] = train;
					dspMsg[2] = trainExpectedSensor[train];
					dspMsg[3] = 0;
					bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");
				}
				Reply(_tid, "1", 2);
				break;

			case TRACK_SS:

				train = msg[1];
				sens = msg[2];
				dist = (msg[3] * 1000000) + (msg[4] * 10000) + (msg[5] * 100) + msg[6];

				
				if (train >= 58 && train < 80) {
					if (sens == 90 ){
					 // Next sensor
						sens = trainExpectedSensor[train];
					}

					int path[102];
					int pathLength = 0;

					int exclusionList[100];
					int exclusionListLength = 0;
					if (!getShortestPathPlus(&t, trainExpectedSensor[train], sens, path, &pathLength, exclusionList, exclusionListLength)) {
						Reply(_tid, "0", 2);
						break;
					}
					
					//Send path info to velocity server here
					trainDestinationSensor[train] = sens;

					if (train == 58) {
						trSwitches = tr58switches;
						trSwitchConfig = tr58switchConfig;
						trSwitchCount = &tr58switchCount;
					} else if (train == 69) {
						trSwitches = tr69switches;
						trSwitchConfig = tr69switchConfig;
						trSwitchCount = &tr69switchCount;
					} else if (train == 70) {
						trSwitches = tr70switches;
						trSwitchConfig = tr70switchConfig;
						trSwitchCount = &tr70switchCount;
					} else {
						trSwitches = tr76switches;
						trSwitchConfig = tr76switchConfig;
						trSwitchCount = &tr76switchCount;

					}

					*trSwitchCount = 0;

					for (i = 0; i < pathLength; i++) {


						if (node[path[i]].type == Sensor) continue;
						else if (node[path[i]].type == Switch) {
							trSwitches[*trSwitchCount] = path[i];
							trSwitchConfig[*trSwitchCount] = node[path[i]].SnextNodeIndex == path[i-1] ? 33 : 34;
							*trSwitchCount += 1;
						} 
						else if (node[path[i]].type == MultiSwitch) {
							trSwitches[*trSwitchCount] = path[i];
							trSwitchConfig[*trSwitchCount] = (node[path[i]].SCnextNodeIndex == path[i-1]) ? 1 : 2;
							*trSwitchCount += 1;

						} else {
							bwassert( 0, COM2, "<trackServer>: Got an invalid node.");

						}


						//iodebug(dspTID, "D2switchCount=%d trSwitches[0]=%d,%d,%d trSwitchConfig[0]=%d,%d,%d", *trSwitchCount, trSwitches[*trSwitchCount-1],trSwitches[*trSwitchCount-2],trSwitches[*trSwitchCount-3], trSwitchConfig[*trSwitchCount-1], trSwitchConfig[*trSwitchCount-2], trSwitchConfig[*trSwitchCount-3]);	
					}

					iodebug(dspTID, "D1\033[s\033[%d;47H%c%d%d\033[u", train - 52, ((sens-1)/16)+'A',((sens-1)%16+1)/10, ((sens-1)%16+1)%10);
				} 
				Reply(_tid, "1", 2);
		        break;


		    case TRACK_SW:

				sw = msg[1];
				swd = msg[2];
				if(sw <= 18) {
					node[80+sw].switchConfig = swd == 'C' ? C : S;

				} else if (sw == 19) {
				//for mutliswitch nodes 19-20 (19 = 153/154 and 20 = 155/156, D = CS and T = SC
				// CC and SS are invalid states (perhaps SS might be needed for reversing?)
						node[99].switchConfig = swd == 'D' ? CS : SC;
				} else if (sw == 20) {
						node[100].switchConfig = swd == 'D' ? CS : SC;

				}
				if(sw < 19){
					commandMsg[0] = COMMAND_SW;
					commandMsg[1] = swd == 'S' ? 33 : 34;
					commandMsg[2] = sw;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
					update_switch(sw, &t, &trainExpectedSensor[0]); //updates the display
				}else if(sw == 19){
					//s == 33 , C = 34
					//D = CS = 34:33	 T = SC = 33:34


					commandMsg[0] = COMMAND_SW; 
					commandMsg[1] = swd == 'D' ? 34 : 33;
					commandMsg[2] = 153;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

					commandMsg[0] = COMMAND_SW;
					commandMsg[1] = swd == 'D' ? 33 : 34; 
					commandMsg[2] = 154;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
					update_switch(154 , &t, &trainExpectedSensor[0]); //updates the display

					//update_switch(sw, &t, &trainExpectedSensor[0]); //updates the display

				}else if(sw == 20){
					//s == 33 , C = 34
					//D = CS = 34:33	 T = SC = 33:34


					commandMsg[0] = COMMAND_SW; 
					commandMsg[1] = swd == 'D' ? 34 : 33;
					commandMsg[2] = 155;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");

					commandMsg[0] = COMMAND_SW;
					commandMsg[1] = swd == 'D' ? 33 : 34; 
					commandMsg[2] = 156;
					commandMsg[3] = 0;
					bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
					update_switch(156, &t, &trainExpectedSensor[0]); //updates the display

					//update_switch(sw, &t, &trainExpectedSensor[0]); //updates the display

				}
				Reply(_tid, "1", 2);
				break;

			default:
				bwassert(0, COM2, "<trackServer>:Invalid code %d\r\n", msg[0]);
				break;
		}
	}
}

