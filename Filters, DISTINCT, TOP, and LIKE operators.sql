/*
================================================================================
Demonstrate SELECT queries with various filters, DISTINCT, TOP, and LIKE operators
================================================================================
*/

----------------------------------------
-- 1. Filter by single Employee_Id
-- Commit message: Retrieve employee with Employee_Id = 5
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id = 5;

----------------------------------------
-- 2. Filter by First_Name
-- Commit message: Retrieve employee with First_Name = 'abhi'
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE First_Name = 'abhi';

----------------------------------------
-- 3. Filter multiple Employee_Ids using IN
-- Commit message: Retrieve employees with Employee_Id IN (1,2,5)
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id IN (1, 2, 5);

----------------------------------------
-- 4. Filter multiple names using IN
-- Commit message: Retrieve employees with First_Name IN ('abhi','Sandeep')
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE First_Name IN ('abhi', 'Sandeep');

----------------------------------------
-- 5. Employee_Id greater than or equal to 3
-- Commit message: Retrieve employees with Employee_Id >= 3
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id >= 3;

----------------------------------------
-- 6. Employee_Id less than or equal to 3
-- Commit message: Retrieve employees with Employee_Id <= 3
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id <= 3;

----------------------------------------
-- 7. Employee_Id not equal to 3
-- Commit message: Retrieve employees with Employee_Id != 3
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id != 3;

----------------------------------------
-- 8. Employee_Id not equal to 3 (alternative syntax)
-- Commit message: Retrieve employees with Employee_Id <> 3
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id <> 3;

----------------------------------------
-- 9. AND condition
-- Commit message: Retrieve employees with Employee_Id > 3 AND Address = 'India'
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id > 3 AND Address = 'India';

----------------------------------------
-- 10. OR condition
-- Commit message: Retrieve employees with Employee_Id > 3 OR Address = 'India'
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id > 3 OR Address = 'India';

----------------------------------------
-- 11. NOT IN condition
-- Commit message: Retrieve employees with Employee_Id NOT IN (1,5,7)
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id NOT IN (1, 5, 7);

----------------------------------------
-- 12. BETWEEN condition
-- Commit message: Retrieve employees with Employee_Id BETWEEN 3 AND 6
----------------------------------------
SELECT First_Name, Last_Name, Address AS AddressOfEmployee
FROM Employees AS emp
WHERE Employee_Id BETWEEN 3 AND 6;

----------------------------------------
-- 13. DISTINCT Clause
-- Explanation:
-- 1. Retrieves only unique/distinct values from a column.
-- 2. Removes duplicates in the result set.
-- 3. Useful for addresses, names, or categories.
-- Commit message: Retrieve distinct addresses from Employees table
----------------------------------------
SELECT DISTINCT Address
FROM Employees;

----------------------------------------
-- 14. TOP Clause
-- Explanation:
-- 1. Retrieves the top N rows from a table based on query.
-- 2. Useful when you want only a subset of records.
-- 3. Can be combined with ORDER BY or WHERE conditions.
-- Commit message: Retrieve top 3 employees from India
----------------------------------------
SELECT TOP 3 *
FROM Employees AS emp
WHERE Address = 'India';

----------------------------------------
-- 15. LIKE Operator Examples
-- Explanation:
-- 1. Helps identify patterns in text columns.
-- 2. % = 0 to n characters, _ = exactly 1 character.
-- 3. Useful for search and pattern matching.
----------------------------------------

-- Ends with 'h'
SELECT *
FROM Employees
WHERE First_Name LIKE '%h';

-- Begins with 'd'
SELECT *
FROM Employees
WHERE First_Name LIKE 'd%';

-- Contains 'o'
SELECT *
FROM Employees
WHERE First_Name LIKE '%o%';

-- Ends with any character + 's' before last character
SELECT *
FROM Employees
WHERE First_Name LIKE '%s_';

-- Third character is 'h'
SELECT *
FROM Employees
WHERE First_Name LIKE '__h%';
