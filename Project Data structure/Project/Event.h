#pragma once
#include<iostream>
#include <fstream>
#include "Hospital.h"
using namespace std;

class Hospital;

class Event
{
protected:
	char eType;
	int Timestep;
	int pickID;
	Hospital* pHospital;
public:
	Event(Hospital* phosp);
	void setTimestep(int t);
	void setType(char type);
	void setpickID(int id);
	int getTimestep();
	char getType();
	int getpickID();
	void virtual ReadEvent(ifstream& inputFile) =0;
	virtual void Execute() = 0;
};

