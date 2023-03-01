#include "Arrival_Event.h"

Arrival_Event::Arrival_Event(Hospital* phosp):Event(phosp)
{
}

void Arrival_Event::Execute()
{
	Floor* f = pHospital->getFloor();
	Pickable *p=new Pickable;
	p->setID(pickID);
	p->setArrivalTime(Timestep);
	p->setPickabletype(pickType);
	p->setSourceFloor(source_floor);
	p->setTargetFloor(target_floor);
	switch (pickType)
	{
	case Patient:
		p->setPatientPriority(pPriority);

		if (target_floor> source_floor)
		{
			f[source_floor].getWaitingUp_Patients()->enqueue(p,p->CalculatePatientFinalPriority());
		}
		else if(target_floor < source_floor)
		{
			f[source_floor].getWaitingDown_Patients()->enqueue(p,p->CalculatePatientFinalPriority());
		}
		break;
	case Visitor:

		if (target_floor > source_floor)
		{
			f[source_floor].getWaitingUp_visitor()->InsertEnd(p);
		}
		else if (target_floor < source_floor)
		{
			f[source_floor].getWaitingDown_visitor()->InsertEnd(p);
		}
		break;
	case Cargo:

		if (target_floor > source_floor)
		{
			f[source_floor].getWaitingUp_cargo()->enqueue(p);
		}
		else if (target_floor < source_floor)
		{
			f[source_floor].getWaitingDown_cargo()->enqueue(p);
		}
		break;
	}
}

void Arrival_Event::setSource(int s)
{
	source_floor = s;
}

void Arrival_Event::setTarget(int t)
{
	target_floor = t;
}

int Arrival_Event::getSource()
{
	return source_floor;
}

int Arrival_Event::getTarget()
{
	return target_floor;
}

void Arrival_Event::ReadEvent(ifstream& inputFile)
{
	char pt;
	inputFile >> pt;

	switch (pt)
	{
	case 'P':
		pickType = Patient;
		break;
	case 'V':
		pickType = Visitor;
		break;
	case 'C':
		pickType = Cargo;
		break;
	}

	int ts;
	int pId;
	int sf;
	int tf;
	inputFile >> ts;
	inputFile >> pId;
	inputFile >> sf;
	inputFile >> tf;
	Timestep = ts;
	pickID = pId;
	source_floor = sf;
	target_floor = tf;

	if (pt == 'P')
	{
		int priority;
		inputFile >> priority;
		pPriority = priority;
	}
}


