#include "Event.h"

Event::Event(Hospital* phosp)
{
	pHospital = phosp;
}

void Event::setTimestep(int t)
{
	Timestep = t;
}

void Event::setType(char type)
{
	eType = type;
}

void Event::setpickID(int id)
{
	pickID = id;
}
int Event::getTimestep()
{
	return Timestep;
}

char Event::getType()
{
	return eType;
}

int Event::getpickID()
{
	return pickID;
}
