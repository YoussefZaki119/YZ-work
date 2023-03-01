#pragma once
#include "Event.h"
#include "Pickable.h"

class Arrival_Event : public Event
{
	Type pickType;
	int source_floor;
	int target_floor;
	int pPriority = 0;
public:
	Arrival_Event(Hospital* phosp);
	void Execute();
	void setSource(int);
	void setTarget(int);
	int getSource();
	int getTarget();
	void ReadEvent(ifstream& inputFile);
};

