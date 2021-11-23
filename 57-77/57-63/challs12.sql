USE Northwind;

with Total_Orders_Per_Employee AS (
SELECT EmployeeID,
       COUNT(EmployeeID) AS Number_Of_Orders_Taken
FROM Orders
GROUP BY EmployeeID
), Total_Number_Late_Orders_Per_Employee AS (
SELECT EmployeeID,
       COUNT(EmployeeID) AS Number_Of_Late_Orders
FROM Orders
WHERE RequiredDate <= ShippedDate
GROUP BY EmployeeID
)
SELECT CONCAT(Em.FirstName, SPACE(2), Em.LastName) AS Full_Name,
       Tope.Number_Of_Orders_Taken AS NUMBER_OF_ORDERS,
       Tnlope.Number_Of_Late_Orders AS LATE_ORDERS,
       CONCAT(FORMAT(((Tnlope.Number_Of_Late_Orders / Tope.Number_Of_Orders_Taken)* 100), 2), "%") AS PERCENTAGE_OF_LATE_ORDERS
FROM Total_Number_Late_Orders_Per_Employee AS Tnlope
INNER JOIN Employees Em
ON Tnlope.EmployeeID = Em.EmployeeID
LEFT JOIN Total_Orders_Per_Employee AS Tope
ON Tope.EmployeeID = Tnlope.EmployeeID
WHERE (Tnlope.Number_Of_Late_Orders / Tope.Number_Of_Orders_Taken) * 100 > 5
ORDER BY (Tnlope.Number_Of_Late_Orders / Tope.Number_Of_Orders_Taken) * 100 DESC;