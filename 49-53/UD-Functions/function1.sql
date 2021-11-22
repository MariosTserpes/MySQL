USE Northwind;

DELIMITER ##
CREATE FUNCTION LINE_TOTAL(
p_unitprice FLOAT, p_quantity INT)
RETURNS DECIMAL(6, 2)
DETERMINISTIC
BEGIN 
 DECLARE v_total DECIMAL(3, 2);
 SET v_total = p_unitprice * p_quantity;
 RETURN v_total;
END ##
DELIMITER ;

#Function
SELECT LINE_TOTAL(3, 2);