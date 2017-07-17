

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


void trackServerPing() {
	int csTID = WhoIs("clockServer");
	int parentTid = MyParentTid();

	char msg[3];
	char rpl[2];
	int rpllen = 2;

	while(1) {
		Delay(csTID, 100);
		msg[0] = TRACK_CSPING;
		msg[1] = 0;
		bwassert(Send(parentTid, msg, 2, rpl, rpllen) >= 0, COM2, "<trackServerPing>: Error sending message to TrackServer[%d].\r\n", parentTid);

	}
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
	int pingTID = Create(5, (void*) trackServerPing);

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
	int trainStopDelay[80];

	int switchDecision1[80];
	int switchDecision2[80];


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
		trainStopDelay[i] = 0;
		switchDecision1[i] = 0;
		switchDecision2[i] = 0;
	}

	for (i=0; i < 102; i++){
		trackReservation[i] = 0;
	}

	int distSensor = 0;


	int train = 0;
	int speed = 0;
	int sens = 0;
	int dist = 0;
	int sw = 0;
	int swd = 0;


	// iodebug(dspTID, "D12TrackTID:%d trackPingTID:%d", MyTid(), pingTID); 
	while(1) {

		msgLen = Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<trackServer>: Receive error.\r\n");


		switch((int) msg[0]) {

			case TRACK_CSPING:
				Reply(_tid, "1", 2);
				break;

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
					// iodebug(dspTID, "D24GETNEXTSENSOR cur:%d, next:%d, dist:%d",tns.curSensor, tns.nextSensor, tns.dist);
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


						// } if (node[trainDestinationSensor[i]].inverse == msg[j]) {

						// 	trainExpectedSensor[i] = msg[j];
						// 	dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
						// 	dspMsg[1] = i;
						// 	dspMsg[2] = trainExpectedSensor[i];
						// 	dspMsg[3] = 0;
						// 	bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");

						// 	commandMsg[0] = COMMAND_RV;
						// 	commandMsg[1] = i;
						// 	bwassert(Send(commandServerTID, commandMsg, 2, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");

						// }

						if (switchDecision1[i] && findAltSensor(&t, switchDecision1[i], &distSensor) == msg[j]) {
							switchDecision2[i] = msg[j];
							switchDecision1[i] = 0;
							//iodebug(dspTID, "D10SwDec2[%d]=%d", i, switchDecision2[i]);
						} else if (switchDecision2[i] && findNextSensor(&t, switchDecision2[i], &distSensor) == msg[j]) {

							trainCurrentSensor[i] = msg[j];
							trainExpectedSensor[i] = findNextSensor(&t, trainCurrentSensor[i], &distSensor);
							//iodebug(dspTID, "D9SwMissed[%d][cur=%d,exp=%d]", i, trainCurrentSensor[i], trainExpectedSensor[i]);

							switchDecision2[i] = 0;
							// recalculate path
							iodebug(dspTID, "D1\033[s\033[%d;47H   \033[u", i - 52);
							trainSpeed[i] = i == 58 ? 9 : 8;
							msg[0] = COMMAND_TR;
							msg[1] = trainSpeed[i];
							msg[2] = i;
							bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);



							dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
							dspMsg[1] = i;
							dspMsg[2] = trainExpectedSensor[i];
							dspMsg[3] = 0;
							bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");

							

							if (trainDestinationSensor[i]) {
								int path[102];
								int pathLength = 0;

								// exclusionEdge exclusionList[100];
								// int exclusionListLength = 0;
								if (!getShortestPath(&t, trainExpectedSensor[i], trainDestinationSensor[i], path, &pathLength)) {
										iodebug(dspTID,"D10Error 1[exp=%d,dest=%d.", trainExpectedSensor[i], trainDestinationSensor[i]);
									if (i == 58) {
										if (trainDestinationSensor[i] == sensor2i("B06")) {
											trainDestinationSensor[i] = sensor2i("D14");
										} else {
											trainDestinationSensor[i] = sensor2i("B06");
										}

									} else if (i == 76) {
										if (trainDestinationSensor[i] == sensor2i("E08")) {
											trainDestinationSensor[i] = sensor2i("D12");
										} else {
											trainDestinationSensor[i] = sensor2i("E08");
										}

									} else {
										trainDestinationSensor[i] = 0;
										iodebug(dspTID, "D1\033[s\033[%d;47H!   \033[u",train- 52);
									}

									if (!getShortestPath(&t, trainExpectedSensor[i], trainDestinationSensor[i], path, &pathLength)) {
										iodebug(dspTID,"D11Error 2[exp=%d,dest=%d.", trainExpectedSensor[i], trainDestinationSensor[i]);
										Reply(_tid, "0", 2);
										break;
									}
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

								*trSwitchCount = 0;
								volatile int kp = 0;
								for (kp = 0; kp < pathLength; kp++) {

									if (node[path[kp]].type == Sensor) continue;
									else if (node[path[kp]].type == Switch) {
										trSwitches[*trSwitchCount] = path[kp];
										trSwitchConfig[*trSwitchCount] = node[path[kp]].SnextNodeIndex == path[kp-1] ? 33 : 34;
										*trSwitchCount += 1;
									} 
									else if (node[path[kp]].type == MultiSwitch) {
										trSwitches[*trSwitchCount] = path[kp];
										trSwitchConfig[*trSwitchCount] = (node[path[kp]].SCnextNodeIndex == path[kp-1]) ? 1 : 2;
										*trSwitchCount += 1;

									} else {
										bwassert( 0, COM2, "<trackServer>: Got an invalid node.");

									}
									//iodebug(dspTID, "D2switchCount=%d trSwitches[0]=%d,%d,%d trSwitchConfig[0]=%d,%d,%d", *trSwitchCount, trSwitches[*trSwitchCount-1],trSwitches[*trSwitchCount-2],trSwitches[*trSwitchCount-3], trSwitchConfig[*trSwitchCount-1], trSwitchConfig[*trSwitchCount-2], trSwitchConfig[*trSwitchCount-3]);	
								}
								iodebug(dspTID, "D1\033[s\033[%d;47H%c%d%d\033[u", i - 52, ((trainDestinationSensor[i]-1)/16)+'A',((trainDestinationSensor[i]-1)%16+1)/10, ((trainDestinationSensor[i]-1)%16+1)%10);

								if (node[trainCurrentSensor[i]].nextNodeIndex > 80) {
									switchDecision1[i] = node[trainCurrentSensor[i]].nextNodeIndex;
									//iodebug(dspTID, "D10SwDec1[%d]=%d", i, switchDecision1[i]);
								}

							}

						}

						if (trainExpectedSensor[i] != 0 && (trainExpectedSensor[i] == msg[j] || (markedOutSensor(trainExpectedSensor[i]) && msg[j] == findNextSensor(&t,trainExpectedSensor[i], &distSensor)))) {
							// iodebug(dspTID, "D10: exp:%d", trainExpectedSensor[i]);
							// release tracksegments.

							switchDecision1[i] = 0;
							switchDecision2[i] = 0;

							volatile int k = 0;
							for (; k < 102; k++) if (trackReservation[k] == i) trackReservation[k] = 0;


							trainCurrentSensor[i] = msg[j];
							trainExpectedSensor[i] = findNextSensor(&t, msg[j], &distSensor);

							if (trainDestinationSensor[i] == trainCurrentSensor[i]) {

								iodebug(dspTID, "D1\033[s\033[%d;47H   \033[u", i - 52);
								trainSpeed[i] = 0;
								msg[0] = COMMAND_TR;
								msg[1] = 0;
								msg[2] = i;
								bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
								trainStopDelay[i] = Time(csTID);


								if (i == 58) {
									if (trainDestinationSensor[i] == sensor2i("B06")) {
										trainDestinationSensor[i] = sensor2i("D14");
									} else {
										trainDestinationSensor[i] = sensor2i("B06");
									}

								} else if (i == 76) {
									if (trainDestinationSensor[i] == sensor2i("E08")) {
										trainDestinationSensor[i] = sensor2i("D12");
									} else {
										trainDestinationSensor[i] = sensor2i("E08");
									}

								} else {
									trainDestinationSensor[i] = 0;
									iodebug(dspTID, "D1\033[s\033[%d;47H!   \033[u",train- 52);
								}

								if (trainDestinationSensor[i]) {
									int path[102];
									int pathLength = 0;

									// exclusionEdge exclusionList[100];
									// int exclusionListLength = 0;
									if (!getShortestPath(&t, trainExpectedSensor[i], trainDestinationSensor[i], path, &pathLength)) {
										iodebug(dspTID,"D10Error 2.");
										Reply(_tid, "0", 2);
										break;
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

									*trSwitchCount = 0;
									volatile int kp = 0;
									for (kp = 0; kp < pathLength; kp++) {


										if (node[path[kp]].type == Sensor) continue;
										else if (node[path[kp]].type == Switch) {
											trSwitches[*trSwitchCount] = path[kp];
											trSwitchConfig[*trSwitchCount] = node[path[kp]].SnextNodeIndex == path[kp-1] ? 33 : 34;
											*trSwitchCount += 1;
										} 
										else if (node[path[kp]].type == MultiSwitch) {
											trSwitches[*trSwitchCount] = path[kp];
											trSwitchConfig[*trSwitchCount] = (node[path[kp]].SCnextNodeIndex == path[kp-1]) ? 1 : 2;
											*trSwitchCount += 1;

										} else {
											bwassert( 0, COM2, "<trackServer>: Got an invalid node.");

										}


										//iodebug(dspTID, "D2switchCount=%d trSwitches[0]=%d,%d,%d trSwitchConfig[0]=%d,%d,%d", *trSwitchCount, trSwitches[*trSwitchCount-1],trSwitches[*trSwitchCount-2],trSwitches[*trSwitchCount-3], trSwitchConfig[*trSwitchCount-1], trSwitchConfig[*trSwitchCount-2], trSwitchConfig[*trSwitchCount-3]);	
									}

									iodebug(dspTID, "D1\033[s\033[%d;47H%c%d%d\033[u", i - 52, ((trainDestinationSensor[i]-1)/16)+'A',((trainDestinationSensor[i]-1)%16+1)/10, ((trainDestinationSensor[i]-1)%16+1)%10);

								}
								

							}

							dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
							dspMsg[1] = i;
							dspMsg[2] = trainExpectedSensor[i];
							dspMsg[3] = 0;
							bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");

							trackReservation[trainCurrentSensor[i]] = i;	
							trackReservation[node[trainCurrentSensor[i]].inverse] = i;	
							int nextSensor = trainExpectedSensor[i];
							int farSensor = findNextSensor(&t, nextSensor, &distSensor);
							if (trackReservation[nextSensor] == 0 && trackReservation[farSensor] == 0) {
								trackReservation[nextSensor] = i;
								trackReservation[node[nextSensor].inverse] = i;
								trackReservation[farSensor] = i;
								trackReservation[node[farSensor].inverse] = i;
								iodebug(dspTID, "D%d\033[s%d:%2d & %2d\033[u", i-52, i, nextSensor, farSensor);

							} 
							else if (trackReservation[nextSensor] != 0) {
								iodebug(dspTID, "D%d\033[s%d:%2d!%2d[1]\033[u", i-52, i, nextSensor, farSensor);
								trainSpeed[i] = 0;
								msg[0] = COMMAND_TR;
								msg[1] = 0;
								msg[2] = i;
								bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);

								if (nextSensor != trainCurrentSensor[trackReservation[nextSensor]]) {

									iodebug(dspTID, "D%d\033[s%d:!!!!!!!!![1]\033[u", trackReservation[nextSensor]-52, trackReservation[nextSensor]);
									trainSpeed[trackReservation[nextSensor]] = 0;
									msg[0] = COMMAND_TR;
									msg[1] = 0;
									msg[2] = trackReservation[nextSensor];
									bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
								}

							}
							else {
								iodebug(dspTID, "D%d\033[s%d:%2d!%2d[2]\033[u", i-52, i, nextSensor, farSensor);
								trainSpeed[i] = 0;
								msg[0] = COMMAND_TR;
								msg[1] = 0;
								msg[2] = i;
								bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);

								if (farSensor != trainCurrentSensor[trackReservation[farSensor]]) {
									iodebug(dspTID, "D%d\033[s%d:!!!!!!!![2]\033[u", trackReservation[farSensor]-52, trackReservation[farSensor]);
									trainSpeed[trackReservation[farSensor]] = 0;
									msg[0] = COMMAND_TR;
									msg[1] = 0;
									msg[2] = trackReservation[farSensor];
									bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
								}
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

							// int rev = *trSwitchCount > 0 && node[node[trainCurrentSensor[i]].inverse].nextNodeIndex == trSwitches[*trSwitchCount - 1];
							// int nextRev = *trSwitchCount > 0 && node[node[trainExpectedSensor[i]].inverse].nextNodeIndex == trSwitches[*trSwitchCount - 1];
							// iodebug(dspTID, "D1\033[s\033[%d;60Hrev:%d[%d] nextRev:%d[%d]..\033[u", train - 51, rev, node[node[trainCurrentSensor[i]].inverse].nextNodeIndex, nextRev, node[node[trainExpectedSensor[i]].inverse].nextNodeIndex);


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


								// if (rev) {
								// 	// iodebug(dspTID, "D1\033[s\033[%d;60HReversing train..\033[u", train - 52);

								// 	trainExpectedSensor[i] = node[trainCurrentSensor[i]].inverse;
								// 	dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
								// 	dspMsg[1] = i;
								// 	dspMsg[2] = trainExpectedSensor[i];
								// 	dspMsg[3] = 0;
								// 	bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");

								// 	msg[0] = COMMAND_RV;
								// 	msg[1] = i;
								// 	bwassert(Send(trainTID, msg, 2, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
								// } else if (nextRev) {			

								// 	// iodebug(dspTID, "D1\033[s\033[%d;60HRev approach..\033[u", train - 52);	

								// 	bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
								// 	msg[0] = COMMAND_TR;
								// 	msg[1] = 4;
								// 	msg[2] = i;
								// 	bwassert(Send(trainTID, msg, 3, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
								// }

							
							}



							if (node[trainCurrentSensor[i]].nextNodeIndex > 80) {
								switchDecision1[i] = node[trainCurrentSensor[i]].nextNodeIndex;
								//iodebug(dspTID, "D10SwDec1[%d]=%d", i, switchDecision1[i]);
							}

							if (trainDestinationSensor[i] == trainExpectedSensor[i]) {
								msg[0] = COMMAND_TR;
								msg[1] = i == 76 ? 3 : 4;
								msg[2] = i;
								bwassert(Send(trainTID, msg, 3, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);

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

				// track reservation code.
				
				// release tracksegments.
				{
					volatile int k = 0;
					for (; k < 102; k++) if (trackReservation[k] == train) trackReservation[k] = 0;
				}

				
				if (trackReservation[sens] != 0) {
					// track segment is reserved. Decline the IS command.
					iodebug(dspTID,"D10Error 1.");
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

				if (train == 58) {
					if (trainDestinationSensor[train] == sensor2i("B06")) {
						trainDestinationSensor[train] = sensor2i("D14");
					} else {
						trainDestinationSensor[train] = sensor2i("B06");
					}

					trainSpeed[train] = train == 58 ? 9 : 8;
					msg[0] = COMMAND_TR;
					msg[1] = trainSpeed[train];
					msg[2] = train;
					bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);

				} else if (train == 76) {
					if (trainDestinationSensor[train] == sensor2i("E08")) {
						trainDestinationSensor[train] = sensor2i("D12");
					} else {
						trainDestinationSensor[train] = sensor2i("E08");
					}
					trainSpeed[train] = train == 58 ? 9 : 8;
					msg[0] = COMMAND_TR;
					msg[1] = trainSpeed[train];
					msg[2] = train;
					bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);

				} else {
					trainDestinationSensor[train] = 0;
					iodebug(dspTID, "D1\033[s\033[%d;47H!   \033[u",train- 52);
				}

				if (trainDestinationSensor[train]) {
					int path[102];
					int pathLength = 0;

					// exclusionEdge exclusionList[100];
					// int exclusionListLength = 0;
					if (!getShortestPath(&t, trainExpectedSensor[train], trainDestinationSensor[train], path, &pathLength)) {
						iodebug(dspTID,"D10Error 2.");
						Reply(_tid, "0", 2);
						break;
					}

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

					iodebug(dspTID, "D1\033[s\033[%d;47H%c%d%d\033[u", train - 52, ((trainDestinationSensor[train]-1)/16)+'A',((trainDestinationSensor[train]-1)%16+1)/10, ((trainDestinationSensor[train]-1)%16+1)%10);

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

					// exclusionEdge exclusionList[100];
					// int exclusionListLength = 0;
					if (!getShortestPath(&t, trainExpectedSensor[train], sens, path, &pathLength)) {
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

					// if (pathLength > 1 && node[path[pathLength-2]].inverse == path[pathLength - 1]) {
					// 	trainExpectedSensor[train] = node[path[pathLength-2]].inverse;
					// 	dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
					// 	dspMsg[1] = i;
					// 	dspMsg[2] = trainExpectedSensor[train];
					// 	dspMsg[3] = 0;
					// 	bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");

					// 	msg[0] = COMMAND_RV;
					// 	msg[1] = train;
					// 	bwassert(Send(trainTID, msg, 2, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");

					// }
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
				bwassert(0, COM2, "<trackServer>:Invalid code %d from %d [trainTID=%d, commandServerTID=%d, dspTID=%d, userPrompt=%d, sensorServer=%d]\r\n", msg[0], _tid, 
					_tid == trainTID, _tid == commandServerTID, _tid == dspTID, _tid == WhoIs("userPrompt"), _tid == WhoIs("sensorServer"));
				break;
		}


		if (trainStopDelay[58] && (Time(csTID) - trainStopDelay[58]) > 250) {
			trainStopDelay[58] = 0;
			trainSpeed[58] = 9;
			msg[0] = COMMAND_TR;
			msg[1] = 9;
			msg[2] = 58;
			bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
		}


		if (trainStopDelay[76] && (Time(csTID) - trainStopDelay[76]) > 250) {
			trainStopDelay[76] = 0;
			trainSpeed[76] = 9;
			msg[0] = COMMAND_TR;
			msg[1] = 9;
			msg[2] = 76;
			bwassert(Send(trainTID, msg, msgLen, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
		}
	}
}

