

#include "server.h"
#include "controller.h"
#include "trackGraph.h"
#include "userRequestCall.h"
#include "time.h"
#include "ui.h"




void trainLocation() {

	volatile int print = 0;
	int myTID = MyTid();
	int csTID = WhoIs("clockServer");
	int trackTID = WhoIs("trackServer");
	int dspTID = WhoIs("displayServer");
	int _tid = 0;
	char msg[80];
	int msgCap = 80;


	char rpl[80];
	int rplCap = 80;
	int rplLen = 0;

	int train = 0;
	int vel = 0;
	volatile int expsensor = 0;
	volatile int cursensor = 0;

	int curnode = 0;
	int expnode = 0;
	int expnodedist = 0;

	int prevTime = 0;
	int curTime = 0;

	// get train number.
	msg[0] = TRACK_TRLOC_NUM;
	bwassert(Send(trackTID, msg, 1, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [1].\r\n", myTID);
	train = (int) rpl[0];


	if (print) iodebug(dspTID, "D%d<%d>:Tr# %d", myTID, myTID, train);
	int dist = 0;

	int rpl0 = 0;
	int rpl1 = 0;

	prevTime = getTicks4(0);
	while(1) {
		Delay(csTID, 6); // breathing room for trackserver.
		msg[0] = TRACK_TRLOC_VEL;
		msg[1] = train;
		bwassert(Send(trackTID, msg, 2, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [2].\r\n", myTID);
		vel = (int) rpl[0];

		if (print) iodebug(dspTID, "D%d<%d>:Vel# %d", myTID+3, myTID, vel);

		msg[0] = TRACK_TRLOC_EXPSENSOR;
		msg[1] = train;
		bwassert(Send(trackTID, msg, 2, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [2].\r\n", myTID);


		rpl0 = (int) rpl[0] >= 128 ? -1 : rpl[0];
		rpl1 = (int) rpl[1] >= 128 ? -1 : rpl[1];

		if (rpl0 == -1 || rpl1 == -1) continue;
		if (print) iodebug(dspTID, "D%d<%d>:Expsensor# %d Cursensor# %d", myTID+6, myTID, rpl0, rpl1);


		if (!(expsensor == rpl0 && cursensor == rpl1)) {

			expsensor = rpl0;
			cursensor = rpl1;
			msg[0] = TRACK_NEXTNODE;
			msg[1] = cursensor;
			curnode = cursensor;
			bwassert(Send(trackTID, msg, 2, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [2].\r\n", myTID);
			rpl0 = (int) rpl[0] >= 128 ? -1 : rpl[0];
			expnode = rpl0;
			expnodedist = (rpl[1] * 100) + rpl[2];
			dist = 0;
			if (print) iodebug(dspTID, "D%d<%d>:Expnode# %d Curnode# %d", myTID+9, myTID, expnode, curnode);
		} 

		// record time and distance.
		curTime = getTicks4(0);
		dist += ((curTime - prevTime) * vel) / 1000;
		prevTime = curTime;
		if (print) iodebug(dspTID, "D%d<%d>: %d->%d Done: %d%%[dist:%d expnodedist:%d]", myTID-3, train, curnode, expnode, (dist*100)/expnodedist, dist, expnodedist);

		if ((dist*100)/expnodedist >= 100) {
			curnode = expnode;
			msg[0] = TRACK_NEXTNODE;	
			msg[1] = curnode;
			bwassert(Send(trackTID, msg, 2, rpl, rplCap) >= 0, COM2, "<trainLocation %d>: Send error [2].\r\n", myTID);
			rpl0 = (int) rpl[0] >= 128 ? -1 : rpl[0];
			expnode = rpl0;
			expnodedist = (rpl[1] * 100) + rpl[2];
			dist = 0;
		}


		//print and wait.

	}

	Exit();



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
	const int tr58 = Create(23, (void*) trainLocation);
	const int tr76 = Create(23, (void*) trainLocation);

	int trainCurrentSensor[80];
	int trainExpectedSensor[80];
	int trainDestinationSensor[80];
	int trainVelocity[80];

	// used for initializing the spawns.
	int initExpectedSensor[80]; 


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
					bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
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

					for (i = 0; i < pathLength; i++) {
						if (node[path[i]].type == Sensor) continue;
						else if (node[path[i]].type == Switch) {
							switch(node[path[i]].switchConfig) {
								case C:
									if (node[path[i]].CnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = S;
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = 33;
									commandMsg[2] = path[i] - 80;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] - 80, &t, &trainExpectedSensor[0]); //updates the display
									break;
								case S:
									if (node[path[i]].SnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = C;
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = 34;
									commandMsg[2] = path[i] - 80;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] - 80, &t, &trainExpectedSensor[0]); //updates the display
									break;
								default:
									bwassert( 0, COM2, "<trackServer>: Got an invalid single switch configuration.");
									break;
							}

						}
						else if (node[path[i]].type == MultiSwitch) {
							switch(node[path[i]].switchConfig) {
								case CS:
									if (node[path[i]].CSnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = SC;
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = 33;
									commandMsg[2] = path[i] == 99 ? 153 : 155;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 153 : 155, &t, &trainExpectedSensor[0]); //updates the display
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = 34;
									commandMsg[2] = path[i] == 99 ? 154 : 156;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 154 : 156, &t, &trainExpectedSensor[0]); //updates the display
									break;

								case SC:
									if (node[path[i]].SCnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = CS;
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = 34;
									commandMsg[2] = path[i] == 99 ? 153 : 155;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 153 : 155, &t, &trainExpectedSensor[0]); //updates the display
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = 33;
									commandMsg[2] = path[i] == 99 ? 154 : 156;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 154 : 156, &t, &trainExpectedSensor[0]); //updates the display
									break;
								default:
									bwassert( 0, COM2, "<trackServer>: Got an invalid multi switch configuration.");
									break;

							}
						} else {
							bwassert( 0, COM2, "<trackServer>: Got an invalid node.");

						}
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



void trackview() {


	char msg[80];


	while(1) {

		// send call


		switch ((int) msg[0]) {
			case 1:
				break;
			case 2:
				break;
			case 3:
				break;
			case 4:
				break;
			case 5:
				break;
			case 6:
				break;
			case 7:
				break;
			case 8:
				break;
			case 9:
				break;
			case 10:
				break;
			case 11:
				break;
			case 12:
				break;
			case 13:
				break;
			case 14:
				break;
			case 15:
				break;
			case 16:
				break;
			case 17:
				break;
			case 18:
				break;
			case 19:
				break;
			case 20:
				break;
			case 21:
				break;
			case 22:
				break;
			case 23:
				break;
			case 24:
				break;
			case 25:
				break;
			case 26:
				break;
			case 27:
				break;
			case 28:
				break;
			case 29:
				break;
			case 30:
				break;
			case 31:
				break;
			case 32:
				break;
			case 33:
				break;
			case 34:
				break;
			case 35:
				break;
			case 36:
				break;
			case 37:
				break;
			case 38:
				break;
			case 39:
				break;
			case 40:
				break;
			case 41:
				break;
			case 42:
				break;
			case 43:
				break;
			case 44:
				break;
			case 45:
				break;
			case 46:
				break;
			case 47:
				break;
			case 48:
				break;
			case 49:
				break;
			case 50:
				break;
			case 51:
				break;
			case 52:
				break;
			case 53:
				break;
			case 54:
				break;
			case 55:
				break;
			case 56:
				break;
			case 57:
				break;
			case 58:
				break;
			case 59:
				break;
			case 60:
				break;
			case 61:
				break;
			case 62:
				break;
			case 63:
				break;
			case 64:
				break;
			case 65:
				break;
			case 66:
				break;
			case 67:
				break;
			case 68:
				break;
			case 69:
				break;
			case 70:
				break;
			case 71:
				break;
			case 72:
				break;
			case 73:
				break;
			case 74:
				break;
			case 75:
				break;
			case 76:
				break;
			case 77:
				break;
			case 78:
				break;
			case 79:
				break;
			case 80:
				break;
			case 81:
				break;
			case 82:
				break;
			case 83:
				break;
			case 84:
				break;
			case 85:
				break;
			case 86:
				break;
			case 87:
				break;
			case 88:
				break;
			case 89:
				break;
			case 90:
				break;
			case 91:
				break;
			case 92:
				break;
			case 93:
				break;
			case 94:
				break;
			case 95:
				break;
			case 96:
				break;
			case 97:
				break;
			case 98:
				break;
			case 99:
				break;
			case 100:
				break;
			default:
				break;
		}
	}
}
