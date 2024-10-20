DELIMITER $$

CREATE PROCEDURE DeleteOldAccidents(
    IN threshold_date DATETIME
)
BEGIN
    DELETE FROM Accidents WHERE accident_date < threshold_date;
END $$

DELIMITER ;