


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

int setEdgeDistance(velocityModel * vm, int s1, int s2, int d);

int getEdgeTime(velocityModel * vm, int s1, int s2, int speed);

int getEdgeVelocity(velocityModel * vm, int s1, int s2, int speed);

void TrackGraphInit(TrackGraph * t);

// Returns 1 if a shortest path does exist.
// If there's a dead end, 0 is returned.

// The shortest path will be placed in path array in reverse order. Luckily the pathLength is also
// mutated, make sure to traverse in reverse order.
int getShortestPath(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength);

void implementTrackB(velocityModel * vm, int rc);

/*
* This function takes in path and pathlength (set through a getShortestPath() call) along with the current train speed, and returns a list of sensors, the distance between them
* and the time between them through arrays passed. Pointers of their length need to be passed in as well in order to be set. 
*
* returns 1 if succesful.
*/
int getEdgeInfo(
	/* These will need to be provided in order to parse */
	TrackGraph * t, int * path, int pathLength, int speed,
	/* These will be updated with the values you're looking for. Note that since distanceList and timeList will be the same size, infoLength will be containing their size after this function call ends. */
    int * sensorList, int * sensorLength, int * distanceList, int * timeList, int * infoLength);

#endif
