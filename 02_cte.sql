-- Common Table Expression (CTE): High Earners
WITH HighEarners AS (
  SELECT name, salary FROM employees WHERE salary > 60000
)
SELECT * FROM HighEarners;
