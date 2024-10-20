DELIMITER $$

CREATE TRIGGER IncrementServiceCount
AFTER INSERT ON Services
FOR EACH ROW
BEGIN
    UPDATE Mechanic 
    SET service_count = service_count + 1 
    WHERE mechanic_id = NEW.mechanic_id;
END $$

DELIMITER ;