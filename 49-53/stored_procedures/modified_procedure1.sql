USE Carshop;

#Modify Procedure1 print_all_cars() to only return cars constructres by Tesla

DROP PROCEDURE IF EXISTS print_all_cars;

DELIMITER @@
CREATE PROCEDURE print_all_cars()
BEGIN
  SELECT *
  FROM Cars
  INNER JOIN Manufacturers
  ON Cars.ManufacturerID = Manufacturers.ManufacturerID
  WHERE ManufacturerName = "Tesla";
END 
@@

CALL print_all_cars();