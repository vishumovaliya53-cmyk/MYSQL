CREATE database sql1;

use sql1;

CREATE table Employees(
     EmpID INT PRIMARY KEY,
     NAME VARCHAR (100),
     salary DECIMAL (10 , 2),
     Department VARCHAR (100),
     JoiningDate datetime
);

-- CRUD -- CREATE QUERY

INSERT INTO Employees(EmpID, NAME, salary, Department, JoiningDate)
VALUES(41, 'VISHU', 75000.00, 'IT', '2023-01-19');

INSERT INTO Employees(EmpID, NAME, salary, Department, JoiningDate)
VALUES
(42, 'SHIVI', 65000.00, 'FINANCE', '2024-02-06'),
(43, 'KRISH', 70000.00, 'DEVELOPMENT', '2022-09-27');

-- SELECT ALL RECORDS
SELECT * FROM Employees

-- SELECT SPECIFIC COLUMNS
SELECT  NAME , salary FROM Employees;