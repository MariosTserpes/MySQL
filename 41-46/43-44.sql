USE Northwind;

SELECT EXISTS (
               SELECT * 
               FROM Employees
               WHERE EmployeeID = 30); 
               
#We have many suppliers but we want those that have supplied products whose unit price is above 100USD
SELECT CompanyName 
FROM Suppliers
WHERE EXISTS(SELECT ProductName
             FROM Products
             WHERE Products.SupplierID = Suppliers.SupplierID
             AND UnitPrice > 100);
 
 #We know that we have many employees and they've all managed orders from customers.
 #However we want to celebrate those employees who have managed more than 100 orders.
 
 SELECT FirstName, LastName
FROM Employees
WHERE EXISTS(SELECT EmployeeID
              FROM (
                     SELECT EmployeeID, Count(EmployeeID) AS Top_Employee
                     FROM Orders
                     WHERE Employees.EmployeeID = Orders.EmployeeID
                     GROUP BY EmployeeID) AS Sub_Table
                     WHERE Top_Employee > 100);
                     
#Let's combine FirstName, LastName from Employees Table
SELECT CONCAT(FirstName, SPACE(1) , LastName)
FROM Employees;


#Repeat twice "Intelligent Developer"