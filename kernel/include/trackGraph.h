


#ifndef _TRACK_GRAPH
#define _TRACK_GRAPH


typedef enum TrackGraphNodeType {
	Sensor,
	Switch,
	MultiSwitch
} TrackGraphNodeType;

typedef enum SwitchNodeType {
	NA,
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

	SwitchNodeType nodeType;
	int nextNodeIndex; // for sensors only.
	int CnextNodeIndex; // for single switches only;
	int SnextNodeIndex; // for single switches only;
	int CSnextNodeIndex; // for multi switches only;
	int SCnextNodeIndex; // for multi switches only;
	unsigned int timeToNextSensor;
} TrackGraphNode;

typedef struct TrackGraph {
	TrackGraphNode node[102];
} TrackGraph;


int sensor2i(char * c);

int switch2i(int i);



void TrackGraphInit(TrackGraph * t);

// Returns 1 if a shortest path does exist.
// If there's a dead end, 0 is returned.
int getShortestPath(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength);

#endif
