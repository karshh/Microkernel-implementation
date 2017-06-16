

#include "trackGraph.h"


int sensor2i(char * c) {
	return  ((16*(c[0] - 'A')) + (10* c[1]) + c[2]);
}

int switch2i(int i) {
	return i + 80;
}



void TrackGraphInit(TrackGraph * t) {

	TrackGraphNode * node = t->node;
	//prevNodeIndex = -1;
	t->currentNodeIndex = -1;

	volatile int i = 1;
	// initializing sensors
	for (i = 1; i <= 98; i++) {
		if (i <= 80) {
			node[i].type = Sensor;
			node[i].id1 = i;
			node[i].id2 = -1;	
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
	node[sensor2i("A15")].nextNodeIndex = sensor2i("C13");
	node[sensor2i("A16")].nextNodeIndex = -1;
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
	node[sensor2i("C13")].nextNodeIndex = sensor2i("E08");
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
	node[sensor2i("D08")].nextNodeIndex = sensor2i("E07");
	node[sensor2i("D09")].nextNodeIndex = sensor2i("E12");
	node[sensor2i("D10")].nextNodeIndex = switch2i(9);
	node[sensor2i("D11")].nextNodeIndex = sensor2i("C16");
	node[sensor2i("D12")].nextNodeIndex = sensor2i("E11");
	node[sensor2i("D13")].nextNodeIndex = sensor2i("B2");
	node[sensor2i("D14")].nextNodeIndex = sensor2i("E14");
	node[sensor2i("D15")].nextNodeIndex = sensor2i("B13");
	node[sensor2i("D16")].nextNodeIndex = sensor2i("E14");
	node[sensor2i("E01")].nextNodeIndex = 99;
	node[sensor2i("E02")].nextNodeIndex = sensor2i("E15");
	node[sensor2i("E03")].nextNodeIndex = sensor2i("D01");
	node[sensor2i("E04")].nextNodeIndex = sensor2i("E05");
	node[sensor2i("E05")].nextNodeIndex = sensor2i("D06");
	node[sensor2i("E06")].nextNodeIndex = switch2i(10);
	node[sensor2i("E07")].nextNodeIndex = sensor2i("C14");
	node[sensor2i("E08")].nextNodeIndex = sensor2i("D07");
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

