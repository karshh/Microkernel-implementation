#include "bwio.h"
#include "buffer.h"
#include "trackGraph.h"


int sensor2i(char * c) {
	return    ((10* (c[1] - '0')) + (c[2] - '0')) + (16*(c[0] - 'A')) ;
}

int switch2i(int i) {
	return i + 80;
}


int findAltSensor(TrackGraph * t, int i, int * dist) {
	TrackGraphNode * node = t->node;
    *dist = 0;
	if (node[i].type == Switch) {
        *dist += node[i].switchConfig == S ? node[i].CnextNodeDistance : node[i].SnextNodeDistance;
		i = node[i].switchConfig == S ? node[i].CnextNodeIndex : node[i].SnextNodeIndex;
	} 
	else if (node[i].type == MultiSwitch) {
        *dist += node[i].switchConfig == CS ? node[i].SCnextNodeDistance : node[i].CSnextNodeDistance;
		i = node[i].switchConfig == CS ? node[i].SCnextNodeIndex : node[i].CSnextNodeIndex;
	} 
	else if (node[i].type == Sensor) {
        *dist += node[i].nextNodeDistance;
		i = node[i].nextNodeIndex;
	}

	while(1) {
		if (i <= 0) break;
		switch(node[i].type) {
			case Sensor:
				return i;
				break;
			case Switch:
                *dist += node[i].switchConfig == S ? node[i].CnextNodeDistance : node[i].SnextNodeDistance;
				i = node[i].switchConfig == S ? node[i].SnextNodeIndex : node[i].CnextNodeIndex;
				break;
			case MultiSwitch:
                *dist += node[i].switchConfig == CS ? node[i].SCnextNodeDistance : node[i].CSnextNodeDistance;
				i = node[i].switchConfig == CS ? node[i].CSnextNodeIndex : node[i].SCnextNodeIndex;
				break;
			default:
				bwassert(0, COM2, "<findALTSensor>: Why the hell did we end up here? FIGURE THIS OUT![ALT] %d node %d", node[i].type,i);
		}
	}
	return -1;
}


int findNextSensor(TrackGraph * t, int i, int * dist) {
	TrackGraphNode * node = t->node;
    *dist = 0;
	if (node[i].type == Sensor) {
        *dist += node[i].nextNodeDistance;
        if (node[i].nextNodeIndex == -1) {
            return -1;
        }
        i = node[i].nextNodeIndex;

    } 
	while(1) {
		if (i <= 0) break;
		switch(node[i].type) {
			case Sensor:
				return i;
				break;
			case Switch:
                *dist += node[i].switchConfig == S ? node[i].SnextNodeDistance : node[i].CnextNodeDistance;
				i = node[i].switchConfig == S ? node[i].SnextNodeIndex : node[i].CnextNodeIndex;
				break;
			case MultiSwitch:
                *dist += node[i].switchConfig == CS ? node[i].CSnextNodeDistance : node[i].SCnextNodeDistance;
				i = node[i].switchConfig == CS ? node[i].CSnextNodeIndex : node[i].SCnextNodeIndex;
				break;
			default:
				bwassert(0, COM2, "<findNextSensor>: Why the hell did we end up here? FIGURE THIS OUT! %d node %d", node[i].type,i);
		}
	}
	return -1;
}



void TrackGraphInitA(TrackGraph * t) {
    // sensorModelInit(&(t->vm));
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
    node[sensor2i("A01")].nextNodeDistance = 218+190;

	node[sensor2i("A02")].nextNodeIndex = -1;
    node[sensor2i("A02")].nextNodeDistance = 500;
	node[sensor2i("A03")].nextNodeIndex = switch2i(14);
    node[sensor2i("A03")].nextNodeDistance = 62;
	node[sensor2i("A04")].nextNodeIndex = sensor2i("B16");
    node[sensor2i("A04")].nextNodeDistance = 440;
	node[sensor2i("A05")].nextNodeIndex = sensor2i("C07");
    node[sensor2i("A05")].nextNodeDistance = 216+145;
	node[sensor2i("A06")].nextNodeIndex = sensor2i("B10");
    node[sensor2i("A06")].nextNodeDistance = 649;
	node[sensor2i("A07")].nextNodeIndex = sensor2i("B12");
    node[sensor2i("A07")].nextNodeDistance = 473;
	node[sensor2i("A08")].nextNodeIndex = sensor2i("C07");
    node[sensor2i("A08")].nextNodeDistance = 211+182+145;
	node[sensor2i("A09")].nextNodeIndex = sensor2i("B08");
    node[sensor2i("A09")].nextNodeDistance = 289;
	node[sensor2i("A10")].nextNodeIndex = sensor2i("C07");
    node[sensor2i("A10")].nextNodeDistance = 210+191+182+145;
	node[sensor2i("A11")].nextNodeIndex = sensor2i("C07");
    node[sensor2i("A11")].nextNodeDistance = 410+191+182+145;
	node[sensor2i("A12")].nextNodeIndex = -1;
    node[sensor2i("A12")].nextNodeDistance = 60;
	node[sensor2i("A13")].nextNodeIndex = sensor2i("C13");
    node[sensor2i("A13")].nextNodeDistance = 215+185+190;
	node[sensor2i("A14")].nextNodeIndex = -1;
    node[sensor2i("A14")].nextNodeDistance = 320;
	node[sensor2i("A15")].nextNodeIndex = -1;
    node[sensor2i("A15")].nextNodeDistance = 145;
	node[sensor2i("A16")].nextNodeIndex = sensor2i("C13");
    node[sensor2i("A16")].nextNodeDistance = 394+394+185+190;
	node[sensor2i("B01")].nextNodeIndex = sensor2i("D14");
    node[sensor2i("B01")].nextNodeDistance = 398;
	node[sensor2i("B02")].nextNodeIndex = sensor2i("C09");
    node[sensor2i("B02")].nextNodeDistance = 230+146;
	node[sensor2i("B03")].nextNodeIndex = sensor2i("C02");
    node[sensor2i("B03")].nextNodeDistance = 230;
	node[sensor2i("B04")].nextNodeIndex = sensor2i("C09");
    node[sensor2i("B04")].nextNodeDistance = 220+146;
	node[sensor2i("B05")].nextNodeIndex = sensor2i("D03");
    node[sensor2i("B05")].nextNodeDistance = 405;
	node[sensor2i("B06")].nextNodeIndex = sensor2i("C12");
    node[sensor2i("B06")].nextNodeDistance = 214+140;
	node[sensor2i("B07")].nextNodeIndex = sensor2i("A10");
    node[sensor2i("B07")].nextNodeDistance = 289;
	node[sensor2i("B08")].nextNodeIndex = -1;
    node[sensor2i("B08")].nextNodeDistance = 70;
	node[sensor2i("B09")].nextNodeIndex = sensor2i("A05");
    node[sensor2i("B09")].nextNodeDistance = 649;
	node[sensor2i("B10")].nextNodeIndex = -1;
    node[sensor2i("B10")].nextNodeDistance = 70;
	node[sensor2i("B11")].nextNodeIndex = sensor2i("A08");
    node[sensor2i("B11")].nextNodeDistance = 473;
	node[sensor2i("B12")].nextNodeIndex = -1;
    node[sensor2i("B12")].nextNodeDistance = 70;
	node[sensor2i("B13")].nextNodeIndex = 100;
    node[sensor2i("B13")].nextNodeDistance = 224;
	node[sensor2i("B14")].nextNodeIndex = sensor2i("D16");
    node[sensor2i("B14")].nextNodeDistance = 202 ;
	node[sensor2i("B15")].nextNodeIndex = sensor2i("A03");
    node[sensor2i("B15")].nextNodeDistance = 440;
	node[sensor2i("B16")].nextNodeIndex = switch2i(15);
    node[sensor2i("B16")].nextNodeDistance = 70;
	node[sensor2i("C01")].nextNodeIndex = sensor2i("B04");
    node[sensor2i("C01")].nextNodeDistance = 230;
	node[sensor2i("C02")].nextNodeIndex = 100;
    node[sensor2i("C02")].nextNodeDistance = 228;
	node[sensor2i("C03")].nextNodeIndex = -1;
    node[sensor2i("C03")].nextNodeDistance = 410;
	node[sensor2i("C04")].nextNodeIndex = switch2i(18);
    node[sensor2i("C04")].nextNodeDistance = 226+187;
	node[sensor2i("C05")].nextNodeIndex = switch2i(6);
    node[sensor2i("C05")].nextNodeDistance = 79;
	node[sensor2i("C06")].nextNodeIndex = sensor2i("B15");
    node[sensor2i("C06")].nextNodeDistance = 411+70;
	node[sensor2i("C07")].nextNodeIndex = switch2i(5);
    node[sensor2i("C07")].nextNodeDistance = 215+187;
	node[sensor2i("C08")].nextNodeIndex = switch2i(3);
    node[sensor2i("C08")].nextNodeDistance = 145;
	node[sensor2i("C09")].nextNodeIndex = sensor2i("B15");
    node[sensor2i("C09")].nextNodeDistance = 305+70;
	node[sensor2i("C10")].nextNodeIndex = switch2i(16);
    node[sensor2i("C10")].nextNodeDistance = 146;
	node[sensor2i("C11")].nextNodeIndex = switch2i(13);
    node[sensor2i("C11")].nextNodeDistance = 140;
	node[sensor2i("C12")].nextNodeIndex = sensor2i("A04");
    node[sensor2i("C12")].nextNodeDistance = 314+62;
	node[sensor2i("C13")].nextNodeIndex = sensor2i("E07");
    node[sensor2i("C13")].nextNodeDistance = 877;
	node[sensor2i("C14")].nextNodeIndex = switch2i(11);
    node[sensor2i("C14")].nextNodeDistance = 60;
	node[sensor2i("C15")].nextNodeIndex = sensor2i("D12");
    node[sensor2i("C15")].nextNodeDistance = 405;
	node[sensor2i("C16")].nextNodeIndex = sensor2i("C06"); 
    node[sensor2i("C16")].nextNodeDistance = 223+79;
	node[sensor2i("D01")].nextNodeIndex = 99;
    node[sensor2i("D01")].nextNodeDistance = 227;
	node[sensor2i("D02")].nextNodeIndex = sensor2i("E04");
    node[sensor2i("D02")].nextNodeDistance = 200;
	node[sensor2i("D03")].nextNodeIndex = sensor2i("E05");
    node[sensor2i("D03")].nextNodeDistance = 223+74;
	node[sensor2i("D04")].nextNodeIndex = sensor2i("B06");
    node[sensor2i("D04")].nextNodeDistance = 405;
	node[sensor2i("D05")].nextNodeIndex = sensor2i("E06");
    node[sensor2i("D05")].nextNodeDistance = 375;
	node[sensor2i("D06")].nextNodeIndex = switch2i(8);
    node[sensor2i("D06")].nextNodeDistance = 213+193;
	node[sensor2i("D07")].nextNodeIndex = switch2i(8);
    node[sensor2i("D07")].nextNodeDistance = 290+193;
	node[sensor2i("D08")].nextNodeIndex = sensor2i("E08");
    node[sensor2i("D08")].nextNodeDistance = 375;
	node[sensor2i("D09")].nextNodeIndex = sensor2i("E12");
    node[sensor2i("D09")].nextNodeDistance = 312;
	node[sensor2i("D10")].nextNodeIndex = switch2i(9);
    node[sensor2i("D10")].nextNodeDistance = 291+193;
	node[sensor2i("D11")].nextNodeIndex = sensor2i("C16");
    node[sensor2i("D11")].nextNodeDistance = 405;
	node[sensor2i("D12")].nextNodeIndex = sensor2i("E11");
    node[sensor2i("D12")].nextNodeDistance = 220+65;
	node[sensor2i("D13")].nextNodeIndex = sensor2i("B02");
    node[sensor2i("D13")].nextNodeDistance = 398;
	node[sensor2i("D14")].nextNodeIndex = sensor2i("E14");
    node[sensor2i("D14")].nextNodeDistance = 225+62;
	node[sensor2i("D15")].nextNodeIndex = sensor2i("B13");
    node[sensor2i("D15")].nextNodeDistance = 202;
	node[sensor2i("D16")].nextNodeIndex = sensor2i("E14");
    node[sensor2i("D16")].nextNodeDistance = 230+62;
	node[sensor2i("E01")].nextNodeIndex = 99;
    node[sensor2i("E01")].nextNodeDistance = 222;
	node[sensor2i("E02")].nextNodeIndex = sensor2i("E15");
    node[sensor2i("E02")].nextNodeDistance = 203;
	node[sensor2i("E03")].nextNodeIndex = sensor2i("D01");
    node[sensor2i("E03")].nextNodeDistance = 200;
	node[sensor2i("E04")].nextNodeIndex = sensor2i("E05");
    node[sensor2i("E04")].nextNodeDistance = 220+74;
	node[sensor2i("E05")].nextNodeIndex = sensor2i("D06");
    node[sensor2i("E05")].nextNodeDistance = 375;
	node[sensor2i("E06")].nextNodeIndex = switch2i(10);
    node[sensor2i("E06")].nextNodeDistance = 74;
	node[sensor2i("E07")].nextNodeIndex = sensor2i("D07");
    node[sensor2i("E07")].nextNodeDistance = 375;
	node[sensor2i("E08")].nextNodeIndex = sensor2i("C14");
    node[sensor2i("E08")].nextNodeDistance = 877;
	node[sensor2i("E09")].nextNodeIndex = switch2i(9);
    node[sensor2i("E09")].nextNodeDistance = 218+193;
	node[sensor2i("E10")].nextNodeIndex = sensor2i("E13");
    node[sensor2i("E10")].nextNodeDistance = 375;
	node[sensor2i("E11")].nextNodeIndex = sensor2i("D10");
    node[sensor2i("E11")].nextNodeDistance = 312;
	node[sensor2i("E12")].nextNodeIndex = switch2i(7);
    node[sensor2i("E12")].nextNodeDistance = 65;
	node[sensor2i("E13")].nextNodeIndex = switch2i(17);
    node[sensor2i("E13")].nextNodeDistance = 62;
	node[sensor2i("E14")].nextNodeIndex = sensor2i("E09");
    node[sensor2i("E14")].nextNodeDistance = 375;
	node[sensor2i("E15")].nextNodeIndex = sensor2i("C12");
    node[sensor2i("E15")].nextNodeDistance = 230+140;
	node[sensor2i("E16")].nextNodeIndex = sensor2i("E01");
    node[sensor2i("E16")].nextNodeDistance = 203;

    for (i = 0; i <= sensor2i("E16"); i++) {
        node[i].inverse = i%2 == 0 ? i-1 : i+1;
    }

	// linking the switches
	node[switch2i(1)].CnextNodeIndex = sensor2i("A09");
    node[switch2i(1)].CnextNodeDistance = 210;
	node[switch2i(2)].CnextNodeIndex = sensor2i("A07");
    node[switch2i(2)].CnextNodeDistance = 211;
	node[switch2i(3)].CnextNodeIndex = switch2i(2);
    node[switch2i(3)].CnextNodeDistance = 182;
	node[switch2i(4)].CnextNodeIndex = sensor2i("A14");
    node[switch2i(4)].CnextNodeDistance = 215;
	node[switch2i(5)].CnextNodeIndex = sensor2i("E11");
    node[switch2i(5)].CnextNodeDistance = 334+65;
	node[switch2i(6)].CnextNodeIndex = switch2i(5);
    node[switch2i(6)].CnextNodeDistance = 338+187;
	node[switch2i(7)].CnextNodeIndex = switch2i(18);
    node[switch2i(7)].CnextNodeDistance = 334+187;
	node[switch2i(8)].CnextNodeIndex = sensor2i("E10");
    node[switch2i(8)].CnextNodeDistance = 218;
	node[switch2i(9)].CnextNodeIndex = sensor2i("D05");
    node[switch2i(9)].CnextNodeDistance = 213;
	node[switch2i(10)].CnextNodeIndex = sensor2i("E03");
    node[switch2i(10)].CnextNodeDistance = 220;
	node[switch2i(11)].CnextNodeIndex = sensor2i("A04");
    node[switch2i(11)].CnextNodeDistance = 445+62;
	node[switch2i(12)].CnextNodeIndex = switch2i(4);
    node[switch2i(12)].CnextNodeDistance = 185;
	node[switch2i(13)].CnextNodeIndex = sensor2i("E16");
    node[switch2i(13)].CnextNodeDistance = 230;
	node[switch2i(14)].CnextNodeIndex = sensor2i("C11");
    node[switch2i(14)].CnextNodeDistance = 314;
	node[switch2i(15)].CnextNodeIndex = sensor2i("C10");
    node[switch2i(15)].CnextNodeDistance = 305;
	node[switch2i(16)].CnextNodeIndex = sensor2i("B03");
    node[switch2i(16)].CnextNodeDistance = 220;
	node[switch2i(17)].CnextNodeIndex = sensor2i("D15");
    node[switch2i(17)].CnextNodeDistance = 230;
	node[switch2i(18)].CnextNodeIndex = sensor2i("C06");
    node[switch2i(18)].CnextNodeDistance = 338+79;


	node[switch2i(1)].SnextNodeIndex = sensor2i("A12");
    node[switch2i(1)].SnextNodeDistance = 410;
	node[switch2i(2)].SnextNodeIndex = switch2i(1);
    node[switch2i(2)].SnextNodeDistance = 191;
	node[switch2i(3)].SnextNodeIndex = sensor2i("A06");
    node[switch2i(3)].SnextNodeDistance = 216;
	node[switch2i(4)].SnextNodeIndex = sensor2i("A15");
    node[switch2i(4)].SnextNodeDistance = 394;
	node[switch2i(5)].SnextNodeIndex = sensor2i("C03");
    node[switch2i(5)].SnextNodeDistance = 226;
	node[switch2i(6)].SnextNodeIndex = sensor2i("C15");
    node[switch2i(6)].SnextNodeDistance = 223;
	node[switch2i(7)].SnextNodeIndex = sensor2i("D11");
    node[switch2i(7)].SnextNodeDistance = 220;
	node[switch2i(8)].SnextNodeIndex = sensor2i("D09");
    node[switch2i(8)].SnextNodeDistance = 291;
	node[switch2i(9)].SnextNodeIndex = sensor2i("D08");
    node[switch2i(9)].SnextNodeDistance = 290;
	node[switch2i(10)].SnextNodeIndex = sensor2i("D04");
    node[switch2i(10)].SnextNodeDistance = 223;
	node[switch2i(11)].SnextNodeIndex = switch2i(12);
    node[switch2i(11)].SnextNodeDistance = 190;
	node[switch2i(12)].SnextNodeIndex = sensor2i("A02");
    node[switch2i(12)].SnextNodeDistance = 218;
	node[switch2i(13)].SnextNodeIndex = sensor2i("B05");
    node[switch2i(13)].SnextNodeDistance = 214;
	node[switch2i(14)].SnextNodeIndex = sensor2i("C13");
    node[switch2i(14)].SnextNodeDistance = 445+60;
	node[switch2i(15)].SnextNodeIndex = sensor2i("C05");
    node[switch2i(15)].SnextNodeDistance = 411;
	node[switch2i(16)].SnextNodeIndex = sensor2i("B01");
    node[switch2i(16)].SnextNodeDistance = 230;
	node[switch2i(17)].SnextNodeIndex = sensor2i("D13");
    node[switch2i(17)].SnextNodeDistance = 225;
	node[switch2i(18)].SnextNodeIndex = sensor2i("C08");
    node[switch2i(18)].SnextNodeDistance = 215;
	
	node[99].CSnextNodeIndex = sensor2i("C01");
    node[99].CSnextNodeDistance = 228;
	node[99].SCnextNodeIndex = sensor2i("B14");
    node[99].SCnextNodeDistance = 224;

	node[100].CSnextNodeIndex = sensor2i("D02");
    node[100].CSnextNodeDistance = 227;
	node[100].SCnextNodeIndex = sensor2i("E02");
    node[100].SCnextNodeDistance = 222;

}



void TrackGraphInitB(TrackGraph * t) {
    // sensorModelInit(&(t->vm));
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
            node[i].switchConfig = S;
            node[i].id1 = i-80;
            node[i].id2 = -1;
        }
    }
    // initializing the two multiswitches.
    node[99].type = MultiSwitch;
    node[99].switchConfig = SC;
    node[99].id1 = 153;
    node[99].id2 = 154;

    node[100].type = MultiSwitch;
    node[100].switchConfig = SC;
    node[100].id1 = 155;
    node[100].id2 = 156;

    // linking the sensors
    node[sensor2i("A01")].nextNodeIndex = sensor2i("C13");
    node[sensor2i("A01")].nextNodeDistance = 231+188;
    node[sensor2i("A02")].nextNodeIndex = -1;
    node[sensor2i("A02")].nextNodeDistance = 504;
    node[sensor2i("A03")].nextNodeIndex = switch2i(14);
    node[sensor2i("A03")].nextNodeDistance = 43;
    node[sensor2i("A04")].nextNodeIndex = sensor2i("B16");
    node[sensor2i("A04")].nextNodeDistance = 437;
    node[sensor2i("A05")].nextNodeIndex = sensor2i("C07");
    node[sensor2i("A05")].nextNodeDistance = 231+128;
    node[sensor2i("A06")].nextNodeIndex = sensor2i("B10");
    node[sensor2i("A06")].nextNodeDistance = 642;
    node[sensor2i("A07")].nextNodeIndex = sensor2i("B12");
    node[sensor2i("A07")].nextNodeDistance = 470;
    node[sensor2i("A08")].nextNodeIndex = sensor2i("C07");
    node[sensor2i("A08")].nextNodeDistance = 229+185+128;
    node[sensor2i("A09")].nextNodeIndex = sensor2i("B08");
    node[sensor2i("A09")].nextNodeDistance = 289;
    node[sensor2i("A10")].nextNodeIndex = sensor2i("C07");
    node[sensor2i("A10")].nextNodeDistance = 229;
    node[sensor2i("A11")].nextNodeIndex = sensor2i("C07");
    node[sensor2i("A11")].nextNodeDistance = 282+188+185+128;
    node[sensor2i("A12")].nextNodeIndex = sensor2i("A16");
    node[sensor2i("A12")].nextNodeDistance = 814;
    node[sensor2i("A13")].nextNodeIndex = sensor2i("C13");
    node[sensor2i("A13")].nextNodeDistance = 236+185+188;
    node[sensor2i("A14")].nextNodeIndex = -1;
    node[sensor2i("A14")].nextNodeDistance = 325;
    node[sensor2i("A15")].nextNodeIndex = sensor2i("A11");
    node[sensor2i("A15")].nextNodeDistance = 814;
    node[sensor2i("A16")].nextNodeIndex = sensor2i("C13");
    node[sensor2i("A16")].nextNodeDistance = 275+185+188;
    node[sensor2i("B01")].nextNodeIndex = sensor2i("D14");
    node[sensor2i("B01")].nextNodeDistance = 404;
    node[sensor2i("B02")].nextNodeIndex = sensor2i("C09");
    node[sensor2i("B02")].nextNodeDistance = 231+128;
    node[sensor2i("B03")].nextNodeIndex = sensor2i("C02");
    node[sensor2i("B03")].nextNodeDistance = 201;
    node[sensor2i("B04")].nextNodeIndex = sensor2i("C09");
    node[sensor2i("B04")].nextNodeDistance = 239+128;
    node[sensor2i("B05")].nextNodeIndex = sensor2i("D03");
    node[sensor2i("B05")].nextNodeDistance = 404;
    node[sensor2i("B06")].nextNodeIndex = sensor2i("C12");
    node[sensor2i("B06")].nextNodeDistance = 231+120;
    node[sensor2i("B07")].nextNodeIndex = sensor2i("A10");
    node[sensor2i("B07")].nextNodeDistance = 289;
    node[sensor2i("B08")].nextNodeIndex = -1;
    node[sensor2i("B08")].nextNodeDistance = 43;
    node[sensor2i("B09")].nextNodeIndex = sensor2i("A05");
    node[sensor2i("B09")].nextNodeDistance = 642;
    node[sensor2i("B10")].nextNodeIndex = -1;
    node[sensor2i("B10")].nextNodeDistance = 50;
    node[sensor2i("B11")].nextNodeIndex = sensor2i("A08");
    node[sensor2i("B11")].nextNodeDistance = 470;
    node[sensor2i("B12")].nextNodeIndex = -1;
    node[sensor2i("B12")].nextNodeDistance = 50;
    node[sensor2i("B13")].nextNodeIndex = 100;
    node[sensor2i("B13")].nextNodeDistance = 239;
    node[sensor2i("B14")].nextNodeIndex = sensor2i("D16");
    node[sensor2i("B14")].nextNodeDistance =  214;
    node[sensor2i("B15")].nextNodeIndex = sensor2i("A03");
    node[sensor2i("B15")].nextNodeDistance = 437;
    node[sensor2i("B16")].nextNodeIndex = switch2i(15);
    node[sensor2i("B16")].nextNodeDistance = 50;
    node[sensor2i("C01")].nextNodeIndex = sensor2i("B04");
    node[sensor2i("C01")].nextNodeDistance = 201;
    node[sensor2i("C02")].nextNodeIndex = 100;
    node[sensor2i("C02")].nextNodeDistance = 246;
    node[sensor2i("C03")].nextNodeIndex = -1;
    node[sensor2i("C03")].nextNodeDistance = 514;
    node[sensor2i("C04")].nextNodeIndex = switch2i(18);
    node[sensor2i("C04")].nextNodeDistance = 239+155;
    node[sensor2i("C05")].nextNodeIndex = switch2i(6);
    node[sensor2i("C05")].nextNodeDistance = 61;
    node[sensor2i("C06")].nextNodeIndex = sensor2i("B15");
    node[sensor2i("C06")].nextNodeDistance = 433+50;
    node[sensor2i("C07")].nextNodeIndex = switch2i(5);
    node[sensor2i("C07")].nextNodeDistance = 231;
    node[sensor2i("C08")].nextNodeIndex = switch2i(3);
    node[sensor2i("C08")].nextNodeDistance = 128;
    node[sensor2i("C09")].nextNodeIndex = sensor2i("B15");
    node[sensor2i("C09")].nextNodeDistance = 326+50;
    node[sensor2i("C10")].nextNodeIndex = switch2i(16);
    node[sensor2i("C10")].nextNodeDistance = 128;
    node[sensor2i("C11")].nextNodeIndex = switch2i(13);
    node[sensor2i("C11")].nextNodeDistance = 120;
    node[sensor2i("C12")].nextNodeIndex = sensor2i("A04");
    node[sensor2i("C12")].nextNodeDistance = 333+43;
    node[sensor2i("C13")].nextNodeIndex = sensor2i("E07");
    node[sensor2i("C13")].nextNodeDistance = 780;
    node[sensor2i("C14")].nextNodeIndex = switch2i(11);
    node[sensor2i("C14")].nextNodeDistance = 50;
    node[sensor2i("C15")].nextNodeIndex = sensor2i("D12");
    node[sensor2i("C15")].nextNodeDistance = 404;
    node[sensor2i("C16")].nextNodeIndex = sensor2i("C06"); 
    node[sensor2i("C16")].nextNodeDistance = 239+61;
    node[sensor2i("D01")].nextNodeIndex = 99;
    node[sensor2i("D01")].nextNodeDistance = 246;
    node[sensor2i("D02")].nextNodeIndex = sensor2i("E04");
    node[sensor2i("D02")].nextNodeDistance = 201;
    node[sensor2i("D03")].nextNodeIndex = sensor2i("E05");
    node[sensor2i("D03")].nextNodeDistance = 239+50;
    node[sensor2i("D04")].nextNodeIndex = sensor2i("B06");
    node[sensor2i("D04")].nextNodeDistance = 404;
    node[sensor2i("D05")].nextNodeIndex = sensor2i("E06");
    node[sensor2i("D05")].nextNodeDistance = 282;
    node[sensor2i("D06")].nextNodeIndex = switch2i(8);
    node[sensor2i("D06")].nextNodeDistance = 229+155;
    node[sensor2i("D07")].nextNodeIndex = switch2i(8);
    node[sensor2i("D07")].nextNodeDistance = 309+155;
    node[sensor2i("D08")].nextNodeIndex = sensor2i("E08");
    node[sensor2i("D08")].nextNodeDistance = 376;
    node[sensor2i("D09")].nextNodeIndex = sensor2i("E12");
    node[sensor2i("D09")].nextNodeDistance = 282;
    node[sensor2i("D10")].nextNodeIndex = switch2i(9);
    node[sensor2i("D10")].nextNodeDistance = 316+155;
    node[sensor2i("D11")].nextNodeIndex = sensor2i("C16");
    node[sensor2i("D11")].nextNodeDistance = 404;
    node[sensor2i("D12")].nextNodeIndex = sensor2i("E11");
    node[sensor2i("D12")].nextNodeDistance = 231+43;
    node[sensor2i("D13")].nextNodeIndex = sensor2i("B02");
    node[sensor2i("D13")].nextNodeDistance = 404;
    node[sensor2i("D14")].nextNodeIndex = sensor2i("E14");
    node[sensor2i("D14")].nextNodeDistance = 239+43;
    node[sensor2i("D15")].nextNodeIndex = sensor2i("B13");
    node[sensor2i("D15")].nextNodeDistance = 214;
    node[sensor2i("D16")].nextNodeIndex = sensor2i("E14");
    node[sensor2i("D16")].nextNodeDistance = 246+43;
    node[sensor2i("E01")].nextNodeIndex = 99;
    node[sensor2i("E01")].nextNodeDistance = 239;
    node[sensor2i("E02")].nextNodeIndex = sensor2i("E15");
    node[sensor2i("E02")].nextNodeDistance = 201;
    node[sensor2i("E03")].nextNodeIndex = sensor2i("D01");
    node[sensor2i("E03")].nextNodeDistance = 201;
    node[sensor2i("E04")].nextNodeIndex = sensor2i("E05");
    node[sensor2i("E04")].nextNodeDistance = 239+50;
    node[sensor2i("E05")].nextNodeIndex = sensor2i("D06");
    node[sensor2i("E05")].nextNodeDistance = 282;
    node[sensor2i("E06")].nextNodeIndex = switch2i(10);
    node[sensor2i("E06")].nextNodeDistance = 50;
    node[sensor2i("E07")].nextNodeIndex = sensor2i("D07");
    node[sensor2i("E07")].nextNodeDistance = 376;
    node[sensor2i("E08")].nextNodeIndex = sensor2i("C14");
    node[sensor2i("E08")].nextNodeDistance = 780;
    node[sensor2i("E09")].nextNodeIndex = switch2i(9);
    node[sensor2i("E09")].nextNodeDistance = 239+155;
    node[sensor2i("E10")].nextNodeIndex = sensor2i("E13");
    node[sensor2i("E10")].nextNodeDistance = 282;
    node[sensor2i("E11")].nextNodeIndex = sensor2i("D10");
    node[sensor2i("E11")].nextNodeDistance = 282;
    node[sensor2i("E12")].nextNodeIndex = switch2i(7);
    node[sensor2i("E12")].nextNodeDistance = 43;
    node[sensor2i("E13")].nextNodeIndex = switch2i(17);
    node[sensor2i("E13")].nextNodeDistance = 43;
    node[sensor2i("E14")].nextNodeIndex = sensor2i("E09");
    node[sensor2i("E14")].nextNodeDistance = 282;
    node[sensor2i("E15")].nextNodeIndex = sensor2i("C12");
    node[sensor2i("E15")].nextNodeDistance = 246+120;
    node[sensor2i("E16")].nextNodeIndex = sensor2i("E01");
    node[sensor2i("E16")].nextNodeDistance = 201;

    for (i = 0; i <= sensor2i("E16"); i++) {
        node[i].inverse = i%2 == 0 ? i-1 : i+1;
    }

    // linking the switches
    node[switch2i(1)].CnextNodeIndex = sensor2i("A09");
    node[switch2i(1)].CnextNodeDistance = 229;
    node[switch2i(2)].CnextNodeIndex = sensor2i("A07");
    node[switch2i(2)].CnextNodeDistance = 229;
    node[switch2i(3)].CnextNodeIndex = switch2i(2);
    node[switch2i(3)].CnextNodeDistance = 185;
    node[switch2i(4)].CnextNodeIndex = sensor2i("A14");
    node[switch2i(4)].CnextNodeDistance = 236;
    node[switch2i(5)].CnextNodeIndex = sensor2i("E11");
    node[switch2i(5)].CnextNodeDistance = 371+43;
    node[switch2i(6)].CnextNodeIndex = switch2i(5);
    node[switch2i(6)].CnextNodeDistance = 371+155;
    node[switch2i(7)].CnextNodeIndex = switch2i(18);
    node[switch2i(7)].CnextNodeDistance = 371+155;
    node[switch2i(8)].CnextNodeIndex = sensor2i("E10");
    node[switch2i(8)].CnextNodeDistance = 239;
    node[switch2i(9)].CnextNodeIndex = sensor2i("D05");
    node[switch2i(9)].CnextNodeDistance = 229;
    node[switch2i(10)].CnextNodeIndex = sensor2i("E03");
    node[switch2i(10)].CnextNodeDistance = 239;
    node[switch2i(11)].CnextNodeIndex = sensor2i("A04");
    node[switch2i(11)].CnextNodeDistance = 495+43;
    node[switch2i(12)].CnextNodeIndex = switch2i(4);
    node[switch2i(12)].CnextNodeDistance = 185;
    node[switch2i(13)].CnextNodeIndex = sensor2i("E16");
    node[switch2i(13)].CnextNodeDistance = 246;
    node[switch2i(14)].CnextNodeIndex = sensor2i("C11");
    node[switch2i(14)].CnextNodeDistance = 333;
    node[switch2i(15)].CnextNodeIndex = sensor2i("C10");
    node[switch2i(15)].CnextNodeDistance = 326;
    node[switch2i(16)].CnextNodeIndex = sensor2i("B03");
    node[switch2i(16)].CnextNodeDistance = 239;
    node[switch2i(17)].CnextNodeIndex = sensor2i("D15");
    node[switch2i(17)].CnextNodeDistance = 246;
    node[switch2i(18)].CnextNodeIndex = sensor2i("C06");
    node[switch2i(18)].CnextNodeDistance = 371;


    node[switch2i(1)].SnextNodeIndex = sensor2i("A12");
    node[switch2i(1)].SnextNodeDistance = 282;
    node[switch2i(2)].SnextNodeIndex = switch2i(1);
    node[switch2i(2)].SnextNodeDistance = 188;
    node[switch2i(3)].SnextNodeIndex = sensor2i("A06");
    node[switch2i(3)].SnextNodeDistance = 231;
    node[switch2i(4)].SnextNodeIndex = sensor2i("A15");
    node[switch2i(4)].SnextNodeDistance = 275;
    node[switch2i(5)].SnextNodeIndex = sensor2i("C03");
    node[switch2i(5)].SnextNodeDistance = 239;
    node[switch2i(6)].SnextNodeIndex = sensor2i("C15");
    node[switch2i(6)].SnextNodeDistance = 239;
    node[switch2i(7)].SnextNodeIndex = sensor2i("D11");
    node[switch2i(7)].SnextNodeDistance = 231;
    node[switch2i(8)].SnextNodeIndex = sensor2i("D09");
    node[switch2i(8)].SnextNodeDistance = 316;
    node[switch2i(9)].SnextNodeIndex = sensor2i("D08");
    node[switch2i(9)].SnextNodeDistance = 309;
    node[switch2i(10)].SnextNodeIndex = sensor2i("D04");
    node[switch2i(10)].SnextNodeDistance = 239;
    node[switch2i(11)].SnextNodeIndex = switch2i(12);
    node[switch2i(11)].SnextNodeDistance = 188;
    node[switch2i(12)].SnextNodeIndex = sensor2i("A02");
    node[switch2i(12)].SnextNodeDistance = 231;
    node[switch2i(13)].SnextNodeIndex = sensor2i("B05");
    node[switch2i(13)].SnextNodeDistance = 231;
    node[switch2i(14)].SnextNodeIndex = sensor2i("C13");
    node[switch2i(14)].SnextNodeDistance = 495+50;
    node[switch2i(15)].SnextNodeIndex = sensor2i("C05");
    node[switch2i(15)].SnextNodeDistance = 433;
    node[switch2i(16)].SnextNodeIndex = sensor2i("B01");
    node[switch2i(16)].SnextNodeDistance = 231;
    node[switch2i(17)].SnextNodeIndex = sensor2i("D13");
    node[switch2i(17)].SnextNodeDistance = 239;
    node[switch2i(18)].SnextNodeIndex = sensor2i("C08");
    node[switch2i(18)].SnextNodeDistance = 231;
    
    node[99].CSnextNodeIndex = sensor2i("C01");
    node[99].CSnextNodeDistance = 246;
    node[99].SCnextNodeIndex = sensor2i("B14");
    node[99].SCnextNodeDistance = 239;

    node[100].CSnextNodeIndex = sensor2i("D02");
    node[100].CSnextNodeDistance = 246;
    node[100].SCnextNodeIndex = sensor2i("E02");
    node[100].SCnextNodeDistance = 239;

}

// returns true if edge is found.
int findEdge(TrackGraph * t, int s1, int s2) {
    TrackGraphNode * node = t->node;
    switch(node[s1].type) {
        case Sensor:
            return node[s1].nextNodeIndex == s2;
            break;
        case Switch:
            return (node[s1].switchConfig == C && node[s1].CnextNodeIndex == s2) || (node[s1].switchConfig == S && node[s1].SnextNodeIndex == s2);
        case MultiSwitch:
            return (node[s1].switchConfig == CS && node[s1].CSnextNodeIndex == s2) || (node[s1].switchConfig == SC && node[s1].SCnextNodeIndex == s2);
        default:
            bwassert(0, COM2, "<findEdge>: couldn't find edge between %d and %d", s1, s2);
            break;
    }
	return 0;

}

int getEdgeDistance(TrackGraph * t, int s1, int s2) {
    TrackGraphNode * node = t->node;
    switch(node[s1].type) {
        case Sensor:
            if (findEdge(t, s1, s2)) return node[s1].nextNodeDistance;
            break;
        case Switch:
            if (node[s1].CnextNodeIndex == s2) return node[s1].CnextNodeDistance;
            if (node[s1].SnextNodeIndex == s2) return node[s1].SnextNodeDistance;
            break;
        case MultiSwitch:
            if (node[s1].CSnextNodeIndex == s2) return node[s1].CSnextNodeDistance;
            if (node[s1].SCnextNodeIndex == s2) return node[s1].SCnextNodeDistance;
            break;
        default:
            bwassert(0, COM2, "<findEdge>: couldn't find edge between %d and %d", s1, s2);
            break;
    }
    return 0;

}

/*
* This function takes in path and pathlength (set through a getShortestPath() call) and returns a list of sensors, the distance between them
* and the time between them through arrays passed. Pointers of their length need to be passed in as well in order to be set. 
*
* returns 1 if succesful.
*/
int getEdgeInfo(TrackGraph * t, int * path, int pathLength, int * distanceList, int * infoLength) {

    TrackGraphNode * node = t->node;
    *infoLength = 0;

    volatile int i = 0;

    for (i = pathLength - 1; i > 0; i--) {
        distanceList[*infoLength] = getEdgeDistance(t, path[i], path[i-1]);
        *infoLength += 1;
    }

    return 1;

}

//this version accounts for reverses
int getShortestPathPlus(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength) { 

    	TrackGraphNode * node = t->node;
	int print = 1;
	circularBuffer cb;

	// storing reverse paths in here.
	int flag[101]; //visited
	int prev[101]; //previous
	volatile int i = 0;

	// variables for while loop.
	int val = 0;
	int nextNode = -1;


	if (sensorStart <= 0 || sensorEnd <= 0) return 0;
	
	if (sensorStart == sensorEnd || sensorStart == node[sensorStart].inverse) {
		path[0] = sensorStart;
		*pathLength = 1;
	}else{
		//volatile int print = 0; // use this to toggle print
			for (; i < 101; i++){
			 flag[i] = 0; // init all efficient step.
			 prev[i] = -1; //has no previous node in search
		}
		
		circularBufferInit(&cb); //initialize empty queue
		flag[sensorStart] = 1;  //indicate we visited start sensor in graph.

		bwassert(addToBuffer(sensorStart, &cb), COM2, "<TrackGraphFind>:ERROR 1, Could not add %d to cb.", sensorStart); //enque node start sensor into path 

		while((getFromBuffer(&val, &cb))){
	//bwprintf(1,"val: %d",val);
			if (node[val].type == Sensor) {
			//bwprintf(1," sens %d\n\r",val);
				//look at next node in sensor's path
				nextNode = node[val].nextNodeIndex;
		//		bwprintf(1," %d 's next %d\n\r",val , nextNode);
				if(nextNode > 0 && flag[nextNode] == 0 ){
					flag[nextNode] = 1;
					prev[nextNode] = val;
					bwassert(addToBuffer(nextNode, &cb), COM2, "<TrackGraphFind>:ERROR 2, Could not add %d to cb.", nextNode); //enque node start sensor into path 
					if (nextNode == sensorEnd) break; //we only need to process this much if we reached end sensor
				}

				//check reverse/inverse node as well
				nextNode = node[val].inverse;
			//	bwprintf(1," %d 's inv %d\n\r",val , nextNode);
				if(nextNode > 0 && flag[nextNode] == 0){
					flag[nextNode] = 1;
					prev[nextNode] = val;
					bwassert(addToBuffer(nextNode, &cb), COM2, "<TrackGraphFind>:ERROR 3, Could not add %d to cb.", nextNode); //enque node start sensor into path 
					if (nextNode == sensorEnd) break; //we only need to process this much if we reached end sensor
				}

			} else if (node[val].type == Switch){
	//bwprintf(1," switch %d\n\r",val);
				//c case
	//bwprintf(1," %d 's cnext %d\n\r",val , nextNode);
				nextNode = node[val].CnextNodeIndex;
				if(nextNode > 0 && flag[nextNode] == 0){
					flag[nextNode] = 1;
					prev[nextNode] = val;
					bwassert(addToBuffer(nextNode, &cb), COM2, "<TrackGraphFind>:ERROR 4, Could not add %d to cb.", nextNode); //enque node start sensor into path 
					if (nextNode == sensorEnd) break; //we only need to process this much if we reached end sensor
				}

				//S case
	//bwprintf(1," %d 's snext %d\n\r",val , nextNode);
				nextNode = node[val].SnextNodeIndex;
				if(nextNode > 0 && flag[nextNode] == 0){
					flag[nextNode] = 1;
					prev[nextNode] = val;
					bwassert(addToBuffer(nextNode, &cb), COM2, "<TrackGraphFind>:ERROR 5, Could not add %d to cb.", nextNode); //enque node start sensor into path 
					if (nextNode == sensorEnd) break; //we only need to process this much if we reached end sensor
				}

			} else {//else multi-switch
	//bwprintf(1," multiswitch %d\n\r",val);
				//bwprintf(COM2, "Found node %d, which is a multiswitch.\r\n", val);
				//cs case
				nextNode = node[val].CSnextNodeIndex;
				if(nextNode > 0 && flag[nextNode] == 0){
					flag[nextNode] = 1;
					prev[nextNode] = val;
					bwassert(addToBuffer(nextNode, &cb), COM2, "<TrackGraphFind>:ERROR 6, Could not add %d to cb.", nextNode); //enque node start sensor into path 
					if (nextNode == sensorEnd) break; //we only need to process this much if we reached end sensor
				}

				//Sc case
				nextNode = node[val].SCnextNodeIndex;
				if(nextNode > 0 && flag[nextNode] == 0){
					flag[nextNode] = 1;
					prev[nextNode] = val;
					bwassert(addToBuffer(nextNode, &cb), COM2, "<TrackGraphFind>:ERROR 7, Could not add %d to cb.", nextNode); //enque node start sensor into path 
					if (nextNode == sensorEnd) break; //we only need to process this much if we reached end sensor
				}

			}
		}
		
		if(prev[i] == -1) return 0; //there is no path to this node
		*pathLength = 0;
		i = sensorEnd;
		for (;i != sensorStart; i = prev[i]) {
			path[*pathLength] = i;
			*pathLength += 1;
		}

		path[*pathLength] = sensorStart;
		*pathLength += 1;
	}

	// toggle print variable to print this, for purposes of debugging (and potentially your sanity if you hate graphs).
	if (print) {
		bwprintf(COM2, "Shortest path, reversed from end to start:\r\n");
		i = sensorEnd;
		for (;i != sensorStart; i = prev[i]) {
			if (i < 81) bwprintf(COM2, "%c%d%d <- ", ((i-1)/16)+'A',((i-1)%16+1)/10, ((i-1)%16+1)%10);
			else if (i < 98) bwprintf(COM2, "sw %d <- ", i-80);
			else bwprintf(COM2, "multsw %d %d <- ", i == 99 ? 153 : 155, i == 99 ? 154 : 156);

		}
		bwprintf(COM2, "%c%d%d\r\n\r\n", ((sensorStart-1)/16)+'A',((sensorStart-1)%16+1)/10, ((sensorStart-1)%16+1)%10);
	}

	return 1;
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

	bwassert(addToBuffer(sensorStart, &cb), COM2, "<TrackGraphFind>:ERROR 1, Could not add %d to cb.", i);

	while(1) {
		// pop a node out
		// if we can't get a node from this buffer, we've reached a dead end. Return 0.
		if (!getFromBuffer(&val, &cb)) return 0;

		if (node[val].type == Sensor) {
			 next = node[val].nextNodeIndex;
			if (next <= 0 || tree[next] > 0) continue;
			tree[next] = val;
			if (next == sensorEnd) {
				break;
			}
			bwassert(addToBuffer(next, &cb), COM2, "<TrackGraphFind>:ERROR 3, Could not add %d to cb.", next);

		} else if (node[val].type == Switch){
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



// Here's another attempt.

int getShortestPathDjikstra(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength) {

    if (sensorStart <= 0 || sensorEnd <= 0) return 0;
    if (sensorStart == sensorEnd) {
        path[0] = sensorStart;
        *pathLength = 1;
        return 1;
    }
    volatile int print = 0; // use this to toggle print

    // Djikstra data structures.
    int dist[101];
    int prev[101];
    int prevSwitch[100];
    int prevSwitchCount = 0;
    int weight[101];

    volatile int i = 0;
    // variables for while loop.
    int val = 0;

    int alt = 0;

    for (; i < 101; i++) {
        dist[i] = 0x7fffffff; //assigned maximum distance value.
        prev[i] = -1;
        prevSwitch[i] = 0;
        weight[i] = 1;
    }

    dist[sensorStart] = 0; //the starting sensor will have distance 0.


    TrackGraphNode * node = t->node;
    // add sensor start as the root node in the queue


    val = sensorStart;
    if (print) bwprintf(COM2, "Beginning Djikstra find SensorStart %c%d%d.\r\n", ((val-1)/16)+'A',((val-1)%16+1)/10, ((val-1)%16+1)%10);


    while(1) {

        // mark this node as visited.
        if (val <= 0) return 0; // dead end

        if (print) {
            if (val <= 80) bwprintf(COM2, "Selected node %c%d%d[weight:%d].\r\n", ((val-1)/16)+'A',((val-1)%16+1)/10, ((val-1)%16+1)%10, weight[val]);
            else if (val <= 98) bwprintf(COM2, "Selected node %d[weight:%d].\r\n", val-80, weight[val]);
            else if (val <= 100 ) bwprintf(COM2, "Selected node [multiswitch] %d[weight:%d].\r\n", val-80, weight[val]);
            else bwprintf(COM2, "Invalid index %d.\r\n", val);
        }

        weight[val] = 0;
        if (val == sensorEnd) { 
           if (print) bwprintf(COM2, "Arrived at %c%d%d. Breaking...\r\n", ((val-1)/16)+'A',((val-1)%16+1)/10, ((val-1)%16+1)%10);
           break;
        }


        // for each neighbor, update alternative distance.
        switch (node[val].type) {
            case Sensor:
                if (node[val].nextNodeIndex == -1) break;
                alt = dist[val] + node[val].nextNodeDistance;
                if (alt < dist[node[val].nextNodeIndex]) {
                    dist[node[val].nextNodeIndex] = alt;
                    prev[node[val].nextNodeIndex] = val;
                }
                break;
            case Switch:
                alt = dist[val] + node[val].CnextNodeDistance;
                if (alt < dist[node[val].CnextNodeIndex]) {
                    dist[node[val].CnextNodeIndex] = alt;
                    prev[node[val].CnextNodeIndex] = val;
                }
                alt = dist[val] + node[val].SnextNodeDistance;
                if (alt < dist[node[val].SnextNodeIndex]) {
                    dist[node[val].SnextNodeIndex] = alt;
                    prev[node[val].SnextNodeIndex] = val;
                }
                break;
            case MultiSwitch:
                alt = dist[val] + node[val].CSnextNodeDistance;
                if (alt < dist[node[val].CSnextNodeIndex]) {
                    dist[node[val].CSnextNodeIndex] = alt;
                    prev[node[val].CSnextNodeIndex] = val;
                }
                alt = dist[val] + node[val].SCnextNodeDistance;
                if (alt < dist[node[val].SCnextNodeIndex]) {
                    dist[node[val].SCnextNodeIndex] = alt;
                    prev[node[val].SCnextNodeIndex] = val;
                }
                break;
            default:
                bwassert(0, COM2, "<getShortestPathDjikstra> Invalid node type[2].");

        }


        // finally  we get the next node with shortest distance.
        switch(node[val].type) {
            case Sensor:
                if (node[val].nextNodeIndex == -1) {
                    // backtrack to the last switch.
                    if (prevSwitchCount <= 0) return 0;
                    prevSwitchCount--;
                    val = prevSwitch[prevSwitchCount];
                } else {
                    val = node[val].nextNodeIndex;
                }

                break;
            case Switch:
                if (weight[node[val].CnextNodeIndex] && weight[node[val].SnextNodeIndex]) {
                    bwassert(prevSwitchCount < 100, COM2, "prevSwitch stack full.\r\n");
                    prevSwitch[prevSwitchCount] = val;
                    prevSwitchCount++;
                    if (node[val].CnextNodeDistance < node[val].SnextNodeDistance) {
                        val = node[val].CnextNodeIndex;
                    } else {
                        val = node[val].SnextNodeIndex;

                    }
                } else if (weight[node[val].CnextNodeIndex]) {
                    val = node[val].CnextNodeIndex;
                } else if (weight[node[val].SnextNodeIndex]) {
                    val = node[val].SnextNodeIndex;
                } else {
                    if (prevSwitchCount <= 0) return 0;
                    prevSwitchCount--;
                    val = prevSwitch[prevSwitchCount];
                }
                break;
            case MultiSwitch:
                if (weight[node[val].CSnextNodeIndex] && weight[node[val].SCnextNodeIndex]) {
                    bwassert(prevSwitchCount < 100, COM2, "prevSwitch stack full.\r\n");
                    prevSwitch[prevSwitchCount] = val;
                    prevSwitchCount++;
                    if (node[val].CSnextNodeDistance < node[val].SCnextNodeDistance) {
                        val = node[val].CSnextNodeIndex;
                    } else {
                        val = node[val].SCnextNodeIndex;
                    }

                } else if (weight[node[val].CSnextNodeIndex]) {
                    val = node[val].CSnextNodeIndex;
                } else if (weight[node[val].CSnextNodeIndex]) {
                    val = node[val].SCnextNodeIndex;
                } else {
                    if (prevSwitchCount <= 0) return 0;
                    prevSwitchCount--;
                    val = prevSwitch[prevSwitchCount];
                }
                break;
            default:
                bwassert(0, COM2, "<getShortestPathDjikstra> Invalid node type[1].");
        }


    }

    if (print) {
        for (i = 0; i < 101; i++) {
            if (!(i % 16)) bwprintf(COM2, "\r\n");
            bwprintf(COM2, "%d ", dist[i]);
        }
    }
    if (print) {
        for (i = 0; i < 101; i++) {
            if (!(i % 16)) bwprintf(COM2, "\r\n");
            bwprintf(COM2, "%d ", prev[i]);
        }
    }
    *pathLength = 0;
    i = sensorEnd;
    for (;i != sensorStart; i = prev[i]) {
        if (i < 0) while(1) {}
        if (print) bwprintf(COM2, "i=%d\r\n", i);
        path[*pathLength] = i;
        *pathLength += 1;
    }
    path[*pathLength] = sensorStart;
    *pathLength += 1;

    // toggle print variable to print this, for purposes of debugging (and potentially your sanity if you hate graphs).
    if (print) {
        bwprintf(COM2, "Shortest path, reversed from end to start:\r\n");
        i = sensorEnd;
        for (;i != sensorStart; i = prev[i]) {
            if (i < 81) bwprintf(COM2, "%c%d%d <- ", ((i-1)/16)+'A',((i-1)%16+1)/10, ((i-1)%16+1)%10);
            else if (i < 98) bwprintf(COM2, "sw %d <- ", i-80);
            else bwprintf(COM2, "multsw %d %d <- ", i == 99 ? 153 : 155, i == 99 ? 154 : 156);

        }
        bwprintf(COM2, "%c%d%d\r\n\r\n", ((sensorStart-1)/16)+'A',((sensorStart-1)%16+1)/10, ((sensorStart-1)%16+1)%10);
    }

    return 1;

}



