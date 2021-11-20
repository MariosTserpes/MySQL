USE Northwind;

SELECT ProductID, 
       ProductName,
	   SupplierID,
       CategoryID
FROM (SELECT * 
	  FROM Products
      WHERE (CategoryID = 2 
		 OR  CategoryID = 1) 
         AND SupplierID = 2) AS Products_SubTable;


#Aggregate with subs queries
SELECT OrderID, 
       COUNT(ProductID) AS total_products,
       UnitPrice 
FROM (SELECT *
      FROM OrderDetails
      WHERE Discount IS NOT NULL) AS OrderDetails_SubTable
GROUP BY OrderID
HAVING total_products >= 1
ORDER BY total_products DESC;

#List of orders handled by emplyees whose salary > 2500USD
SELECT * 
FROM Orders
WHERE EmployeeID IN  (SELECT EmployeeID 
                      FROM Employees 
                      WHERE Salary > 2500);

#The best customer of Northwind by the highest total amount spent with Northwind
SELECT *
FROM Customers
WHERE CustomerID = (SELECT CustomerID
                    FROM Orders
                    WHERE orderid = (SELECT OrderID 
                                     FROM OrderDetails
                                     GROUP BY OrderID
                                     ORDER BY SUM(UnitPrice * Quantity) DESC
                                     LIMIT 1));