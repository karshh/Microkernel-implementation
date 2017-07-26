

#include "server.h"
#include "controller.h"
#include "trackGraph.h"
#include "userRequestCall.h"
#include "time.h"
#include "ui.h"


#define OUTER_LOOP_TRAIN 71

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
		Delay(csTID, 1);
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
	int pingTID = Create(10, (void*) trackServerPing);

	int trainCurrentSensor[80];
	int trainExpectedSensor[80];
	int trainSpeed[80];
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
		trainSpeed[i] = 0;
		trainVelocity[i] = 0;
		initExpectedSensor[i] = 0;
	}

	int switch15Delay = 0;
	int switch9Delay = 0;
	int tr69Delay = 0;

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

				i = Time(csTID);
				if (switch15Delay &&  (i- switch15Delay >= 145)) {
					switch15Delay = 0;
					node[95].switchConfig = S;
					commandMsg[0] = COMMAND_SW;
					commandMsg[1] = node[95].switchConfig == S ? 33 : 34;
					commandMsg[2] = 15;
					commandMsg[3] = 0;

					bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
					update_switch(15, &t, &trainExpectedSensor[0]); //updates the display
				}

				if (switch9Delay &&  (i- switch9Delay >= 60)) {
					switch9Delay = 0;
					node[89].switchConfig = S;
					commandMsg[0] = COMMAND_SW;
					commandMsg[1] = node[89].switchConfig == S ? 33 : 34;
					commandMsg[2] = 9;
					commandMsg[3] = 0;

					bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
					update_switch(9, &t, &trainExpectedSensor[0]); //updates the display
				}

				if (tr69Delay &&  (i- tr69Delay >= 1)) {
					tr69Delay = 0;
					trainSpeed[OUTER_LOOP_TRAIN] = 14;
					msg[0] = COMMAND_TR;
					msg[1] = 14;
					msg[2] = OUTER_LOOP_TRAIN;
					bwassert(Send(trainTID, msg, 3, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
				}

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
					tns.expectedSensor = findNextSensor(&t, tns.curSensor, &(tns.expectedDist)); //return -1 if i'm at a dead end and there are no more sensors on this route
					tns.followingSensor = findNextSensor(&t, tns.expectedSensor, &(tns.followingDist)); //return -1 if i'm at a dead end and there are no more sensors on this route
					if(node[node[tns.curSensor].nextNodeIndex].type == Switch){
						tns.alternateSensor = findAltSensor(&t, node[tns.curSensor].nextNodeIndex, &(tns.alternateDist)) ;
						tns.hasSwitch = 1;
					}
					else{
						tns.hasSwitch = 0;
					}

					iodebug(dspTID, "D24GETNEXTSENSOR cur:%d, next:%d, dist:%d fol:%d fold:%d, hasAlt:%d alt:%d altd:%d",tns.curSensor, tns.expectedSensor, tns.expectedDist,tns.followingSensor,tns.followingDist,tns.hasSwitch, tns.alternateSensor, tns.alternateDist);
		        		Reply(_tid, (char*)&tns, sizeof(trackNextSensorstruct)); //send the nextSEnsor Stuct (12 bytes). Note no need to format integers into characters, just send raw bytes.
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

				// init project swiches straight.
				for (i=1; i <= 18; i++){
					if ((i >= 6 && i <= 10) || (i >= 13 && i <= 17)) {
						node[i+80].switchConfig = S;
						commandMsg[0] = COMMAND_SW;
						commandMsg[1] = node[i+80].switchConfig == S ? 33 : 34;
						commandMsg[2] = i;
						commandMsg[3] = 0;

						bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
						update_switch(i, &t, &trainExpectedSensor[0]); //updates the display

					}
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
					for (i = 58; i <= 76;) {

						if ( trainExpectedSensor[i] != 0 && (trainExpectedSensor[i] == msg[j] || 
							(markedOutSensor(trainExpectedSensor[i]) && msg[j] == findNextSensor(&t,trainExpectedSensor[i], &distSensor)))) {

							trainCurrentSensor[i] = msg[j];
							// DONT SET EXPECTED SENSOR YET. train may need to switch switches swish swishes
							
							if (i == 58) {
								/*
								* Train approaching switch 9.
								*/
								
								if (trainCurrentSensor[i] == sensor2i("E09") || trainCurrentSensor[i] == sensor2i("D10")) {
									node[89].switchConfig = C;
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = node[89].switchConfig == S ? 33 : 34;
									commandMsg[2] = 9;
									commandMsg[3] = 0;

									bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(i, &t, &trainExpectedSensor[0]); //updates the display
								}
								/*
								* Train just passed switch 9.
								*/
								if (trainCurrentSensor[i] == sensor2i("E06") || trainCurrentSensor[i] == sensor2i("D08")) {
									switch9Delay = Time(csTID);
								}

								/*
								* Train approaching switch 15.
								*/
								if (trainCurrentSensor[i] == sensor2i("A04")) {
									node[95].switchConfig = C;
									commandMsg[0] = COMMAND_SW;
									commandMsg[1] = node[95].switchConfig == S ? 33 : 34;
									commandMsg[2] = 15;
									commandMsg[3] = 0;

									bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to CommandServer.\r\n");
									update_switch(i, &t, &trainExpectedSensor[0]); //updates the display
								}
								/*
								* Train just passed switch 15.
								*/
								if (trainCurrentSensor[i] == sensor2i("C10")) {
									switch15Delay = Time(csTID);
									iodebug(dspTID, "D10 sw15:%d", switch15Delay);

								}

								/*
								* Train hit midpoint of it's loop.
								*/
								if (trainCurrentSensor[i] == sensor2i("E06") || trainCurrentSensor[i] == sensor2i("B01")) {
									tr69Delay = Time(csTID);

								}

							}

							if (i == OUTER_LOOP_TRAIN) {
								/*
								* Outer train passed by C07. Start the inner train.
								*/
								if (trainCurrentSensor[i] == sensor2i("C07")) {

									trainExpectedSensor[58] = sensor2i("C07");
									trainCurrentSensor[58] = -1;
									dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
									dspMsg[1] = 58;
									dspMsg[2] = trainExpectedSensor[58];
									dspMsg[3] = 0;
									bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");

									msg[0] = COMMAND_TRBATCH;
									msg[1] = 0;
									bwassert(Send(trainTID, msg, 2, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
								}

								/*
								* Train passed by mutually shared segment. Slow it down until 58 speeds it up.
								*/ 
								if (trainCurrentSensor[i] == sensor2i("D08") || trainCurrentSensor[i] == sensor2i("C05")) {
									trainSpeed[i] = 11;
									msg[0] = COMMAND_TR;
									msg[1] = 11;
									msg[2] = i;
									bwassert(Send(trainTID, msg, 3, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);

								}

							}
							trainExpectedSensor[i] = findNextSensor(&t, trainCurrentSensor[i], &distSensor);			

							dspMsg[0] = COMMAND_TRAIN_SENS; //hardcoded to indicate expected sensor
							dspMsg[1] = i;
							dspMsg[2] = trainExpectedSensor[i];
							dspMsg[3] = 0;
							bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to DisplayServer.\r\n");
						}



						if (i == 58) {
							i = 69;
						} else if (i == 69) {
							i = 70;
						} else if (i == 70) {
							i = 71;
						}  else if (i == 71) {
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

				//iodebug(dspTID, "D1\033[s\033[%d;60H%d & %d\033[u", train - 52, sens, node[sens].nextNodeIndex);
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

				trainSpeed[train] = 14;
				msg[0] = COMMAND_TR;
				msg[1] = 14;
				msg[2] = train;
				bwassert(Send(trainTID, msg, 3, rpl, rpllen) >= 0, COM2, "<trackServer>: Error sending message to TrainServer[%d].\r\n", trainTID);
					
				Reply(_tid, "1", 2);
				break;

			case TRACK_SS:

				// deprecated
				Reply(_tid, "0", 2);
		        break;



		    // switch changes.
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
	}
}

