-- Dynamic SQL: Execute runtime query
SET @sql = 'SELECT * FROM employees';
PREPARE stmt FROM @sql;
EXECUTE stmt;
