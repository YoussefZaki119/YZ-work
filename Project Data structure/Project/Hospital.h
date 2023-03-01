#pragma once
#include "UI.h"
#include "Floor.h"
#include "Event.h"
#include "Elevator.h"
#include "LinkedList.h"
#include "Pickable.h"
#include "Event.h"
#include "Floor.h"
#include <fstream>
#include <Windows.h>

class UI;
class Event;

class Hospital
{
private:
	int CurrentTimeStep;
	int num_events;
	int num_floors;
	Floor* floors;
	int EMR_floor;
	int modeOfOperation;
	int TotalWaitTime;
	ifstream inputFile;
	ofstream outputFile;
	string FileName;
	LinkedQueue<Event*>* Events;
	Elevator* Pelevator;
	Elevator* Velevator;
	Elevator* Celevator;
	UI* userInterface;
	LinkedList<Pickable*>* stairslist;
	LinkedQueue<Pickable*>* completedPickableList;

	

public:
	Hospital();
	~Hospital();
	void readfloorInfo();
	void readElevatorInfo();
	void readPickableInfo();
	void readEvent();
	void readInputFile();
	void Simulate();
	void setNumEvents(int);
	void setNumFloors(int);
	void setTotalWaitTime(int);
	void outputFileGeneration();
	int getTotalWaitingTime();
	int getNumFloors();
	int getcurTS();
	Floor* getFloor();
	Elevator* getPelevator();
	Elevator* getVelevator();
	Elevator* getCelevator();
	LinkedList<Pickable*>* getStairList();
	LinkedQueue<Pickable*>* getCompletedPickableList();
	void loadingElevtors();
	void PelevatorSetting();
	void VelevatorSetting();
	void CelevatorSetting();
	void Elevators_Settings();
	void UnloadingElevators(Elevator* Elevator_Type);
	void stairssettings();


};
