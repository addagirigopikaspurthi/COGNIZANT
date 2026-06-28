CREATE DATABASE IF NOT EXISTS FinanceDB;
USE FinanceDB;

DROP TABLE IF EXISTS Borrowings;
DROP TABLE IF EXISTS Clients;

CREATE TABLE Clients(
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(50),
    ClientAge INT,
    AccountBalance DECIMAL(10,2),
    PremiumCustomer BOOLEAN
);

CREATE TABLE Borrowings(
    BorrowID INT PRIMARY KEY,
    ClientID INT,
    RateOfInterest DECIMAL(5,2),
    RepaymentDate DATE,
    FOREIGN KEY(ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO Clients VALUES
(201,'Arjun',68,18000,FALSE),
(202,'Sneha',35,7000,FALSE),
(203,'Kiran',72,22000,FALSE);

INSERT INTO Borrowings VALUES
(301,201,8.50,CURDATE()+INTERVAL 12 DAY),
(302,202,9.75,CURDATE()+INTERVAL 45 DAY),
(303,203,7.50,CURDATE()+INTERVAL 18 DAY);

SELECT * FROM Clients;
SELECT * FROM Borrowings;

UPDATE Borrowings
SET RateOfInterest = RateOfInterest - 1
WHERE ClientID IN (
    SELECT ClientID
    FROM Clients
    WHERE ClientAge > 60
);

SELECT * FROM Borrowings;

UPDATE Clients
SET PremiumCustomer = TRUE
WHERE AccountBalance > 15000;

SELECT * FROM Clients;

SELECT
ClientID,
BorrowID,
RepaymentDate,
'Reminder: Payment Due Soon' AS Message
FROM Borrowings
WHERE RepaymentDate BETWEEN CURDATE() AND CURDATE()+INTERVAL 30 DAY;
