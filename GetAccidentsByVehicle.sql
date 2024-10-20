DELIMITER $$

CREATE PROCEDURE GetAccidentsByVehicle(
    IN vehicle_id INT
)
BEGIN
    SELECT * FROM Accidents WHERE vehicle_id = vehicle_id;
END $$

DELIMITER ;
