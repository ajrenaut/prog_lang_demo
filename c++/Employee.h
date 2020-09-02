#ifndef _EMPLOYEE_H_
#define _EMPLOYEE_H_

#include <string.h>
#include <iostream>
#include <sstream>
#include <iomanip>

using namespace std;

class Employee
{
private:
        string firstName;
        string lastName;
public:
        Employee(string first, string last);
        string getFirstName();
        string getLastName();
        void setFirstName(string name);
        void setLastName(string name);
        virtual string getInfo();
        virtual double getEarning();
        virtual ~Employee();
};

class SalariedEmployee;
class HourlyEmployee;
class CommissionEmployee;


#endif
