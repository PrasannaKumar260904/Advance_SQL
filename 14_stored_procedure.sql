-- Stored Procedure: Get High Earners
DELIMITER //
CREATE PROCEDURE GetHighEarners()
BEGIN
  SELECT * FROM employees WHERE salary > 60000;
END //
DELIMITER ;
