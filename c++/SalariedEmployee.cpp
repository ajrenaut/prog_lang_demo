#include "SalariedEmployee.h"

SalariedEmployee::SalariedEmployee(string first, string last, double salary)
        : Employee(first, last)
{
        this->salary = salary;
}

double SalariedEmployee::getSalary() {
        return this->salary;
}

string SalariedEmployee::getInfo() {
        ostringstream ostream;
        ostream << "Salaried employee: " << this->getFirstName() << " ";
        ostream <<  this->getLastName() << endl;
        ostream << "weekly salary: " << fixed << setprecision(2) << this->getSalary();
        return ostream.str();
}

double SalariedEmployee::getEarning() {
        return this->salary;
}
