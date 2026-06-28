CREATE DATABASE IF NOT EXISTS FinanceSystem;
USE FinanceSystem;

DROP TABLE IF EXISTS Wallets;
DROP TABLE IF EXISTS Staff;

CREATE TABLE Wallets(
WalletID INT PRIMARY KEY,
UserID INT,
WalletType VARCHAR(20),
Amount DECIMAL(10,2)
);

CREATE TABLE Staff(
StaffID INT PRIMARY KEY,
StaffName VARCHAR(50),
Section VARCHAR(30),
Pay DECIMAL(10,2)
);

INSERT INTO Wallets VALUES
(201,11,'Savings',12000),
(202,12,'Savings',18000),
(203,13,'Business',25000),
(204,14,'Savings',8000);

INSERT INTO Staff VALUES
(301,'Amit','Sales',32000),
(302,'Neha','Support',36000),
(303,'Rohan','Sales',42000),
(304,'Meera','Accounts',47000);

SELECT * FROM Wallets;
SELECT * FROM Staff;

DELIMITER //

CREATE PROCEDURE AddMonthlyInterest()
BEGIN

UPDATE Wallets
SET Amount = Amount + (Amount * 0.02)
WHERE WalletType = 'Savings';

SELECT 'Interest Added Successfully' AS Message;

END//

DELIMITER ;

CALL AddMonthlyInterest();

SELECT * FROM Wallets;

DELIMITER //

CREATE PROCEDURE IncreaseSalary(
IN sec VARCHAR(30),
IN percent DECIMAL(5,2)
)
BEGIN

UPDATE Staff
SET Pay = Pay + (Pay * percent / 100)
WHERE Section = sec;

SELECT 'Salary Updated Successfully' AS Message;

END//

DELIMITER ;

CALL IncreaseSalary('Sales',8);

SELECT * FROM Staff;

DELIMITER //

CREATE PROCEDURE SendMoney(
IN fromWallet INT,
IN toWallet INT,
IN transferAmount DECIMAL(10,2)
)
BEGIN

DECLARE availableBalance DECIMAL(10,2);

SELECT Amount
INTO availableBalance
FROM Wallets
WHERE WalletID = fromWallet;

IF availableBalance >= transferAmount THEN

UPDATE Wallets
SET Amount = Amount - transferAmount
WHERE WalletID = fromWallet;

UPDATE Wallets
SET Amount = Amount + transferAmount
WHERE WalletID = toWallet;

SELECT 'Money Transfer Completed' AS Message;

ELSE

SELECT 'Not Enough Balance' AS Message;

END IF;

END//

DELIMITER ;

CALL SendMoney(201,202,3000);

SELECT * FROM Wallets;
