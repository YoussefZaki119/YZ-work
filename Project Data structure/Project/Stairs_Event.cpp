#include "Stairs_Event.h"


int Stairs_Event:: stairscount = 0;
Stairs_Event::Stairs_Event(Hospital* phosp):Event(phosp)
{

}

void Stairs_Event::Execute()
{
	int stairsEquation;
	Floor* f = pHospital->getFloor();
	int numf = pHospital->getNumFloors();
	LinkedList<Pickable*>* VUptr;
	LinkedList<Pickable*>* VDptr;
	Pickable temp;
	Pickable* tempVptr;
	Pickable* VU;
	Pickable* VD;
	for (int i = 0;i < numf;i++)
	{
		VUptr = f[i].getWaitingUp_visitor();
		VDptr = f[i].getWaitingDown_visitor();
		temp.setID(pickID);
		tempVptr = &temp;
		VU = VUptr->RetrieveVisitorID(tempVptr);
		VD = VDptr->RetrieveVisitorID(tempVptr);


		if (VU != nullptr)
		{
			stairsEquation =pHospital->getcurTS() + abs(VU->getTargetFloor() - VU->getSourceFloor()) * VU->getStairsTS();
			pHospital->getStairList()->InsertEnd(VU);
			stairscount++;
			VU->setStairsTargetTime(stairsEquation);
			VU->setPickTime(pHospital->getcurTS());
		}
		if (VD != nullptr)
		{
			stairsEquation = pHospital->getcurTS() + abs(VD->getTargetFloor() - VD->getSourceFloor()) * VD->getStairsTS();
			pHospital->getStairList()->InsertEnd(VD);
			stairscount++;
			VD->setStairsTargetTime(stairsEquation);
			VD->setPickTime(pHospital->getcurTS());
		}
	}

}

void Stairs_Event::ReadEvent(ifstream& inputFile)
{
	int ts, pid;
	inputFile >> ts >> pid;
	setTimestep(ts);
	setpickID(pid);
}

int Stairs_Event::getstairscount()
{
	return stairscount;
}
