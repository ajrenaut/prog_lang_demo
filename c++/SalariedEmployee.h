#ifndef _SALARIEDEMPLOYEE_H_
#define _SALARIEDEMPLOYEE_H_

#include <string.h>
#include <iostream>
#include <sstream>
#include <iomanip>
#include "Employee.h"

class SalariedEmployee : public virtual Employee {
private:
        double salary;
public:
        SalariedEmployee(string first, string last, double salary);
        double getSalary();
        string getInfo();
        double getEarning();
};

#endif
