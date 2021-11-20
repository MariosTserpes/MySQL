USE Northwind;

#Case 
SELECT OrderID, Quantity,
CASE
  WHEN Quantity < 20 THEN "Less than 20"
  WHEN Quantity = 20 THEN "Equal to 20"
  WHEN Quantity > 20 THEN "More than 20"
  ELSE "Not a number"
END 
FROM OrderDetails;


#Case with IS NULL
SELECT * FROM Employees
ORDER BY 
(CASE 
  WHEN Region IS NULL THEN country
  ELSE Region 
END) ASC;

WITH WaitForUs AS (SELECT CustomerID, Count(*) AS Total_Orders
                   FROM Orders 
				   INNER JOIN Customers 
                   USING(CustomerID)
                   GROUP BY CustomerID)
			
		          SELECT CustomerID, Total_Orders,
                  CASE Total_Orders
                     WHEN 1 THEN "Has done business with us once"
                     WHEN 2 THEN "Has done business with us is twice"
                     WHEN 3 THEN "Has done business with us thrice"
                     ELSE "Dedicated Customer"
				 END Type_of_Customer
                  FROM WaitForUs;