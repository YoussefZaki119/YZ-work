#pragma once
#include "LinkedPriorityQueue.h"
#include "Pickable.h"
#include "LinkedList.h"
#include "LinkedQueue.h"
class Floor
{
private:
	static int count;
	int ID;
	LinkedPriorityQueue<Pickable*>* WaitingUp_patients;
	LinkedPriorityQueue<Pickable*>* Waitingdown_patients;
	LinkedList<Pickable*>* WaitingUp_visitor;
	LinkedList<Pickable*>* Waitingdown_visitor;
	LinkedQueue<Pickable*>* WaitingUp_cargo;
	LinkedQueue<Pickable*>* Waitingdown_cargo;

public:
	
	Floor();
	~Floor();

	void enqueue_pickable(Pickable* p);
	LinkedPriorityQueue<Pickable*>* getWaitingUp_Patients();
	LinkedPriorityQueue<Pickable*>* getWaitingDown_Patients();
	LinkedList<Pickable*>* getWaitingUp_visitor();
	LinkedList<Pickable*>* getWaitingDown_visitor();
	LinkedQueue<Pickable*>* getWaitingUp_cargo();
	LinkedQueue<Pickable*>* getWaitingDown_cargo();








	



};

