-- NTILE Percentile: Salary Quartiles
SELECT name, salary, NTILE(2) OVER (ORDER BY salary DESC) AS quartile
FROM employees;
