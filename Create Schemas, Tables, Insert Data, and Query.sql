-- ============================================================
-- Script: Create Schemas, Tables, Insert Data, and Query

-- Purpose: Demonstrate schemas, tables, inserts, selects in SSMS
-- ============================================================

-- ===============================
-- 1. Create Schemas
-- ===============================
-- Commit message: Creating initial schemas
CREATE SCHEMA Plaindosa;
GO

CREATE SCHEMA MulbagalDosa;
GO

CREATE SCHEMA MasalaDosa;
GO

-- ===============================
-- 2. Create Tables in Schemas
-- ===============================
-- Commit message: Creating Employee tables in all schemas

CREATE TABLE Plaindosa.Employee
(
    EmployeeId INT,
    EmployeeFirstName VARCHAR(100),
    EmployeeLastName VARCHAR(100),
    Salary INT,
    [Address] VARCHAR(100)
);

CREATE TABLE MulbagalDosa.Employee
(
    EmployeeId INT,
    EmployeeFirstName VARCHAR(100),
    EmployeeLastName VARCHAR(100),
    Salary INT,
    [Address] VARCHAR(100)
);

CREATE TABLE MasalaDosa.Employee
(
    EmployeeId INT NOT NULL,
    EmployeeFirstName VARCHAR(100),
    EmployeeLastName VARCHAR(100),
    Salary INT,
    [Address] VARCHAR(100)
);

-- ===============================
-- 3. Insert Data into Plaindosa.Employee
-- ===============================
-- Commit message: Inserting initial 4 rows into Plaindosa.Employee

INSERT INTO Plaindosa.Employee
(
    EmployeeId,
    EmployeeFirstName,
    EmployeeLastName,
    Salary,
    [Address]
)
VALUES
(1,'Sandeep','Kumar',1000,'India'),
(2,'Prabhas','King',2000,'US'),
(3,'Pooji','Bhannu',3000,'India'),
(4,'Sriram','King',5000,'Aus');

-- Commit message: Inserting additional rows using SELECT + UNION ALL
INSERT INTO Plaindosa.Employee
(
    EmployeeId,
    EmployeeFirstName,
    EmployeeLastName,
    Salary,
    [Address]
)
SELECT 5,'Kumar','Bhannu',2750,'India' UNION ALL
SELECT 6,'Aswini','Queen',3000,'India' UNION ALL
SELECT 7,'Rebal','Allu',2750,'US' UNION ALL
SELECT 8,'Chiru','Darling',2750,'US';

-- ===============================
-- 4. Select Data from Plaindosa.Employee
-- ===============================
-- Commit message: Selecting all rows from Plaindosa.Employee
SELECT * 
FROM Plaindosa.Employee
ORDER BY EmployeeId;

-- ===============================
-- 5. List all tables in Plaindosa schema
-- ===============================
-- Commit message: Retrieving tables in Plaindosa schema
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_SCHEMA = 'Plaindosa';

-- ===============================
-- 6. Check database existence
-- ===============================
-- Commit message: Verify if database 'sandeep' exists
SELECT name 
FROM sys.databases
WHERE name = 'sandeep';
