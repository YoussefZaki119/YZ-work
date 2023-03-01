#include "Pickable.h"

int Pickable::stair_TS = 0;
int Pickable::totalPickCount = 0;
int Pickable::autoS = 0;
int Pickable::CountautoS = 0;

Pickable::Pickable()
{
	totalPickCount++;
}

Pickable::~Pickable()
{
	totalPickCount--;
}

void Pickable::setstairTS(int sts)
{
	Pickable::stair_TS = sts;
}

void Pickable::setAutoS(int as)
{
	Pickable::autoS = as;
}

void Pickable::setCountAutoS(int cas)
{
	Pickable::CountautoS = cas;
}

void Pickable::setTargetTime(int tt)
{
	target_time = tt;
}

void Pickable::setPickTime(int pt)
{
	pick_time = pt;
}

void Pickable::setID(int id)
{
	ID = id;
}

void Pickable::setTotalPickCount(int t)
{
	totalPickCount = t;
}

void Pickable::setSourceFloor(int sf)
{
	source_floor = sf;
}

void Pickable::setTargetFloor(int tf)
{
	target_floor = tf;
}

void Pickable::setArrivalTime(int at)
{
	arrival_time = at;
}

void Pickable::setPickabletype(Type p)
{
	pickabletype = p;
}

void Pickable::setPatientPriority(int prior)
{
	patient_priority = prior;
}

void Pickable::setWaitTime(int wt)
{
	waitTime = wt;
}

void Pickable::setServiceTime(int st)
{
	serviceTime = st;
}

void Pickable::setElevPriority(int prior)
{
	elevator_priority = prior;
}

void Pickable::setStairsTargetTime(int stt)
{
	stairs_target_time = stt;
}

float Pickable::CalculatePatientFinalPriority()
{
	patient_final_priority = (float) patient_priority / (abs(target_floor - source_floor) * arrival_time);
	patient_final_priority *= 10;
	return patient_final_priority;
}



int Pickable::getPickTime()
{
	return pick_time;
}

int Pickable::getTargetTime()
{
	return target_time;
}

int Pickable::getTotalPickCount()
{
	return totalPickCount;
}

int Pickable::getServiceTime()
{
	return serviceTime;
}

int Pickable::getWaitTime()
{
	return (pick_time-arrival_time);
}

int Pickable::getTotalTime()
{
	return (arrival_time + getWaitTime() + getServiceTime());
}

int Pickable::getID()
{
	return ID;
}

int Pickable::getSourceFloor()
{
	return source_floor;
}

int Pickable::getTargetFloor()
{
	return target_floor;
}

int Pickable::getArrivalTime()
{
	return arrival_time;
}

Type Pickable::getPickabletype()
{
	return pickabletype;
}

int Pickable::getElevPriority()
{
	return elevator_priority;
}


int Pickable::getStairsTS()
{
	return stair_TS;
}

int Pickable::getStairsTargetTime()
{
	return stairs_target_time;
}

int Pickable::getAutoS()
{
	return autoS;
}

int Pickable::getCountAutoS()
{
	return CountautoS;
}

int Pickable::getPatientPriority()
{
	return patient_priority;
}

bool Pickable ::operator == (Pickable& inputVisitor) //operator overloading for comparing visitor IDs
{
	if (ID == inputVisitor.getID())
		return true;
	else
		return false;
}