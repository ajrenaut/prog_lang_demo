#include "HourlyEmployee.h"

HourlyEmployee::HourlyEmployee(string first, string last, double rate, int numHours)
        : Employee(first, last)
{
        hourlyRate = rate;
        hours = numHours;
}

double HourlyEmployee::getRate() {
        return this->hourlyRate;
}

int HourlyEmployee::getHours() {
        return this->hours;
}

string HourlyEmployee::getInfo() {
        ostringstream ostream;
        ostream << "Hourly employee: " << this->getFirstName() << " " << this->getLastName() << endl;
        ostream << "hours worked: " << this->getHours() << ", houry rate: ";
        ostream << setprecision(2) << fixed << this->getRate();
        return ostream.str();
}

double HourlyEmployee::getEarning() {
        double pay = 0;
        int remainingHours, overtime;
        remainingHours = hours;
        if (remainingHours > 50) {
                overtime = remainingHours - 50;
                pay += 2 * hourlyRate * overtime;
                remainingHours = remainingHours - overtime;
        }
        if (remainingHours > 40) {
                overtime = remainingHours - 40;
                pay += 1.5 * hourlyRate * overtime;
                remainingHours = remainingHours - overtime;
        }
        pay += hourlyRate * remainingHours;
        return pay;
}
