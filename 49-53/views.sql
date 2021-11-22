USE Northwind;

#You are required to create a View for Sale Manager from Employee table using the first name and salary

CREATE VIEW Sale_Manager
AS 
SELECT FirstName, Salary
FROM Employees
WHERE Title = "Sales Manager";

#SELECT * FROM Sale_Manager;

#View for Employees were employeed in 1994

CREATE VIEW EMPLOYEES_HIRE_YEAR (Full_Name, Hire_Year)
AS
SELECT CONCAT(FirstName, SPACE(2), LastName) AS Full_Name,
        Year(HireDate) AS Hire_Year
FROM Employees
WHERE Year(HireDate) = 1994;

#SELECT * FROM EMPLOYEES_HIRE_YEAR;

#Updating a View
#The employees hired '94. We do not need the year but only their Full Name

CREATE OR REPLACE VIEW EMPLOYEES_HIRE_YEAR
AS
SELECT CONCAT(FirstName, SPACE(2), LastName) AS Full_Name
FROM Employees
WHERE YEAR(HireDATE) = 1994;

SELECT * FROM EMPLOYEES_HIRE_YEAR;

#View For Japan Suppliers

CREATE VIEW Japan_Suppliers 
AS 
SELECT SupplierID, 
       CompanyName
FROM Suppliers
WHERE Country = "Japan";

SELECT * FROM Japan_Suppliers;

#Creating a view using another View and the base table
CREATE VIEW Japan_Suppliers2
AS 
SELECT Suppliers.SupplierID,
       Suppliers.ContactName,
       Suppliers.CompanyName,
       Suppliers.Address,
       Suppliers.Phone
FROM Suppliers, Japan_Suppliers
WHERE Suppliers.SupplierID = Japan_Suppliers.SupplierID
AND Suppliers.CompanyName = Japan_Suppliers.CompanyName;

SELECT * FROM Japan_Suppliers2;


#2nd Approach[USING INNER JOIN]
CREATE VIEW Japan_Supplier_approach2
AS
SELECT SupplierID, 
       CompanyName
FROM Suppliers
WHERE Country = 'Japan';

SELECT Suppliers.SupplierID,
       Suppliers.ContactName,
       Suppliers.CompanyName,
       Suppliers.Address,
       Suppliers.Phone
FROM Suppliers
INNER JOIN Japan_Supplier_approach2
ON ( Suppliers.SupplierID = Japan_Supplier_approach2.SupplierID
AND Suppliers.CompanyName = Japan_Supplier_approach2.CompanyName);