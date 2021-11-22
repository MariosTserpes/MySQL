CREATE TABLE shipperUpdateLog (
id INT AUTO_INCREMENT PRIMARY KEY,
shipperName VARCHAR(255) DEFAULT NULL,
shipperNumber INT NOT NULL,
updateDate DATETIME DEFAULT NULL,
typeOfAction VARCHAR(255) DEFAULT NULL);

CREATE TRIGGER afterShipperUpdate
AFTER UPDATE ON shippers
FOR EACH ROW
INSERT INTO shipperUpdateLog
SET shipperName = NEW.CompanyName,
    shipperNumber = NEW.phone,
    updateDate = NOW(),
    typeOfAction = 'update';


UPDATE shippers
SET CompanyName = 'Love Express', Phone = '503888222'
WHERE ShipperID = 1;