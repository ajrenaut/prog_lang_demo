#ifndef _HOURLYEMPLOYEE_H_
#define _HOURLYEMPLOYEE_H_

#include <string.h>
#include <iostream>
#include <sstream>
#include <iomanip>
#include "Employee.h"

class HourlyEmployee : public virtual Employee {
private:
        double hourlyRate;
        int hours;
public:
        HourlyEmployee(string, string, double, int);
        double getRate();
        int getHours();
        string getInfo();
        double getEarning();
};

#endif
