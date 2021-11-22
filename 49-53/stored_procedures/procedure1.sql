USE Carshop;

DELIMITER &&
CREATE PROCEDURE print_all_cars()
BEGIN
SELECT *
FROM Cars;
END &&

CALL print_all_cars();