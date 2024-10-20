use main;

DELIMITER $$

CREATE PROCEDURE AddDriver(
    IN driver_name TEXT,
    IN license_number INT,
    IN license_category VARCHAR(255),
    IN phone INTEGER,
    IN hire_date DATETIME,
    IN roll INT,
    IN status BOOLEAN
)
BEGIN
    INSERT INTO Drivers (name, license_number, license_category, phone, hire_date, roll, status)
    VALUES (driver_name, license_number, license_category, phone, hire_date, roll, status);
END $$

DELIMITER ; 
