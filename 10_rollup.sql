-- ROLLUP: Salary total by department
SELECT department, SUM(salary)
FROM employees
GROUP BY ROLLUP(department);
