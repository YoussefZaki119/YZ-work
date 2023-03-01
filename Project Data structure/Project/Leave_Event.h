#pragma once
#include "Event.h"
#include "Pickable.h"
class Leave_Event : public Event
{
	static int leavecount;
public:
	Leave_Event(Hospital* phosp);
	void Execute();
	void ReadEvent(ifstream& inputFile);
	int getleavecount();

};

