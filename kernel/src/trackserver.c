

#include "server.h"
#include "controller.h"
#include "trackGraph.h"
#include "userRequestCall.h"
#include "time.h"
#include "ui.h"




// void trainLocation() {

// 	volatile int print = 0;
// 	int myTID = MyTid();
// 	int csTID = WhoIs("clockServer");
// 	int trackTID = WhoIs("trackServer");
// 	int dspTID = WhoIs("displayServer");
// 	int _tid = 0;
// 	char msg[80];
// 	int msgCap = 80;


// 	char rpl[80];
// 	int rplCap = 80;
// 	int rplLen = 0;

// 	int train = 0;
// 	int vel = 0;
// 	volatile int expsensor = 0;
// 	volatile int cursensor = 0;

// 	int curnode = 0;
// 	int expnode = 0;
// 	int expnodedist = 0;

// 	int prevTime = 0;
// 	int curTime = 0;

// 	int reservations[80];

// 	// get train number.
// 	msg[0] = TRACK_TRLOC_NUM;
// 	bwassert(Send(trackTID, msg, 1, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [1].\r\n", myTID);
// 	train = (int) rpl[0];


// 	if (print) iodebug(dspTID, "D%d<%d>:Tr# %d", myTID, myTID, train);
// 	int dist = 0;

// 	int rpl0 = 0;
// 	int rpl1 = 0;
// 	int pCursor = 0;
// 	prevTime = getTicks4(0);
// 	while(1) {
// 		Delay(csTID, 6); // breathing room for trackserver.
// 		msg[0] = TRACK_TRLOC_VEL;
// 		msg[1] = train;
// 		bwassert(Send(trackTID, msg, 2, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [2].\r\n", myTID);
// 		vel = (int) rpl[0];

// 		if (print) iodebug(dspTID, "D%d<%d>:Vel# %d", myTID+3, myTID, vel);

// 		msg[0] = TRACK_TRLOC_EXPSENSOR;
// 		msg[1] = train;
// 		bwassert(Send(trackTID, msg, 2, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [2].\r\n", myTID);


// 		rpl0 = (int) rpl[0] >= 128 ? -1 : rpl[0];
// 		rpl1 = (int) rpl[1] >= 128 ? -1 : rpl[1];

// 		if (rpl0 == -1 || rpl1 == -1) continue;
// 		if (print) iodebug(dspTID, "D%d<%d>:Expsensor# %d Cursensor# %d", myTID+6, myTID, rpl0, rpl1);


// 		if (!(expsensor == rpl0 && cursensor == rpl1)) {

// 			expsensor = rpl0;
// 			cursensor = rpl1;
// 			msg[0] = TRACK_NEXTNODE;
// 			msg[1] = cursensor;
// 			curnode = cursensor;
// 			bwassert(Send(trackTID, msg, 2, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [2].\r\n", myTID);
// 			rpl0 = (int) rpl[0] >= 128 ? -1 : rpl[0];
// 			expnode = rpl0;
// 			expnodedist = (rpl[1] * 100) + rpl[2];
// 			dist = 0;

// 			if (print) {
// 				if (curnode < 80) {
// 					if (expnode <= 80) {
// 						iodebug(dspTID, "D1\033[%d;42H                              \033[%d;43H%d:%c%d%d->%c%d%d", 
// 							train-52, train-52, train, ((curnode-1)/16)+'A',((curnode-1)%16+1)/10, ((curnode-1)%16+1)%10, ((expnode-1)/16)+'A',((expnode-1)%16+1)/10, ((expnode-1)%16+1)%10);
							
// 					} else {
// 						iodebug(dspTID, "D1\033[%d;42H                              \033[%d;43H%d:%c%d%d->sw%d", train-52, train-52, train, ((curnode-1)/16)+'A',((curnode-1)%16+1)/10, ((curnode-1)%16+1)%10, expnode-80);
							
// 					}
// 				} else {
// 					if (expnode <= 80) {
// 						iodebug(dspTID, "D1\033[%d;42H                              \033[%d;43H%d:sw%d->%c%d%d", train-52, train-52,train, curnode-80, ((expnode-1)/16)+'A',((expnode-1)%16+1)/10, ((expnode-1)%16+1)%10 );
// 					} else {
// 						iodebug(dspTID, "D1\033[%d;42H                              \033[%d;43H%d:sw%d->sw%d", train-52, train-52,train, curnode-80, expnode-80);

// 					}

// 				}
// 			}
// 			if (print) iodebug(dspTID, "D%d<%d>:Expnode# %d Curnode# %d", myTID+9, myTID, expnode, curnode);
// 		} 

// 		// record time and distance.
// 		curTime = getTicks4(0);
// 		dist += ((curTime - prevTime) * vel) / 1000;
// 		prevTime = curTime;


// 		if ((dist*100)/expnodedist >= 100) {
// 			curnode = expnode;
// 			msg[0] = TRACK_NEXTNODE;	
// 			msg[1] = curnode;
// 			bwassert(Send(trackTID, msg, 2, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [2].\r\n", myTID);
// 			rpl0 = (int) rpl[0] >= 128 ? -1 : rpl[0];
// 			expnode = rpl0;
// 			expnodedist = (rpl[1] * 100) + rpl[2];
// 			dist = 0;

// 			if (print) {
// 				if (curnode < 80) {
// 						if (expnode <= 80) {
// 							iodebug(dspTID, "D1\033[%d;42H                              \033[%d;43H%d:%c%d%d->%c%d%d", 
// 								train-52, train-52, train, ((curnode-1)/16)+'A',((curnode-1)%16+1)/10, ((curnode-1)%16+1)%10, ((expnode-1)/16)+'A',((expnode-1)%16+1)/10, ((expnode-1)%16+1)%10);
								
// 						} else {
// 							iodebug(dspTID, "D1\033[%d;42H                              \033[%d;43H%d:%c%d%d->sw%d", train-52, train-52, train, ((curnode-1)/16)+'A',((curnode-1)%16+1)/10, ((curnode-1)%16+1)%10, expnode-80);
								
// 						}
// 					} else {
// 						if (expnode <= 80) {
// 							iodebug(dspTID, "D1\033[%d;42H                              \033[%d;43H%d:sw%d->%c%d%d", train-52, train-52,train, curnode-80, ((expnode-1)/16)+'A',((expnode-1)%16+1)/10, ((expnode-1)%16+1)%10 );
// 						} else {
// 							iodebug(dspTID, "D1\033[%d;42H                              \033[%d;43H%d:sw%d->sw%d", train-52, train-52,train, curnode-80, expnode-80);

// 						}

// 					}
// 				} else {
// 					iodebug(dspTID, "D1\033[%d;75H[%d%d%%]", train-52, ((dist*100)/expnodedist)/10, ((dist*100)/expnodedist) %10);
// 				}

// 			}


// 		//print and wait.

// 	}

// 	Exit();



// }



int shortEdge(TrackGraph * t, int sensor) {

	TrackGraphNode * node = t->node;

	return node[sensor].nextNodeDistance < 200;
}
void trackServer() {

	bwassert(!RegisterAs("trackServer"), COM2, "Failed to register trackServer.\r\n");
	int commandServerTID = WhoIs("commandServer");
	bwassert(commandServerTID >= 0, COM2, "Failed to get CommandServerTID.\r\n");

	int dspTID = WhoIs("displayServer");
	// int trainTID = WhoIs("trainServer");
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
	int trainVelocity[80];

	// used for initializing the spawns.
	int initExpectedSensor[80]; 


	int tr58switches[20];
	int tr58switchConfig[20];
	int tr58switchCount = 0;
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
		trainVelocity[i] = i;
		initExpectedSensor[i] = 0;
	}


	int prevSensor = 0;
	int curSensor = 0;
	int nextSensor = 0;
	int prevSensorTime = 0;
	int curSensorTime = 0;
	volatile int curSensorTimeT = 0;
	volatile int prevSensorTimeT = 0;
	int distSensor = 0;


	int train;
	int sens;
	int dist;
	int sw;
	int swd;

	while(1) {

		msgLen = Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<trackServer>: Receive error.\r\n");

		switch((int) msg[0]) {
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
					// curSensorTime = getTicks4(0); //in ms
					// curSensorTimeT = Time(csTID);
					curSensor = msg[j];
					//for train velocity model
					//get distance between the current and last sensor in most direct route.
					if(prevSensor != curSensor){
						//int path[102];
						//int pathLength = 0;
						//getShortestPath(&t,  prevSensor, curSensor,path, &pathLength);

						nextSensor = findNextSensor(&t,curSensor, &distSensor);

						// prevSensorTime = curSensorTime;
						// prevSensorTimeT = curSensorTimeT;
						prevSensor = curSensor;
					
						for (i = 58; i < 80; i++) {
							if (trainDestinationSensor[i] == msg[j]) {
	
								commandMsg[0] = COMMAND_TR;
								commandMsg[1] = 0;
								commandMsg[2] = i;
								commandMsg[3] = 0;
								bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
							}

							if (trainExpectedSensor[i] == msg[j] || msg[j] == findNextSensor(&t,trainExpectedSensor[i], &distSensor)) {
								trainCurrentSensor[i] = msg[j];
								trainExpectedSensor[i] = findNextSensor(&t, msg[j], &distSensor);
								
								if (i == 58) {
									trSwitches = tr58switches;
									trSwitchConfig = tr58switchConfig;
									trSwitchCount = &tr58switchCount;
								} else {
									trSwitches = tr76switches;
									trSwitchConfig = tr76switchConfig;
									trSwitchCount = &tr76switchCount;

								}

								if (*trSwitchCount > 0 && 
									((node[trainExpectedSensor[i]].nextNodeIndex == trSwitches[*trSwitchCount - 1] && shortEdge(&t, trainExpectedSensor[i])) || 
										node[trainCurrentSensor[i]].nextNodeIndex == trSwitches[*trSwitchCount - 1])) {

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
										//iodebug(dspTID, "D4switchCount=%d trSwitches[0]=%d trSwitchConfig[0]=%d", *trSwitchCount, trSwitches[*trSwitchCount],trSwitchConfig[*trSwitchCount]);
									}
								}
									//iodebug(dspTID, "D3switchCount=%d trSwitches[0]=%d trSwitchConfig[0]=%d", *trSwitchCount, trSwitches[*trSwitchCount],trSwitchConfig[*trSwitchCount]);	
									


								dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
								dspMsg[1] = i;
								dspMsg[2] = trainExpectedSensor[i];
								dspMsg[3] = 0;
								bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");
							}
						}
					}
				}
				Reply(_tid, "1", 2);
				break;

			case TRACK_IS:

				train = msg[1];
				sens = msg[2];
				if (train >= 58 && train < 80) {
					trainCurrentSensor[train] = -1;
					trainExpectedSensor[train] = sens;	

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
							trSwitchConfig[*trSwitchCount] = (node[path[i]].SCnextNodeIndex == path[i-1]) ? 2 : 1;
							*trSwitchCount += 1;

						} else {
							bwassert( 0, COM2, "<trackServer>: Got an invalid node.");

						}


						//iodebug(dspTID, "D2switchCount=%d trSwitches[0]=%d,%d,%d trSwitchConfig[0]=%d,%d,%d", *trSwitchCount, trSwitches[*trSwitchCount-1],trSwitches[*trSwitchCount-2],trSwitches[*trSwitchCount-3], trSwitchConfig[*trSwitchCount-1], trSwitchConfig[*trSwitchCount-2], trSwitchConfig[*trSwitchCount-3]);	
					}
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

