#include <bwio.h>
#include <stdio.h>
#include <trackGraph.h>
int main(){
	TrackGraph t;
	TrackGraphInitA(&t);
	TrackGraphNode * node = t.node;
	int pathLength=0;
	int path[150];
/*
	bwprintf(1,"has path[%s] to [%s]: %d\n\r","C13", "D07", getShortestPathPlus(&t, sensor2i("C13"), sensor2i("D07"), path, &pathLength));
	bwprintf(1,"has path[%s] to [%s]: %d\n\r","C14", "D07", getShortestPathPlus(&t, sensor2i("C14"), sensor2i("D07"), path, &pathLength));
	bwprintf(1,"has path[%s] to [%s]: %d\n\r","B01", "B03", getShortestPathPlus(&t, sensor2i("B01"), sensor2i("B03"), path, &pathLength));
	bwprintf(1,"has path[%s] to [%s]: %d\n\r","B03", "B01", getShortestPathPlus(&t, sensor2i("B03"), sensor2i("B01"), path, &pathLength));
	bwprintf(1,"has path[%s] to [%s]: %d\n\r","B03", "B02", getShortestPathPlus(&t, sensor2i("B03"), sensor2i("B02"), path, &pathLength));
*/

	int i=0;
	int j=0;
	for(i=1;i<=80;i++){
		for(j=1;j<=80;j++){
		getShortestPathPlus(&t, i, j, path, &pathLength);
		}
	}
}
