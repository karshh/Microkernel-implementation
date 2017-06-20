#include "bwio.h"
#include "buffer.h"
#include "trackGraph.h"


int sensor2i(char * c) {
	return    ((10* (c[1] - '0')) + (c[2] - '0')) + (16*(c[0] - 'A')) ;
}

int switch2i(int i) {
	return i + 80;
}


int findAltSensor(TrackGraph * t, int i) {
	TrackGraphNode * node = t->node;
	if (node[i].type == Switch) {
		i = node[i].switchConfig == S ? node[i].CnextNodeIndex : node[i].SnextNodeIndex;
	} 
	else if (node[i].type == MultiSwitch) {
		i = node[i].switchConfig == CS ? node[i].SCnextNodeIndex : node[i].CSnextNodeIndex;
	} 
	else if (node[i].type == Sensor) {
		i = node[i].nextNodeIndex;
	}

	while(1) {
		if (i <= 0) break;
		switch(node[i].type) {
			case Sensor:
				return i;
				break;
			case Switch:
				i = node[i].switchConfig == S ? node[i].SnextNodeIndex : node[i].CnextNodeIndex;
				break;
			case MultiSwitch:
				i = node[i].switchConfig == CS ? node[i].CSnextNodeIndex : node[i].SCnextNodeIndex;
				break;
			default:
				bwassert(0, COM2, "<findNextSensor>: Why the hell did we end up here? FIGURE THIS OUT!");
		}
	}
	return -1;
}


int findNextSensor(TrackGraph * t, int i) {
	TrackGraphNode * node = t->node;
	if (node[i].type == Sensor) i = node[i].nextNodeIndex;

	while(1) {
		if (i <= 0) break;
		switch(node[i].type) {
			case Sensor:
				return i;
				break;
			case Switch:
				i = node[i].switchConfig == S ? node[i].SnextNodeIndex : node[i].CnextNodeIndex;
				break;
			case MultiSwitch:
				i = node[i].switchConfig == CS ? node[i].CSnextNodeIndex : node[i].SCnextNodeIndex;
				break;
			default:
				bwassert(0, COM2, "<findNextSensor>: Why the hell did we end up here? FIGURE THIS OUT!");
		}
	}
	return -1;
}

void TrackGraphInit(TrackGraph * t) {

	TrackGraphNode * node = t->node;
	//prevNodeIndex = -1;

	volatile int i = 1;
	// initializing sensors
	for (i = 1; i <= 98; i++) {
		if (i <= 80) {
			node[i].type = Sensor;
			node[i].id1 = i;
			node[i].id2 = -1;
			node[i].switchConfig = NA;
		} else {
			node[i].type = Switch;
			node[i].id1 = i-80;
			node[i].id2 = -1;
		}
	}
	// initializing the two multiswitches.
	node[99].type = MultiSwitch;
	node[99].id1 = 153;
	node[99].id2 = 154;

	node[100].type = MultiSwitch;
	node[100].id1 = 155;
	node[100].id2 = 156;

	// linking the sensors
	node[sensor2i("A01")].nextNodeIndex = sensor2i("C13");
	node[sensor2i("A02")].nextNodeIndex = -1;
	node[sensor2i("A03")].nextNodeIndex = switch2i(14);
	node[sensor2i("A04")].nextNodeIndex = sensor2i("B16");
	node[sensor2i("A05")].nextNodeIndex = sensor2i("C07");
	node[sensor2i("A06")].nextNodeIndex = sensor2i("B10");
	node[sensor2i("A07")].nextNodeIndex = sensor2i("B12");
	node[sensor2i("A08")].nextNodeIndex = sensor2i("C07");
	node[sensor2i("A09")].nextNodeIndex = sensor2i("B08");
	node[sensor2i("A10")].nextNodeIndex = sensor2i("C07");
	node[sensor2i("A11")].nextNodeIndex = sensor2i("C07");
	node[sensor2i("A12")].nextNodeIndex = -1;
	node[sensor2i("A13")].nextNodeIndex = sensor2i("C13");
	node[sensor2i("A14")].nextNodeIndex = -1;
	node[sensor2i("A15")].nextNodeIndex = -1;
	node[sensor2i("A16")].nextNodeIndex = sensor2i("C13");
	node[sensor2i("B01")].nextNodeIndex = sensor2i("D14");
	node[sensor2i("B02")].nextNodeIndex = sensor2i("C09");
	node[sensor2i("B03")].nextNodeIndex = sensor2i("C02");
	node[sensor2i("B04")].nextNodeIndex = sensor2i("C09");
	node[sensor2i("B05")].nextNodeIndex = sensor2i("D03");
	node[sensor2i("B06")].nextNodeIndex = sensor2i("C12");
	node[sensor2i("B07")].nextNodeIndex = sensor2i("A10");
	node[sensor2i("B08")].nextNodeIndex = -1;
	node[sensor2i("B09")].nextNodeIndex = sensor2i("A05");
	node[sensor2i("B10")].nextNodeIndex = -1;
	node[sensor2i("B11")].nextNodeIndex = sensor2i("A08");
	node[sensor2i("B12")].nextNodeIndex = -1;
	node[sensor2i("B13")].nextNodeIndex = 100;
	node[sensor2i("B14")].nextNodeIndex = sensor2i("D16");
	node[sensor2i("B15")].nextNodeIndex = sensor2i("A03");
	node[sensor2i("B16")].nextNodeIndex = switch2i(15);
	node[sensor2i("C01")].nextNodeIndex = sensor2i("B04");
	node[sensor2i("C02")].nextNodeIndex = 100;
	node[sensor2i("C03")].nextNodeIndex = -1;
	node[sensor2i("C04")].nextNodeIndex = switch2i(18);
	node[sensor2i("C05")].nextNodeIndex = switch2i(6);
	node[sensor2i("C06")].nextNodeIndex = sensor2i("B15");
	node[sensor2i("C07")].nextNodeIndex = switch2i(5);
	node[sensor2i("C08")].nextNodeIndex = switch2i(3);
	node[sensor2i("C09")].nextNodeIndex = sensor2i("B15");
	node[sensor2i("C10")].nextNodeIndex = switch2i(16);
	node[sensor2i("C11")].nextNodeIndex = switch2i(13);
	node[sensor2i("C12")].nextNodeIndex = sensor2i("A04");
	node[sensor2i("C13")].nextNodeIndex = sensor2i("E07");
	node[sensor2i("C14")].nextNodeIndex = switch2i(11);
	node[sensor2i("C15")].nextNodeIndex = sensor2i("D12");
	node[sensor2i("C16")].nextNodeIndex = sensor2i("C06"); 
	node[sensor2i("D01")].nextNodeIndex = 99;
	node[sensor2i("D02")].nextNodeIndex = sensor2i("E04");
	node[sensor2i("D03")].nextNodeIndex = sensor2i("E05");
	node[sensor2i("D04")].nextNodeIndex = sensor2i("B06");
	node[sensor2i("D05")].nextNodeIndex = sensor2i("E06");
	node[sensor2i("D06")].nextNodeIndex = switch2i(8);
	node[sensor2i("D07")].nextNodeIndex = switch2i(8);
	node[sensor2i("D08")].nextNodeIndex = sensor2i("E08");
	node[sensor2i("D09")].nextNodeIndex = sensor2i("E12");
	node[sensor2i("D10")].nextNodeIndex = switch2i(9);
	node[sensor2i("D11")].nextNodeIndex = sensor2i("C16");
	node[sensor2i("D12")].nextNodeIndex = sensor2i("E11");
	node[sensor2i("D13")].nextNodeIndex = sensor2i("B02");
	node[sensor2i("D14")].nextNodeIndex = sensor2i("E14");
	node[sensor2i("D15")].nextNodeIndex = sensor2i("B13");
	node[sensor2i("D16")].nextNodeIndex = sensor2i("E14");
	node[sensor2i("E01")].nextNodeIndex = 99;
	node[sensor2i("E02")].nextNodeIndex = sensor2i("E15");
	node[sensor2i("E03")].nextNodeIndex = sensor2i("D01");
	node[sensor2i("E04")].nextNodeIndex = sensor2i("E05");
	node[sensor2i("E05")].nextNodeIndex = sensor2i("D06");
	node[sensor2i("E06")].nextNodeIndex = switch2i(10);
	node[sensor2i("E07")].nextNodeIndex = sensor2i("D07");
	node[sensor2i("E08")].nextNodeIndex = sensor2i("C14");
	node[sensor2i("E09")].nextNodeIndex = switch2i(9);
	node[sensor2i("E10")].nextNodeIndex = sensor2i("E13");
	node[sensor2i("E11")].nextNodeIndex = sensor2i("D10");
	node[sensor2i("E12")].nextNodeIndex = switch2i(7);
	node[sensor2i("E13")].nextNodeIndex = switch2i(17);
	node[sensor2i("E14")].nextNodeIndex = sensor2i("E09");
	node[sensor2i("E15")].nextNodeIndex = sensor2i("C12");
	node[sensor2i("E16")].nextNodeIndex = sensor2i("E01");

	// linking the switches
	node[switch2i(1)].CnextNodeIndex = sensor2i("A09");
	node[switch2i(2)].CnextNodeIndex = sensor2i("A07");
	node[switch2i(3)].CnextNodeIndex = switch2i(2);
	node[switch2i(4)].CnextNodeIndex = sensor2i("A14");
	node[switch2i(5)].CnextNodeIndex = sensor2i("E11");
	node[switch2i(6)].CnextNodeIndex = switch2i(5);
	node[switch2i(7)].CnextNodeIndex = switch2i(18);
	node[switch2i(8)].CnextNodeIndex = sensor2i("E10");
	node[switch2i(9)].CnextNodeIndex = sensor2i("D05");
	node[switch2i(10)].CnextNodeIndex = sensor2i("E03");
	node[switch2i(11)].CnextNodeIndex = sensor2i("A04");
	node[switch2i(12)].CnextNodeIndex = switch2i(4);
	node[switch2i(13)].CnextNodeIndex = sensor2i("E16");
	node[switch2i(14)].CnextNodeIndex = sensor2i("C11");
	node[switch2i(15)].CnextNodeIndex = sensor2i("C10");
	node[switch2i(16)].CnextNodeIndex = sensor2i("B03");
	node[switch2i(17)].CnextNodeIndex = sensor2i("D15");
	node[switch2i(18)].CnextNodeIndex = sensor2i("C06");


	node[switch2i(1)].SnextNodeIndex = sensor2i("A12");
	node[switch2i(2)].SnextNodeIndex = switch2i(1);
	node[switch2i(3)].SnextNodeIndex = sensor2i("A06");
	node[switch2i(4)].SnextNodeIndex = sensor2i("A15");
	node[switch2i(5)].SnextNodeIndex = sensor2i("C03");
	node[switch2i(6)].SnextNodeIndex = sensor2i("C15");
	node[switch2i(7)].SnextNodeIndex = sensor2i("D11");
	node[switch2i(8)].SnextNodeIndex = sensor2i("D09");
	node[switch2i(9)].SnextNodeIndex = sensor2i("D08");
	node[switch2i(10)].SnextNodeIndex = sensor2i("D04");
	node[switch2i(11)].SnextNodeIndex = switch2i(12);
	node[switch2i(12)].SnextNodeIndex = sensor2i("A02");
	node[switch2i(13)].SnextNodeIndex = sensor2i("B05");
	node[switch2i(14)].SnextNodeIndex = sensor2i("C13");
	node[switch2i(15)].SnextNodeIndex = sensor2i("C05");
	node[switch2i(16)].SnextNodeIndex = sensor2i("B01");
	node[switch2i(17)].SnextNodeIndex = sensor2i("D13");
	node[switch2i(18)].SnextNodeIndex = sensor2i("C08");
	
	node[99].CSnextNodeIndex = sensor2i("C01");
	node[99].SCnextNodeIndex = sensor2i("B14");

	node[100].CSnextNodeIndex = sensor2i("D02");
	node[100].SCnextNodeIndex = sensor2i("E02");

}


// 3 semesters of graph theory and this is what my best solution ends up being.... FML

int getShortestPath(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength) {

	if (sensorStart <= 0 || sensorEnd <= 0) return 0;
	if (sensorStart == sensorEnd) {
		path[0] = sensorStart;
		*pathLength = 1;
		return 1;
	}
	volatile int print = 0; // use this to toggle print
	circularBuffer cb;
	circularBufferInit(&cb);

	// storing reverse paths in here.
	int tree[101];
	volatile int i = 0;
	// variables for while loop.
	int val = 0;
	int next = -1;
	int Cnext = -1;
	int Snext = -1;
	int SCnext = -1;
	int CSnext = -1;

	for (; i < 101; i++) tree[i] = 0; // inefficient step.


	TrackGraphNode * node = t->node;
	// add sensor start as the root node in the queue

	//bwprintf(COM2, "Adding root %d\r\n", sensorStart);
	bwassert(addToBuffer(sensorStart, &cb), COM2, "<TrackGraphFind>:ERROR 1, Could not add %d to cb.", i);

	//bwprintf(COM2, "Beginning BFS find.\r\n");
	while(1) {
		// pop a node out
		// if we can't get a node from this buffer, we've reached a dead end. Return 0.
		if (!getFromBuffer(&val, &cb)) return 0;

		if (node[val].type == Sensor) {
			//bwprintf(COM2, "Found node %d, which is a sensor.\r\n", val);
			 next = node[val].nextNodeIndex;
			//bwprintf(COM2, "The child is %d.\r\n", next);
			if (next <= 0 || tree[next] > 0) continue;
			tree[next] = val;
			if (next == sensorEnd) {
				//bwprintf(COM2, "Looks like %d is the chosen child!\r\n", next);
				break;
			}
			bwassert(addToBuffer(next, &cb), COM2, "<TrackGraphFind>:ERROR 3, Could not add %d to cb.", next);

		} else if (node[val].type == Switch){
			//bwprintf(COM2, "Found node %d, which is a switch.\r\n", val);
			 Cnext = node[val].CnextNodeIndex;
			 Snext = node[val].SnextNodeIndex;
			if (Cnext > 0 && tree[Cnext] <= 0) {
				tree[Cnext] = val;
				if (Cnext == sensorEnd) break;
				bwassert(addToBuffer(Cnext, &cb), COM2, "<TrackGraphFind>:ERROR 4, Could not add %d to cb.", Cnext);
			}
			if (Snext > 0 && tree[Snext] <= 0) {
				tree[Snext] = val;
				if (Snext == sensorEnd) break;
				bwassert(addToBuffer(Snext, &cb), COM2, "<TrackGraphFind>:ERROR 5, Could not add %d to cb.", Snext);
			}
		} else {
			//bwprintf(COM2, "Found node %d, which is a multiswitch.\r\n", val);
			 CSnext = node[val].CSnextNodeIndex;
			 SCnext = node[val].SCnextNodeIndex;
			if (CSnext > 0 && tree[CSnext] <= 0) {
				tree[CSnext] = val;
				if (CSnext == sensorEnd) break;
				bwassert(addToBuffer(CSnext, &cb), COM2, "<TrackGraphFind>:ERROR 6, Could not add %d to cb.", CSnext);
			}
			if (SCnext > 0 && tree[SCnext] <= 0) {
				tree[SCnext] = val;
				if (SCnext == sensorEnd) break;
				bwassert(addToBuffer(SCnext, &cb), COM2, "<TrackGraphFind>:ERROR 7, Could not add %d to cb.", SCnext);
			}
		}
	}

	*pathLength = 0;
	i = sensorEnd;
	for (;i != sensorStart; i = tree[i]) {
		path[*pathLength] = i;
		*pathLength += 1;
	}
	path[*pathLength] = sensorStart;
	*pathLength += 1;


	// toggle print variable to print this, for purposes of debugging (and potentially your sanity if you hate graphs).
	if (print) {
		bwprintf(COM2, "Shortest path, reversed from end to start:\r\n");
		i = sensorEnd;
		for (;i != sensorStart; i = tree[i]) {
			if (i < 81) bwprintf(COM2, "%c%d%d <- ", ((i-1)/16)+'A',((i-1)%16+1)/10, ((i-1)%16+1)%10);
			else if (i < 98) bwprintf(COM2, "sw %d <- ", i-80);
			else bwprintf(COM2, "multsw %d %d <- ", i == 99 ? 153 : 155, i == 99 ? 154 : 156);

		}
		bwprintf(COM2, "%c%d%d\r\n\r\n", ((sensorStart-1)/16)+'A',((sensorStart-1)%16+1)/10, ((sensorStart-1)%16+1)%10);
	}

	return 1;

}

