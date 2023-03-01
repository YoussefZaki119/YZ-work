#include "UI.h"
#include "Leave_Event.h"
#include "Stairs_Event.h"
#include <string>
#include "Hospital.h"

UI::UI(Hospital* pHosp)
{
	pHospital = pHosp;
}

string UI::getUserInput() //getting user input (file name)
{
	string input;
	getline(cin, input);
	return input;
}

int UI::printInfo()
{
	Leave_Event l(pHospital);
	Stairs_Event s(pHospital);
	int currentTimeStep = pHospital->getcurTS();
	Floor* F = pHospital->getFloor();
	int Totalwaiting = 0;
	int TotalInService = 0;
	int TotalCompleted = 0;
	LinkedQueue<Pickable*>* Completed = pHospital->getCompletedPickableList();

	cout << "Current timestep:" << currentTimeStep << endl;
	for (int i = pHospital->getNumFloors()-1; i >=0 ;i--)
	{
		LinkedPriorityQueue<Pickable*>* waitingup_patients = F[i].getWaitingUp_Patients();
		LinkedPriorityQueue<Pickable*>* waitingdown_patients = F[i].getWaitingDown_Patients();

		LinkedList<Pickable*>* waitingup_visitor = F[i].getWaitingUp_visitor();
		LinkedList<Pickable*>* waitingdown_visitor = F[i].getWaitingDown_visitor();

		LinkedQueue<Pickable*>* waitingup_cargos = F[i].getWaitingUp_cargo();
		LinkedQueue<Pickable*>* waitingdown_cargos = F[i].getWaitingDown_cargo();
	
		cout << waitingup_patients->getCount() + waitingdown_patients->getCount() << " Waiting patients: UP[";
		waitingup_patients->print();
		cout << "] DOWN[";
		waitingdown_patients->print();
		cout << "]\n";

		cout << waitingup_cargos->getCount() + waitingdown_cargos->getCount() << " Waiting cargos: UP[";
		waitingup_cargos->print();
		cout << "] DOWN[";
		waitingdown_cargos->print();
		cout << "]\n";

		cout << waitingup_visitor->getCount() + waitingdown_visitor->getCount() << " Waiting visitors: UP[";
		waitingup_visitor->print();
		cout << "] DOWN[";
		waitingdown_visitor->print();
		cout << "]\n";
		//
		cout << "Elevators: ";
		bool Elevator_Found = false;
		string Direction;
		string State;

		if (pHospital->getPelevator()->getCurrentFloor() == i)
		{
			switch (pHospital->getPelevator()->getDirection())
			{
			case UP:
				Direction = "UP";
				break;
			case DOWN:
				Direction = "DOWN";
				break;
			}
			switch (pHospital->getPelevator()->getState())
			{
			case IDLE:
				State = "IDLE";
				break;
			case MOV:
				State = "MOV";
				break;
			case UNLOAD:
				State = "UNLOAD";
				break;
			case AVAIL:
				State = "AVAIL";
				break;
			case Out:
				State = "OUT";
				break;
			}
			cout << "P[" << Direction << ", " << State << ", " << pHospital->getPelevator()->getcapacity() << ", " << pHospital->getPelevator()->get_elevator_list()->getCount()<< "] ";
			Elevator_Found = true;
		}
		if (pHospital->getVelevator()->getCurrentFloor() == i)
		{
			switch (pHospital->getVelevator()->getDirection())
			{
			case UP:
				Direction = "UP";
				break;
			case DOWN:
				Direction = "DOWN";
				break;
			}
			switch (pHospital->getVelevator()->getState())
			{
			case IDLE:
				State = "IDLE";
				break;
			case MOV:
				State = "MOV";
				break;
			case UNLOAD:
				State = "UNLOAD";
				break;
			case AVAIL:
				State = "AVAIL";
				break;
			case Out:
				State = "OUT";
				break;
			}
			cout << "V[" << Direction << ", " << State << ", " << pHospital->getVelevator()->getcapacity() << ", " << pHospital->getVelevator()->get_elevator_list()->getCount() << "] ";
			Elevator_Found = true;
		}
		if (pHospital->getCelevator()->getCurrentFloor() == i)
		{
			switch (pHospital->getCelevator()->getDirection())
			{
			case UP:
				Direction = "UP";
				break;
			case DOWN:
				Direction = "DOWN";
				break;
			}
			switch (pHospital->getCelevator()->getState())
			{
			case IDLE:
				State = "IDLE";
				break;
			case MOV:
				State = "MOV";
				break;
			case UNLOAD:
				State = "UNLOAD";
				break;
			case AVAIL:
				State = "AVAIL";
				break;
			case Out:
				State = "OUT";
				break;
			}
			cout << "C[" << Direction << ", " << State << ", " << pHospital->getCelevator()->getcapacity() << ", " << pHospital->getCelevator()->get_elevator_list()->getCount() << "] ";
			Elevator_Found = true;
		}
		if (!Elevator_Found)
		{
			cout << "None";
		}
		cout << endl;
		//
		Totalwaiting =Totalwaiting+ waitingup_visitor->getCount() + waitingdown_visitor->getCount() + waitingup_patients->getCount() + waitingdown_patients->getCount() + waitingup_cargos->getCount() + waitingdown_cargos->getCount();
		pHospital->setTotalWaitTime(pHospital->getTotalWaitingTime() + Totalwaiting);
		TotalInService = pHospital->getCelevator()->getCurrentLoad() + pHospital->getVelevator()->getCurrentLoad() + pHospital->getPelevator()->getCurrentLoad();
		TotalCompleted = Completed->getCount();
		if (i == 0)
		{
			cout << "------------------------ GROUND ------------------------\n";
			cout << Totalwaiting << " total waiting pass/cargo (" << l.getleavecount() << " visitors left)\n";
			cout << TotalInService << " total in-service pass/cargo (" << pHospital->getStairList()->getCount() << " visitors by stairs)\n";
			cout << TotalCompleted << " total completed pass/cargos \n";
		}
		else
		{
			cout << "------------------------ Floor " << i << " -----------------------\n";

		}
	}
	return Totalwaiting;
}

int UI::getModeOfOperation()
{
	printMessage("Choose the mode of operation :");
	printMessage("[1] Interactive Mode");
	printMessage("[2] Step by Step");
	printMessage("[3] Silent Mode");
	string chosenOper;
	getline(cin, chosenOper);
	while (chosenOper != "1" && chosenOper != "2" && chosenOper != "3")
	{
		printMessage("Error! Enter a valid number.... Choose the mode of operation :");
		printMessage("[1] Interactive Mode");
		printMessage("[2] Step by Step");
		printMessage("[3] Silent Mode");
		cin >> chosenOper;
	}
	int num = stoi(chosenOper);
	return num;

}

void UI::printMessage(string msg)
{
	cout << msg << endl;

}

ostream& operator << (ostream& out, Pickable* pickableInput) //operator overloading for cout  visitor ID
{
	out << pickableInput->getID();
	return out;
}