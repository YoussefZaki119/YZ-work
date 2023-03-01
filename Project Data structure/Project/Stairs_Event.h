#pragma once
#include "Event.h"
class Stairs_Event : public Event
{
	static int stairscount;
public:
	Stairs_Event(Hospital* phosp);
	void Execute();
	void ReadEvent(ifstream& inputFile);
	int getstairscount();

};

