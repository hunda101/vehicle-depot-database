DELIMITER $$

CREATE PROCEDURE GetVehicleByNumber(
    IN vehicle_number VARCHAR(255)
)
BEGIN
    SELECT * FROM Vehicles WHERE vehicle_number = vehicle_number;
END $$

DELIMITER 