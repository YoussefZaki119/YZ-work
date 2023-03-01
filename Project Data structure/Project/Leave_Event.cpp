#include "Leave_Event.h"
#include "LinkedList.h"
#include "Pickable.h"

int Leave_Event::leavecount = 0;

Leave_Event::Leave_Event(Hospital* phosp):Event(phosp)
{

}


void Leave_Event::Execute()
{
	Pickable* pptr;
	Floor* f= pHospital->getFloor();
	LinkedList<Pickable*>* Vptr = f[0].getWaitingUp_visitor();
	Pickable temp;
	temp.setID(pickID);
	Pickable* tempVptr = &temp;
	pptr=Vptr->RetrieveVisitorID(tempVptr);
	if (pptr == nullptr)
	{
		return;
	}
	delete pptr;
	leavecount++;

}

void Leave_Event::ReadEvent(ifstream& inputFile)
{
	int ts, pid;
	inputFile >> ts >> pid;
	setTimestep(ts);
	setpickID(pid);
}

int Leave_Event::getleavecount()
{
	return leavecount;
}
