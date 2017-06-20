


#ifndef _TRACK_GRAPH
#define _TRACK_GRAPH


typedef enum TrackGraphNodeType {
	Sensor,
	Switch,
	MultiSwitch
} TrackGraphNodeType;

typedef enum SwitchConfig {
	NA,
	S,
	C,
	SS,
	SC,
	CS,
	CC
} SwitchConfig;

typedef struct TrackGraphNode {
	TrackGraphNodeType type;
	int id1;
	int id2; // to support multiswitches, have 2 ID's. 

	SwitchConfig switchConfig;
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
int findAltSensor(TrackGraph * t, int i);
int findNextSensor(TrackGraph * t, int i);

int sensor2i(char * c);

int switch2i(int i);



void TrackGraphInit(TrackGraph * t);

// Returns 1 if a shortest path does exist.
// If there's a dead end, 0 is returned.

// The shortest path will be placed in path array in reverse order. Luckily the pathLength is also
// mutated, make sure to traverse in reverse order.
int getShortestPath(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength);

#endif
