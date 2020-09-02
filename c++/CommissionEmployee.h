#ifndef _COMMISSIONEMPLOYEE_H_
#define _COMMISSIONEMPLOYEE_H_

#include <string.h>
#include <iostream>
#include <sstream>
#include <iomanip>
#include "Employee.h"

class CommissionEmployee : public virtual Employee {
private:
        double minimumSalary;
        double sales;
        double commissionRate;
public:
        CommissionEmployee(string first, string last, double min, double salesAmt, double comRate);
        double getMinSalary();
        double getSales();
        double getRate();
        string getInfo();
        double getEarning();
};

#endif
