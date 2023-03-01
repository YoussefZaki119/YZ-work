
#include "Hospital.h"
#include "Arrival_Event.h"
#include "Leave_Event.h"
#include "Stairs_Event.h"
#include "UI.h"


int Hospital::getcurTS()
{
	return CurrentTimeStep;
}

Hospital::Hospital()
{
	CurrentTimeStep = 1;
	TotalWaitTime = 0;
	Pelevator = new Elevator;
	Velevator = new Elevator;
	Celevator = new Elevator;
	stairslist = new LinkedList<Pickable*>;
	completedPickableList = new LinkedQueue<Pickable*>;
	Events = new LinkedQueue<Event*>;
	userInterface = new UI(this);  //for printing info on screen and getting user input

}

Hospital::~Hospital()
{
	delete Pelevator;
	delete Velevator;
	delete Celevator;
	delete stairslist;
	delete completedPickableList;
	delete Events;
	delete userInterface;
	delete []floors;
}

void Hospital::readfloorInfo()
{
	int nFloors = -1;
	inputFile >> nFloors;
 	if (nFloors >= 0)
	{
		floors = new Floor[nFloors];
		num_floors = nFloors;
	}
}

void Hospital::readElevatorInfo()
{
	int vspeed, cspeed, pspeed;
	int vcapacity, ccapacity, pcapacity;
	inputFile >> vspeed >> cspeed >> pspeed;
	inputFile >> vcapacity >> ccapacity >> pcapacity;
	Velevator->setspeed(vspeed);
	Celevator->setspeed(cspeed);
	Pelevator->setspeed(pspeed);
	Velevator->setcapacity(vcapacity);
	Celevator->setcapacity(ccapacity);
	Pelevator->setcapacity(pcapacity);

}

void Hospital::readPickableInfo()
{
	int stairTS, autos;
	inputFile >> stairTS >> autos;
	Pickable::setAutoS(autos);
	Pickable::setstairTS(stairTS);
}

void Hospital::readEvent()
{
	int num_events;
	char EventType;
	Event* evnPtr;
	inputFile >> num_events;
	setNumEvents(num_events);

	for (int i = 0;i < num_events;i++)
	{
		inputFile >> EventType;
		switch (EventType)
		{
		case 'A':
			evnPtr = new Arrival_Event(this);
			evnPtr->ReadEvent(inputFile);	
			break;
		case 'L':
			evnPtr = new Leave_Event(this);
			evnPtr->ReadEvent(inputFile);	
			break;
		case 'S':
			evnPtr = new Stairs_Event(this);
			evnPtr->ReadEvent(inputFile);
			break;

		}
		Events->enqueue(evnPtr);

	}
}

void Hospital::readInputFile()
{
	userInterface->printMessage("Enter your file name");
	FileName = userInterface->getUserInput();	//recieving file name from user
	inputFile.open(FileName + ".txt");
	readfloorInfo();
	readElevatorInfo();
	readPickableInfo();
	readEvent();
}

void Hospital::Simulate()
{
	modeOfOperation = userInterface->getModeOfOperation(); //getting mode of operation (interactive-step by step-silent)
	readInputFile();

	while (!inputFile.is_open()) //check if file name exists
	{
		userInterface->printMessage("Error! File not found, please enter valid file name"); //if not, repeat process untill valid file entered
		readInputFile();
	}

	Event* eventPtr;
	while (!Events->isEmpty()) //checking if there is still an event to be executed
	{
		if (Events->peek(eventPtr))
		{
			while (eventPtr->getTimestep() == CurrentTimeStep) //checking if time of event in front of queue arrived
			{
				Events->dequeue(eventPtr); //if yes, dequeue event and execute
				eventPtr->Execute();
				delete eventPtr; //deleting executed event
				eventPtr = nullptr;
				if (!Events->peek(eventPtr))
					break;
			}
			Elevators_Settings();
			UnloadingElevators(Pelevator);
			UnloadingElevators(Velevator);
			UnloadingElevators(Celevator);
			loadingElevtors();
			stairssettings();
			if (modeOfOperation == 1) //checking chosen mode of operation to print appropriately
			{

				userInterface->printInfo(); //printing updated info if there is any actions occured during timestep
				userInterface->printMessage("Press 'Enter' to continue:");
				userInterface->getUserInput();


			}
			else if (modeOfOperation == 2)
			{
				userInterface->printInfo();
				userInterface->printMessage("");
				Sleep(1000);
			}
			CurrentTimeStep++;
		}
		

	}
	Pickable* P = nullptr;

	int x = P->getTotalPickCount();
	int y = completedPickableList->getCount();

	while (x != y)
	{
		Elevators_Settings();
		UnloadingElevators(Pelevator);
		UnloadingElevators(Velevator);
		UnloadingElevators(Celevator);
		loadingElevtors();
		stairssettings();
		if (modeOfOperation == 1) //checking chosen mode of operation to print appropriately
		{

			userInterface->printInfo(); //printing updated info if there is any actions occured during timestep
			userInterface->printMessage("Press 'Enter' to continue:");
			userInterface->getUserInput();
		}
		else if (modeOfOperation == 2)
		{
			userInterface->printInfo();
			userInterface->printMessage("");
			Sleep(1000);
		}
		CurrentTimeStep++;
		x = P->getTotalPickCount();
		y = completedPickableList->getCount();

		loadingElevtors();

	}
	outputFileGeneration();
	if (modeOfOperation == 3)
	{
		userInterface->printMessage("Silent Mode");
		userInterface->printMessage("Simulation Starts...");
		userInterface->printMessage("Simulation ends, Output file created");
	}
	userInterface->printMessage("The output file has been created successfully ");
}





void Hospital::setNumEvents(int nEvents)
{
	num_events = nEvents;
}

void Hospital::setNumFloors(int NumF)
{
	num_floors = NumF;
}

int Hospital::getNumFloors()
{
	return num_floors;
}

Floor* Hospital::getFloor()
{
	return floors;
}

Elevator* Hospital::getPelevator()
{
	return Pelevator;
}

Elevator* Hospital::getVelevator()
{
	return Velevator;
}

Elevator* Hospital::getCelevator()
{
	return Celevator;
}

void Hospital::setTotalWaitTime(int twt)
{
	TotalWaitTime = twt;
}

void Hospital::outputFileGeneration()
{
	Pickable* temp=NULL;
	int pCount = 0, vCount = 0, cCount = 0;
	int sumWaitTime = 0, sumServiceTime = 0;
	outputFile.open(FileName + "Output.txt");
	outputFile << "TT" << "\t" << "ID" << "\t" << "AT" << "\t" << "WT" << "\t" << "ST" << endl;
	while (!completedPickableList->isEmpty())
	{
		completedPickableList->dequeue(temp);
		if (temp->getPickabletype() == Patient)
			pCount++;
		if (temp->getPickabletype() == Visitor)
			vCount++;
		if (temp->getPickabletype() == Cargo)
			cCount++;
		sumWaitTime += temp->getWaitTime();
		sumServiceTime += temp->getServiceTime();
		outputFile << temp->getTotalTime() << "\t" << temp->getID() << "\t" << temp->getArrivalTime() << "\t" << temp->getWaitTime() << "\t" << temp->getServiceTime()<<endl;

	}
	int totalcount = vCount + pCount + cCount;
	float avgWait = (float)sumWaitTime / totalcount;
	float avgServ = (float)sumServiceTime / totalcount;
	float autoS_Prec = ((float)temp->getCountAutoS() / vCount) * 100;
	outputFile << "......................................\n......................................\n";
	outputFile << "passengers: " << (vCount + pCount) << "  [V: " << vCount << ", P: " << pCount << "]\n";
	outputFile << "cargos: " << cCount<<endl;
	outputFile << "Avg Wait = " << avgWait<<endl;
	outputFile << "Avg Serv = " << avgServ << endl;
	outputFile << "AutoS: " << autoS_Prec << "%" << endl;
}

int Hospital::getTotalWaitingTime()
{
	return TotalWaitTime;
}

LinkedList<Pickable*>* Hospital::getStairList()
{
	return stairslist;
}

LinkedQueue<Pickable*>* Hospital::getCompletedPickableList()
{
	return completedPickableList ;
}

void Hospital::loadingElevtors()
{
	Pickable* inServicePickable = nullptr;
	Pickable* tempPickable = nullptr;


	for (int i = 0; i < num_floors; i++)
	{

		/*////////////////////////for waiting up patients///////////////////////*/

		if (Pelevator->getState() == AVAIL && Pelevator->getCurrentFloor() == i && Pelevator->getDirection() == UP)
		{
			while (Pelevator->getCurrentLoad() < Pelevator->getcapacity() && floors[i].getWaitingUp_Patients()->dequeue(inServicePickable))
			{
				inServicePickable->setElevPriority(-(inServicePickable->getTargetFloor()));
				Pelevator->get_elevator_list()->enqueue(inServicePickable,inServicePickable->getElevPriority());
				Pelevator->setState(UNLOAD);    // LOADING
				Pelevator->setUnloadTimeStep(CurrentTimeStep);

				inServicePickable->setPickTime(CurrentTimeStep);
				Pelevator->setCurrentLoad(1 + Pelevator->getCurrentLoad());
			}
		}
		else if (Velevator->getState() == AVAIL && Velevator->getCurrentFloor() == i && Velevator->getDirection() == UP)
		{
			while (Velevator->getCurrentLoad() < Velevator->getcapacity() && floors[i].getWaitingUp_Patients()->dequeue(inServicePickable))
			{
				inServicePickable->setElevPriority(-(inServicePickable->getTargetFloor()));
				Velevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
				Velevator->setState(UNLOAD);	// LOADING
				Velevator->setUnloadTimeStep(CurrentTimeStep);

				inServicePickable->setPickTime(CurrentTimeStep);
				Velevator->setCurrentLoad(1 + Velevator->getCurrentLoad());
			}

		}
		else if (Celevator->getState() == AVAIL && Celevator->getCurrentFloor() == i && Celevator->getDirection() == UP)
		{
			Celevator->get_elevator_list()->peek(tempPickable);

			if ( tempPickable== nullptr || (tempPickable->getPickabletype() == Patient && Celevator->getCurrentLoad() < Celevator->getcapacity()))
			{
				while (Celevator->getCurrentLoad() < Celevator->getcapacity() && floors[i].getWaitingUp_Patients()->dequeue(inServicePickable))
				{
					inServicePickable->setElevPriority(-(inServicePickable->getTargetFloor()));
					Celevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
					Celevator->setState(UNLOAD);	// LOADING
					Celevator->setUnloadTimeStep(CurrentTimeStep);

					inServicePickable->setPickTime(CurrentTimeStep);
					Celevator->setCurrentLoad(1 + Celevator->getCurrentLoad());
				}
			}
		}

		/*//////////////////////// for waiting down patients///////////////////////*/

		if (Pelevator->getState() == AVAIL && Pelevator->getCurrentFloor() == i && Pelevator->getDirection() == DOWN)
		{
			while (Pelevator->getCurrentLoad() < Pelevator->getcapacity() && floors[i].getWaitingDown_Patients()->dequeue(inServicePickable))
			{
				inServicePickable->setElevPriority(inServicePickable->getTargetFloor());
				Pelevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
				Pelevator->setState(UNLOAD);	// LOADING
				Pelevator->setUnloadTimeStep(CurrentTimeStep);

				inServicePickable->setPickTime(CurrentTimeStep);
				Pelevator->setCurrentLoad(1 + Pelevator->getCurrentLoad());
			}
		}
		else if ( Velevator->getState() == AVAIL && Velevator->getCurrentFloor() == i && Velevator->getDirection() == DOWN)
		{
			while (Velevator->getCurrentLoad() < Velevator->getcapacity() && floors[i].getWaitingDown_Patients()->dequeue(inServicePickable))
			{
				inServicePickable->setElevPriority(inServicePickable->getTargetFloor());
				Velevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
				Velevator->setState(UNLOAD);	// LOADING
				Velevator->setUnloadTimeStep(CurrentTimeStep);

				inServicePickable->setPickTime(CurrentTimeStep);
				Velevator->setCurrentLoad(1 + Velevator->getCurrentLoad());
			}
		}
		else if (Celevator->getState() == AVAIL && Celevator->getCurrentFloor() == i && Celevator->getDirection() == DOWN)
		{
			Celevator->get_elevator_list()->peek(tempPickable);

			if ( tempPickable==nullptr || (tempPickable->getPickabletype() == Patient && Celevator->getCurrentLoad() < Celevator->getcapacity()))
			{
				while (Celevator->getCurrentLoad() < Celevator->getcapacity() && floors[i].getWaitingDown_Patients()->dequeue(inServicePickable))
				{
					inServicePickable->setElevPriority(inServicePickable->getTargetFloor());
					Celevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
					Celevator->setState(UNLOAD);	// LOADING
					Celevator->setUnloadTimeStep(CurrentTimeStep);

					inServicePickable->setPickTime(CurrentTimeStep);
					Celevator->setCurrentLoad(1 + Celevator->getCurrentLoad());
				}
			}
		}

		/*//////////////////////// for waiting up visitors///////////////////////*/

		if (Velevator->getState() == AVAIL && Velevator->getCurrentFloor() == i && Velevator->getDirection() == UP)
		{
			while (Velevator->getCurrentLoad() < Velevator->getcapacity() && floors[i].getWaitingUp_visitor()->RemoveFirst(inServicePickable))
			{
				inServicePickable->setElevPriority(-(inServicePickable->getTargetFloor()));
				Velevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
				Velevator->setState(UNLOAD);	// LOADING
				Velevator->setUnloadTimeStep(CurrentTimeStep);

				inServicePickable->setPickTime(CurrentTimeStep);
				Velevator->setCurrentLoad(1 + Velevator->getCurrentLoad());
			}
		}
		else if (Pelevator->getState() == AVAIL && Pelevator->getCurrentFloor() == i && Pelevator->getDirection() == UP)
		{
			while (Pelevator->getCurrentLoad() < Pelevator->getcapacity() && floors[i].getWaitingUp_visitor()->RemoveFirst(inServicePickable))
			{
				inServicePickable->setElevPriority(-(inServicePickable->getTargetFloor() - inServicePickable->getSourceFloor()));
				Pelevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
				Pelevator->setState(UNLOAD);	// LOADING
				Pelevator->setUnloadTimeStep(CurrentTimeStep);

				Pelevator->setUnloadTimeStep(CurrentTimeStep);
				inServicePickable->setPickTime(CurrentTimeStep);
				Pelevator->setCurrentLoad(1 + Pelevator->getCurrentLoad());
			}

		}

		/*//////////////////////// for waiting down visitors///////////////////////*/
		if (Velevator->getState() == AVAIL && Velevator->getCurrentFloor() == i && Velevator->getDirection() == DOWN)
		{
			while (Velevator->getCurrentLoad() < Velevator->getcapacity() && floors[i].getWaitingDown_visitor()->RemoveFirst(inServicePickable))
			{
				inServicePickable->setElevPriority(inServicePickable->getTargetFloor());
				Velevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
				Velevator->setState(UNLOAD);	// LOADING
				Velevator->setUnloadTimeStep(CurrentTimeStep);

				inServicePickable->setPickTime(CurrentTimeStep);
				Velevator->setCurrentLoad(1 + Velevator->getCurrentLoad());
			}
		}
		else if (Pelevator->getState() == AVAIL && Pelevator->getCurrentFloor() == i && Pelevator->getDirection() == DOWN)
		{
			while (Pelevator->getCurrentLoad() < Pelevator->getcapacity() && floors[i].getWaitingDown_visitor()->RemoveFirst(inServicePickable))
			{
				inServicePickable->setElevPriority(inServicePickable->getTargetFloor() - inServicePickable->getSourceFloor());
				Pelevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
				Pelevator->setState(UNLOAD);	// LOADING
				Pelevator->setUnloadTimeStep(CurrentTimeStep);

				inServicePickable->setPickTime(CurrentTimeStep);
				Pelevator->setCurrentLoad(1 + Pelevator->getCurrentLoad());
			}
		}


		/*//////////////////////// for waiting up cargos///////////////////////*/

		if (Celevator->getState() == AVAIL && Celevator->getCurrentFloor() == i && Celevator->getDirection() == UP)
		{
			if(Celevator->get_elevator_list())
				Celevator->get_elevator_list()->peek(tempPickable);
			
			if (tempPickable ==nullptr ||(tempPickable->getPickabletype() == Cargo && Celevator->getCurrentLoad() < Celevator->getcapacity()))
			{
				while (Celevator->getCurrentLoad() < Celevator->getcapacity() && floors[i].getWaitingUp_cargo()->dequeue(inServicePickable))
				{
					inServicePickable->setElevPriority(-(inServicePickable->getTargetFloor()));
					Celevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
					Celevator->setState(UNLOAD);	// LOADING
					Celevator->setUnloadTimeStep(CurrentTimeStep);

					inServicePickable->setPickTime(CurrentTimeStep);
					Celevator->setCurrentLoad(1 + Celevator->getCurrentLoad());
				}
			}
		}


		/*//////////////////////// for waiting down cargos///////////////////////*/
		bool PeekCargo = false;
		if (Celevator->getState() == AVAIL && Celevator->getCurrentFloor() == i && Celevator->getDirection() == DOWN)
		{
			PeekCargo=Celevator->get_elevator_list()->peek(tempPickable);
			if (!PeekCargo || (PeekCargo && tempPickable->getPickabletype() == Cargo && Celevator->getCurrentLoad() < Celevator->getcapacity()))
			{
				while (Celevator->getCurrentLoad() < Celevator->getcapacity() && floors[i].getWaitingDown_cargo()->dequeue(inServicePickable))
				{
					inServicePickable->setElevPriority(inServicePickable->getTargetFloor());
					Celevator->get_elevator_list()->enqueue(inServicePickable, inServicePickable->getElevPriority());
					Celevator->setState(UNLOAD);	// LOADING
					Celevator->setUnloadTimeStep(CurrentTimeStep);

					inServicePickable->setPickTime(CurrentTimeStep);
					Celevator->setCurrentLoad(1 + Celevator->getCurrentLoad());
				}
			}
		}
	}
}

void Hospital::UnloadingElevators(Elevator* Elevator_Type)
{
	//General function for all elevators
	Pickable* InservicePickable;
	if (Elevator_Type->getState() == MOV || Elevator_Type->getState() == AVAIL) // If elevator is moving
	{
		//Elevator_Type->setCurrentFloor(Elevator_Type->getCurrentFloor() + 1);


		if (Elevator_Type->get_elevator_list()->peek(InservicePickable))
		{
			if (InservicePickable->getTargetFloor() == Elevator_Type->getCurrentFloor())
			{
				Elevator_Type->setState(UNLOAD); //set elevator (UNLOAD) if any patients or visitors are unloaded
				Elevator_Type->setUnloadTimeStep(CurrentTimeStep);
				while (Elevator_Type->get_elevator_list()->peek(InservicePickable) && InservicePickable->getTargetFloor() == Elevator_Type->getCurrentFloor())
				{
					Elevator_Type->get_elevator_list()->dequeue(InservicePickable);
					Elevator_Type->setCurrentLoad(Elevator_Type->getCurrentLoad() - 1);

					completedPickableList->enqueue(InservicePickable);
					InservicePickable->setTargetTime(CurrentTimeStep);
					InservicePickable->setServiceTime(CurrentTimeStep - InservicePickable->getPickTime());
				}
			}
		}
		
	}

}

void Hospital::stairssettings()
{
	Pickable* stairspick=NULL;
	int stairscount = stairslist->getCount();
	for (int i = 0;i < stairscount;i++)
	{
		stairslist->RemoveFirst(stairspick);
		if (stairspick->getStairsTargetTime() == CurrentTimeStep)
		{
			completedPickableList->enqueue(stairspick);
		}
		else
		{
			stairslist->InsertEnd(stairspick);
		}
	}

	int Vupcount;
	int Vdowncount;
	LinkedList<Pickable*>* Vup;
	LinkedList<Pickable*>* Vdown;

	for (int i = 0;i < num_floors ;i++)
	{
		Vupcount = floors[i].getWaitingUp_visitor()->getCount();
		Vdowncount= floors[i].getWaitingDown_visitor()->getCount();
		Vup = floors[i].getWaitingUp_visitor();
		Vdown = floors[i].getWaitingDown_visitor();
		int stairEquation;
		stairspick = NULL;
		for (int j = 0;j < Vupcount;j++)
		{
			Vup->RemoveFirst(stairspick);
			if (stairspick)
			{
				if (stairspick && ((CurrentTimeStep - stairspick->getArrivalTime()) >= stairspick->getAutoS()))
				{
					stairEquation = CurrentTimeStep + abs(stairspick->getTargetFloor() - stairspick->getSourceFloor()) * stairspick->getStairsTS();
					stairspick->setStairsTargetTime(stairEquation);
					stairspick->setPickTime(CurrentTimeStep);
					stairslist->InsertEnd(stairspick);
					stairspick->setCountAutoS(stairspick->getCountAutoS() + 1);
				}
				else
				{
					Vup->InsertEnd(stairspick);
				}

			}

		}
		stairspick = NULL;
		for (int j = 0;j < Vdowncount;j++)
		{
			Vdown->RemoveFirst(stairspick);
			if (stairspick)
			{
				if ((CurrentTimeStep - stairspick->getArrivalTime()) >= stairspick->getAutoS())
				{
					stairEquation = CurrentTimeStep + abs(stairspick->getTargetFloor() - stairspick->getSourceFloor()) * stairspick->getStairsTS();
					stairspick->setStairsTargetTime(stairEquation);
					stairspick->setPickTime(CurrentTimeStep);
					stairslist->InsertEnd(stairspick);
					stairspick->setCountAutoS(stairspick->getCountAutoS() + 1);

				}
				else
				{
					Vdown->InsertEnd(stairspick);
				}

			}
			
		}


	}

}

void Hospital::PelevatorSetting() ////in progress( paitient only (very hard))
{
	bool PeekUp = false;
	bool PeekDown = false;
	Pickable* InServicePickable = NULL;
	if (Pelevator->getState() == AVAIL  || Pelevator->getState() == MOV)
	{
		// Check if elevator reaches the last floor ->>> change direction to DOWN
		if (Pelevator->getCurrentFloor() == num_floors - 1 && Pelevator->getDirection() == UP)
		{
			if (Pelevator->get_elevator_list()->isEmpty())
			{
				Pelevator->setState(IDLE);
				Pelevator->setDirection(DOWN);
			}
		}

		if (Pelevator->getCurrentFloor() == 0 && Pelevator->getDirection() == DOWN)
		{
			if (Pelevator->get_elevator_list()->isEmpty())
			{
				Pelevator->setState(IDLE);
				Pelevator->setDirection(UP);
			}
		}
	}

	if (Pelevator->getState() == AVAIL)
	{
		if (Pelevator->getDirection() == UP)
		{
			for (int i = Pelevator->getCurrentFloor();i < num_floors;i++)
			{
				PeekUp = floors[i].getWaitingUp_Patients()->peek(InServicePickable);
				if (PeekUp)
				{
					break;
				}
			}
		}
		else // DOWN
		{
			for (int i = Pelevator->getCurrentFloor();i > 0;i--)
			{
				PeekDown = floors[i].getWaitingDown_Patients()->peek(InServicePickable);
				if (PeekDown)
				{
					break;
				}
			}
		}
		if (PeekUp || PeekDown)
		{
			Pelevator->setState(MOV);
			Pelevator->setMovingtime(CurrentTimeStep);
		}
		else //if no requests in the moving direction
		{
			if (Pelevator->getCurrentLoad() == 0) // if elevator is empty
			{
				if (Pelevator->getDirection() == UP)// if elevator direction is up
				{
					for (int i = Pelevator->getCurrentFloor();i > 0;i--)
					{
						PeekDown = floors[i].getWaitingDown_Patients()->peek(InServicePickable);
						if (PeekDown)// check if any down request, CHANGE THE DIRECTION and CHANGE STATE to MOV
						{
							Pelevator->setDirection(DOWN);
							break;
						}

						if (!PeekDown)//check if there is no down requests below the elevator
						{
							for (int i = Pelevator->getCurrentFloor();i < num_floors;i++)
							{
								PeekDown = floors[i].getWaitingDown_Patients()->peek(InServicePickable);
								if (PeekDown)// check if any down request above the elevator go execute it,CHANGE STATE to MOV
								{
									Pelevator->setState(MOV);
									Pelevator->setMovingtime(CurrentTimeStep);
									break;
								}
							}
						}
					}
				}
				else // if elevator direction is down
				{
					for (int i = Pelevator->getCurrentFloor();i < num_floors;i++)
					{
						PeekUp = floors[i].getWaitingUp_Patients()->peek(InServicePickable);
						if (PeekUp)// check if any down request, CHANGE THE DIRECTION and CHANGE STATE to MOV
						{
							Pelevator->setDirection(UP);
							break;
						}

						if (!PeekUp) // check if there is no up requests
						{
							for (int i = Pelevator->getCurrentFloor();i >= 0;i--)
							{
								PeekUp = floors[i].getWaitingUp_Patients()->peek(InServicePickable);
								if (PeekUp)// check if any up request below us,  CHANGE STATE to MOV
								{
									Pelevator->setState(MOV);
									Pelevator->setMovingtime(CurrentTimeStep);
									break;
								}
							}

						}
					}
				}
			}
		}
		// Checking if elevator is empty and 10 timesteps passed without any requests ->>>> Elevator is IDLE
		if (Pelevator->getCurrentLoad() == 0 && Pelevator->getAvailTs() + 10 == CurrentTimeStep)
		{
			Pelevator->setState(IDLE);
		}
	}
	if (Pelevator->getState() == IDLE )
	{
		Pickable* InServicePickableUp;
		Pickable* InServicePickableDown;
		for (int i = 0;i < num_floors;i++)
		{
			 PeekUp = floors[i].getWaitingUp_Patients()->peek(InServicePickableUp);
			 PeekDown = floors[i].getWaitingDown_Patients()->peek(InServicePickableDown);
			 if (PeekDown || PeekUp)
			 {
				 if (Pelevator->getIsIDLE() == false)
				 {
					 Pelevator->setAvailTs(CurrentTimeStep + 3); // available time after 3 timesteps
					 Pelevator->setIsIDLE(true);
				 }
			 }
		}
		if (Pelevator->getAvailTs() == CurrentTimeStep)
		{
			Pelevator->setState(AVAIL);
			Pelevator->setIsIDLE(false);
		}	
	}
	if (Pelevator->getState() == MOV)
	{
		if (Pelevator->getMovingtime() + Pelevator->getspeed() == CurrentTimeStep)
		{
			if (Pelevator->getDirection() == UP)
			{
				if (Pelevator->getCurrentFloor() != num_floors)
				{
					Pelevator->setCurrentFloor(Pelevator->getCurrentFloor() + 1);
				}
				// check if patient or visitor waiting in the current floor -> set the Pelevator to available
				if ((!floors[Pelevator->getCurrentFloor()].getWaitingUp_Patients()->isEmpty() || !floors[Pelevator->getCurrentFloor()].getWaitingUp_visitor()->isEmpty())&& Pelevator->getCurrentLoad() < Pelevator->getcapacity())
				{

					Pelevator->setState(AVAIL); //set elevator (AVAILABLE) if any patients or visitors are waiting
					Pelevator->setAvailTs(CurrentTimeStep);
				}
				else if (!floors[Pelevator->getCurrentFloor()].getWaitingDown_Patients()->isEmpty() && Pelevator->getCurrentLoad() == 0)//check if any down requests and elevator is empty
				{
					for (int i = Pelevator->getCurrentFloor();i < num_floors;i++)
					{
						PeekUp = floors[i].getWaitingUp_Patients()->peek(InServicePickable);
						if (PeekUp)// check if any up request above the elevator
						{
							break;
						}
					}

					if (!PeekUp)// check if there is no any up request above the elevator
					{
						Pelevator->setState(AVAIL);
						Pelevator->setDirection(DOWN);//change elevator direction to down and state to move
						Pelevator->setAvailTs(CurrentTimeStep);
					}
					else
					{
						Pelevator->setMovingtime(CurrentTimeStep);

					}
				}
				else
				{
					Pelevator->setMovingtime(CurrentTimeStep);
				}
			}
			else
			{
				Pelevator->setCurrentFloor(Pelevator->getCurrentFloor() - 1);
				if (!floors[Pelevator->getCurrentFloor()].getWaitingDown_Patients()->isEmpty() || !floors[Pelevator->getCurrentFloor()].getWaitingDown_visitor()->isEmpty())
				{
					Pelevator->setState(AVAIL);
					Pelevator->setAvailTs(CurrentTimeStep);
				}
				else if (!floors[Pelevator->getCurrentFloor()].getWaitingUp_Patients()->isEmpty() && Pelevator->getCurrentLoad() == 0)//check if any up requests and elevator is empty
				{
					for (int i = Pelevator->getCurrentFloor();i >= 0;i--)
					{
						PeekDown = floors[i].getWaitingDown_Patients()->peek(InServicePickable);
						if (PeekDown)// check if any down request
						{

							break;
						}
					}

					if (!PeekDown)// check if there is no down request
					{
						Pelevator->setState(AVAIL);
						Pelevator->setDirection(UP);//change elevator direction to down and state to move
						Pelevator->setAvailTs(CurrentTimeStep);
					}
					else
					{
						Pelevator->setMovingtime(CurrentTimeStep);

					}
				}
				else
				{
					Pelevator->setMovingtime(CurrentTimeStep);
				}
			}
		}
	}
	if (Pelevator->getState() == UNLOAD)
	{
		if (Pelevator->getUnloadTimeStep() + 1 == CurrentTimeStep)
		{
			if (!Pelevator->get_elevator_list()->isEmpty())
			{
				Pelevator->setState(MOV);
				Pelevator->setMovingtime(CurrentTimeStep);
			}
			else
			{
				Pelevator->setState(AVAIL);
				Pelevator->setAvailTs(CurrentTimeStep);
			}
		}
	}
}

void Hospital::VelevatorSetting()
{
	bool UpVisitorFlag = false;
	bool DownVisitorFlag = false;
	if (Velevator->getState() == AVAIL || Velevator->getState() == MOV)
	{
		// Check if elevator reaches the last floor ->>> change direction to DOWN
		if (Velevator->getCurrentFloor() == num_floors - 1 && Velevator->getDirection() == UP)
		{
			if (Velevator->get_elevator_list()->isEmpty())
			{
				Velevator->setState(IDLE);
				Velevator->setDirection(DOWN);
			}
		}
		if (Velevator->getCurrentFloor() == 0 && Velevator->getDirection() == DOWN)
		{
			if (Velevator->get_elevator_list()->isEmpty())
			{
				Velevator->setState(IDLE);
				Velevator->setDirection(UP);
			}
		}
	}

	if (Velevator->getState() == AVAIL)
	{

		if (Velevator->getDirection() == UP)
		{
			for (int i = Velevator->getCurrentFloor();i < num_floors;i++)
			{
				if (!floors[i].getWaitingUp_visitor()->isEmpty())
				{
					UpVisitorFlag = true;
					break;
				}

			}
		}
		else // DOWN
		{
			for (int i = Velevator->getCurrentFloor();i > 0;i--)
			{
				if (!floors[i].getWaitingDown_visitor()->isEmpty())
				{
					DownVisitorFlag = true;
					break;
				}
			}
		}
		if (UpVisitorFlag || DownVisitorFlag)
		{
			Velevator->setState(MOV);
			Velevator->setMovingtime(CurrentTimeStep);
		}
		else //if no requests in the moving direction
		{
			DownVisitorFlag = false;
			if (Velevator->getCurrentLoad() == 0) // if elevator is empty
			{
				if (Velevator->getDirection() == UP)// if elevator direction is up
				{
					for (int i = Velevator->getCurrentFloor();i > 0;i--)
					{
						if (!floors[i].getWaitingDown_visitor()->isEmpty()) //check if any down request, CHANGE THE DIRECTION and CHANGE STATE to MOV
						{
							Velevator->setDirection(DOWN);
							DownVisitorFlag = true;
							break;
						}

					}

					if (!DownVisitorFlag)//check if there is no down requests below the elevator
					{
						for (int i = Velevator->getCurrentFloor();i < num_floors;i++)
						{
							DownVisitorFlag = !floors[i].getWaitingDown_visitor()->isEmpty();
							if (DownVisitorFlag)// check if any down request above the elevator go execute it,CHANGE STATE to MOV
							{
								Velevator->setState(MOV);
								Velevator->setMovingtime(CurrentTimeStep);
								break;
							}
						}
					}


				}
				else // if elevator direction is down
				{
					UpVisitorFlag = false;
					for (int i = Velevator->getCurrentFloor();i < num_floors;i++)
					{
						if (!floors[i].getWaitingUp_visitor()->isEmpty()) //check if any Up request, CHANGE THE DIRECTION and CHANGE STATE to MOV
						{
							Velevator->setDirection(UP);
							UpVisitorFlag = true;
							break;
						}
					}

					if (!UpVisitorFlag) // check if there is no up requests
					{
						for (int i = Velevator->getCurrentFloor();i >= 0;i--)
						{
							UpVisitorFlag = !floors[i].getWaitingUp_visitor()->isEmpty();
							if (UpVisitorFlag)// check if any up request below us,  CHANGE STATE to MOV
							{
								Velevator->setState(MOV);
								Velevator->setMovingtime(CurrentTimeStep);
								break;
							}
						}

					}
				}
			}
		}
		
		// Checking if elevator is empty and 10 timesteps passed without any requests ->>>> Elevator is IDLE
		if (Velevator->getCurrentLoad() == 0 && Velevator->getAvailTs() + 10 == CurrentTimeStep)
		{
			Velevator->setState(IDLE);
		}

		if (Velevator->getState() == AVAIL && Velevator->getCurrentLoad() != 0)
		{
			Velevator->setState(MOV);
			Velevator->setMovingtime(CurrentTimeStep);
		}

	}
	if (Velevator->getState() == IDLE)
	{
		Pickable* InServicePickableUp;
		Pickable* InServicePickableDown;
		for (int i = 0;i < num_floors;i++)
		{
			if (!floors[i].getWaitingUp_visitor()->isEmpty() || !floors[i].getWaitingDown_visitor()->isEmpty())
			{
				if (Velevator->getIsIDLE() == false)
				{
					Velevator->setAvailTs(CurrentTimeStep + 3); // available time after 3 timesteps
					Velevator->setIsIDLE(true);
				}
			}

		}
		if (Velevator->getAvailTs() == CurrentTimeStep)
		{
			Velevator->setState(AVAIL);
			Velevator->setIsIDLE(false);
		}
	}
	
	if (Velevator->getState() == MOV)
	{
		if (Velevator->getMovingtime() + Velevator->getspeed() == CurrentTimeStep)
		{
			if (Velevator->getDirection() == UP)
			{
				if (Velevator->getCurrentFloor() == num_floors - 1)
				{
					Velevator->setState(AVAIL);
					Velevator->setAvailTs(CurrentTimeStep);
					Velevator->setDirection(DOWN);
				}
				else
				{
					UpVisitorFlag = false;
					Velevator->setCurrentFloor(Velevator->getCurrentFloor() + 1);
					// check if patient or visitor waiting in the current floor -> set the Velevator to available
					if (!floors[Velevator->getCurrentFloor()].getWaitingUp_Patients()->isEmpty() || !floors[Velevator->getCurrentFloor()].getWaitingUp_visitor()->isEmpty())
					{
						Velevator->setState(AVAIL); //set elevator (AVAILABLE) if any patients or visitors are waiting
						Velevator->setAvailTs(CurrentTimeStep);
					}
					else if (!floors[Velevator->getCurrentFloor()].getWaitingDown_visitor()->isEmpty() && Velevator->getCurrentLoad() == 0)//check if any down requests and elevator is empty
					{
						for (int i = Velevator->getCurrentFloor();i < num_floors;i++)
						{
							UpVisitorFlag = !floors[i].getWaitingUp_visitor()->isEmpty();
							if (UpVisitorFlag)// check if any up request above the elevator
							{
								break;
							}
						}

						if (!UpVisitorFlag)// check if there is no any up request above the elevator
						{
							Velevator->setState(AVAIL);
							Velevator->setDirection(DOWN);//change elevator direction to down and state to move
							Velevator->setAvailTs(CurrentTimeStep);
						}
						else
						{
							Velevator->setMovingtime(CurrentTimeStep);

						}
					}
					else
					{
						Velevator->setMovingtime(CurrentTimeStep);
					}
				}
				
			}
			else
			{
				if (Velevator->getCurrentFloor() == 0)
				{
					Velevator->setState(AVAIL);
					Velevator->setAvailTs(CurrentTimeStep);
					Velevator->setDirection(UP);
				}
				else
				{
					DownVisitorFlag = false;
					Velevator->setCurrentFloor(Velevator->getCurrentFloor() - 1);
					// check if patient or visitor waiting in the current floor -> set the Velevator to available
					if (!floors[Velevator->getCurrentFloor()].getWaitingDown_Patients()->isEmpty() || !floors[Velevator->getCurrentFloor()].getWaitingDown_visitor()->isEmpty())
					{
						Velevator->setState(AVAIL);
						Velevator->setAvailTs(CurrentTimeStep);
					}
					else if (!floors[Velevator->getCurrentFloor()].getWaitingUp_visitor()->isEmpty() && Velevator->getCurrentLoad() == 0)//check if any up requests and elevator is empty
					{
						for (int i = Velevator->getCurrentFloor();i >= 0;i--)
						{
							DownVisitorFlag = !floors[i].getWaitingDown_visitor()->isEmpty();
							if (DownVisitorFlag)// check if any down request
							{

								break;
							}
						}

						if (!DownVisitorFlag)// check if there is no down request
						{
							Velevator->setState(AVAIL);
							Velevator->setDirection(UP);//change elevator direction to down and state to move
							Velevator->setAvailTs(CurrentTimeStep);
						}
						else
						{
							Velevator->setMovingtime(CurrentTimeStep);

						}
					}
					else
					{
						Velevator->setMovingtime(CurrentTimeStep);
					}
				}
				
				
			}
		}
	}
	if (Velevator->getState() == UNLOAD)
	{
		if (Velevator->getUnloadTimeStep() + 1 == CurrentTimeStep)
		{
			if (!Velevator->get_elevator_list()->isEmpty())
			{
				Velevator->setState(MOV);
				Velevator->setMovingtime(CurrentTimeStep);
			}
			else
			{
				Velevator->setState(AVAIL);
				Velevator->setAvailTs(CurrentTimeStep);
			}
		}
	}
}

void Hospital::CelevatorSetting()
{
	bool PeekUp = false;
	bool PeekDown = false;
	Pickable* InServicePickable = NULL;
	if (Celevator->getState() == AVAIL)
	{
		// Check if elevator reaches the last floor ->>> change direction to DOWN
		if (Celevator->getCurrentFloor() == num_floors - 1 && Celevator->getDirection() == UP)
		{
			if (Celevator->get_elevator_list()->isEmpty())
			{
				Celevator->setState(IDLE);
				Celevator->setDirection(DOWN);
			}
		}
		//check if elevator reaches ground floor ->>> change direction to UP
		if (Celevator->getCurrentFloor() == 0 && Celevator->getDirection() == DOWN)
		{
			if (Celevator->get_elevator_list()->isEmpty())
			{
				Celevator->setState(IDLE);
				Celevator->setDirection(UP);
			}
		}
	}

	if (Celevator->getState() == AVAIL)
	{

		if (Celevator->getDirection() == UP)
		{
			for (int i = Celevator->getCurrentFloor();i < num_floors;i++)
			{
				PeekUp = floors[i].getWaitingUp_cargo()->peek(InServicePickable);
				if (PeekUp)
				{
					break;
				}
			}
		}
		else // DOWN
		{
			for (int i = Celevator->getCurrentFloor();i > 0;i--)
			{
				PeekDown = floors[i].getWaitingDown_cargo()->peek(InServicePickable);
				if (PeekDown)
				{
					break;
				}
			}
		}
		if (PeekUp || PeekDown)
		{
			Celevator->setState(MOV);
			Celevator->setMovingtime(CurrentTimeStep);
		}
		else //if no requests in the moving direction
		{
			if (Celevator->getCurrentLoad() == 0) // if elevator is empty
			{
				if (Celevator->getDirection() == UP)// if elevator direction is up
				{
					for (int i = Celevator->getCurrentFloor();i > 0;i--)
					{
						PeekDown = floors[i].getWaitingDown_cargo()->peek(InServicePickable);
						if (PeekDown)// check if any down request, CHANGE THE DIRECTION and CHANGE STATE to MOV
						{
							Celevator->setDirection(DOWN);
							break;
						}
					}

					if (!PeekDown)//check if there is no down requests below the elevator
					{
						for (int i = Celevator->getCurrentFloor();i < num_floors;i++)
						{
							PeekDown = floors[i].getWaitingDown_cargo()->peek(InServicePickable);
							if (PeekDown)// check if any down request above the elevator go execute it,CHANGE STATE to MOV
							{
								Celevator->setState(MOV);
								Celevator->setMovingtime(CurrentTimeStep);
								break;
							}
						}
					}

				}
				else // if elevator direction is down
				{
					for (int i = Celevator->getCurrentFloor();i < num_floors;i++)
					{
						PeekUp = floors[i].getWaitingUp_cargo()->peek(InServicePickable);
						if (PeekUp)// check if any down request, CHANGE THE DIRECTION and CHANGE STATE to MOV
						{
							Celevator->setDirection(UP);
							break;
						}
					}

					if (!PeekUp) // check if there is no up requests
					{
						for (int i = Celevator->getCurrentFloor();i >= 0;i--)
						{
							PeekUp = floors[i].getWaitingUp_cargo()->peek(InServicePickable);
							if (PeekUp)// check if any up request below us,  CHANGE STATE to MOV
							{
								Celevator->setState(MOV);
								Celevator->setMovingtime(CurrentTimeStep);
								break;
							}
						}

					}

					
				}
			}
		}
		// Checking if elevator is empty and 10 timesteps passed without any requests ->>>> Elevator is IDLE
		if (Celevator->getCurrentLoad() == 0 && Celevator->getAvailTs() + 10 == CurrentTimeStep)
		{
			Celevator->setState(IDLE);
		}

		if (Celevator->getState() == AVAIL && Celevator->getCurrentLoad() != 0)
		{
			Celevator->setState(MOV);
			Celevator->setMovingtime(CurrentTimeStep);
		}
	}
	if (Celevator->getState() == IDLE)
	{
		Pickable* InServicePickableUp;
		Pickable* InServicePickableDown;
		for (int i = 0;i < num_floors;i++)
		{
			PeekUp = floors[i].getWaitingUp_cargo()->peek(InServicePickableUp);
			PeekDown = floors[i].getWaitingDown_cargo()->peek(InServicePickableDown);
			if (PeekUp || PeekDown)
			{
				if (Celevator->getIsIDLE() == false)
				{
					Celevator->setAvailTs(CurrentTimeStep + 3); // available time after 3 timesteps
					Celevator->setIsIDLE(true);
				}
			}
		}
		if (Celevator->getAvailTs() == CurrentTimeStep)
		{
			Celevator->setState(AVAIL);
			Celevator->setIsIDLE(false);
		}
	}
	
	if (Celevator->getState() == MOV)
	{
		if (Celevator->getMovingtime() + Celevator->getspeed() == CurrentTimeStep)
		{
			if (Celevator->getDirection() == UP)
			{
				Celevator->setCurrentFloor(Celevator->getCurrentFloor() + 1);
				// check if patient or cargo waiting in the current floor -> set the Celevator to available
				if (!floors[Celevator->getCurrentFloor()].getWaitingUp_Patients()->isEmpty() || !floors[Celevator->getCurrentFloor()].getWaitingUp_cargo()->isEmpty())
				{
					Celevator->setState(AVAIL); //set elevator (AVAILABLE) if any patients or cargo are waiting
					Celevator->setAvailTs(CurrentTimeStep);
				}
				else if (!floors[Celevator->getCurrentFloor()].getWaitingDown_cargo()->isEmpty() && Celevator->getCurrentLoad() == 0)//check if any down requests and elevator is empty
				{
					for (int i = Celevator->getCurrentFloor();i < num_floors;i++)
					{
						PeekUp = floors[i].getWaitingUp_cargo()->peek(InServicePickable);
						if (PeekUp)// check if any up request above the elevator
						{
							break;
						}
					}

					if (!PeekUp)// check if there is no any up request above the elevator
					{
						Celevator->setState(AVAIL);
						Celevator->setDirection(DOWN);//change elevator direction to down and state to move
						Celevator->setAvailTs(CurrentTimeStep);
					}
					else
					{
						Celevator->setMovingtime(CurrentTimeStep);

					}
				}
				else
				{
					Celevator->setMovingtime(CurrentTimeStep);
				}
			}
			else
			{
				Celevator->setCurrentFloor(Celevator->getCurrentFloor() - 1);
				if (!floors[Celevator->getCurrentFloor()].getWaitingDown_Patients()->isEmpty() || !floors[Celevator->getCurrentFloor()].getWaitingDown_cargo()->isEmpty())
				{
					Celevator->setState(AVAIL);
					Celevator->setAvailTs(CurrentTimeStep);
				}
				else if (!floors[Celevator->getCurrentFloor()].getWaitingUp_cargo()->isEmpty() && Celevator->getCurrentLoad() == 0)//check if any up requests and elevator is empty
				{
					for (int i = Celevator->getCurrentFloor();i >= 0;i--)
					{
						PeekDown = floors[i].getWaitingDown_cargo()->peek(InServicePickable);
						if (PeekDown)// check if any down request
						{

							break;
						}
					}

					if (!PeekDown)// check if there is no down request
					{
						Celevator->setState(AVAIL);
						Celevator->setDirection(UP);//change elevator direction to down and state to move
						Celevator->setAvailTs(CurrentTimeStep);
					}
					else
					{
						Celevator->setMovingtime(CurrentTimeStep);

					}
				}
				else
				{
					Celevator->setMovingtime(CurrentTimeStep);
				}
			}
		}
	}
	if (Celevator->getState() == UNLOAD)
	{
		if (Celevator->getUnloadTimeStep() + 1 == CurrentTimeStep)
		{
			if (!Celevator->get_elevator_list()->isEmpty())
			{
				Celevator->setState(MOV);
				Celevator->setMovingtime(CurrentTimeStep);
			}
			else
			{
				Celevator->setState(AVAIL);
				Celevator->setAvailTs(CurrentTimeStep);
			}
		}
	}
}

void Hospital::Elevators_Settings()
{
	PelevatorSetting();
	VelevatorSetting();
	CelevatorSetting();
}

       