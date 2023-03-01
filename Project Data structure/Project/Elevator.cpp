#include "Elevator.h"

Elevator::Elevator()
{
	setCurrentFloor(0);
	setState(IDLE);
	setDirection(UP);
	setCurrentLoad(0);
	elevator_list = new LinkedPriorityQueue<Pickable*>;

}

Elevator::~Elevator()
{
	delete elevator_list;
}

void Elevator::setspeed(int s)
{
	speed = s;
}

void Elevator::setcapacity(int c)
{
	capacity = c;
}

void Elevator::setCheckUpPeriod(int cup)
{
	CheckUpPeriod = cup;
}

void Elevator::setState(E_state s)
{
	state = s;
}

void Elevator::setDirection(E_Direction d)
{
	direction = d;
}

void Elevator::setCurrentLoad(int cl)
{
	CurrentLoad = cl;
}

void Elevator::setCurrentFloor(int cf)
{
	CurrentFloor = cf;
}

void Elevator::setAvailTs(int ats)
{
	AvailTs = ats;
}

void Elevator::setMovingtime(int mt)
{
	Movingtime = mt;
}

void Elevator::setUnloadTimeStep(int Ts)
{
	UnloadTimeStep = Ts;
}

void Elevator::setIsIDLE(bool I)
{
	IsIDLE = I;
}

int Elevator::getCheckUpPeriod()
{
	return CheckUpPeriod;
}

int Elevator::getspeed()
{
	return speed;
}

int Elevator::getcapacity()
{
	return capacity;
}

int Elevator::getCurrentLoad()
{
	return CurrentLoad;
}

int Elevator::getCurrentFloor()
{
	return CurrentFloor;
}

int Elevator::getAvailTs()
{
	return AvailTs;
}

int Elevator::getMovingtime()
{
	return Movingtime;
}

int Elevator::getUnloadTimeStep()
{
	return UnloadTimeStep;
}

bool Elevator::getIsIDLE()
{
	return IsIDLE;
}

LinkedPriorityQueue<Pickable*>* Elevator::get_elevator_list()
{
	return elevator_list;
}


E_state Elevator::getState()
{
	return state;
}

E_Direction Elevator::getDirection()
{
	return direction;
}
