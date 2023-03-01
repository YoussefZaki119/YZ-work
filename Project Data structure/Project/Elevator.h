#pragma once
#include "LinkedPriorityQueue.h"
#include "Pickable.h"
//#include "Event.h"

enum E_state
{
	IDLE,
	MOV,
	UNLOAD,
	AVAIL,
	Out
};
enum E_Direction
{
	UP,
	DOWN
};

class Elevator
{
	int speed;
	int capacity;
	LinkedPriorityQueue<Pickable*>* elevator_list;
	E_state state;
	E_Direction direction;
	int CheckUpPeriod;
	int CurrentLoad;
	int CurrentFloor;
	int AvailTs;
	int Movingtime;
	int UnloadTimeStep;
	bool IsIDLE = false;
public:
	Elevator();
	~Elevator();
	void setspeed(int s);
	void setcapacity(int c);
	void setCheckUpPeriod(int cup);
	void setState(E_state s);
	void setDirection(E_Direction d);
	void setCurrentLoad(int cl);
	void setCurrentFloor(int cf);
	void setAvailTs(int ats);
	void setMovingtime(int mt);
	void setUnloadTimeStep(int Ts);
	void setIsIDLE(bool);

	int getCheckUpPeriod();
	int getspeed();
	int getcapacity();
	int getCurrentLoad();
	int getCurrentFloor();
	int getAvailTs();
	int getMovingtime();
	int getUnloadTimeStep();
	bool getIsIDLE();
	
	LinkedPriorityQueue<Pickable*>* get_elevator_list();
	E_state getState();
	E_Direction getDirection();
};

