
use Portfolio_projects;
--Table 1 Query:
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 2 Query:
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)



--Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1001, 'Karthik', 'RS', 30, 'Male'),
(1002, 'Akash', 'anant', 30, 'Female'),
(1003, 'Thanu', 'Shree', 29, 'Female'),
(1004, 'Teju', 'Kumar', 31, 'Female'),
(1005, 'Rakesh', 'singh', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Dhanush', 'S', 32, 'male'),
(1008, 'Shilpa', 'Shetty', 38, 'Female'),
(1009, 'Kevin', 'Hurt', 31, 'Male')

--Table 2 Insert:
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)