SHOW PROCEDURE STATUS
WHERE db = "Northwind";

#Procedure in order to get the number of product being supplied by inputing Supplier's ID Number
DROP PROCEDURE IF EXISTS NUMBER_OF_PRODUCTS;

DELIMITER $$
CREATE PROCEDURE NUMBER_OF_PRODUCTS (p_Supplier INT)
BEGIN
SELECT Suppliers.CompanyName AS Supplier,
	   Suppliers.SupplierID AS Unique_Identifier,
       COUNT(Suppliers.SupplierID) AS total_number
FROM Suppliers
INNER JOIN Products
ON Suppliers.SupplierID = Products.SupplierID
WHERE Products.SupplierID = p_supplier
GROUP BY Products.SupplierID;
END 
$$

#Result
CALL NUMBER_OF_PRODUCTS(2);