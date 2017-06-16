


#ifndef _TRACK_GRAPH
#define _TRACK_GRAPH


typedef enum TrackGraphNodeType {
	Sensor,
	Switch,
	MultiSwitch
} TrackGraphNodeType;

typedef enum SwitchNodeType {
	S,
	C,
	SS,
	SC,
	CS,
	CC
} SwitchNodeType;

typedef struct TrackGraphNode {
	TrackGraphNodeType type;
	int id1;
	int id2; // to support multiswitches, have 2 ID's. 
	int nextNodeIndex; // for sensors only.

	SwitchNodeType nodeType;
	int CnextNodeIndex; // for single switches only;
	int SnextNodeIndex; // for single switches only;
	int CSnextNodeIndex; // for multi switches only;
	int SCnextNodeIndex; // for multi switches only;
	unsigned int timeToNextSensor;
} TrackGraphNode;

typedef struct TrackGraph {
	TrackGraphNode node[102];
	int currentNodeIndex;
} TrackGraph;


int sensor2i(char * c);

int switch2i(int i);



void TrackGraphInit(TrackGraph * t);

#endif
