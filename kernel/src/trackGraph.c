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



void velocityModelInit(velocityModel * vm) {
    volatile int i = 0;

    velocityModelNode * v = vm->v;

    // A01
    v[1].numChild= 1;
    v[1].child[0] = sensor2i("C13");
    v[1].distance[0] = 218+190+60;
    v[1].child[1] = 0;
    v[1].child[2] = 0;
    v[1].child[3] = 0;
    v[1].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[1].time[i] = 0;
    }


    // A02
    v[2].numChild= 0;
    v[2].child[0] = 0;
    v[2].child[1] = 0;
    v[2].child[2] = 0;
    v[2].child[3] = 0;
    v[2].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[2].time[i] = 0;
    }

    // A03
    v[3].numChild= 2;
    v[3].child[0] = sensor2i("C13");
    v[3].distance[0] = 62+445+60;
    v[3].child[1] = sensor2i("C11");
    v[3].distance[1] = 62+314;
    v[3].child[2] = 0;
    v[3].child[3] = 0;
    v[3].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[3].time[i] = 0;
    }

    // A04
    v[4].numChild= 1;
    v[4].child[0] = sensor2i("B16");
    v[4].distance[0] = 440;
    v[4].child[1] = 0;
    v[4].child[2] = 0;
    v[4].child[3] = 0;
    v[4].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[4].time[i] = 0;
    }

    // A05
    v[5].numChild= 1;
    v[5].child[0] = sensor2i("C07");
    v[5].distance[0] = 216+145;
    v[5].child[1] = 0;
    v[5].child[2] = 0;
    v[5].child[3] = 0;
    v[5].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[5].time[i] = 0;
    }

    // A06
    v[6].numChild= 1;
    v[6].child[0] = sensor2i("B10");
    v[6].distance[0] = 649;
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
    v[7].child[1] = 0;
    v[7].child[2] = 0;
    v[7].child[3] = 0;
    v[7].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[7].time[i] = 0;
    }

    // A08
    v[8].numChild= 1;
    v[8].child[0] = sensor2i("C07");
    v[8].distance[0] = 211+182+145;
    v[8].child[1] = 0;
    v[8].child[2] = 0;
    v[8].child[3] = 0;
    v[8].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[8].time[i] = 0;
    }

    // A09
    v[9].numChild= 1;
    v[9].child[0] = sensor2i("B08");
    v[9].distance[0] = 289;
    v[9].child[1] = 0;
    v[9].child[2] = 0;
    v[9].child[3] = 0;
    v[9].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[9].time[i] = 0;
    }

    // A10
    v[10].numChild= 1;
    v[10].child[0] = sensor2i("C07");
    v[3].distance[0] = 62+445+60;
    v[10].child[1] = 0;
    v[10].child[2] = 0;
    v[10].child[3] = 0;
    v[10].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[10].time[i] = 0;
    }

    // A11
    v[11].numChild= 1;
    v[11].child[0] = sensor2i("C07");
    v[11].distance[0] = 410+191+182+145;
    v[11].child[1] = 0;
    v[11].child[2] = 0;
    v[11].child[3] = 0;
    v[11].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[11].time[i] = 0;
    }

    // A12
    v[12].numChild= 0;
    v[12].child[0] = 0;
    v[12].child[1] = 0;
    v[12].child[2] = 0;
    v[12].child[3] = 0;
    v[12].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[12].time[i] = 0;
    }

    // A13
    v[13].numChild= 1;
    v[13].child[0] = sensor2i("C13");
    v[13].distance[0] = 215+185+190+60;
    v[13].child[1] = 0;
    v[13].child[2] = 0;
    v[13].child[3] = 0;
    v[13].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[13].time[i] = 0;
    }

    // A14
    v[14].numChild= 0;
    v[14].child[0] = 0;
    v[14].child[1] = 0;
    v[14].child[2] = 0;
    v[14].child[3] = 0;
    v[14].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[14].time[i] = 0;
    }

    // A15
    v[15].numChild= 0;
    v[15].child[0] = 0;
    v[15].child[1] = 0;
    v[15].child[2] = 0;
    v[15].child[3] = 0;
    v[15].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[15].time[i] = 0;
    }


    // A16
    v[16].numChild= 1;
    v[16].child[0] = sensor2i("C13");
    v[16].distance[0] = 394+185+190+60;
    v[16].child[1] = 0;
    v[16].child[2] = 0;
    v[16].child[3] = 0;
    v[16].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[16].time[i] = 0;
    }



    // B01
    v[17].numChild= 1;
    v[17].child[0] = sensor2i("D14");
    v[17].distance[0] = 398;
    v[17].child[1] = 0;
    v[17].child[2] = 0;
    v[17].child[3] = 0;
    v[17].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[17].time[i] = 0;
    }


    // B02
    v[18].numChild= 1;
    v[18].child[0] = sensor2i("C09");
    v[18].distance[0] = 230+146;
    v[18].child[1] = 0;
    v[18].child[2] = 0;
    v[18].child[3] = 0;
    v[18].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[18].time[i] = 0;
    }

    // B03
    v[19].numChild= 1;
    v[19].child[0] = sensor2i("C02");
    v[19].distance[0] = 230;
    v[19].child[1] = 0;
    v[19].child[2] = 0;
    v[19].child[3] = 0;
    v[19].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[19].time[i] = 0;
    }

    // B04
    v[20].numChild= 1;
    v[20].child[0] = sensor2i("C09");
    v[20].distance[0] = 220+146;
    v[20].child[1] = 0;
    v[20].child[2] = 0;
    v[20].child[3] = 0;
    v[20].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[20].time[i] = 0;
    }

    // B05
    v[21].numChild= 1;
    v[21].child[0] = sensor2i("D03");
    v[21].distance[0] = 405;
    v[21].child[1] = 0;
    v[21].child[2] = 0;
    v[21].child[3] = 0;
    v[21].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[21].time[i] = 0;
    }

    // B06
    v[22].numChild= 1;
    v[22].child[0] = sensor2i("C12");
    v[22].distance[0] = 214+140;
    v[22].child[1] = 0;
    v[22].child[2] = 0;
    v[22].child[3] = 0;
    v[22].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[22].time[i] = 0;
    }

    // B07
    v[23].numChild= 1;
    v[23].child[0] = sensor2i("A10");
    v[23].distance[0] = 289;
    v[23].child[1] = 0;
    v[23].child[2] = 0;
    v[23].child[3] = 0;
    v[23].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[23].time[i] = 0;
    }

    // B08
    v[24].numChild= 0;
    v[24].child[0] = 0;
    v[24].child[1] = 0;
    v[24].child[2] = 0;
    v[24].child[3] = 0;
    v[24].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[24].time[i] = 0;
    }

    // B09
    v[25].numChild= 1;
    v[25].child[0] = sensor2i("A05");
    v[25].distance[0] = 649;
    v[25].child[1] = 0;
    v[25].child[2] = 0;
    v[25].child[3] = 0;
    v[25].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[25].time[i] = 0;
    }

    // B10
    v[26].numChild= 0;
    v[26].child[0] = 0;
    v[26].child[1] = 0;
    v[26].child[2] = 0;
    v[26].child[3] = 0;
    v[26].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[26].time[i] = 0;
    }

    // B11
    v[27].numChild= 1;
    v[27].child[0] = sensor2i("A08");
    v[27].distance[0] = 473;
    v[27].child[1] = 0;
    v[27].child[2] = 0;
    v[27].child[3] = 0;
    v[27].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[27].time[i] = 0;
    }

    // B12
    v[28].numChild= 0;
    v[28].child[0] = 0;
    v[28].child[1] = 0;
    v[28].child[2] = 0;
    v[28].child[3] = 0;
    v[28].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[28].time[i] = 0;
    }

    // B13
    v[29].numChild= 2;
    v[29].child[0] = sensor2i("D02");
    v[29].distance[0] = 224+32+227;
    v[29].child[1] = sensor2i("E02");
    v[29].distance[1] = 224+32+222;
    v[29].child[2] = 0;
    v[29].child[3] = 0;
    v[29].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[29].time[i] = 0;
    }

    // B14
    v[30].numChild= 1;
    v[30].child[0] = sensor2i("D16");
    v[30].distance[0] = 202;
    v[30].child[1] = 0;
    v[30].child[2] = 0;
    v[30].child[3] = 0;
    v[30].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[30].time[i] = 0;
    }

    // B15
    v[31].numChild= 1;
    v[31].child[0] = sensor2i("A03");
    v[31].distance[0] = 440;
    v[31].child[1] = 0;
    v[31].child[2] = 0;
    v[31].child[3] = 0;
    v[31].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[31].time[i] = 0;
    }


    // B16
    v[32].numChild= 2;
    v[32].child[0] = sensor2i("C10");
    v[32].distance[0] = 70+305;
    v[32].child[1] = sensor2i("C05");
    v[32].distance[1] = 70+411;
    v[32].child[2] = 0;
    v[32].child[3] = 0;
    v[32].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[32].time[i] = 0;
    }



    // C01
    v[33].numChild= 1;
    v[33].child[0] = sensor2i("B04");
    v[33].distance[0] = 230;
    v[33].child[1] = 0;
    v[33].child[2] = 0;
    v[33].child[3] = 0;
    v[33].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[33].time[i] = 0;
    }


    // C02
    v[34].numChild= 2;
    v[34].child[0] = sensor2i("E02");
    v[34].distance[0] = 228+32+222;
    v[34].child[1] = sensor2i("D02");
    v[34].distance[1] = 228+32+227;
    v[34].child[2] = 0;
    v[34].child[3] = 0;
    v[34].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[34].time[i] = 0;
    }

    // C03
    v[35].numChild= 0;
    v[35].child[0] = 0;
    v[35].child[1] = 0;
    v[35].child[2] = 0;
    v[35].child[3] = 0;
    v[35].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[35].time[i] = 0;
    }

    // C04
    v[36].numChild= 2;
    v[36].child[0] = sensor2i("C06");
    v[36].distance[0] = 226+187+338+79;
    v[36].child[1] = sensor2i("C08");
    v[36].distance[1] = 226+187+215;
    v[36].child[2] = 0;
    v[36].child[3] = 0;
    v[36].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[36].time[i] = 0;
    }

    // C05
    v[37].numChild= 3;
    v[37].child[0] = sensor2i("C15");
    v[37].distance[0] = 79+223;
    v[37].child[1] = sensor2i("E11");
    v[37].distance[1] = 79+338+187+334+65;
    v[37].child[2] = sensor2i("C03");
    v[37].distance[2] = 79+338+187+226;
    v[37].child[3] = 0;
    v[37].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[37].time[i] = 0;
    }

    // C06
    v[38].numChild= 1;
    v[38].child[0] = sensor2i("B15");
    v[38].distance[0] = 441+70;
    v[38].child[1] = 0;
    v[38].child[2] = 0;
    v[38].child[3] = 0;
    v[38].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[38].time[i] = 0;
    }

    // C07
    v[39].numChild= 2;
    v[39].child[0] = sensor2i("E11");
    v[39].distance[0] = 215+187+334+65;
    v[39].child[1] = sensor2i("C03");
    v[39].distance[1] = 215+187+226;
    v[39].child[2] = 0;
    v[39].child[3] = 0;
    v[39].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[39].time[i] = 0;
    }

    // C08
    v[40].numChild= 4;
    v[40].child[0] = sensor2i("A12");
    v[40].distance[0] = 145+182+191+410;
    v[40].child[1] = sensor2i("A09");
    v[40].distance[1] = 145+182+191+210;
    v[40].child[2] = sensor2i("A07");
    v[40].distance[2] = 145+182+211;
    v[40].child[3] = sensor2i("A06");
    v[40].distance[3] = 145+216;
    v[40].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[40].time[i] = 0;
    }

    // C09
    v[41].numChild= 1;
    v[41].child[0] = sensor2i("B15");
    v[41].distance[0] = 305+70;
    v[41].child[1] = 0;
    v[41].child[2] = 0;
    v[41].child[3] = 0;
    v[41].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[41].time[i] = 0;
    }

    // C10
    v[42].numChild= 2;
    v[42].child[0] = sensor2i("B03") ;
    v[42].distance[0] = 146+220;
    v[42].child[1] = sensor2i("B01") ;
    v[42].distance[1] = 146+230;
    v[42].child[2] = 0;
    v[42].child[3] = 0;
    v[42].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[42].time[i] = 0;
    }

    // C11
    v[43].numChild= 2;
    v[43].child[0] = sensor2i("E16");
    v[43].distance[0] = 140+230;
    v[43].child[1] = sensor2i("B05") ;
    v[43].distance[1] = 140+214;
    v[43].child[2] = 0;
    v[43].child[3] = 0;
    v[43].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[43].time[i] = 0;
    }

    // C12
    v[44].numChild= 1;
    v[44].child[0] =  sensor2i("A04");
    v[44].distance[0] = 314+62;
    v[44].child[1] = 0;
    v[44].child[2] = 0;
    v[44].child[3] = 0;
    v[44].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[44].time[i] = 0;
    }

    // C13
    v[45].numChild= 1;
    v[45].child[0] = sensor2i("E07");
    v[45].distance[0] = 877;
    v[45].child[1] = 0;
    v[45].child[2] = 0;
    v[45].child[3] = 0;
    v[45].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[45].time[i] = 0;
    }

    // C14
    v[46].numChild= 4;
    v[46].child[0] = sensor2i("A02");
    v[46].distance[0] = 60+190+218;
    v[46].child[1] =  sensor2i("A14");
    v[46].distance[1] = 60+190+185+215;
    v[46].child[2] =  sensor2i("A15");
    v[46].distance[2] = 60+190+185+394;
    v[46].child[3] =  sensor2i("A04");
    v[46].distance[3] = 60+445+62;
    v[46].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[46].time[i] = 0;
    }

    // C15
    v[47].numChild= 1;
    v[47].child[0] = sensor2i("D12");
    v[47].distance[0] = 405;
    v[47].child[1] = 0;
    v[47].child[2] = 0;
    v[47].child[3] = 0;
    v[47].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[47].time[i] = 0;
    }


    // C16
    v[48].numChild= 1;
    v[48].child[0] = sensor2i("C06");
    v[48].distance[0] = 223+79;
    v[48].child[1] = 0;
    v[48].child[2] = 0;
    v[48].child[3] = 0;
    v[48].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[48].time[i] = 0;
    }



    // D01
    v[49].numChild= 2;
    v[49].child[0] = sensor2i("C01");
    v[49].distance[0] = 227+32+228;
    v[49].child[1] = sensor2i("B14") ;
    v[49].distance[1] = 227+32+224;
    v[49].child[2] = 0;
    v[49].child[3] = 0;
    v[49].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[49].time[i] = 0;
    }


    // D02
    v[50].numChild= 1;
    v[50].child[0] = sensor2i("E04");
    v[50].distance[0] = 200;
    v[50].child[1] = 0;
    v[50].child[2] = 0;
    v[50].child[3] = 0;
    v[50].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[50].time[i] = 0;
    }

    // D03
    v[51].numChild= 1;
    v[51].child[0] =  sensor2i("E05");
    v[51].distance[0] = 223+74;
    v[51].child[1] = 0;
    v[51].child[2] = 0;
    v[51].child[3] = 0;
    v[51].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[51].time[i] = 0;
    }

    // D04
    v[52].numChild= 1;
    v[52].child[0] = sensor2i("B06");
    v[52].distance[0] = 405;
    v[52].child[1] = 0;
    v[52].child[2] = 0;
    v[52].child[3] = 0;
    v[52].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[52].time[i] = 0;
    }

    // D05
    v[53].numChild= 1;
    v[53].child[0] = sensor2i("E06");
    v[53].distance[0] = 375;
    v[53].child[1] = 0;
    v[53].child[2] = 0;
    v[53].child[3] = 0;
    v[53].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[53].time[i] = 0;
    }

    // D06
    v[54].numChild= 2;
    v[54].child[0] = sensor2i("E10");
    v[54].distance[0] = 213+193+218;
    v[54].child[1] = sensor2i("D09");
    v[54].distance[1] = 213+193+291;
    v[54].child[2] = 0;
    v[54].child[3] = 0;
    v[54].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[54].time[i] = 0;
    }

    // D07
    v[55].numChild= 2;
    v[55].child[0] = sensor2i("E10");
    v[55].distance[0] = 290+193+218;
    v[55].child[1] = sensor2i("D09");
    v[55].distance[1] = 290+193+291;
    v[55].child[2] = 0;
    v[55].child[3] = 0;
    v[55].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[55].time[i] = 0;
    }

    // D08
    v[56].numChild= 1;
    v[56].child[0] = sensor2i("E08");
    v[56].distance[0] = 375;
    v[56].child[1] = 0;
    v[56].child[2] = 0;
    v[56].child[3] = 0;
    v[56].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[56].time[i] = 0;
    }

    // D09
    v[57].numChild= 1;
    v[57].child[0] = sensor2i("E12");
    v[6].distance[0] = 361;
    v[57].child[1] = 0;
    v[57].child[2] = 0;
    v[57].child[3] = 0;
    v[57].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[57].time[i] = 0;
    }

    // D10
    v[58].numChild= 2;
    v[58].child[0] = sensor2i("D08") ;
    v[58].distance[0] = 291+193+290;
    v[58].child[1] = sensor2i("D05") ;
    v[58].distance[1] = 291+193+213;
    v[58].child[2] = 0;
    v[58].child[3] = 0;
    v[58].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[58].time[i] = 0;
    }

    // D11
    v[59].numChild= 1;
    v[59].child[0] = sensor2i("C16");
    v[59].distance[0] = 405;
    v[59].child[1] = 0 ;
    v[59].child[2] = 0;
    v[59].child[3] = 0;
    v[59].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[59].time[i] = 0;
    }

    // D12
    v[60].numChild= 1;
    v[60].child[0] =  sensor2i("E11");
    v[60].distance[0] = 220+65;
    v[60].child[1] = 0;
    v[60].child[2] = 0;
    v[60].child[3] = 0;
    v[60].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[60].time[i] = 0;
    }

    // D13
    v[61].numChild= 1;
    v[61].child[0] = sensor2i("B02");
    v[61].distance[0] = 398;
    v[61].child[1] = 0;
    v[61].child[2] = 0;
    v[61].child[3] = 0;
    v[61].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[61].time[i] = 0;
    }

    // D14
    v[62].numChild= 1;
    v[62].child[0] = sensor2i("E14");
    v[62].distance[0] = 225+62;
    v[62].child[1] =  0;
    v[62].child[2] =  0;
    v[62].child[3] =  0 ;
    v[62].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[62].time[i] = 0;
    }

    // D15
    v[63].numChild= 1;
    v[63].child[0] = sensor2i("B13");
    v[63].distance[0] = 202;
    v[63].child[1] = 0;
    v[63].child[2] = 0;
    v[63].child[3] = 0;
    v[63].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[63].time[i] = 0;
    }


    // D16
    v[64].numChild= 1;
    v[64].child[0] = sensor2i("E14");
    v[64].distance[0] = 230+62;
    v[64].child[1] = 0;
    v[64].child[2] = 0;
    v[64].child[3] = 0;
    v[64].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[64].time[i] = 0;
    }



    // E01
    v[65].numChild= 2;
    v[65].child[0] = sensor2i("C01");
    v[65].distance[0] = 222+32+228;
    v[65].child[1] = sensor2i("B14") ;
    v[65].distance[1] = 222+32+224;
    v[65].child[2] = 0;
    v[65].child[3] = 0;
    v[65].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[65].time[i] = 0;
    }


    // E02
    v[66].numChild= 1;
    v[66].child[0] = sensor2i("E15");
    v[66].distance[0] = 203;
    v[66].child[1] = 0;
    v[66].child[2] = 0;
    v[66].child[3] = 0;
    v[66].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[66].time[i] = 0;
    }

    // E03
    v[67].numChild= 1;
    v[67].child[0] =  sensor2i("D01");
    v[67].distance[0] = 200;
    v[67].child[1] = 0;
    v[67].child[2] = 0;
    v[67].child[3] = 0;
    v[67].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[67].time[i] = 0;
    }

    // E04
    v[68].numChild= 1;
    v[68].child[0] = sensor2i("E05");
    v[68].distance[0] = 220+74;
    v[68].child[1] = 0;
    v[68].child[2] = 0;
    v[68].child[3] = 0;
    v[68].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[68].time[i] = 0;
    }

    // E05
    v[69].numChild= 1;
    v[69].child[0] = sensor2i("D06");
    v[69].distance[0] = 375;
    v[69].child[1] = 0;
    v[69].child[2] = 0;
    v[69].child[3] = 0;
    v[69].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[69].time[i] = 0;
    }

    // E06
    v[70].numChild= 2;
    v[70].child[0] = sensor2i("E03");
    v[70].distance[0] = 74+220;
    v[70].child[1] = sensor2i("D04");
    v[70].distance[1] = 74+223;
    v[70].child[2] = 0;
    v[70].child[3] = 0;
    v[70].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[70].time[i] = 0;
    }

    // E07
    v[71].numChild= 1;
    v[71].child[0] = sensor2i("D07");
    v[71].distance[0] = 375;
    v[71].child[1] = 0;
    v[71].child[2] = 0;
    v[71].child[3] = 0;
    v[71].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[71].time[i] = 0;
    }

    // E08
    v[72].numChild= 1;
    v[72].child[0] = sensor2i("C14");
    v[72].distance[0] = 877;
    v[72].child[1] = 0;
    v[72].child[2] = 0;
    v[72].child[3] = 0;
    v[72].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[72].time[i] = 0;
    }

    // E09
    v[73].numChild= 2;
    v[73].child[0] = sensor2i("D08");
    v[73].distance[0] = 218+193+290;
    v[73].child[1] =  sensor2i("D05");
    v[73].distance[1] = 218+193+213;
    v[73].child[2] = 0;
    v[73].child[3] = 0;
    v[73].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[73].time[i] = 0;
    }

    // E10
    v[74].numChild= 1;
    v[74].child[0] = sensor2i("E13");
    v[74].distance[0] = 375;
    v[74].child[1] = 0;
    v[74].child[2] = 0;
    v[74].child[3] = 0;
    v[74].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[74].time[i] = 0;
    }

    // E11
    v[75].numChild= 1;
    v[75].child[0] = sensor2i("D10");
    v[75].distance[0] = 361;
    v[75].child[1] = 0 ;
    v[75].child[2] = 0;
    v[75].child[3] = 0;
    v[75].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[75].time[i] = 0;
    }

    // E12
    v[76].numChild= 3;
    v[76].child[0] =  sensor2i("D11");
    v[76].distance[0] = 65+220;
    v[76].child[1] = sensor2i("C08") ;
    v[76].distance[1] = 65+334+187+215;
    v[76].child[2] = sensor2i("C06") ;
    v[76].distance[2] = 65+334+187+338+79;
    v[76].child[3] = 0;
    v[76].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[76].time[i] = 0;
    }

    // E13
    v[77].numChild= 2;
    v[77].child[0] = sensor2i("D13");
    v[77].distance[0] = 62+225;
    v[77].child[1] =  sensor2i("D15");
    v[77].distance[1] = 62+230;
    v[77].child[2] = 0;
    v[77].child[3] = 0;
    v[77].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[77].time[i] = 0;
    }

    // E14
    v[78].numChild= 1;
    v[78].child[0] = sensor2i("E09");
    v[78].distance[0] = 375;
    v[78].child[1] =  0;
    v[78].child[2] =  0;
    v[78].child[3] =  0 ;
    v[78].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[78].time[i] = 0;
    }

    // E15
    v[79].numChild= 1;
    v[79].child[0] = sensor2i("C12");
    v[79].distance[0] = 230+140;
    v[79].child[1] = 0;
    v[79].child[2] = 0;
    v[79].child[3] = 0;
    v[79].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[79].time[i] = 0;
    }


    // E16
    v[80].numChild= 1;
    v[80].child[0] = sensor2i("E01");
    v[80].distance[0] = 203;
    v[80].child[1] = 0;
    v[80].child[2] = 0;
    v[80].child[3] = 0;
    v[80].child[4] = 0;
    for (i = 0; i < 70; i++) {
        v[80].time[i] = 0;
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

