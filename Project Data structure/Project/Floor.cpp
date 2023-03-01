#include "Floor.h"

int Floor::count = 0;

Floor::Floor()
{
	ID = count++;
	WaitingUp_patients = new LinkedPriorityQueue<Pickable*>;
	Waitingdown_patients = new LinkedPriorityQueue<Pickable*>;
	WaitingUp_visitor = new LinkedList<Pickable*>;
	Waitingdown_visitor = new LinkedList<Pickable*>;
	WaitingUp_cargo = new LinkedQueue<Pickable*>;
	Waitingdown_cargo = new LinkedQueue<Pickable*>;
}

Floor::~Floor()
{
	delete WaitingUp_patients;
	delete Waitingdown_patients;
	delete WaitingUp_visitor;
	delete Waitingdown_visitor;
	delete WaitingUp_cargo;
	delete Waitingdown_cargo;

}

void Floor::enqueue_pickable(Pickable* p)
{
	switch (p->getPickabletype())
	{
	case Patient:
		if (p->getTargetFloor() > p->getSourceFloor())
		{
			WaitingUp_patients->enqueue(p);
		}
		else
		{
			Waitingdown_patients->enqueue(p);
		}
		break;
	
	case Visitor:
		if (p->getTargetFloor() > p->getSourceFloor())
		{
			WaitingUp_visitor->InsertEnd(p);
		}
		else if (p->getTargetFloor() < p->getSourceFloor())
		{
			Waitingdown_visitor->InsertEnd(p);
		}
		break;
	case Cargo:
		if (p->getTargetFloor() > p->getSourceFloor())
		{
			WaitingUp_cargo->enqueue(p);
		}
		else if (p->getTargetFloor() < p->getSourceFloor())
		{
			Waitingdown_cargo->enqueue(p);
		}
		break;

	}
	

}

LinkedPriorityQueue<Pickable*>* Floor::getWaitingUp_Patients()
{
	return WaitingUp_patients;
}

LinkedPriorityQueue<Pickable*>* Floor::getWaitingDown_Patients()
{
	return Waitingdown_patients;
}

LinkedList<Pickable*>* Floor::getWaitingUp_visitor()
{
	return WaitingUp_visitor;
}

LinkedList<Pickable*>* Floor::getWaitingDown_visitor()
{
	return Waitingdown_visitor;
}

LinkedQueue<Pickable*>* Floor::getWaitingUp_cargo()
{
	return WaitingUp_cargo;
}

LinkedQueue<Pickable*>* Floor::getWaitingDown_cargo()
{
	return Waitingdown_cargo;
}
