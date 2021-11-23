USE Carshop;

SELECT CarName
FROM Cars;

SELECT CarName, 
       Price
FROM Cars;

#Cars sold for 25000USD
SELECT Distinct CarName
FROM Cars
WHERE Price = 25000;

#Details of cars whose price is between 14.000 and 30.000
SELECT *
FROM Cars
WHERE Price BETWEEN 14000 AND 30000
ORDER BY Price ASC;

#Number of Cars sold for 30000 or above
SELECT COUNT(*) AS number_of_cars
FROM Cars
WHERE Price >= 30000;

#Current price list in USD - Should be modified in Rupee
SELECT CarName,
       CONCAT("INR ", FORMAT((PRICE * 70), 2)) AS price_in_rupee
FROM Cars;

#Price List for Cambodia Customers
SELECT Manufacturers.ManufacturerName,
       Cars.CarName,
	   CONCAT("KHR ", FORMAT((Cars.PRICE * 410), 2)) AS price_in_KHR
FROM Cars
INNER JOIN Manufacturers 
ON Manufacturers.ManufacturerID = Cars.ManufacturerID
ORDER BY Manufacturers.ManufacturerName DESC;

#Most Expensive Cars
#1st
SELECT Price,
       CarName
FROM Cars
WHERE Price = (SELECT MAX(Price)
               FROM Cars);

#2nd
SELECT Price,
       CarName
FROM Cars
ORDER BY Price DESC
LIMIT 1;

#Most expensive car, its price and its manufacturer Name
#1st
SELECT Cars.Price,
       Cars.CarName,
       Manufacturers.ManufacturerName
FROM Cars 
INNER JOIN Manufacturers
ON Manufacturers.ManufacturerID = Cars.ManufacturerID
ORDER BY Cars.Price DESC
LIMIT 1;

#2nd
SELECT Cars.Price,
       Cars.CarName,
       Manufacturers.ManufacturerName
FROM Cars 
INNER JOIN Manufacturers
ON Manufacturers.ManufacturerID = Cars.ManufacturerID
WHERE Cars.Price = (SELECT MAX(Cars.PRICE)
                    FROM Cars);
                    
#Price list of Honda or Toyota
SELECT Cars.CarName,
       Cars.Price,
       Manufacturers.ManufacturerName
FROM Cars
INNER JOIN Manufacturers
ON Manufacturers.ManufacturerID = Cars.ManufacturerID
WHERE Manufacturers.ManufacturerName IN ('Toyota', 'Honda');

#Number of cars per Manufacturer
SELECT Manufacturers.ManufacturerName,
       COUNT(Cars.ManufacturerID) AS Number_of_cars
FROM Cars
INNER JOIN Manufacturers
ON Manufacturers.ManufacturerID = Cars.ManufacturerID
GROUP BY Manufacturers.ManufacturerName
ORDER BY Number_of_cars DESC;
       
#Average Price per Manufacturer | Name-Price
SELECT Manufacturers.ManufacturerName,
       AVG(Cars.Price) AS Average_Price
FROM Cars, Manufacturers
WHERE Manufacturers.ManufacturerID = Cars.ManufacturerID
GROUP BY Manufacturers.ManufacturerName
ORDER BY Average_Price DESC;

#Name and Price of cheapest car
SELECT CarName, 
       Price
FROM Cars
WHERE Price = (SELECT MIN(Price) FROM Cars);

#View
CREATE VIEW Price_List
AS
SELECT ManufacturerName,
       CarName,
       CONCAT("Dollar: ", FORMAT((Price), 2)) AS PRICE_USD,
	   CONCAT("Euro: ", FORMAT((Price * 0.85), 2)) AS PRICE_Euro,
	   CONCAT("Sterlin: ", FORMAT((Price * 0.77), 2)) AS PRICE_Sterlin,
	   CONCAT("Yaun: ", FORMAT((Price * 85), 2)) AS PRICE_Yaun
FROM Cars, Manufacturers
WHERE Cars.ManufacturerID = Manufacturers.ManufacturerID
ORDER BY ManufacturerName ASC;

#Call View
SELECT * FROM Price_List;