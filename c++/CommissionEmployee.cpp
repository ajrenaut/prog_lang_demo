#include "CommissionEmployee.h"

CommissionEmployee::CommissionEmployee(string first, string last, double min,
        double salesAmt, double comRate) : Employee(first, last)
{
        this->minimumSalary = min;
        this->sales = salesAmt;
        this->commissionRate = comRate;
}

double CommissionEmployee::getMinSalary() {
        return this->minimumSalary;
}

double CommissionEmployee::getSales() {
        return this->sales;
}

double CommissionEmployee::getRate() {
        return this->commissionRate;
}


string CommissionEmployee::getInfo() {
        ostringstream ostream;
        ostream << "Commission employee: " << this->getFirstName() << " " << this->getLastName() << endl;
        ostream << "minimum salary: " << fixed << setprecision(2) << this->getMinSalary();
        ostream << ", sales amount: " << setprecision(2) << this->getSales();
        ostream << ", commission rate: " << setprecision(2) << this->getRate() << "%";
        return ostream.str();

}

double CommissionEmployee::getEarning() {
        double commission;
        commission = sales * commissionRate;
        if (commission > minimumSalary) return commission;
        else return minimumSalary;
}
