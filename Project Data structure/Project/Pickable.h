#pragma once
#include <iostream>
using namespace std;
enum Type
{
	Patient,
	Visitor,
	Cargo
};

class Pickable
{
private:
	static int totalPickCount;
	static int stair_TS;
	static int autoS;
	static int CountautoS;
	int ID;
	int source_floor;
	int target_floor;
	int arrival_time;
	int target_time;
	int stairs_target_time;
	int pick_time;
	int waitTime;
	int serviceTime = 0;
	Type pickabletype;
	int patient_priority;
	float patient_final_priority;
	int elevator_priority;
public:
	
	
	Pickable();
	~Pickable();
	void static setstairTS(int);
	void static setAutoS(int);
	void static setCountAutoS(int);

	void setTargetTime(int);
	void setPickTime(int);
	void setID(int id);
	void setTotalPickCount(int);
	void setSourceFloor(int sf);
	void setTargetFloor(int tf);
	void setArrivalTime(int at);
	void setPickabletype(Type p);
	void setPatientPriority(int prior);
	void setWaitTime(int);
	void setServiceTime(int);
	void setElevPriority(int);
	void setStairsTargetTime(int);
	float CalculatePatientFinalPriority();

	int getPickTime();
	int getTargetTime();
	int getTotalPickCount();
	int getServiceTime();
	int getWaitTime();
	int getTotalTime();
	int getID();
	int getSourceFloor();
	int getTargetFloor();
	int getArrivalTime();
	Type getPickabletype();
	int getPatientPriority();
	int getElevPriority();
	int getStairsTS();
	int getStairsTargetTime();
	int getAutoS();
	int getCountAutoS();
	
	bool operator==(Pickable& inputVisitor);



};

