


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
	SC,
	CS,
} SwitchConfig;


typedef struct TrackGraphNode {
	TrackGraphNodeType type;
	int id1;
	int id2; // to support multiswitches, have 2 ID's. 

	SwitchConfig switchConfig;
	int nextNodeIndex; // for sensors only.
	int nextNodeDistance;
	int inverse;
	int CnextNodeIndex; // for single switches only;
	int CnextNodeDistance;
	int SnextNodeIndex; // for single switches only;
	int SnextNodeDistance;
	int CSnextNodeIndex; // for multi switches only;
	int CSnextNodeDistance;
	int SCnextNodeIndex; // for multi switches only;
	int SCnextNodeDistance;
	unsigned int timeToNextSensor;
} TrackGraphNode;

typedef struct TrackGraph {
	TrackGraphNode node[102];
} TrackGraph;


// void sensorModelInit(sensorModel * vm);

int findAltSensor(TrackGraph * t, int i, int * dist);

int findNextSensor(TrackGraph * t, int i, int * dist);

int sensor2i(char * c);

int switch2i(int i);

int findEdge(TrackGraph * t, int s1, int s2);

int getEdgeDistance(TrackGraph * t, int s1, int s2);

void TrackGraphInitA(TrackGraph * t);
void TrackGraphInitB(TrackGraph * t);

void TrackGraphInit(TrackGraph * t);



// Returns 1 if a shortest path does exist.
// If there's a dead end, 0 is returned.

// The shortest path will be placed in path array in reverse order. Luckily the pathLength is also
// mutated, make sure to traverse in reverse order.
int getShortestPath(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength);
int getShortestPathDjikstra(TrackGraph * t, int sensorStart, int sensorEnd, int * path, int * pathLength);


/*
* This function takes in path and pathlength (set through a getShortestPath() call) along with the current train speed, and returns a list of sensors, the distance between them
* and the time between them through arrays passed. Pointers of their length need to be passed in as well in order to be set. 
*
* returns 1 if succesful.
*/
int getEdgeInfo(
	/* These will need to be provided in order to parse */
	TrackGraph * t, int * path, int pathLength,
	/* These will be updated with the values you're looking for. Note that since distanceList and timeList will be the same size, infoLength will be containing their size after this function call ends. */
    int * distanceList, int * infoLength);

#endif
