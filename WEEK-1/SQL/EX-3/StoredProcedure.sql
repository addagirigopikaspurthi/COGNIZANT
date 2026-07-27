CREATE DATABASE IF NOT EXISTS BankDB;
USE BankDB;

DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Accounts(
AccountID INT PRIMARY KEY,
CustomerID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
Department VARCHAR(30),
Salary DECIMAL(10,2)
);

INSERT INTO Accounts VALUES
(101,1,'Savings',10000),
(102,2,'Savings',15000),
(103,3,'Current',20000),
(104,4,'Savings',5000);

INSERT INTO Employees VALUES
(201,'Ravi','IT',30000),
(202,'Priya','HR',35000),
(203,'Rahul','IT',40000),
(204,'Anu','Finance',45000);

SELECT * FROM Accounts;
SELECT * FROM Employees;

DELIMITER //

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
UPDATE Accounts
SET Balance = Balance + (Balance*0.01)
WHERE AccountType='Savings';

SELECT 'Monthly Interest Applied' AS Message;
END//

DELIMITER ;

CALL ProcessMonthlyInterest();

SELECT * FROM Accounts;

DELIMITER //

CREATE PROCEDURE UpdateEmployeeBonus(
IN dept VARCHAR(30),
IN bonus DECIMAL(5,2)
)
BEGIN

UPDATE Employees
SET Salary=Salary+(Salary*bonus/100)
WHERE Department=dept;

SELECT 'Bonus Updated' AS Message;

END//

DELIMITER ;

CALL UpdateEmployeeBonus('IT',10);

SELECT * FROM Employees;

DELIMITER //

CREATE PROCEDURE TransferFunds(
IN sourceAcc INT,
IN destAcc INT,
IN amount DECIMAL(10,2)
)
BEGIN

DECLARE bal DECIMAL(10,2);

SELECT Balance
INTO bal
FROM Accounts
WHERE AccountID=sourceAcc;

IF bal>=amount THEN

UPDATE Accounts
SET Balance=Balance-amount
WHERE AccountID=sourceAcc;

UPDATE Accounts
SET Balance=Balance+amount
WHERE AccountID=destAcc;

SELECT 'Transfer Successful' AS Message;

ELSE

SELECT 'Insufficient Balance' AS Message;

END IF;

END//

DELIMITER ;

CALL TransferFunds(101,102,2000);

SELECT * FROM Accounts;