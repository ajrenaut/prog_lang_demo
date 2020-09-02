#include "Employee.h"

using namespace std;

Employee::Employee(string first, string last) {
        firstName = first;
        lastName = last;
}

Employee::~Employee(){}
string Employee::getInfo(){return "";}
double Employee::getEarning(){return -1;}

string Employee::getFirstName() {
        return this->firstName;
}

string Employee::getLastName() {
        return this->lastName;
}

void Employee::setFirstName(string name) {
        this->firstName = name;
}

void Employee::setLastName(string name) {
        this->lastName = name;
}
