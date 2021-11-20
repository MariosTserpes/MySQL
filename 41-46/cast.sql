USE Northwind;

#Cast
SELECT CAST("2021-11-20" AS DATE) AS convert_string_to_date;

#integer to char
SELECT CAST(20 AS CHAR) AS convet_int_to_char;

#from string to date & time
SELECT CAST("2021-11-20 06:00:00" AS DATE) AS string_to_date, 
       CAST("2021-11-20 06:00:00" AS TIME) AS string_to_time;
       
#Order Date Without Time
SELECT OrderID,
       CustomerID,
	   CAST(OrderDate AS DATE) AS Order_Date
FROM Orders;


#From Date to Datetime [2012-03-24]
SELECT *,
       CAST("2012-03-24" AS DATE) AS DATE_CHECK
FROM Orders;