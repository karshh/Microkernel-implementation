#include "ts7200.h"
#include "dictionary.h"
#include "buffer.h"
#include "userRequestCall.h"
#include "trackGraph.h"
#include "bwio.h"
#include "server.h"
#include "ui.h"
#include "pkstring.h"
#include "icu.h"
#include "controller.h"
#include "time.h"


void trainServer(){
//keep track of train speeds, and sends instructions to ioserver
	bwassert(!RegisterAs("trainServer"), COM2, "Failed to register trainServer.\r\n");
	int commandServerTID = WhoIs("commandServer");
	int csTID = WhoIs("clockServer");
	int sensorTID = WhoIs("displaySensors");
	while (sensorTID < 0) {
		Pass();
		sensorTID = WhoIs("displaySensors");
	}
	//keep track of train speeds
	int trainSpeed[80];
	int trainCurrentSensor[80];
	int trainExpectedSensor[80];
	int trainDestinationSensor[80];



	// track graph.
	TrackGraph t;
	TrackGraphInit(&t);
	TrackGraphNode * node = t.node;

    int _tid = -1;
    char msg[64];
    int msgCap = 64;

    // need seperate Msg and Rpl buffers just for displaying train sensors.
    char dspMsg[64];

    char commandMsg[64];
    char rpl[3];
    int rpllen = 3;

	volatile int i=0;
	int msgLen = 0;
	int dspTID = WhoIs("displayServer");

	for (i=0; i < 80; i++){
			trainCurrentSensor[i] = 0;
			trainExpectedSensor[i] = 0;
			trainDestinationSensor[i] = 0;
 			trainSpeed[i] = 0;
			commandMsg[0] = 'T';
			commandMsg[1] = trainSpeed[i];
			commandMsg[2] = i;
			commandMsg[3] = 0;
			bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
			//send message to display thaat trains are initilizaing
			msg[0] = 2; //no warning
			msg[1] = 0;
			msg[2] = i;//position (0..17)
			msg[3] = 0;
			bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

			//Delay(csTID, (14 * 19) + 170);
			Delay(csTID, 5);
	}
	// why do we have this massive delay here?
	Delay(csTID,436);
	//send message to display thaat switches are initilizaing
	msg[0] = 2; //no warning
	msg[1] = 1;
	msg[2] = 0;//position (0..17)
	msg[3] = 0;
	bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 


	//init switches
	for (i=1; i <= 18; i++){
		node[i+80].switchConfig = C;
		commandMsg[0] = 'S';
		commandMsg[1] = node[i+80].switchConfig == S ? 33 : 34;
		commandMsg[2] = i;
		commandMsg[3] = 0;
		bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		update_switch(i, &t, &trainExpectedSensor[0]); //updates the display
	}

	node[99].switchConfig = CS;
	commandMsg[0] = 'S';
	commandMsg[1] = 34;
	commandMsg[2] = 153;
	commandMsg[3] = 0;
	bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	//update_switch(153, &t); //updates the display
	
	commandMsg[0] = 'S';
	commandMsg[1] = 33;
	commandMsg[2] = 154;
	commandMsg[3] = 0;
	bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	update_switch(154, &t, &trainExpectedSensor[0]); //updates the display

	node[100].switchConfig = CS;
	commandMsg[0] = 'S';
	commandMsg[1] = 34;
	commandMsg[2] = 155;
	commandMsg[3] = 0;
	bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	//update_switch(155, &t); //updates the display
	
	commandMsg[0] = 'S';
	commandMsg[1] = 33;
	commandMsg[2] = 156;
	commandMsg[3] = 0;
	bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
	update_switch(156, &t, &trainExpectedSensor[0]); //updates the display
		

	//send message to display that init is done. allow command line input
	msg[0] = 2; //no warning
	msg[1] = 2;
	msg[2] = 0;//position (0..17)
	msg[3] = 0;
		bwassert(Send(dspTID, msg, 4, rpl, rpllen) >= 0, COM2, "<update switchs>: Displaying switches failed."); 

	int train;
	int speed;
	int sw;
	int swd;
	int sens;


	while(1){

		msgLen = Receive(&_tid, msg, msgCap);
		bwassert(msgLen >= 0, COM2, "<trainServer>: Receive error.\r\n");
		if (_tid == sensorTID) {
			// we received a sensor update from dspTID
			// search for each train if it's expected sensor was hit. If yes, then find next sensor
			// and add that as it's expected sensor.
			volatile int j = 0;
			for (j = 0; j < msgLen; j++) {
				for (i = 58; i < 80; i++) {
					if (trainDestinationSensor[i] == msg[j]) {

						commandMsg[0] = 'T';
						commandMsg[1] = 0;
						commandMsg[2] = i;
						commandMsg[3] = 0;
						bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
						trainSpeed[i] = 0;
						trainDestinationSensor[i] = 0;
					}
					if (trainExpectedSensor[i] == msg[j]) {
						trainCurrentSensor[i] = msg[j];
						trainExpectedSensor[i] = findNextSensor(&t, msg[j]);
						dspMsg[0] = 3; //hardcoded to indicate expected sensor
						dspMsg[1] = i;
						dspMsg[2] = trainExpectedSensor[i];
						dspMsg[3] = 0;
						bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
					}
				}
			}
			Reply(_tid, "1", 2);

		} else {

			switch(msg[0]){
			case 'L':
				train = msg[1];
				trainSpeed[train] = 0;


				commandMsg[0] = 'L';
				commandMsg[1] = 16+trainSpeed[train];
				commandMsg[2] = train;
				commandMsg[3] = 0;
				bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        Reply(_tid, "1", 2);
		        break;

			case 'T':
				speed = msg[1];
				train = msg[2];
				trainSpeed[train] = speed;

				commandMsg[0] = 'T';
				commandMsg[1] = trainSpeed[train];
				commandMsg[2] = train;
				commandMsg[3] = 0;
				bwassert(Send(commandServerTID, commandMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
		        Reply(_tid, "1", 2);
		        break;

			case 'R':
				train = msg[1];

				commandMsg[0] = 'R';
				commandMsg[1] = train;
				commandMsg[2] = trainSpeed[train];
				commandMsg[3] = 0;
				bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
				{ char c[2];
				 c[0] = trainSpeed[train];
				 c[1] = 0;
				
		        	Reply(_tid, &c[0], 2);
				}

		        break;

			case 'J': // ss command
				train = msg[1];
				sens = msg[2];
				if (train >= 58 && train < 80) {

					int path[102];
					int pathLength = 0;
					if (!getShortestPath(&t, trainExpectedSensor[train], sens, path, &pathLength)) {
						Reply(_tid, "0", 2);
						break;
					}
					trainDestinationSensor[train] = sens;

					for (i = 0; i < pathLength; i++) {
						if (node[path[i]].type == Sensor) continue;
						else if (node[path[i]].type == Switch) {
							switch(node[path[i]].switchConfig) {
								case C:
									if (node[path[i]].CnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = S;
									commandMsg[0] = 'S';
									commandMsg[1] = 33;
									commandMsg[2] = path[i] - 80;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] - 80, &t, &trainExpectedSensor[0]); //updates the display
									break;
								case S:
									if (node[path[i]].SnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = C;
									commandMsg[0] = 'S';
									commandMsg[1] = 34;
									commandMsg[2] = path[i] - 80;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] - 80, &t, &trainExpectedSensor[0]); //updates the display
									break;
								default:
									bwassert( 0, COM2, "<trainServer>: Got an invalid single switch configuration.");
									break;
							}

						}
						else if (node[path[i]].type == MultiSwitch) {
							switch(node[path[i]].switchConfig) {
								case CS:
									if (node[path[i]].CSnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = SC;
									commandMsg[0] = 'S';
									commandMsg[1] = 33;
									commandMsg[2] = path[i] == 99 ? 153 : 155;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 153 : 155, &t, &trainExpectedSensor[0]); //updates the display
									commandMsg[0] = 'S';
									commandMsg[1] = 34;
									commandMsg[2] = path[i] == 99 ? 154 : 156;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 154 : 156, &t, &trainExpectedSensor[0]); //updates the display
									break;

								case SC:
									if (node[path[i]].SCnextNodeIndex == path[i-1]) break;
									node[path[i]].switchConfig = CS;
									commandMsg[0] = 'S';
									commandMsg[1] = 34;
									commandMsg[2] = path[i] == 99 ? 153 : 155;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 153 : 155, &t, &trainExpectedSensor[0]); //updates the display
									commandMsg[0] = 'S';
									commandMsg[1] = 33;
									commandMsg[2] = path[i] == 99 ? 154 : 156;
									commandMsg[3] = 0;
									bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
									update_switch(path[i] == 99 ? 154 : 156, &t, &trainExpectedSensor[0]); //updates the display
									break;
								default:
									bwassert( 0, COM2, "<trainServer>: Got an invalid multi switch configuration.");
									break;

							}
						} else {
							bwassert( 0, COM2, "<trainServer>: Got an invalid node.");

						}
					}
				} 
				Reply(_tid, "1", 2);
		        break;

			case 'I': // is command
				train = msg[1];
				sens = msg[2];
				if (train >= 58 && train < 80) {
					trainCurrentSensor[train] = -1;
					trainExpectedSensor[train] = sens;	
					dspMsg[0] = 3; //hardcoded to indicate expected sensor
					dspMsg[1] = train;
					dspMsg[2] = trainExpectedSensor[train];
					dspMsg[3] = 0;
					bwassert(Send(dspTID, dspMsg, 4, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to DisplayServer.\r\n");
				}

		        Reply(_tid, "1", 2);

		        break;

			case 'S':
				sw = msg[1];
				swd = msg[2];
				if(sw <= 18) {
					node[80+sw].switchConfig = swd == 'C' ? C : S;

				} else if (sw == 153) {
					switch (node[99].switchConfig) {
						case SC:
							node[99].switchConfig = swd == 'C' ? CC : SC;
							break;
						case SS:
							node[99].switchConfig = swd == 'C' ? CS : SS;
							break;
						case CS:
							node[99].switchConfig = swd == 'C' ? CS : SS;
							break;
						case CC:
							node[99].switchConfig = swd == 'C' ? CC : SC;
							break;
						default:
							bwassert(0, COM2, "<trainServer>: Incorrect multi switch configuration of 153/154 [153].");
							break;

					}
				} else if (sw == 154) {
					switch (node[99].switchConfig) {
						case SC:
							node[99].switchConfig = swd == 'C' ? SC : SS;
							break;
						case SS:
							node[99].switchConfig = swd == 'C' ? SC : SS;
							break;
						case CS:
							node[99].switchConfig = swd == 'C' ? CC : CS;
							break;
						case CC:
							node[99].switchConfig = swd == 'C' ? CC : CS;
							break;
						default:
							bwassert(0, COM2, "<trainServer>: Incorrect multi switch configuration of 153/154 [154].");
							break;

					}
				} else if (sw == 155) {
					switch (node[100].switchConfig) {
						case SC:
							node[100].switchConfig = swd == 'C' ? CC : SC;
							break;
						case SS:
							node[100].switchConfig = swd == 'C' ? CS : SS;
							break;
						case CS:
							node[100].switchConfig = swd == 'C' ? CS : SS;
							break;
						case CC:
							node[100].switchConfig = swd == 'C' ? CC : SC;
							break;
						default:
							bwassert(0, COM2, "<trainServer>: Incorrect multi switch configuration of 155/156 [155].");
							break;

					}
				} else if (sw == 156) {
					switch (node[100].switchConfig) {
						case SC:
							node[100].switchConfig = swd == 'C' ? SC : SS;
							break;
						case SS:
							node[100].switchConfig = swd == 'C' ? SC : SS;
							break;
						case CS:
							node[100].switchConfig = swd == 'C' ? CC : CS;
							break;
						case CC:
							node[100].switchConfig = swd == 'C' ? CC : CS;
							break;
						default:
							bwassert(0, COM2, "<trainServer>: Incorrect multi switch configuration of 155/156 [156].");
							break;

					}
				}

				commandMsg[0] = 'S';
				commandMsg[1] = swd == 'S' ? 33 : 34;
				commandMsg[2] = sw;
				commandMsg[3] = 0;
				bwassert(Send(commandServerTID, commandMsg, 8, rpl, rpllen) >= 0, COM2, "<trainServer>: Error sending message to CommandServer.\r\n");
				update_switch(sw, &t, &trainExpectedSensor[0]); //updates the display

		        Reply(_tid, "1", 2);
		        break;

			default:
		        bwassert(0, COM2, "<trainServer>: Illegal request code from userTask <%d>:[%s].\r\n", _tid,msg);
		        break;
			}

		}
	}

}
