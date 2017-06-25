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
    velocityModelInit(&(t->vm));
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
	node[sensor2i("C11")].nextNodeIndex = switch2i(12);
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
	node[switch2i(12)].CnextNodeIndex = sensor2i("E16");
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
	node[switch2i(12)].SnextNodeIndex = sensor2i("B05");
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


int findSensorEdge(velocityModel * vm, int s1, int s2) {
	volatile int i = 0;
	for (; i < vm->v[s1].numChild; i++) {
		if (vm->v[s1].child[i] == s2) return i;
	}
	return -1;

}

int getEdgeDistance(velocityModel * vm, int s1, int s2) {
	int edgeNum = findSensorEdge(vm, s1, s2);
	if (edgeNum < 0) return 0;

	return vm->v[s1].distance[edgeNum];

}


int setEdgeDistance(velocityModel * vm, int s1, int s2, int d) {
    int edgeNum = findSensorEdge(vm, s1, s2);
    if (edgeNum < 0) return 0;

    vm->v[s1].distance[edgeNum] = d;

    return 1;

}


int updateEdgeTime(velocityModel * vm, int s1, int s2, int speed, int t) {
    int edgeNum = findSensorEdge(vm, s1, s2);
    if (edgeNum < 0 || speed < 0) return 0;

    volatile int index = (speed * 5) + edgeNum;
    vm->v[s1].time[index] = ((vm->v[s1].time[index] * vm->v[s1].count[index]) + t) / (vm->v[s1].count[index] + 1);
    vm->v[s1].count[index] += 1;
    return 1;
}

int getEdgeTime(velocityModel * vm, int s1, int s2, int speed) {
    int edgeNum = findSensorEdge(vm, s1, s2);
    if (edgeNum < 0 || speed < 0) return 0;
    volatile int index = (speed * 5) + edgeNum;
    return vm->v[s1].time[index];

}


int getEdgeVelocity(velocityModel * vm, int s1, int s2, int speed) {
    int edgeNum = findSensorEdge(vm, s1, s2);
    if (edgeNum < 0 || speed < 0) return 0;
    int t = getEdgeTime(vm, s1, s2, speed); 
    return t == 0 ? 0 : (getEdgeDistance(vm, s1, s2)*1000)/t;

}

void initGenEdgeTime(velocityModel * vm, char* s11, char* s12, char* s21, char* s22, int speed) {
    int v =  getEdgeVelocity(vm, sensor2i(s21), sensor2i(s22), speed);
    updateEdgeTime(vm, sensor2i(s11), sensor2i(s12), speed, v == 0 ? : (getEdgeDistance(vm, sensor2i(s11), sensor2i(s12)) * 1000) /v);
}

/*
* This function takes in path and pathlength (set through a getShortestPath() call) and returns a list of sensors, the distance between them
* and the time between them through arrays passed. Pointers of their length need to be passed in as well in order to be set. 
*
* returns 1 if succesful.
*/
int getEdgeInfo(TrackGraph * t, int * path, int pathLength, int speed ,
    int * sensorList, int * sensorLength, int * distanceList, int * timeList, int * infoLength) {

    TrackGraphNode * node = t->node;


    *sensorLength = 0;
    *infoLength = 0;

    volatile int i = 0;

    for (i = pathLength-1; i >= 0; i--) {
        if (node[path[i]].type == Sensor) {
            sensorList[*sensorLength] = path[i];
            *sensorLength += 1;
        }
    }

    for (i = 0; i < *sensorLength - 1; i++) {
        distanceList[*infoLength] = getEdgeDistance(&(t->vm), sensorList[i], sensorList[i+1]);
        timeList[*infoLength] = getEdgeTime(&(t->vm), sensorList[i], sensorList[i+1], speed);
        *infoLength += 1;
    }

    return 1;

}

void velocityModelInit(velocityModel * vm) {
    volatile int i = 0;
    volatile int j = 0;

    velocityModelNode * v = vm->v;
 

    for (i = 1; i < VELOCITY_NODES; i++) {
    	v[i].colCursor = (i-1) / 16; 
    	for (j = 0; j < 75; j++) {
    		if (j < 5) v[i].distance[j] = 0;
    		v[i].time[j] = 0;
    		v[i].count[j] = 0;
    	}
    }

    volatile int rc = 3;
    
    // A01
    v[1].numChild= 1;
    v[1].child[0] = sensor2i("C13");
    v[1].distance[0] = 218+190+60;
    v[1].rowCursor[0] = rc;
    rc++;
    v[1].child[1] = 0;
    v[1].child[2] = 0;
    v[1].child[3] = 0;
    v[1].child[4] = 0;

    // A02
    v[2].numChild= 0;
    v[2].child[0] = 0;
    v[2].child[1] = 0;
    v[2].child[2] = 0;
    v[2].child[3] = 0;
    v[2].child[4] = 0;
    // A03
    v[3].numChild= 2;
    v[3].child[0] = sensor2i("C13");
    v[3].distance[0] = 62+445+60;
    v[3].rowCursor[0] = rc;
    rc++;
    v[3].child[1] = sensor2i("C11");
    v[3].distance[1] = 62+314;
    v[3].rowCursor[1] = rc;
    rc++;
    v[3].child[2] = 0;
    v[3].child[3] = 0;
    v[3].child[4] = 0;

    // A04
    v[4].numChild= 1;
    v[4].child[0] = sensor2i("B16");
    v[4].distance[0] = 440;
    v[4].rowCursor[0] = rc;
    rc++;
    v[4].child[1] = 0;
    v[4].child[2] = 0;
    v[4].child[3] = 0;
    v[4].child[4] = 0;
    // A05
    v[5].numChild= 1;
    v[5].child[0] = sensor2i("C07");
    v[5].distance[0] = 216+145;
    v[5].rowCursor[0] = rc;
    rc++;
    v[5].child[1] = 0;
    v[5].child[2] = 0;
    v[5].child[3] = 0;
    v[5].child[4] = 0;

    // A06
    v[6].numChild= 1;
    v[6].child[0] = sensor2i("B10");
    v[6].distance[0] = 649;
    v[6].rowCursor[0] = rc;
    rc++;
    v[6].child[1] = 0;
    v[6].child[2] = 0;
    v[6].child[3] = 0;
    v[6].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[6].time[i] = 0;
    }

    // A07
    v[7].numChild= 1;
    v[7].child[0] = sensor2i("B12");
    v[7].distance[0] = 473;
    v[7].rowCursor[0] = rc;
    rc++;
    v[7].child[1] = 0;
    v[7].child[2] = 0;
    v[7].child[3] = 0;
    v[7].child[4] = 0;

    // A08
    v[8].numChild= 1;
    v[8].child[0] = sensor2i("C07");
    v[8].distance[0] = 211+182+145;
    v[8].rowCursor[0] = rc;
    rc++;
    v[8].child[1] = 0;
    v[8].child[2] = 0;
    v[8].child[3] = 0;
    v[8].child[4] = 0;

    // A09
    v[9].numChild= 1;
    v[9].child[0] = sensor2i("B08");
    v[9].distance[0] = 289;
    v[9].rowCursor[0] = rc;
    rc++;
    v[9].child[1] = 0;
    v[9].child[2] = 0;
    v[9].child[3] = 0;
    v[9].child[4] = 0;

    // A10
    v[10].numChild= 1;
    v[10].child[0] = sensor2i("C07");
    v[10].distance[0] = 62+445+60;
    v[10].rowCursor[0] = rc;
    rc++;
    v[10].child[1] = 0;
    v[10].child[2] = 0;
    v[10].child[3] = 0;
    v[10].child[4] = 0;

    // A11
    v[11].numChild= 1;
    v[11].child[0] = sensor2i("C07");
    v[11].distance[0] = 410+191+182+145;
    v[11].rowCursor[0] = rc;
    rc++;
    v[11].child[1] = 0;
    v[11].child[2] = 0;
    v[11].child[3] = 0;
    v[11].child[4] = 0;

    // A12
    v[12].numChild= 0;
    v[12].child[0] = 0;
    v[12].child[1] = 0;
    v[12].child[2] = 0;
    v[12].child[3] = 0;
    v[12].child[4] = 0;

    // A13
    v[13].numChild= 1;
    v[13].child[0] = sensor2i("C13");
    v[13].distance[0] = 215+185+190+60;
    v[13].rowCursor[0] = rc;
    rc++;
    v[13].child[1] = 0;
    v[13].child[2] = 0;
    v[13].child[3] = 0;
    v[13].child[4] = 0;

    // A14
    v[14].numChild= 0;
    v[14].child[0] = 0;
    v[14].child[1] = 0;
    v[14].child[2] = 0;
    v[14].child[3] = 0;
    v[14].child[4] = 0;

    // A15
    v[15].numChild= 0;
    v[15].child[0] = 0;
    v[15].child[1] = 0;
    v[15].child[2] = 0;
    v[15].child[3] = 0;
    v[15].child[4] = 0;

    // A16
    v[16].numChild= 1;
    v[16].child[0] = sensor2i("C13");
    v[16].distance[0] = 394+185+190+60;
    v[16].rowCursor[0] = rc;
    rc++;
    v[16].child[1] = 0;
    v[16].child[2] = 0;
    v[16].child[3] = 0;
    v[16].child[4] = 0;



    implementTrackB(vm, rc);

    rc = 3;
    // B01
    v[17].numChild= 1;
    v[17].child[0] = sensor2i("D14");
    v[17].distance[0] = 398;
    v[17].rowCursor[0] = rc;
    rc++;
    v[17].child[1] = 0;
    v[17].child[2] = 0;
    v[17].child[3] = 0;
    v[17].child[4] = 0;


    // B02
    v[18].numChild= 1;
    v[18].child[0] = sensor2i("C09");
    v[18].distance[0] = 230+146;
    v[18].rowCursor[0] = rc;
    rc++;
    v[18].child[1] = 0;
    v[18].child[2] = 0;
    v[18].child[3] = 0;
    v[18].child[4] = 0;

    // B03
    v[19].numChild= 1;
    v[19].child[0] = sensor2i("C02");
    v[19].distance[0] = 230;
    v[19].rowCursor[0] = rc;
    rc++;
    v[19].child[1] = 0;
    v[19].child[2] = 0;
    v[19].child[3] = 0;
    v[19].child[4] = 0;
    // B04
    v[20].numChild= 1;
    v[20].child[0] = sensor2i("C09");
    v[20].distance[0] = 220+146;
    v[20].rowCursor[0] = rc;
    rc++;
    v[20].child[1] = 0;
    v[20].child[2] = 0;
    v[20].child[3] = 0;
    v[20].child[4] = 0;

    // B05
    v[21].numChild= 1;
    v[21].child[0] = sensor2i("D03");
    v[21].distance[0] = 405;
    v[21].rowCursor[0] = rc;
    rc++;
    v[21].child[1] = 0;
    v[21].child[2] = 0;
    v[21].child[3] = 0;
    v[21].child[4] = 0;

    // B06
    v[22].numChild= 1;
    v[22].child[0] = sensor2i("C12");
    v[22].distance[0] = 214+140;
    v[22].rowCursor[0] = rc;
    rc++;
    v[22].child[1] = 0;
    v[22].child[2] = 0;
    v[22].child[3] = 0;
    v[22].child[4] = 0;

    // B07
    v[23].numChild= 1;
    v[23].child[0] = sensor2i("A10");
    v[23].distance[0] = 289;
    v[23].rowCursor[0] = rc;
    rc++;
    v[23].child[1] = 0;
    v[23].child[2] = 0;
    v[23].child[3] = 0;
    v[23].child[4] = 0;

    // B08
    v[24].numChild= 0;
    v[24].child[0] = 0;
    v[24].child[1] = 0;
    v[24].child[2] = 0;
    v[24].child[3] = 0;
    v[24].child[4] = 0;

    // B09
    v[25].numChild= 1;
    v[25].child[0] = sensor2i("A05");
    v[25].distance[0] = 649;
    v[25].rowCursor[0] = rc;
    rc++;
    v[25].child[1] = 0;
    v[25].child[2] = 0;
    v[25].child[3] = 0;
    v[25].child[4] = 0;

    // B10
    v[26].numChild= 0;
    v[26].child[0] = 0;
    v[26].child[1] = 0;
    v[26].child[2] = 0;
    v[26].child[3] = 0;
    v[26].child[4] = 0;

    // B11
    v[27].numChild= 1;
    v[27].child[0] = sensor2i("A08");
    v[27].distance[0] = 473;
    v[27].rowCursor[0] = rc;
    rc++;
    v[27].child[1] = 0;
    v[27].child[2] = 0;
    v[27].child[3] = 0;
    v[27].child[4] = 0;

    // B12
    v[28].numChild= 0;
    v[28].child[0] = 0;
    v[28].child[1] = 0;
    v[28].child[2] = 0;
    v[28].child[3] = 0;
    v[28].child[4] = 0;

    // B13
    v[29].numChild= 2;
    v[29].child[0] = sensor2i("D02");
    v[29].distance[0] = 224+32+227;
    v[29].rowCursor[0] = rc;
    rc++;
    v[29].child[1] = sensor2i("E02");
    v[29].distance[1] = 224+32+222;
    v[29].rowCursor[1] = rc;
    rc++;
    v[29].child[2] = 0;
    v[29].child[3] = 0;
    v[29].child[4] = 0;

    // B14
    v[30].numChild= 1;
    v[30].child[0] = sensor2i("D16");
    v[30].distance[0] = 202;
    v[30].rowCursor[0] = rc;
    rc++;
    v[30].child[1] = 0;
    v[30].child[2] = 0;
    v[30].child[3] = 0;
    v[30].child[4] = 0;

    // B15
    v[31].numChild= 1;
    v[31].child[0] = sensor2i("A03");
    v[31].distance[0] = 440;
    v[31].rowCursor[0] = rc;
    rc++;
    v[31].child[1] = 0;
    v[31].child[2] = 0;
    v[31].child[3] = 0;
    v[31].child[4] = 0;


    // B16
    v[32].numChild= 2;
    v[32].child[0] = sensor2i("C10");
    v[32].distance[0] = 70+305;
    v[32].rowCursor[0] = rc;
    rc++;
    v[32].child[1] = sensor2i("C05");
    v[32].distance[1] = 70+411;
    v[32].rowCursor[1] = rc;
    rc++;
    v[32].child[2] = 0;
    v[32].child[3] = 0;
    v[32].child[4] = 0;

    rc = 3;
    // C01
    v[33].numChild= 1;
    v[33].child[0] = sensor2i("B04");
    v[33].distance[0] = 230;
    v[33].rowCursor[0] = rc;
    rc++;
    v[33].child[1] = 0;
    v[33].child[2] = 0;
    v[33].child[3] = 0;
    v[33].child[4] = 0;

    // C02
    v[34].numChild= 2;
    v[34].child[0] = sensor2i("E02");
    v[34].distance[0] = 228+32+222;
    v[34].rowCursor[0] = rc;
    rc++;
    v[34].child[1] = sensor2i("D02");
    v[34].distance[1] = 228+32+227;
    v[34].rowCursor[1] = rc;
    rc++;
    v[34].child[2] = 0;
    v[34].child[3] = 0;
    v[34].child[4] = 0;

    // C03
    v[35].numChild= 0;
    v[35].child[0] = 0;
    v[35].child[1] = 0;
    v[35].child[2] = 0;
    v[35].child[3] = 0;
    v[35].child[4] = 0;
    

    // C04
    v[36].numChild= 2;
    v[36].child[0] = sensor2i("C06");
    v[36].distance[0] = 226+187+338+79;
    v[36].rowCursor[0] = rc;
    rc++;
    v[36].child[1] = sensor2i("C08");
    v[36].distance[1] = 226+187+215;
    v[36].rowCursor[1] = rc;
    rc++;
    v[36].child[2] = 0;
    v[36].child[3] = 0;
    v[36].child[4] = 0;

    // C05
    v[37].numChild= 3;
    v[37].child[0] = sensor2i("C15");
    v[37].distance[0] = 79+223;
    v[37].rowCursor[0] = rc;
    rc++;
    v[37].child[1] = sensor2i("E11");
    v[37].distance[1] = 79+338+187+334+65;
    v[37].rowCursor[1] = rc;
    rc++;
    v[37].child[2] = sensor2i("C03");
    v[37].distance[2] = 79+338+187+226;
    v[37].rowCursor[2] = rc;
    rc++;
    v[37].child[3] = 0;
    v[37].child[4] = 0;

    // C06
    v[38].numChild= 1;
    v[38].child[0] = sensor2i("B15");
    v[38].distance[0] = 441+70;
    v[38].rowCursor[0] = rc;
    rc++;
    v[38].child[1] = 0;
    v[38].child[2] = 0;
    v[38].child[3] = 0;
    v[38].child[4] = 0;

    // C07
    v[39].numChild= 2;
    v[39].child[0] = sensor2i("E11");
    v[39].distance[0] = 215+187+334+65;
    v[39].rowCursor[0] = rc;
    rc++;
    v[39].child[1] = sensor2i("C03");
    v[39].distance[1] = 215+187+226;
    v[39].rowCursor[1] = rc;
    rc++;
    v[39].child[2] = 0;
    v[39].child[3] = 0;
    v[39].child[4] = 0;

    // C08
    v[40].numChild= 4;
    v[40].child[0] = sensor2i("A12");
    v[40].distance[0] = 145+182+191+410;
    v[40].rowCursor[0] = rc;
    rc++;
    v[40].child[1] = sensor2i("A09");
    v[40].distance[1] = 145+182+191+210;
    v[40].rowCursor[1] = rc;
    rc++;
    v[40].child[2] = sensor2i("A07");
    v[40].distance[2] = 145+182+211;
    v[40].rowCursor[2] = rc;
    rc++;
    v[40].child[3] = sensor2i("A06");
    v[40].distance[3] = 145+216;
    v[40].rowCursor[3] = rc;
    rc++;
    v[40].child[4] = 0;

    // C09
    v[41].numChild= 1;
    v[41].child[0] = sensor2i("B15");
    v[41].distance[0] = 305+70;
    v[41].rowCursor[0] = rc;
    rc++;
    v[41].child[1] = 0;
    v[41].child[2] = 0;
    v[41].child[3] = 0;
    v[41].child[4] = 0;

    // C10
    v[42].numChild= 2;
    v[42].child[0] = sensor2i("B03") ;
    v[42].distance[0] = 146+220;
    v[42].rowCursor[0] = rc;
    rc++;
    v[42].child[1] = sensor2i("B01") ;
    v[42].distance[1] = 146+230;
    v[42].rowCursor[1] = rc;
    rc++;
    v[42].child[2] = 0;
    v[42].child[3] = 0;
    v[42].child[4] = 0;

    // C11
    v[43].numChild= 2;
    v[43].child[0] = sensor2i("E16");
    v[43].distance[0] = 140+230;
    v[43].rowCursor[0] = rc;
    rc++;
    v[43].child[1] = sensor2i("B05") ;
    v[43].distance[1] = 140+214;
    v[43].rowCursor[1] = rc;
    rc++;
    v[43].child[2] = 0;
    v[43].child[3] = 0;
    v[43].child[4] = 0;

    // C12
    v[44].numChild= 1;
    v[44].child[0] =  sensor2i("A04");
    v[44].distance[0] = 314+62;
    v[44].rowCursor[0] = rc;
    rc++;
    v[44].child[1] = 0;
    v[44].child[2] = 0;
    v[44].child[3] = 0;
    v[44].child[4] = 0;

    // C13
    v[45].numChild= 1;
    v[45].child[0] = sensor2i("E07");
    v[45].distance[0] = 877;
    v[45].rowCursor[0] = rc;
    rc++;
    v[45].child[1] = 0;
    v[45].child[2] = 0;
    v[45].child[3] = 0;
    v[45].child[4] = 0;

    // C14
    v[46].numChild= 4;
    v[46].child[0] = sensor2i("A02");
    v[46].distance[0] = 60+190+218;
    v[46].rowCursor[0] = rc;
    rc++;
    v[46].child[1] =  sensor2i("A14");
    v[46].distance[1] = 60+190+185+215;
    v[46].rowCursor[1] = rc;
    rc++;
    v[46].child[2] =  sensor2i("A15");
    v[46].distance[2] = 60+190+185+394;
    v[46].rowCursor[2] = rc;
    rc++;
    v[46].child[3] =  sensor2i("A04");
    v[46].distance[3] = 60+445+62;
    v[46].rowCursor[3] = rc;
    rc++;
    v[46].child[4] = 0;

    // C15
    v[47].numChild= 1;
    v[47].child[0] = sensor2i("D12");
    v[47].distance[0] = 405;
    v[47].rowCursor[0] = rc;
    rc++;
    v[47].child[1] = 0;
    v[47].child[2] = 0;
    v[47].child[3] = 0;
    v[47].child[4] = 0;


    // C16
    v[48].numChild= 1;
    v[48].child[0] = sensor2i("C06");
    v[48].distance[0] = 223+79;
    v[48].rowCursor[0] = rc;
    rc++;
    v[48].child[1] = 0;
    v[48].child[2] = 0;
    v[48].child[3] = 0;
    v[48].child[4] = 0;

    rc = 3;

    // D01
    v[49].numChild= 2;
    v[49].child[0] = sensor2i("C01");
    v[49].distance[0] = 227+32+228;
    v[49].rowCursor[0] = rc;
    rc++;
    v[49].child[1] = sensor2i("B14") ;
    v[49].distance[1] = 227+32+224;
    v[49].rowCursor[1] = rc;
    rc++;
    v[49].child[2] = 0;
    v[49].child[3] = 0;
    v[49].child[4] = 0;


    // D02
    v[50].numChild= 1;
    v[50].child[0] = sensor2i("E04");
    v[50].distance[0] = 200;
    v[50].rowCursor[0] = rc;
    rc++;
    v[50].child[1] = 0;
    v[50].child[2] = 0;
    v[50].child[3] = 0;
    v[50].child[4] = 0;

    // D03
    v[51].numChild= 1;
    v[51].child[0] =  sensor2i("E05");
    v[51].distance[0] = 223+74;
    v[51].rowCursor[0] = rc;
    rc++;
    v[51].child[1] = 0;
    v[51].child[2] = 0;
    v[51].child[3] = 0;
    v[51].child[4] = 0;

    // D04
    v[52].numChild= 1;
    v[52].child[0] = sensor2i("B06");
    v[52].distance[0] = 405;
    v[52].rowCursor[0] = rc;
    rc++;
    v[52].child[1] = 0;
    v[52].child[2] = 0;
    v[52].child[3] = 0;
    v[52].child[4] = 0;

    // D05
    v[53].numChild= 1;
    v[53].child[0] = sensor2i("E06");
    v[53].distance[0] = 375;
    v[53].rowCursor[0] = rc;
    rc++;
    v[53].child[1] = 0;
    v[53].child[2] = 0;
    v[53].child[3] = 0;
    v[53].child[4] = 0;

    // D06
    v[54].numChild= 2;
    v[54].child[0] = sensor2i("E10");
    v[54].distance[0] = 213+193+218;
    v[54].rowCursor[0] = rc;
    rc++;
    v[54].child[1] = sensor2i("D09");
    v[54].distance[1] = 213+193+291;
    v[54].rowCursor[1] = rc;
    rc++;
    v[54].child[2] = 0;
    v[54].child[3] = 0;
    v[54].child[4] = 0;

    // D07
    v[55].numChild= 2;
    v[55].child[0] = sensor2i("E10");
    v[55].distance[0] = 290+193+218;
    v[55].rowCursor[0] = rc;
    rc++;
    v[55].child[1] = sensor2i("D09");
    v[55].distance[1] = 290+193+291;
    v[55].rowCursor[1] = rc;
    rc++;
    v[55].child[2] = 0;
    v[55].child[3] = 0;
    v[55].child[4] = 0;

    // D08
    v[56].numChild= 1;
    v[56].child[0] = sensor2i("E08");
    v[56].distance[0] = 375;
    v[56].rowCursor[0] = rc;
    rc++;
    v[56].child[1] = 0;
    v[56].child[2] = 0;
    v[56].child[3] = 0;
    v[56].child[4] = 0;

    // D09
    v[57].numChild= 1;
    v[57].child[0] = sensor2i("E12");
    v[57].distance[0] = 361;
    v[57].rowCursor[0] = rc;
    rc++;
    v[57].child[1] = 0;
    v[57].child[2] = 0;
    v[57].child[3] = 0;
    v[57].child[4] = 0;

    // D10
    v[58].numChild= 2;
    v[58].child[0] = sensor2i("D08") ;
    v[58].distance[0] = 291+193+290;
    v[58].rowCursor[0] = rc;
    rc++;
    v[58].child[1] = sensor2i("D05") ;
    v[58].distance[1] = 291+193+213;
    v[58].rowCursor[1] = rc;
    rc++;
    v[58].child[2] = 0;
    v[58].child[3] = 0;
    v[58].child[4] = 0;

    // D11
    v[59].numChild= 1;
    v[59].child[0] = sensor2i("C16");
    v[59].distance[0] = 405;
    v[59].rowCursor[0] = rc;
    rc++;
    v[59].child[1] = 0 ;
    v[59].child[2] = 0;
    v[59].child[3] = 0;
    v[59].child[4] = 0;

    // D12
    v[60].numChild= 1;
    v[60].child[0] =  sensor2i("E11");
    v[60].distance[0] = 220+65;
    v[60].rowCursor[0] = rc;
    rc++;
    v[60].child[1] = 0;
    v[60].child[2] = 0;
    v[60].child[3] = 0;
    v[60].child[4] = 0;

    // D13
    v[61].numChild= 1;
    v[61].child[0] = sensor2i("B02");
    v[61].distance[0] = 398;
    v[61].rowCursor[0] = rc;
    rc++;
    v[61].child[1] = 0;
    v[61].child[2] = 0;
    v[61].child[3] = 0;
    v[61].child[4] = 0;

    // D14
    v[62].numChild= 1;
    v[62].child[0] = sensor2i("E14");
    v[62].distance[0] = 225+62;
    v[62].rowCursor[0] = rc;
    rc++;
    v[62].child[1] =  0;
    v[62].child[2] =  0;
    v[62].child[3] =  0 ;
    v[62].child[4] = 0;

    // D15
    v[63].numChild= 1;
    v[63].child[0] = sensor2i("B13");
    v[63].distance[0] = 202;
    v[63].rowCursor[0] = rc;
    rc++;
    v[63].child[1] = 0;
    v[63].child[2] = 0;
    v[63].child[3] = 0;
    v[63].child[4] = 0;


    // D16
    v[64].numChild= 1;
    v[64].child[0] = sensor2i("E14");
    v[64].distance[0] = 230+62;
    v[64].rowCursor[0] = rc;
    rc++;
    v[64].child[1] = 0;
    v[64].child[2] = 0;
    v[64].child[3] = 0;
    v[64].child[4] = 0;


    rc = 3;
    // E01
    v[65].numChild= 2;
    v[65].child[0] = sensor2i("C01");
    v[65].distance[0] = 222+32+228;
    v[65].rowCursor[0] = rc;
    rc++;
    v[65].child[1] = sensor2i("B14") ;
    v[65].distance[1] = 222+32+224;
    v[65].rowCursor[1] = rc;
    rc++;
    v[65].child[2] = 0;
    v[65].child[3] = 0;
    v[65].child[4] = 0;


    // E02
    v[66].numChild= 1;
    v[66].child[0] = sensor2i("E15");
    v[66].distance[0] = 203;
    v[66].rowCursor[0] = rc;
    rc++;
    v[66].child[1] = 0;
    v[66].child[2] = 0;
    v[66].child[3] = 0;
    v[66].child[4] = 0;

    // E03
    v[67].numChild= 1;
    v[67].child[0] =  sensor2i("D01");
    v[67].distance[0] = 200;
    v[67].rowCursor[0] = rc;
    rc++;
    v[67].child[1] = 0;
    v[67].child[2] = 0;
    v[67].child[3] = 0;
    v[67].child[4] = 0;

    // E04
    v[68].numChild= 1;
    v[68].child[0] = sensor2i("E05");
    v[68].distance[0] = 220+74;
    v[68].rowCursor[0] = rc;
    rc++;
    v[68].child[1] = 0;
    v[68].child[2] = 0;
    v[68].child[3] = 0;
    v[68].child[4] = 0;

    // E05
    v[69].numChild= 1;
    v[69].child[0] = sensor2i("D06");
    v[69].distance[0] = 375;
    v[69].rowCursor[0] = rc;
    rc++;
    v[69].child[1] = 0;
    v[69].child[2] = 0;
    v[69].child[3] = 0;
    v[69].child[4] = 0;

    // E06
    v[70].numChild= 2;
    v[70].child[0] = sensor2i("E03");
    v[70].distance[0] = 74+220;
    v[70].rowCursor[0] = rc;
    rc++;
    v[70].child[1] = sensor2i("D04");
    v[70].distance[1] = 74+223;
    v[70].rowCursor[1] = rc;
    rc++;
    v[70].child[2] = 0;
    v[70].child[3] = 0;
    v[70].child[4] = 0;

    // E07
    v[71].numChild= 1;
    v[71].child[0] = sensor2i("D07");
    v[71].distance[0] = 375;
    v[71].rowCursor[0] = rc;
    rc++;
    v[71].child[1] = 0;
    v[71].child[2] = 0;
    v[71].child[3] = 0;
    v[71].child[4] = 0;

    // E08
    v[72].numChild= 1;
    v[72].child[0] = sensor2i("C14");
    v[72].distance[0] = 877;
    v[72].rowCursor[0] = rc;
    rc++;
    v[72].child[1] = 0;
    v[72].child[2] = 0;
    v[72].child[3] = 0;
    v[72].child[4] = 0;

    // E09
    v[73].numChild= 2;
    v[73].child[0] = sensor2i("D08");
    v[73].distance[0] = 218+193+290;
    v[73].rowCursor[0] = rc;
    rc++;
    v[73].child[1] =  sensor2i("D05");
    v[73].distance[1] = 218+193+213;
    v[73].rowCursor[1] = rc;
    rc++;
    v[73].child[2] = 0;
    v[73].child[3] = 0;
    v[73].child[4] = 0;

    // E10
    v[74].numChild= 1;
    v[74].child[0] = sensor2i("E13");
    v[74].distance[0] = 375;
    v[74].rowCursor[0] = rc;
    rc++;
    v[74].child[1] = 0;
    v[74].child[2] = 0;
    v[74].child[3] = 0;
    v[74].child[4] = 0;

    // E11
    v[75].numChild= 1;
    v[75].child[0] = sensor2i("D10");
    v[75].distance[0] = 361;
    v[75].rowCursor[0] = rc;
    rc++;
    v[75].child[1] = 0 ;
    v[75].child[2] = 0;
    v[75].child[3] = 0;
    v[75].child[4] = 0;

    // E12
    v[76].numChild= 3;
    v[76].child[0] =  sensor2i("D11");
    v[76].distance[0] = 65+220;
    v[76].rowCursor[0] = rc;
    rc++;
    v[76].child[1] = sensor2i("C08") ;
    v[76].distance[1] = 65+334+187+215;
    v[76].rowCursor[1] = rc;
    rc++;
    v[76].child[2] = sensor2i("C06") ;
    v[76].distance[2] = 65+334+187+338+79;
    v[76].rowCursor[2] = rc;
    rc++;
    v[76].child[3] = 0;
    v[76].child[4] = 0;

    // E13
    v[77].numChild= 2;
    v[77].child[0] = sensor2i("D13");
    v[77].distance[0] = 62+225;
    v[77].rowCursor[0] = rc;
    rc++;
    v[77].child[1] =  sensor2i("D15");
    v[77].distance[1] = 62+230;
    v[77].rowCursor[1] = rc;
    rc++;
    v[77].child[2] = 0;
    v[77].child[3] = 0;
    v[77].child[4] = 0;
    // E14
    v[78].numChild= 1;
    v[78].child[0] = sensor2i("E09");
    v[78].distance[0] = 375;
    v[78].rowCursor[0] = rc;
    rc++;
    v[78].child[1] =  0;
    v[78].child[2] =  0;
    v[78].child[3] =  0 ;
    v[78].child[4] = 0;
    // E15
    v[79].numChild= 1;
    v[79].child[0] = sensor2i("C12");
    v[79].distance[0] = 230+140;
    v[79].rowCursor[0] = rc;
    rc++;
    v[79].child[1] = 0;
    v[79].child[2] = 0;
    v[79].child[3] = 0;
    v[79].child[4] = 0;

    // E16
    v[80].numChild= 1;
    v[80].child[0] = sensor2i("E01");
    v[80].distance[0] = 203;
    v[80].rowCursor[0] = rc;
    rc++;
    v[80].child[1] = 0;
    v[80].child[2] = 0;
    v[80].child[3] = 0;
    v[80].child[4] = 0;

    // speed 14
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C13"), 14, 896);
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C11"), 14, 584);
    updateEdgeTime(vm, sensor2i("A04"), sensor2i("B16"), 14, 644);



    updateEdgeTime(vm, sensor2i("B01"), sensor2i("D14"), 14, 598);
    updateEdgeTime(vm, sensor2i("B02"), sensor2i("C09"), 14, 525);
    updateEdgeTime(vm, sensor2i("B04"), sensor2i("C09"), 14, 541);
    updateEdgeTime(vm, sensor2i("B05"), sensor2i("D03"), 14, 599);
    updateEdgeTime(vm, sensor2i("B06"), sensor2i("C12"), 14, 508);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("D02"), 14, 742);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("E02"), 14, 732);
    updateEdgeTime(vm, sensor2i("B14"), sensor2i("D16"), 14, 254);
    updateEdgeTime(vm, sensor2i("B15"), sensor2i("A03"), 14, 642);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C10"), 14, 549);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C05"), 14, 754);

    updateEdgeTime(vm, sensor2i("C01"), sensor2i("B04"), 14, 345);
    updateEdgeTime(vm, sensor2i("C02"), sensor2i("D02"), 14, 762);
    updateEdgeTime(vm, sensor2i("C05"), sensor2i("C15"), 14, 427);
    updateEdgeTime(vm, sensor2i("C05"), sensor2i("E11"), 14, 1646);
    updateEdgeTime(vm, sensor2i("C06"), sensor2i("B15"), 14, 748);
    updateEdgeTime(vm, sensor2i("C07"), sensor2i("E11"), 14, 1555);
    updateEdgeTime(vm, sensor2i("C09"), sensor2i("B15"), 14, 550);
    updateEdgeTime(vm, sensor2i("C10"), sensor2i("B01"), 14, 536);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("E16"), 14, 539);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("B05"), 14, 518);
    updateEdgeTime(vm, sensor2i("C12"), sensor2i("A04"), 14, 559);
    updateEdgeTime(vm, sensor2i("C13"), sensor2i("E07"), 14, 1383);
    updateEdgeTime(vm, sensor2i("C14"), sensor2i("A04"), 14, 877);
    updateEdgeTime(vm, sensor2i("C15"), sensor2i("D12"), 14, 655);
    updateEdgeTime(vm, sensor2i("C16"), sensor2i("C06"), 14, 414);

    updateEdgeTime(vm, sensor2i("D01"), sensor2i("C01"), 14, 915);
    updateEdgeTime(vm, sensor2i("D01"), sensor2i("B14"), 14, 752);
    updateEdgeTime(vm, sensor2i("D03"), sensor2i("E05"), 14, 406);
    updateEdgeTime(vm, sensor2i("D04"), sensor2i("B06"), 14, 592);
    updateEdgeTime(vm, sensor2i("D05"), sensor2i("E06"), 14, 549);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("E10"), 14, 972);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("D09"), 14, 1098);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("E10"), 14, 1108);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("D09"), 14, 1205);
    updateEdgeTime(vm, sensor2i("D08"), sensor2i("E08"), 14, 551);
    updateEdgeTime(vm, sensor2i("D09"), sensor2i("E12"), 14, 545);
    updateEdgeTime(vm, sensor2i("D10"), sensor2i("D08"), 14, 1248);
    updateEdgeTime(vm, sensor2i("D10"), sensor2i("D05"), 14, 1403);
    updateEdgeTime(vm, sensor2i("D11"), sensor2i("C16"), 14, 591);
    updateEdgeTime(vm, sensor2i("D12"), sensor2i("E11"), 14, 411);
    updateEdgeTime(vm, sensor2i("D13"), sensor2i("B02"), 14, 597);
    updateEdgeTime(vm, sensor2i("D14"), sensor2i("E14"), 14, 399);
    updateEdgeTime(vm, sensor2i("D15"), sensor2i("B13"), 14, 221);
    updateEdgeTime(vm, sensor2i("D16"), sensor2i("E14"), 14, 404);

    updateEdgeTime(vm, sensor2i("E01"), sensor2i("C01"), 14, 751);
    updateEdgeTime(vm, sensor2i("E01"), sensor2i("B14"), 14, 732);
    updateEdgeTime(vm, sensor2i("E02"), sensor2i("E15"), 14, 274);
    updateEdgeTime(vm, sensor2i("E03"), sensor2i("D01"), 14, 262);
    updateEdgeTime(vm, sensor2i("E05"), sensor2i("D06"), 14, 580);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("E03"), 14, 437);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("D04"), 14, 391);
    updateEdgeTime(vm, sensor2i("E07"), sensor2i("D07"), 14, 559);
    updateEdgeTime(vm, sensor2i("E08"), sensor2i("C14"), 14, 1375);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D08"), 14, 1108);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D05"), 14, 986);
    updateEdgeTime(vm, sensor2i("E10"), sensor2i("E13"), 14, 549);
    updateEdgeTime(vm, sensor2i("E11"), sensor2i("D10"), 14, 553);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("D11"), 14, 386);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("C06"), 14, 1625);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D13"), 14, 403);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D15"), 14, 441);
    updateEdgeTime(vm, sensor2i("E14"), sensor2i("E09"), 14, 550);
    updateEdgeTime(vm, sensor2i("E15"), sensor2i("C12"), 14, 549);
    updateEdgeTime(vm, sensor2i("E16"), sensor2i("E01"), 14, 245);
 
    initGenEdgeTime(vm, "A01", "C13", "C13", "E07", 14);
    initGenEdgeTime(vm, "A05", "C07", "C13", "E07", 14);
    initGenEdgeTime(vm, "A06", "B10", "C13", "E07", 14);
    initGenEdgeTime(vm, "A07", "B12", "C13", "E07", 14);
    initGenEdgeTime(vm, "A08", "C07", "C13", "E07", 14);
    initGenEdgeTime(vm, "A09", "B08", "C13", "E07", 14);
    initGenEdgeTime(vm, "A10", "C07", "C13", "E07", 14);
    initGenEdgeTime(vm, "A11", "C07", "C13", "E07", 14);
    initGenEdgeTime(vm, "A13", "C13", "C13", "E07", 14);
    initGenEdgeTime(vm, "A16", "C13", "C13", "E07", 14);

    initGenEdgeTime(vm, "B03", "C02", "D13", "B02", 14);
    initGenEdgeTime(vm, "B07", "A10", "C13", "E07", 14);
    initGenEdgeTime(vm, "B09", "A05", "C13", "E07", 14);
    initGenEdgeTime(vm, "B11", "A08", "C13", "E07", 14);

    initGenEdgeTime(vm, "C02", "E02", "E02", "E15", 14);
    initGenEdgeTime(vm, "C04", "C06", "C07", "E11", 14);
    initGenEdgeTime(vm, "C04", "C08", "C13", "E07", 14);
    initGenEdgeTime(vm, "C05", "C03", "B16", "C05", 14);
    initGenEdgeTime(vm, "C07", "C03", "C13", "E07", 14);
    initGenEdgeTime(vm, "C08", "A12", "C13", "E07", 14);
    initGenEdgeTime(vm, "C08", "A09", "C13", "E07", 14);
    initGenEdgeTime(vm, "C08", "A07", "C13", "E07", 14);
    initGenEdgeTime(vm, "C08", "A06", "C13", "E07", 14);
    initGenEdgeTime(vm, "C10", "B03", "C12", "A04", 14);
    initGenEdgeTime(vm, "C14", "A02", "C13", "E07", 14);
    initGenEdgeTime(vm, "C14", "A14", "C13", "E07", 14);
    initGenEdgeTime(vm, "C14", "A15", "C13", "E07", 14);

    initGenEdgeTime(vm, "D02", "E04", "E02", "E15", 14);

    initGenEdgeTime(vm, "E04", "E05", "E15", "C12", 14);
    initGenEdgeTime(vm, "E12", "C08", "C05", "C15", 14);


    // speed 13
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C13"), 13, 964);
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C11"), 13, 627);
    updateEdgeTime(vm, sensor2i("A04"), sensor2i("B16"), 13, 702);

    updateEdgeTime(vm, sensor2i("B01"), sensor2i("D14"), 13, 647);
    updateEdgeTime(vm, sensor2i("B02"), sensor2i("C09"), 13, 569);
    updateEdgeTime(vm, sensor2i("B04"), sensor2i("C09"), 13, 566);
    updateEdgeTime(vm, sensor2i("B05"), sensor2i("D03"), 13, 647);
    updateEdgeTime(vm, sensor2i("B06"), sensor2i("C12"), 13, 549);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("D02"), 13, 793);
    updateEdgeTime(vm, sensor2i("B14"), sensor2i("D16"), 13, 264);
    updateEdgeTime(vm, sensor2i("B15"), sensor2i("A03"), 13, 681);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C10"), 13, 593);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C05"), 13, 807);

    updateEdgeTime(vm, sensor2i("C01"), sensor2i("B04"), 13, 359);
    updateEdgeTime(vm, sensor2i("C02"), sensor2i("E02"), 13, 793);
    updateEdgeTime(vm, sensor2i("C02"), sensor2i("D02"), 13, 827);
    updateEdgeTime(vm, sensor2i("C05"), sensor2i("C15"), 13, 427);
    updateEdgeTime(vm, sensor2i("C05"), sensor2i("E11"), 13, 1774);
    updateEdgeTime(vm, sensor2i("C06"), sensor2i("B15"), 13, 792);
    updateEdgeTime(vm, sensor2i("C09"), sensor2i("B15"), 13, 600);
    updateEdgeTime(vm, sensor2i("C10"), sensor2i("B01"), 13, 585);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("E16"), 13, 569);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("B05"), 13, 549);
    updateEdgeTime(vm, sensor2i("C12"), sensor2i("A04"), 13, 617);
    updateEdgeTime(vm, sensor2i("C13"), sensor2i("E07"), 13, 1491);
    updateEdgeTime(vm, sensor2i("C14"), sensor2i("A04"), 13, 978);
    updateEdgeTime(vm, sensor2i("C15"), sensor2i("D12"), 13, 693);
    updateEdgeTime(vm, sensor2i("C16"), sensor2i("C06"), 13, 451);

    updateEdgeTime(vm, sensor2i("D01"), sensor2i("C01"), 13, 807);
    updateEdgeTime(vm, sensor2i("D01"), sensor2i("B14"), 13, 807);
    updateEdgeTime(vm, sensor2i("D03"), sensor2i("E05"), 13, 437);
    updateEdgeTime(vm, sensor2i("D04"), sensor2i("B06"), 13, 643);
    updateEdgeTime(vm, sensor2i("D05"), sensor2i("E06"), 13, 578);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("E10"), 13, 1067);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("D09"), 13, 1167);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("E10"), 13, 1201);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("D09"), 13, 1301);
    updateEdgeTime(vm, sensor2i("D08"), sensor2i("E08"), 13, 598);
    updateEdgeTime(vm, sensor2i("D09"), sensor2i("E12"), 13, 577);
    updateEdgeTime(vm, sensor2i("D10"), sensor2i("D08"), 13, 1348);
    updateEdgeTime(vm, sensor2i("D10"), sensor2i("D05"), 13, 1229);
    updateEdgeTime(vm, sensor2i("D11"), sensor2i("C16"), 13, 645);
    updateEdgeTime(vm, sensor2i("D12"), sensor2i("E11"), 13, 435);
    updateEdgeTime(vm, sensor2i("D13"), sensor2i("B02"), 13, 632);
    updateEdgeTime(vm, sensor2i("D14"), sensor2i("E14"), 13, 442);
    updateEdgeTime(vm, sensor2i("D15"), sensor2i("B13"), 13, 244);
    updateEdgeTime(vm, sensor2i("D16"), sensor2i("E14"), 13, 461);

    updateEdgeTime(vm, sensor2i("E01"), sensor2i("C01"), 13, 811);
    updateEdgeTime(vm, sensor2i("E01"), sensor2i("B14"), 13, 793);
    updateEdgeTime(vm, sensor2i("E02"), sensor2i("E15"), 13, 294);
    updateEdgeTime(vm, sensor2i("E03"), sensor2i("D01"), 13, 263);
    updateEdgeTime(vm, sensor2i("E05"), sensor2i("D06"), 13, 617);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("E03"), 13, 488);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("D04"), 13, 445);
    updateEdgeTime(vm, sensor2i("E07"), sensor2i("D07"), 13, 610);
    updateEdgeTime(vm, sensor2i("E08"), sensor2i("C14"), 13, 1492);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D08"), 13, 1199);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D05"), 13, 1061);
    updateEdgeTime(vm, sensor2i("E10"), sensor2i("E13"), 13, 589);
    updateEdgeTime(vm, sensor2i("E11"), sensor2i("D10"), 13, 574);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("D11"), 13, 427);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("C06"), 13, 1753);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D13"), 13, 427);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D15"), 13, 467);
    updateEdgeTime(vm, sensor2i("E14"), sensor2i("E09"), 13, 612);
    updateEdgeTime(vm, sensor2i("E15"), sensor2i("C12"), 13, 579);
    updateEdgeTime(vm, sensor2i("E16"), sensor2i("E01"), 13, 265);


    initGenEdgeTime(vm, "A01", "C13", "C13", "E07", 13);
    initGenEdgeTime(vm, "A05", "C07", "C13", "E07", 13);
    initGenEdgeTime(vm, "A06", "B10", "C13", "E07", 13);
    initGenEdgeTime(vm, "A07", "B12", "C13", "E07", 13);
    initGenEdgeTime(vm, "A08", "C07", "C13", "E07", 13);
    initGenEdgeTime(vm, "A09", "B08", "C13", "E07", 13);
    initGenEdgeTime(vm, "A10", "C07", "C13", "E07", 13);
    initGenEdgeTime(vm, "A11", "C07", "C13", "E07", 13);
    initGenEdgeTime(vm, "A13", "C13", "C13", "E07", 13);
    initGenEdgeTime(vm, "A16", "C13", "C13", "E07", 13);

    initGenEdgeTime(vm, "B03", "C02", "D13", "B02", 13);
    initGenEdgeTime(vm, "B07", "A10", "C13", "E07", 13);
    initGenEdgeTime(vm, "B09", "A05", "C13", "E07", 13);
    initGenEdgeTime(vm, "B11", "A08", "C13", "E07", 13);
    initGenEdgeTime(vm, "B13", "E02", "C13", "E07", 13);


    initGenEdgeTime(vm, "C04", "C06", "B16", "C05", 13);
    initGenEdgeTime(vm, "C04", "C08", "C13", "E07", 13);
    initGenEdgeTime(vm, "C05", "C03", "B16", "C05", 13);
    initGenEdgeTime(vm, "C07", "E11", "B16", "C05", 13);
    initGenEdgeTime(vm, "C07", "C03", "C13", "E07", 13);
    initGenEdgeTime(vm, "C08", "A12", "C13", "E07", 13);
    initGenEdgeTime(vm, "C08", "A09", "C13", "E07", 13);
    initGenEdgeTime(vm, "C08", "A07", "C13", "E07", 13);
    initGenEdgeTime(vm, "C08", "A06", "C13", "E07", 13);
    initGenEdgeTime(vm, "C10", "B03", "C12", "A04", 13);
    initGenEdgeTime(vm, "C13", "A02", "C13", "E07", 13);
    initGenEdgeTime(vm, "C13", "A13", "C13", "E07", 13);
    initGenEdgeTime(vm, "C13", "A15", "C13", "E07", 13);
    initGenEdgeTime(vm, "C14", "A02", "C13", "E07", 13);
    initGenEdgeTime(vm, "C14", "A14", "C13", "E07", 13);
    initGenEdgeTime(vm, "C14", "A15", "C13", "E07", 13);

    initGenEdgeTime(vm, "D02", "E04", "E02", "E15", 13);

    initGenEdgeTime(vm, "E04", "E05", "E15", "C12", 13);
    initGenEdgeTime(vm, "E12", "C08", "C05", "C15", 13);


    // speed 12
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C13"), 12, 1127);
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C11"), 12, 738);
    updateEdgeTime(vm, sensor2i("A04"), sensor2i("B16"), 12, 803);

    updateEdgeTime(vm, sensor2i("B01"), sensor2i("D14"), 12, 741);
    updateEdgeTime(vm, sensor2i("B02"), sensor2i("C09"), 12, 660);
    updateEdgeTime(vm, sensor2i("B04"), sensor2i("C09"), 12, 660);
    updateEdgeTime(vm, sensor2i("B05"), sensor2i("D03"), 12, 734);
    updateEdgeTime(vm, sensor2i("B06"), sensor2i("C12"), 12, 632);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("D02"), 12, 955);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("E02"), 12, 914);
    updateEdgeTime(vm, sensor2i("B14"), sensor2i("D16"), 12, 305);
    updateEdgeTime(vm, sensor2i("B15"), sensor2i("A03"), 12, 799);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C10"), 12, 692);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C05"), 12, 935);

    updateEdgeTime(vm, sensor2i("C01"), sensor2i("B04"), 12, 399);
    updateEdgeTime(vm, sensor2i("C02"), sensor2i("E02"), 12, 945);
    updateEdgeTime(vm, sensor2i("C02"), sensor2i("D02"), 12, 903);
    updateEdgeTime(vm, sensor2i("C05"), sensor2i("C15"), 12, 518);
    updateEdgeTime(vm, sensor2i("C05"), sensor2i("E11"), 12, 2045);
    updateEdgeTime(vm, sensor2i("C06"), sensor2i("B15"), 12, 917);
    updateEdgeTime(vm, sensor2i("C09"), sensor2i("B15"), 12, 699);
    updateEdgeTime(vm, sensor2i("C10"), sensor2i("B01"), 12, 667);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("E16"), 12, 631);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("B05"), 12, 631);
    updateEdgeTime(vm, sensor2i("C12"), sensor2i("A04"), 12, 710);
    updateEdgeTime(vm, sensor2i("C13"), sensor2i("E07"), 12, 1701);
    updateEdgeTime(vm, sensor2i("C14"), sensor2i("A04"), 12, 1122);
    updateEdgeTime(vm, sensor2i("C15"), sensor2i("D12"), 12, 793);
    updateEdgeTime(vm, sensor2i("C16"), sensor2i("C06"), 12, 934);


    updateEdgeTime(vm, sensor2i("D01"), sensor2i("C01"), 12, 929);
    updateEdgeTime(vm, sensor2i("D01"), sensor2i("B14"), 12, 916);
    updateEdgeTime(vm, sensor2i("D03"), sensor2i("E05"), 12, 503);
    updateEdgeTime(vm, sensor2i("D04"), sensor2i("B06"), 12, 753);
    updateEdgeTime(vm, sensor2i("D05"), sensor2i("E06"), 12, 671);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("E10"), 12, 1230);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("D09"), 12, 1365);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("E10"), 12, 1392);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("D09"), 12, 1526);
    updateEdgeTime(vm, sensor2i("D08"), sensor2i("E08"), 12, 698);
    updateEdgeTime(vm, sensor2i("D09"), sensor2i("E12"), 12, 702);
    updateEdgeTime(vm, sensor2i("D10"), sensor2i("D08"), 12, 1544);
    updateEdgeTime(vm, sensor2i("D10"), sensor2i("D05"), 12, 1379);
    updateEdgeTime(vm, sensor2i("D11"), sensor2i("C16"), 12, 746);
    updateEdgeTime(vm, sensor2i("D12"), sensor2i("E11"), 12, 518);
    updateEdgeTime(vm, sensor2i("D13"), sensor2i("B02"), 12, 731);
    updateEdgeTime(vm, sensor2i("D14"), sensor2i("E14"), 12, 519);
    updateEdgeTime(vm, sensor2i("D15"), sensor2i("B13"), 12, 317);
    updateEdgeTime(vm, sensor2i("D16"), sensor2i("E14"), 12, 541);



    updateEdgeTime(vm, sensor2i("E01"), sensor2i("C01"), 12, 952);
    updateEdgeTime(vm, sensor2i("E01"), sensor2i("B14"), 12, 914);
    updateEdgeTime(vm, sensor2i("E02"), sensor2i("E15"), 12, 321);
    updateEdgeTime(vm, sensor2i("E03"), sensor2i("D01"), 12, 305);
    updateEdgeTime(vm, sensor2i("E05"), sensor2i("D06"), 12, 709);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("E03"), 12, 549);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("D04"), 12, 510);
    updateEdgeTime(vm, sensor2i("E07"), sensor2i("D07"), 12, 698);
    updateEdgeTime(vm, sensor2i("E08"), sensor2i("C14"), 12, 1731);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D08"), 12, 1378);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D05"), 12, 1230);
    updateEdgeTime(vm, sensor2i("E10"), sensor2i("E13"), 12, 690);
    updateEdgeTime(vm, sensor2i("E11"), sensor2i("D10"), 12, 659);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("D11"), 12, 499);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("C06"), 12, 2057);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D13"), 12, 480);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D15"), 12, 524);
    updateEdgeTime(vm, sensor2i("E14"), sensor2i("E09"), 12, 688);
    updateEdgeTime(vm, sensor2i("E15"), sensor2i("C12"), 12, 692);
    updateEdgeTime(vm, sensor2i("E16"), sensor2i("E01"), 12, 316);



    initGenEdgeTime(vm, "A01", "C13", "C13", "E07", 12);
    initGenEdgeTime(vm, "A05", "C07", "C13", "E07", 12);
    initGenEdgeTime(vm, "A06", "B10", "C13", "E07", 12);
    initGenEdgeTime(vm, "A07", "B12", "C13", "E07", 12);
    initGenEdgeTime(vm, "A08", "C07", "C13", "E07", 12);
    initGenEdgeTime(vm, "A09", "B08", "C13", "E07", 12);
    initGenEdgeTime(vm, "A10", "C07", "C13", "E07", 12);
    initGenEdgeTime(vm, "A11", "C07", "C13", "E07", 12);
    initGenEdgeTime(vm, "A13", "C13", "C13", "E07", 12);
    initGenEdgeTime(vm, "A16", "C13", "C13", "E07", 12);

    initGenEdgeTime(vm, "B03", "C02", "D13", "B02", 12);
    initGenEdgeTime(vm, "B07", "A10", "C13", "E07", 12);
    initGenEdgeTime(vm, "B09", "A05", "C13", "E07", 12);
    initGenEdgeTime(vm, "B11", "A08", "C13", "E07", 12);


    initGenEdgeTime(vm, "C04", "C06", "B16", "C05", 12);
    initGenEdgeTime(vm, "C04", "C08", "C13", "E07", 12);
    initGenEdgeTime(vm, "C05", "C03", "B16", "C05", 12);
    initGenEdgeTime(vm, "C07", "E11", "B16", "C05", 12);
    initGenEdgeTime(vm, "C07", "C03", "C13", "E07", 12);
    initGenEdgeTime(vm, "C08", "A12", "C13", "E07", 12);
    initGenEdgeTime(vm, "C08", "A09", "C13", "E07", 12);
    initGenEdgeTime(vm, "C08", "A07", "C13", "E07", 12);
    initGenEdgeTime(vm, "C08", "A06", "C13", "E07", 12);
    initGenEdgeTime(vm, "C10", "B03", "C12", "A04", 12);
    initGenEdgeTime(vm, "C14", "A02", "C13", "E07", 12);
    initGenEdgeTime(vm, "C14", "A14", "C13", "E07", 12);
    initGenEdgeTime(vm, "C14", "A15", "C13", "E07", 12);

    initGenEdgeTime(vm, "D02", "E04", "E02", "E15", 12);

    initGenEdgeTime(vm, "E04", "E05", "E15", "C12", 12);
    initGenEdgeTime(vm, "E12", "C08", "C05", "C15", 12);

    // speed 11
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C13"), 11, 1307);
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C11"), 11, 854);
    updateEdgeTime(vm, sensor2i("A04"), sensor2i("B16"), 11, 952);

    updateEdgeTime(vm, sensor2i("B02"), sensor2i("C09"), 11, 761);
    updateEdgeTime(vm, sensor2i("B04"), sensor2i("C09"), 11, 785);
    updateEdgeTime(vm, sensor2i("B05"), sensor2i("D03"), 11, 861);
    updateEdgeTime(vm, sensor2i("B06"), sensor2i("C12"), 11, 767);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("D02"), 11, 1082);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("E02"), 11, 1014);
    updateEdgeTime(vm, sensor2i("B14"), sensor2i("D16"), 11, 383);
    updateEdgeTime(vm, sensor2i("B15"), sensor2i("A03"), 11, 958);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C10"), 11, 859);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C05"), 11, 1056);

    updateEdgeTime(vm, sensor2i("C01"), sensor2i("B04"), 11, 438);
    updateEdgeTime(vm, sensor2i("C02"), sensor2i("D02"), 11, 1097);
    updateEdgeTime(vm, sensor2i("C05"), sensor2i("C15"), 11, 630);
    updateEdgeTime(vm, sensor2i("C05"), sensor2i("E11"), 11, 2398);
    updateEdgeTime(vm, sensor2i("C06"), sensor2i("B15"), 11, 1083);
    updateEdgeTime(vm, sensor2i("C09"), sensor2i("B15"), 11, 820);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("E16"), 11, 778);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("B05"), 11, 742);
    updateEdgeTime(vm, sensor2i("C12"), sensor2i("A04"), 11, 846);
    updateEdgeTime(vm, sensor2i("C13"), sensor2i("E07"), 11, 1976);
    updateEdgeTime(vm, sensor2i("C15"), sensor2i("D12"), 11, 915);
    updateEdgeTime(vm, sensor2i("C16"), sensor2i("C06"), 11, 658);

    updateEdgeTime(vm, sensor2i("D01"), sensor2i("C01"), 11, 1052);
    updateEdgeTime(vm, sensor2i("D01"), sensor2i("B14"), 11, 1098);
    updateEdgeTime(vm, sensor2i("D03"), sensor2i("E05"), 11, 584);
    updateEdgeTime(vm, sensor2i("D04"), sensor2i("B06"), 11, 888);
    updateEdgeTime(vm, sensor2i("D05"), sensor2i("E06"), 11, 816);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("E10"), 11, 1419);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("D09"), 11, 1568);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("E10"), 11, 1586);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("D09"), 11, 1778);
    updateEdgeTime(vm, sensor2i("D08"), sensor2i("E08"), 11, 818);
    updateEdgeTime(vm, sensor2i("D10"), sensor2i("D05"), 11, 1657);
    updateEdgeTime(vm, sensor2i("D11"), sensor2i("C16"), 11, 866);
    updateEdgeTime(vm, sensor2i("D12"), sensor2i("E11"), 11, 609);
    updateEdgeTime(vm, sensor2i("D13"), sensor2i("B02"), 11, 854);
    updateEdgeTime(vm, sensor2i("D15"), sensor2i("B13"), 11, 383);
    updateEdgeTime(vm, sensor2i("D16"), sensor2i("E14"), 11, 661);

    updateEdgeTime(vm, sensor2i("E01"), sensor2i("C01"), 11, 1084);
    updateEdgeTime(vm, sensor2i("E01"), sensor2i("B14"), 11, 1018);
    updateEdgeTime(vm, sensor2i("E02"), sensor2i("E15"), 11, 366);
    updateEdgeTime(vm, sensor2i("E03"), sensor2i("D01"), 11, 465);
    updateEdgeTime(vm, sensor2i("E05"), sensor2i("D06"), 11, 841);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("E03"), 11, 640);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("D04"), 11, 596);
    updateEdgeTime(vm, sensor2i("E07"), sensor2i("D07"), 11, 817);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D05"), 11, 1463);
    updateEdgeTime(vm, sensor2i("E10"), sensor2i("E13"), 11, 791);
    updateEdgeTime(vm, sensor2i("E11"), sensor2i("D10"), 11, 772);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("D11"), 11, 549);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("C06"), 11, 2385);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D13"), 11, 573);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D15"), 11, 590);
    updateEdgeTime(vm, sensor2i("E14"), sensor2i("E09"), 11, 812);
    updateEdgeTime(vm, sensor2i("E15"), sensor2i("C12"), 11, 854);
    updateEdgeTime(vm, sensor2i("E16"), sensor2i("E01"), 11, 365);


    initGenEdgeTime(vm, "A01", "C13", "C13", "E07", 11);
    initGenEdgeTime(vm, "A05", "C07", "C13", "E07", 11);
    initGenEdgeTime(vm, "A06", "B10", "C13", "E07", 11);
    initGenEdgeTime(vm, "A07", "B12", "C13", "E07", 11);
    initGenEdgeTime(vm, "A08", "C07", "C13", "E07", 11);
    initGenEdgeTime(vm, "A09", "B08", "C13", "E07", 11);
    initGenEdgeTime(vm, "A10", "C07", "C13", "E07", 11);
    initGenEdgeTime(vm, "A11", "C07", "C13", "E07", 11);
    initGenEdgeTime(vm, "A13", "C13", "C13", "E07", 11);
    initGenEdgeTime(vm, "A16", "C13", "C13", "E07", 11);

    initGenEdgeTime(vm, "B01", "D14", "D13", "B02", 11);
    initGenEdgeTime(vm, "B03", "C02", "D13", "B02", 11);
    initGenEdgeTime(vm, "B07", "A10", "C13", "E07", 11);
    initGenEdgeTime(vm, "B09", "A05", "C13", "E07", 11);
    initGenEdgeTime(vm, "B11", "A08", "C13", "E07", 11);


    initGenEdgeTime(vm, "C02", "E02", "B13", "D02", 11);
    initGenEdgeTime(vm, "C04", "C06", "B16", "C05", 11);
    initGenEdgeTime(vm, "C04", "C08", "C13", "E07", 11);
    initGenEdgeTime(vm, "C05", "C03", "B16", "C05", 11);
    initGenEdgeTime(vm, "C07", "E11", "B16", "C05", 11);
    initGenEdgeTime(vm, "C07", "C03", "C13", "E07", 11);
    initGenEdgeTime(vm, "C08", "A12", "C13", "E07", 11);
    initGenEdgeTime(vm, "C08", "A09", "C13", "E07", 11);
    initGenEdgeTime(vm, "C08", "A07", "C13", "E07", 11);
    initGenEdgeTime(vm, "C08", "A06", "C13", "E07", 11);
    initGenEdgeTime(vm, "C10", "B03", "C12", "A04", 11);
    initGenEdgeTime(vm, "C10", "B01", "C05", "C15", 11);
    initGenEdgeTime(vm, "C14", "A02", "C13", "E07", 11);
    initGenEdgeTime(vm, "C14", "A14", "C13", "E07", 11);
    initGenEdgeTime(vm, "C14", "A15", "C13", "E07", 11);
    initGenEdgeTime(vm, "C14", "A04", "B16", "C05", 11);

    initGenEdgeTime(vm, "D02", "E04", "E02", "E15", 11);
    initGenEdgeTime(vm, "D09", "E12", "E11", "D10", 11);
    initGenEdgeTime(vm, "D10", "D08", "D07", "D09", 11);
    initGenEdgeTime(vm, "D14", "E14", "C10", "B01", 11);

    initGenEdgeTime(vm, "E04", "E05", "E15", "C12", 11);
    initGenEdgeTime(vm, "E08", "C14", "C14", "A04", 11);
    initGenEdgeTime(vm, "E09", "D08", "D06", "D09", 11);
    initGenEdgeTime(vm, "E12", "C08", "C05", "C15", 11);


    // speed 10
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C13"), 10, 1757);
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C11"), 10, 1159);

    updateEdgeTime(vm, sensor2i("B02"), sensor2i("C09"), 10, 1037);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("D02"), 10, 1403);
    updateEdgeTime(vm, sensor2i("B14"), sensor2i("D16"), 10, 528);
    updateEdgeTime(vm, sensor2i("B15"), sensor2i("A03"), 10, 1323);

    updateEdgeTime(vm, sensor2i("C01"), sensor2i("B04"), 10, 569);
    updateEdgeTime(vm, sensor2i("C06"), sensor2i("B15"), 10, 1427);
    updateEdgeTime(vm, sensor2i("C07"), sensor2i("E11"), 10, 2500);
    updateEdgeTime(vm, sensor2i("C09"), sensor2i("B15"), 10, 1103);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("E16"), 10, 1104);
    updateEdgeTime(vm, sensor2i("C13"), sensor2i("E07"), 10, 2712);

    updateEdgeTime(vm, sensor2i("D01"), sensor2i("C01"), 10, 1464);
    updateEdgeTime(vm, sensor2i("D01"), sensor2i("B14"), 10, 1433);
    updateEdgeTime(vm, sensor2i("D05"), sensor2i("E06"), 10, 1107);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("E10"), 10, 1952);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("D09"), 10, 2135);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("E10"), 10, 2196);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("D09"), 10, 2378);
    updateEdgeTime(vm, sensor2i("D10"), sensor2i("D05"), 10, 2256);
    updateEdgeTime(vm, sensor2i("D15"), sensor2i("B13"), 10, 488);
    updateEdgeTime(vm, sensor2i("D16"), sensor2i("E14"), 10, 874);

    updateEdgeTime(vm, sensor2i("E01"), sensor2i("C01"), 10, 1464);
    updateEdgeTime(vm, sensor2i("E01"), sensor2i("B14"), 10, 1341);
    updateEdgeTime(vm, sensor2i("E03"), sensor2i("D01"), 10, 488);
    updateEdgeTime(vm, sensor2i("E05"), sensor2i("D06"), 10, 1159);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("E03"), 10, 869);
    updateEdgeTime(vm, sensor2i("E07"), sensor2i("D07"), 10, 1087);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D05"), 10, 1951);
    updateEdgeTime(vm, sensor2i("E10"), sensor2i("E13"), 10, 1067);
    updateEdgeTime(vm, sensor2i("E11"), sensor2i("D10"), 10, 1098);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("C06"), 10, 3195);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D15"), 10, 793);
    updateEdgeTime(vm, sensor2i("E14"), sensor2i("E09"), 10, 1097);
    updateEdgeTime(vm, sensor2i("E16"), sensor2i("E01"), 10, 442);


    initGenEdgeTime(vm, "A01", "C13", "C13", "E07", 10);
    initGenEdgeTime(vm, "A04", "B16", "D06", "D09", 10);
    initGenEdgeTime(vm, "A05", "C07", "C13", "E07", 10);
    initGenEdgeTime(vm, "A06", "B10", "C13", "E07", 10);
    initGenEdgeTime(vm, "A07", "B12", "C13", "E07", 10);
    initGenEdgeTime(vm, "A08", "C07", "C13", "E07", 10);
    initGenEdgeTime(vm, "A09", "B08", "C13", "E07", 10);
    initGenEdgeTime(vm, "A10", "C07", "C13", "E07", 10);
    initGenEdgeTime(vm, "A11", "C07", "C13", "E07", 10);
    initGenEdgeTime(vm, "A13", "C13", "C13", "E07", 10);
    initGenEdgeTime(vm, "A16", "C13", "C13", "E07", 10);

    initGenEdgeTime(vm, "B01", "D14", "A01", "C13", 10);
    initGenEdgeTime(vm, "B03", "C02", "A01", "C13", 10);
    initGenEdgeTime(vm, "B04", "C09", "D16", "E14", 10);
    initGenEdgeTime(vm, "B05", "D03", "B01", "D14", 10);
    initGenEdgeTime(vm, "B06", "C12", "B02", "C09", 10);
    initGenEdgeTime(vm, "B07", "A10", "C13", "E07", 10);
    initGenEdgeTime(vm, "B09", "A05", "C13", "E07", 10);
    initGenEdgeTime(vm, "B11", "A08", "C13", "E07", 10);
    initGenEdgeTime(vm, "B13", "D02", "E01", "C01", 10);
    initGenEdgeTime(vm, "B13", "E02", "B01", "D14", 10);
    initGenEdgeTime(vm, "B16", "C10", "A03", "C11", 10);
    initGenEdgeTime(vm, "B16", "C05", "A03", "C13", 10);

    initGenEdgeTime(vm, "C01", "B04", "B03", "C02", 10);
    initGenEdgeTime(vm, "C02", "D02", "B13", "E02", 10);
    initGenEdgeTime(vm, "C02", "E02", "B13", "D02", 10);
    initGenEdgeTime(vm, "C04", "C06", "B16", "C05", 10);
    initGenEdgeTime(vm, "C04", "C08", "C13", "E07", 10);
    initGenEdgeTime(vm, "C05", "C03", "B16", "C05", 10);
    initGenEdgeTime(vm, "C05", "C15", "C07", "E11", 10);
    initGenEdgeTime(vm, "C05", "E11", "C07", "E11", 10);
    initGenEdgeTime(vm, "C07", "C03", "C13", "E07", 10);
    initGenEdgeTime(vm, "C08", "A12", "C13", "E07", 10);
    initGenEdgeTime(vm, "C08", "A09", "C13", "E07", 10);
    initGenEdgeTime(vm, "C08", "A07", "C13", "E07", 10);
    initGenEdgeTime(vm, "C08", "A06", "C13", "E07", 10);
    initGenEdgeTime(vm, "C10", "B03", "C05", "C15", 10);
    initGenEdgeTime(vm, "C10", "B01", "C05", "C15", 10);
    initGenEdgeTime(vm, "C11", "B05", "B05", "D03", 10);
    initGenEdgeTime(vm, "C12", "A04", "C06", "B15", 10);
    initGenEdgeTime(vm, "C14", "A02", "C13", "E07", 10);
    initGenEdgeTime(vm, "C14", "A14", "C13", "E07", 10);
    initGenEdgeTime(vm, "C14", "A15", "C13", "E07", 10);
    initGenEdgeTime(vm, "C14", "A04", "B16", "C05", 10);
    initGenEdgeTime(vm, "C15", "D12", "B06", "C12", 10);
    initGenEdgeTime(vm, "C16", "C06", "B06", "C12", 10);

    initGenEdgeTime(vm, "D02", "E04", "C02", "D02", 10);
    initGenEdgeTime(vm, "D03", "E05", "C11", "B05", 10);
    initGenEdgeTime(vm, "D04", "B06", "B01", "D14", 10);
    initGenEdgeTime(vm, "D08", "E08", "E07", "D07", 10);
    initGenEdgeTime(vm, "D09", "E12", "E11", "D10", 10);
    initGenEdgeTime(vm, "D10", "D08", "D07", "D09", 10);
    initGenEdgeTime(vm, "D11", "C16", "C15", "D12", 10);
    initGenEdgeTime(vm, "D12", "E11", "C16", "C06", 10);
    initGenEdgeTime(vm, "D13", "B02", "B01", "D14", 10);
    initGenEdgeTime(vm, "D14", "E14", "C10", "B01", 10);

    initGenEdgeTime(vm, "E02", "E15", "D02", "E04", 10);
    initGenEdgeTime(vm, "E04", "E05", "D02", "E04", 10);
    initGenEdgeTime(vm, "E06", "D04", "A03", "C11", 10);
    initGenEdgeTime(vm, "E08", "C14", "C14", "A04", 10);
    initGenEdgeTime(vm, "E09", "D08", "D06", "D09", 10);
    initGenEdgeTime(vm, "E12", "C08", "C05", "C15", 10);
    initGenEdgeTime(vm, "E12", "D11", "D08", "E08", 10);
    initGenEdgeTime(vm, "E13", "D13", "C10", "B01", 10);
    initGenEdgeTime(vm, "E15", "C12", "E04", "E05", 10);


    // speed 9
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C13"), 9, 1952);
    updateEdgeTime(vm, sensor2i("A03"), sensor2i("C11"), 9, 1237);
    updateEdgeTime(vm, sensor2i("A04"), sensor2i("B16"), 9, 1423);

    updateEdgeTime(vm, sensor2i("B02"), sensor2i("C09"), 9, 1097);
    updateEdgeTime(vm, sensor2i("B04"), sensor2i("C09"), 9, 1159);
    updateEdgeTime(vm, sensor2i("B05"), sensor2i("D03"), 9, 1281);
    updateEdgeTime(vm, sensor2i("B06"), sensor2i("C12"), 9, 1159);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("D02"), 9, 1592);
    updateEdgeTime(vm, sensor2i("B13"), sensor2i("E02"), 9, 1525);
    updateEdgeTime(vm, sensor2i("B14"), sensor2i("D16"), 9, 569);
    updateEdgeTime(vm, sensor2i("B15"), sensor2i("A03"), 9, 1443);
    updateEdgeTime(vm, sensor2i("B16"), sensor2i("C10"), 9, 1178);

    updateEdgeTime(vm, sensor2i("C01"), sensor2i("B04"), 9, 658);
    updateEdgeTime(vm, sensor2i("C02"), sensor2i("E02"), 9, 1586);
    updateEdgeTime(vm, sensor2i("C02"), sensor2i("D02"), 9, 1585);
    updateEdgeTime(vm, sensor2i("C06"), sensor2i("B15"), 9, 1587);
    updateEdgeTime(vm, sensor2i("C09"), sensor2i("B15"), 9, 1219);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("E16"), 9, 1158);
    updateEdgeTime(vm, sensor2i("C11"), sensor2i("B05"), 9, 1062);
    updateEdgeTime(vm, sensor2i("C12"), sensor2i("A04"), 9, 1199);
    updateEdgeTime(vm, sensor2i("C13"), sensor2i("E07"), 9, 2911);
    updateEdgeTime(vm, sensor2i("C16"), sensor2i("C06"), 9, 923);

    updateEdgeTime(vm, sensor2i("D01"), sensor2i("C01"), 9, 1647);
    updateEdgeTime(vm, sensor2i("D01"), sensor2i("B14"), 9, 1586);
    updateEdgeTime(vm, sensor2i("D02"), sensor2i("E04"), 9, 671);
    updateEdgeTime(vm, sensor2i("D03"), sensor2i("E05"), 9, 854);
    updateEdgeTime(vm, sensor2i("D04"), sensor2i("B06"), 9, 1281);
    updateEdgeTime(vm, sensor2i("D05"), sensor2i("E06"), 9, 1211);
    updateEdgeTime(vm, sensor2i("D06"), sensor2i("E10"), 9, 2125);
    updateEdgeTime(vm, sensor2i("D07"), sensor2i("D09"), 9, 2623);
    updateEdgeTime(vm, sensor2i("D09"), sensor2i("E12"), 9, 1174);
    updateEdgeTime(vm, sensor2i("D11"), sensor2i("C16"), 9, 1402);
    updateEdgeTime(vm, sensor2i("D13"), sensor2i("B02"), 9, 1280);
    updateEdgeTime(vm, sensor2i("D15"), sensor2i("B13"), 9, 560);
    updateEdgeTime(vm, sensor2i("D16"), sensor2i("E14"), 9, 976);

    updateEdgeTime(vm, sensor2i("E01"), sensor2i("C01"), 9, 1586);
    updateEdgeTime(vm, sensor2i("E01"), sensor2i("B14"), 9, 1463);
    updateEdgeTime(vm, sensor2i("E02"), sensor2i("E15"), 9, 579);
    updateEdgeTime(vm, sensor2i("E03"), sensor2i("D01"), 9, 549);
    updateEdgeTime(vm, sensor2i("E04"), sensor2i("E05"), 9, 854);
    updateEdgeTime(vm, sensor2i("E05"), sensor2i("D06"), 9, 1268);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("E03"), 9, 976);
    updateEdgeTime(vm, sensor2i("E06"), sensor2i("D04"), 9, 853);
    updateEdgeTime(vm, sensor2i("E07"), sensor2i("D07"), 9, 1189);
    updateEdgeTime(vm, sensor2i("E09"), sensor2i("D05"), 9, 2206);
    updateEdgeTime(vm, sensor2i("E10"), sensor2i("E13"), 9, 1184);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("D11"), 9, 854);
    updateEdgeTime(vm, sensor2i("E12"), sensor2i("C06"), 9, 3538);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D13"), 9, 854);
    updateEdgeTime(vm, sensor2i("E13"), sensor2i("D15"), 9, 870);
    updateEdgeTime(vm, sensor2i("E14"), sensor2i("E09"), 9, 1220);
    updateEdgeTime(vm, sensor2i("E15"), sensor2i("C12"), 9, 1189);
    updateEdgeTime(vm, sensor2i("E16"), sensor2i("E01"), 9, 602);



    initGenEdgeTime(vm, "A01", "C13", "C13", "E07", 9);
    initGenEdgeTime(vm, "A05", "C07", "C13", "E07", 9);
    initGenEdgeTime(vm, "A06", "B10", "C13", "E07", 9);
    initGenEdgeTime(vm, "A07", "B12", "C13", "E07", 9);
    initGenEdgeTime(vm, "A08", "C07", "C13", "E07", 9);
    initGenEdgeTime(vm, "A09", "B08", "C13", "E07", 9);
    initGenEdgeTime(vm, "A10", "C07", "C13", "E07", 9);
    initGenEdgeTime(vm, "A11", "C07", "C13", "E07", 9);
    initGenEdgeTime(vm, "A13", "C13", "C13", "E07", 9);
    initGenEdgeTime(vm, "A16", "C13", "C13", "E07", 9);

    initGenEdgeTime(vm, "B01", "D14", "D13", "B02", 9);
    initGenEdgeTime(vm, "B03", "C02", "D13", "B02", 9);
    initGenEdgeTime(vm, "B07", "A10", "C13", "E07", 9);
    initGenEdgeTime(vm, "B09", "A05", "C13", "E07", 9);
    initGenEdgeTime(vm, "B11", "A08", "C13", "E07", 9);
    initGenEdgeTime(vm, "B16", "C05", "A03", "C13", 9);

    initGenEdgeTime(vm, "C04", "C06", "B16", "C05", 9);
    initGenEdgeTime(vm, "C04", "C08", "C13", "E07", 9);
    initGenEdgeTime(vm, "C05", "C03", "B16", "C05", 9);
    initGenEdgeTime(vm, "C05", "C15", "B16", "C05", 9);
    initGenEdgeTime(vm, "C05", "E11", "C05", "C15", 9);
    initGenEdgeTime(vm, "C07", "C03", "C13", "E07", 9);
    initGenEdgeTime(vm, "C07", "E11", "B16", "C05", 9);
    initGenEdgeTime(vm, "C08", "A12", "C13", "E07", 9);
    initGenEdgeTime(vm, "C08", "A09", "C13", "E07", 9);
    initGenEdgeTime(vm, "C08", "A07", "C13", "E07", 9);
    initGenEdgeTime(vm, "C08", "A06", "C13", "E07", 9);
    initGenEdgeTime(vm, "C10", "B03", "C12", "A04", 9);
    initGenEdgeTime(vm, "C10", "B01", "C05", "C15", 9);
    initGenEdgeTime(vm, "C14", "A02", "C13", "E07", 9);
    initGenEdgeTime(vm, "C14", "A14", "C13", "E07", 9);
    initGenEdgeTime(vm, "C14", "A15", "C13", "E07", 9);
    initGenEdgeTime(vm, "C14", "A04", "B16", "C05", 9);
    initGenEdgeTime(vm, "C15", "D12", "B16", "C05", 9);

    initGenEdgeTime(vm, "D06", "D09", "D07", "D09", 9);
    initGenEdgeTime(vm, "D07", "E10", "D07", "D09", 9);
    initGenEdgeTime(vm, "D08", "E08", "E07", "D07", 9);
    initGenEdgeTime(vm, "D10", "D08", "D07", "D09", 9);
    initGenEdgeTime(vm, "D10", "D05", "D07", "D09", 9);
    initGenEdgeTime(vm, "D12", "E11", "C16", "C06", 9);
    initGenEdgeTime(vm, "D14", "E14", "C10", "B01", 9);

    initGenEdgeTime(vm, "E08", "C14", "C14", "A04", 9);
    initGenEdgeTime(vm, "E09", "D08", "D06", "D09", 9);
    initGenEdgeTime(vm, "E11", "D10", "D09", "E12", 9);
    initGenEdgeTime(vm, "E12", "C08", "D09", "E12", 9);
    initGenEdgeTime(vm, "E12", "D11", "D08", "E08", 9);


    // for track B
    initGenEdgeTime(vm, "A12", "A16", "A10", "C07", 14);
    initGenEdgeTime(vm, "A15", "A11", "A10", "C07", 14);

    initGenEdgeTime(vm, "A12", "A16", "A10", "C07", 13);
    initGenEdgeTime(vm, "A15", "A11", "A10", "C07", 13);

    initGenEdgeTime(vm, "A12", "A16", "A10", "C07", 12);
    initGenEdgeTime(vm, "A15", "A11", "A10", "C07", 12);

    initGenEdgeTime(vm, "A12", "A16", "A10", "C07", 11);
    initGenEdgeTime(vm, "A15", "A11", "A10", "C07", 11);

    initGenEdgeTime(vm, "A12", "A16", "A10", "C07", 10);
    initGenEdgeTime(vm, "A15", "A11", "A10", "C07", 10);

    initGenEdgeTime(vm, "A12", "A16", "A10", "C07", 9);
    initGenEdgeTime(vm, "A15", "A11", "A10", "C07", 9);


    for (i = 1; i < 81; i++) {
        for (j = 0; j < v[i].numChild; j++) {
            updateEdgeTime(vm, i, v[i].child[j], 8, (getEdgeDistance(vm, i, v[i].child[j]) * 1000)/225);
            updateEdgeTime(vm, i, v[i].child[j], 7, (getEdgeDistance(vm, i, v[i].child[j]) * 1000)/190);
            updateEdgeTime(vm, i, v[i].child[j], 6, (getEdgeDistance(vm, i, v[i].child[j]) * 1000)/130);
            updateEdgeTime(vm, i, v[i].child[j], 5, (getEdgeDistance(vm, i, v[i].child[j]) * 1000)/95);
            updateEdgeTime(vm, i, v[i].child[j], 4, (getEdgeDistance(vm, i, v[i].child[j]) * 1000)/60);
            updateEdgeTime(vm, i, v[i].child[j], 3, (getEdgeDistance(vm, i, v[i].child[j]) * 1000)/25);
            updateEdgeTime(vm, i, v[i].child[j], 2, (getEdgeDistance(vm, i, v[i].child[j]) * 1000)/15);
            updateEdgeTime(vm, i, v[i].child[j], 1, (getEdgeDistance(vm, i, v[i].child[j]) * 1000)/7);
        }
    }


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

