CREATE DATABASE PR2;

USE PR2;

-- 1. Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

-- Insert into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Alice', 'Brown', 'alice.b@email.com', '2023-01-10'),
(4, 'Bob', 'White', 'bob.white@email.com', '2023-02-20'),
(5, 'Charlie', 'Green', 'charlie.g@email.com', '2023-05-05');

-- 2. Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-05', 50.00), 
(104, 4, '2023-08-01', 300.00), 
(105, 2, '2023-08-02', 120.25);

-- 3. Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Insert into Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'David', 'Kim', 'IT', '2019-06-12', 70000.00),
(4, 'Emily', 'Davis', 'Marketing', '2022-09-01', 48000.00),
(5, 'Michael', 'Wilson', 'Sales', '2018-11-30', 52000.00);

-- === INNER JOIN ===
SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.TotalAmount
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

-- === LEFT JOIN ===
SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.TotalAmount
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

-- === RIGHT JOIN ===
SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

-- === FULL OUTER JOIN ===
SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.TotalAmount
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

-- 5. Subquery to find customers who placed orders worth more than the average amount
SELECT * 
FROM Orders
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders); 

-- 6. Subquery to find employees with salaries above the average salary
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 7. Extract the year and month from the OrderDate
SELECT 
    OrderID, 
    OrderDate, 
    YEAR(OrderDate) AS OrderYear, 
    MONTH(OrderDate) AS OrderMonth
FROM Orders; 

-- 8. Calculate the difference in days between two dates
SELECT 
    OrderID, 
    OrderDate, 
    DATEDIFF(CURRENT_DATE, OrderDate) AS DaysSinceOrder
FROM Orders;

-- 9. Format the OrderDate to a more readable format
SELECT 
    OrderID, 
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;

-- 10. Concatenate Full Name
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- 11. Replace part of a string
SELECT REPLACE(FirstName, 'John', 'johnsmith') AS UpdatedName
FROM Customers;

-- 12. Change Case (Upper/Lower)
SELECT UPPER(FirstName) AS UpperFirst, 
       LOWER(LastName) AS LowerLast
FROM Employees;

-- 13. Trim spaces from Email
SELECT TRIM(Email) AS CleanEmail
FROM Customers;

-- 14. Running Total of TotalAmount
SELECT OrderID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;

-- 15. Rank orders based on TotalAmoun
SELECT OrderID, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
FROM Orders;

-- 16. Assign Discount based on TotalAmount
SELECT OrderID, TotalAmount,
       CASE 
           WHEN TotalAmount > 150 THEN '10% off'
           WHEN TotalAmount > 550 THEN '5% off'
           ELSE 'No Discount'
       END AS DiscountCategory
FROM Orders;

--
SELECT FirstName, Salary,
       CASE 
           WHEN Salary >= 54000 THEN 'High'
           WHEN Salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryLevel
FROM Employees;