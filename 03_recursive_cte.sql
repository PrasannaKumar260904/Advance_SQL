-- Recursive CTE: Generate numbers from 1 to 5
WITH RECURSIVE nums AS (
  SELECT 1 AS num
  UNION ALL
  SELECT num + 1 FROM nums WHERE num < 5
)
SELECT * FROM nums;
