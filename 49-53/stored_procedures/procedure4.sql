USE Northwind;

DELIMITER ##
CREATE PROCEDURE fill_table(
ShipperID INT, CompanyName VARCHAR(40), Phone VARCHAR(24))
BEGIN
START TRANSACTION;
BEGIN
    INSERT INTO Shippers 
    VALUES (ShipperID, CompanyName, Phone);
COMMIT;
END 
##