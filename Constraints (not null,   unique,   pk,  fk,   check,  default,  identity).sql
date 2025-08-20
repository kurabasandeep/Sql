
-- ============================================================
-- File: SQL_Constraints_FullExamples.sql
--  

/* 1  not null
   2  unique
   3  primary key
   4  foreign key
   5  check
   6  default 
   7 identity
*/

-- ========================================
-- 1️⃣ NOT NULL Constraint
-- Explanation:
-- 1. Ensures a column cannot have NULL values.
-- 2. Mandatory data must be provided when inserting a row.
-- 3. Helps avoid missing values in important columns.
-- ========================================
CREATE TABLE NotNULLTest
(
    Id INT NOT NULL,  -- Mandatory
    Name VARCHAR(100) -- Optional
);

INSERT INTO NotNULLTest(Id, Name)
SELECT 1,'sandeep' UNION ALL
SELECT 2,'abhi';

INSERT INTO NotNULLTest(Id, Name)
SELECT 3,NULL;

INSERT INTO NotNULLTest(Id)
SELECT 4;

SELECT * FROM NotNULLTest;

-- ========================================
-- 2️⃣ UNIQUE Constraint
-- Explanation:
-- 1. Ensures all values in a column are distinct.
-- 2. Allows only one NULL value per column.
-- 3. Helps maintain uniqueness for important data like emails or IDs.
-- ========================================
CREATE TABLE UniqueTest
(
    Id INT UNIQUE,
    Name VARCHAR(100)
);

INSERT INTO UniqueTest(Id, Name)
SELECT 1,'sandeep';

INSERT INTO UniqueTest(Id, Name)
SELECT 2,'keerthi';

INSERT INTO UniqueTest(Id, Name)
SELECT NULL,'abhi';

INSERT INTO UniqueTest(Id, Name)
SELECT NULL,'sriram';

INSERT INTO UniqueTest(Id, Name)
SELECT NULL,'yuva';

SELECT * FROM UniqueTest;

-- ========================================
-- 3️⃣ PRIMARY KEY Constraint
-- Explanation:
-- 1. Uniquely identifies each row in a table.
-- 2. Combines UNIQUE and NOT NULL constraints automatically.
-- 3. Each table can have only one primary key.
-- ========================================
CREATE TABLE PrimaryKeyTest
(
    Id INT PRIMARY KEY,
    Name VARCHAR(100)
);

INSERT INTO PrimaryKeyTest(Id, Name)
SELECT 1,'sandeep';

INSERT INTO PrimaryKeyTest(Id, Name)
SELECT 2,'abhi';

-- This will fail because PK must be unique
-- INSERT INTO PrimaryKeyTest(Id, Name)
-- SELECT 2,'pooji';

SELECT * FROM PrimaryKeyTest;

-- ========================================
-- 4️⃣ FOREIGN KEY Constraint
-- Explanation:
-- 1. Links a column in one table to a primary key in another table.
-- 2. Ensures referential integrity, preventing orphan records.
-- 3. Only values that exist in the parent table can be inserted.
-- ========================================
CREATE TABLE ForeignKeyTest
(
    Id INT FOREIGN KEY REFERENCES PrimaryKeyTest(Id),
    DOB DATE
);

INSERT INTO ForeignKeyTest(Id, DOB)
SELECT 1,'2000-01-10';

-- This will fail because FK cannot be NULL or invalid
-- INSERT INTO ForeignKeyTest(Id, DOB)
-- SELECT NULL,'2015-01-10';

SELECT * FROM ForeignKeyTest;

-- ========================================
-- 5️⃣ CHECK Constraint
-- Explanation:
-- 1. Ensures the value in a column meets a specific condition.
-- 2. Example: Salary > 0, Age > 18, VaccinationFlag IN ('Yes','No').
-- 3. Helps validate data before inserting or updating.
-- ========================================
CREATE TABLE CheckTest
(
    Id INT,
    Salary INT CHECK(Salary > 0)
);

INSERT INTO CheckTest(Id, Salary)
SELECT 1,2000;

INSERT INTO CheckTest(Id, Salary)
SELECT 2,1500;

-- This will fail
-- INSERT INTO CheckTest(Id, Salary)
-- SELECT 3,-2000;

SELECT * FROM CheckTest;

-- Another CHECK example
CREATE TABLE CheckTest2
(
    Name VARCHAR(100),
    VaccinationFlag VARCHAR(10) CHECK(VaccinationFlag IN ('Yes','No'))
);

INSERT INTO CheckTest2(Name, VaccinationFlag)
SELECT 'sandeep','Yes';

INSERT INTO CheckTest2(Name, VaccinationFlag)
SELECT 'prabhas','No';

-- This will fail
-- INSERT INTO CheckTest2(Name, VaccinationFlag)
-- SELECT 'abhi','Y';

SELECT * FROM CheckTest2;

-- ========================================
-- 6️⃣ DEFAULT Constraint
-- Explanation:
-- 1. Automatically assigns a default value if none is provided.
-- 2. Useful for optional columns to avoid NULL or missing data.
-- 3. Example: DEFAULT('NoNameProvided') for a Name column.
-- ========================================
CREATE TABLE DefaultTest
(
    Id INT,
    Name VARCHAR(100) DEFAULT('NoNameProvided')
);

INSERT INTO DefaultTest(Id, Name)
SELECT 1,'sandeep';

INSERT INTO DefaultTest(Id, Name)
SELECT 2,NULL;

INSERT INTO DefaultTest(Id)
SELECT 3;

SELECT * FROM DefaultTest;

-- ========================================
-- 7️⃣ IDENTITY Constraint
-- Explanation:
-- 1. Automatically generates incremental numbers for a column.
-- 2. Useful for primary keys or serial numbers.
-- 3. Example: IDENTITY(1,1) starts at 1 and increments by 1.
-- ========================================
CREATE TABLE IdentityTest
(
    ID INT IDENTITY(1,1),
    Name VARCHAR(100)
);

INSERT INTO IdentityTest(Name)
SELECT 'sandeep' UNION ALL
SELECT 'abhi';

INSERT INTO IdentityTest(Name)
SELECT 'pooji' UNION ALL
SELECT 'abhison';

-- Manual insert using IDENTITY_INSERT
SET IDENTITY_INSERT IdentityTest ON;

INSERT INTO IdentityTest(Id, Name)
SELECT 15,'prabhas';

SET IDENTITY_INSERT IdentityTest OFF;

SELECT * FROM IdentityTest;

-- ========================================
-- 8️⃣ IDENTITY with custom increment
-- Explanation:
-- 1. Starts from a seed value and increments by a defined number.
-- 2. Useful for generating serial numbers with steps.
-- 3. Example: IDENTITY(1,5) generates 1,6,11,16...
-- ========================================
CREATE TABLE IdentityTest3
(
    ID INT IDENTITY(1,5),
    Name VARCHAR(100)
);

INSERT INTO IdentityTest3(Name)
SELECT 'sandeep' UNION ALL
SELECT 'abhi' UNION ALL
SELECT 'king';

SELECT * FROM IdentityTest3;
