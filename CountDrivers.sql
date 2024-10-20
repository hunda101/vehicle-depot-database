DELIMITER $$

CREATE FUNCTION CountDrivers() 
RETURNS INT
BEGIN
    DECLARE driver_count INT;
    SELECT COUNT(*) INTO driver_count FROM Drivers;
    RETURN driver_count;
END $$

DELIMITER ;