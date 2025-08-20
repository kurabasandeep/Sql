-- To Get Line Numbers : Tools - Options - Text Editor - Transact SQL - Line Numbers(Check the box)
/*
Hello 
world
*/
-- This is a line that I want to comment
/*
 Three options to execute your query : 
	 Execute button at the top of the query window
	 Use F5 (fn+F5)
	 Ctrl + E
 To hide/unhide the results/console window/pane : Ctrl + R
 To Comment a line of code  : Ctrl+K+C
 To uncomment : Ctrl+K+U
 
 CREATE A DATABASE
	 Database is a storage unit that helps us in storing data in form of tables.
	 Database also holds certain other objects that helps us in managing and accessing data as well.
	 All these above objects are referred to as database objects and are created in the database itself
*/
--1. To create a database using Transact-SQL(TSQL)
CREATE DATABASE SANDEEP

--2. Using the GUI(Graphical User Interface)

-- Whenever we create a database there are two files that are created : 
	-- MDF (Master Data File) - It holds data that is stored
	-- LDF (Log Data File) - It holds the log of all the changes that is performed on the database

-- Change the database connection
USE SANDEEP

-- Remove/Delete the database -- Comments in SQL Server
--DROP DATABASE 

-- 2 types of comments
	-- Single Line : --
	-- Multi Line  : /*.....*/

/* Tables in SQL Server
	 Table is a container that comprises of multiple fields(columns) that helps us in storing data
	 Alt + F1 - To view the metadata of the object*/
CREATE TABLE Employee
(
	EmployeeId int
	, EmployeeFirstName varchar(100)
	, EmployeeLastName varchar(100)
	, Salary int
	, Address varchar(500)-- Address is a keyword in SQL
)
GO-- Force the batch to end

sp_help Employee
GO






create table sandeep (id int, full_name varchar(20),city varchar(20))

insert into sandeep 
values
(2,'Yuva','Banglore'),
(3,'Bhannu','Banglore'),
(4,'Kumar','Banglore'),
(5,'Aswini','Banglore'),
(6,'Manjula','Banglore'),
(7,'Sigarappa','Banglore')

create table Developers(slno int, name varchar(20),city varchar(20))
insert into Developers 
values
(1,'Sandeep','Banglore'),
(2,'Abhi','Ongole'),
(3,'pooji','ongole'),
(4,'Sriram','india')




--Create a Table
	CREATE TABLE Employees
	(Employee_Id int,                   -- Column Name -- DataType(Mandatory) -- Constraint (Optional)
	First_Name char(20),
	Last_Name char(20),
	Salary int,
	Address nvarchar(100))

	Create Table Family
	(Sr_No tinyint,
	First_Name char(50),
	Last_Name char(50),
	Relation char(50))

	select * from Employee    -- select is used to select table and view

	insert into Employee    -- insert into is used to insert values in table
	(Employee_Id,First_Name, Last_Name, Salary, Address) --optional when giving values for all columns )
	Values (1,'sandeep','Kumar',1000,'India'),
	(2,'prabhas','nani',2000,'India'),
	(3,'rebal','allu',4000,'USA'),
	(4,'abhi','pooji',3000,'Aus')

	insert into Employee
	(Employee_Id,First_Name, Last_Name, Salary, Address) 
	SELECT 5, 'Kumar','abhiram',4500,'India' UNION ALL
	SELECT 6,'bhannu','bhavik',5000,'India' UNION ALL
	SELECT 7,'keerthi','poojitha',4000,'UK' UNION ALL
	SELECT 8, 'pooji','sriram', 2500,'UK' 

SELEct * from Employee

-- Alt + F1 -- to view the metadata
-- Metadata is nothing but data about data
--/*
DATABASE ==> SCHEMA(Optional) ==> TABLES

Schema
	-- Logical Partition of the database
	-- dbo stands for database objects
	-- dbo schema is the default schema for all the database objects
Database --> Schema(s) --> Table(s)/Object(s)
*/

CREATE SCHEMA Food -- Employee, Product, Sale, Profit
GO -- Batch is forced to end

CREATE SCHEMA Clothing -- Employee, Product, Sale, Profit
GO

CREATE SCHEMA Electronics-- Employee, Product, Sale, Profit
GO

-- To remove a schema
DROP SCHEMA Food
GO

CREATE TABLE Food.Employee
(
	EmployeeId int
	, EmployeeFirstName varchar(100)
	, EmployeeLastName varchar(100)
	, Salary int
	, Address varchar(100)
)

CREATE TABLE Clothing.Employee
(
	EmployeeId int
	, EmployeeFirstName varchar(100)
	, EmployeeLastName varchar(100)
	, Salary int
	, Address varchar(100)
)

CREATE TABLE Electronics.Employee
(
	EmployeeId int not null
	, EmployeeFirstName varchar(100)
	, EmployeeLastName varchar(100)
	, Salary int
	, [Address] varchar(100)
)

-- Insert data into a table
	-- Values
	INSERT INTO Employee
	(
		EmployeeId
		, EmployeeFirstName
		, EmployeeLastName
		, Salary
		, Address
	)
	VALUES (1,'sandeep','Kumar', 1000, 'India')
	, (2,'prabhas','king', 2000, 'US')
	, (3,'pooji','bhannu', 3000, 'India')
	, (4,'sriram','king', 5000, 'Aus')
	
	-- Select
	INSERT INTO Employee
	(
		EmployeeId
		, EmployeeFirstName
		, EmployeeLastName
		, Salary
		, Address
	)
	SELECT 5,'Kumar','bhannu',2750,'India' UNION ALL
	SELECT 6,'aswini','queen',3000,'India' UNION ALL
	SELECT 7,'rebal','allu',2750,'US' UNION ALL
	SELECT 8,'chiru','darling',2750,'US' 

-- Retrive the data from the table
SELECT * -- * represents all the columns

