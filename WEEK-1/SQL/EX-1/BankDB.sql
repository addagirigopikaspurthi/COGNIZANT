CREATE DATABASE IF NOT EXISTS BankDB;
USE BankDB;

DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Age INT,
    Balance DECIMAL(10,2),
    IsVIP BOOLEAN
);

CREATE TABLE Loans(
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    InterestRate DECIMAL(5,2),
    DueDate DATE,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES
(101,'Ravi',65,12000,FALSE),
(102,'Priya',45,8000,FALSE),
(103,'Rahul',70,15000,FALSE);

INSERT INTO Loans VALUES
(201,101,9.00,CURDATE()+INTERVAL 10 DAY),
(202,102,10.00,CURDATE()+INTERVAL 40 DAY),
(203,103,8.00,CURDATE()+INTERVAL 20 DAY);

SELECT * FROM Customers;
SELECT * FROM Loans;

-- Scenario 1
UPDATE Loans
SET InterestRate = InterestRate - 1
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE Age > 60
);

SELECT * FROM Loans;

-- Scenario 2
UPDATE Customers
SET IsVIP = TRUE
WHERE Balance > 10000;

SELECT * FROM Customers;

-- Scenario 3
SELECT
CustomerID,
LoanID,
DueDate,
'Reminder: Loan Due Soon' AS Message
FROM Loans
WHERE DueDate BETWEEN CURDATE() AND CURDATE()+INTERVAL 30 DAY;