-- Temporary Table: High salary employees
CREATE TEMPORARY TABLE temp_emp AS
SELECT * FROM employees WHERE salary > 60000;
