make: Employee.cpp reading.cpp payroll.cpp SalariedEmployee.cpp HourlyEmployee.cpp CommissionEmployee.cpp
	g++ -c Employee.cpp -std=c++11
	g++ -c SalariedEmployee.cpp -std=c++11
	g++ -c HourlyEmployee.cpp -std=c++11
	g++ -c CommissionEmployee.cpp -std=c++11
	g++ -c reading.cpp -std=c++11
	g++ -c payroll.cpp -std=c++11
	g++ -std=c++11 -o a.out payroll.o reading.o Employee.o SalariedEmployee.o HourlyEmployee.o CommissionEmployee.o
clean:
	rm a.out
	rm *.o
