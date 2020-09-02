#include "reading.h"
#include "SalariedEmployee.h"
#include "CommissionEmployee.h"
#include "HourlyEmployee.h"
#include <iostream>
#include <fstream>

using namespace std;

vector<Employee*> *readFrom(string fileName) {
         ifstream inFile;
         inFile.open(fileName);
         string empType;

         vector<Employee*> *employeeVect = new vector<Employee*>;
         while (inFile >> empType) {
                 string fname, lname;
                 inFile >> fname >> lname;
                 if (empType == "salaried") {
                         double salary;
                         inFile >> salary;
                         employeeVect->push_back(new SalariedEmployee(fname, lname, salary));
                         //cout << "Read in a Salaried employee." << endl;
                         //Salaried
                 }
                 else if (empType == "hourly") {
                         double hourlyRate;
                         int hours;
                         inFile >> hours >> hourlyRate;
                         employeeVect->push_back(new HourlyEmployee(fname, lname, hourlyRate, hours));
                        // cout << "Read in an Hourly employee." << endl;
                         //hourly
                 }
                 else if (empType == "commission") {
                         double comRate, minimumSalary, sales;
                         inFile >> minimumSalary >> sales >> comRate;
                         employeeVect->push_back(new CommissionEmployee(fname, lname, minimumSalary, sales, comRate));
                         //cout << "Read in a Commission employee." << endl;
                         //commission
                 }
         }
         return employeeVect;
}
