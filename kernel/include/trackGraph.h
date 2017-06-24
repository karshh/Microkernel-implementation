


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

typedef struct velocityModelNode {
    int numChild;
    int child[5];
    int distance[5];
    int time[75];
    int count[75];
    char rowCursor[5];
    char colCursor;
} velocityModelNode;


#define VELOCITY_NODES 81

typedef struct velocityModel {
    velocityModelNode v[VELOCITY_NODES];

} velocityModel;

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
	velocityModel vm;
} TrackGraph;


void velocityModelInit(velocityModel * vm);

int findAltSensor(TrackGraph * t, int i);

int findNextSensor(TrackGraph * t, int i);

int sensor2i(char * c);

int switch2i(int i);

int findSensorEdge(velocityModel * vm, int s1, int s2);

int updateEdgeTime(velocityModel * vm, int s1, int s2, int speed, int t);

int getEdgeDistance(velocityModel * vm, int s1, int s2);
int getEdgeTime(velocityModel * vm, int s1, int s2, int speed);

void TrackGraphInit(TrackGraph * t);

// Returns 1 if a shortest path does exist.
// If there's a dead end, 0 is returned.

// The shortest path will be placed in path array in reverse order. Luckily the pathLength is also
// mutated, make sure to traverse in reverse order.
int getShortestPath(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength);

#endif
