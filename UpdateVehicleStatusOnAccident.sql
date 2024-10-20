DELIMITER $$

CREATE TRIGGER UpdateVehicleStatusOnAccident
AFTER INSERT ON Accidents
FOR EACH ROW
BEGIN
    UPDATE Vehicles 
    SET status = FALSE 
    WHERE id = NEW.vehicle_id;
END $$

DELIMITER ;