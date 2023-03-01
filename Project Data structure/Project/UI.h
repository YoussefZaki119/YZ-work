#pragma once
#include <fstream>
#include "Hospital.h"
#include <iostream>
using namespace std;

class Hospital;
class Elevator;

class UI
{
	Hospital* pHospital;

public:

    UI(Hospital* phosp);
    
    string getUserInput();
    int printInfo();
    int getModeOfOperation();
    void printMessage(string msg);

};

