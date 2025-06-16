-- Subquery: Employees earning more than average
SELECT name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
