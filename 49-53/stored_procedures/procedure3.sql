USE Carshop;

#Procedure in order to get the most expensive car by Manufacturer when ID_number of the manufacturer is inputted.
DELIMITER ##
CREATE PROCEDURE most_expensive_car(p_manufacturerID INT)
BEGIN
SELECT ManufacturerName AS Manufacturer_Name,
       MAX(Price) AS Price
FROM Cars 
INNER JOIN Manufacturers
ON Cars.ManufacturerID = Manufacturers.ManufacturerID
AND Cars.ManufacturerID = p_manufacturerID
GROUP BY Manufacturer_Name;
END ##

CALL most_expensive_car(1);