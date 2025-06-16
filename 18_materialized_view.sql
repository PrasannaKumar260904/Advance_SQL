-- Materialized View: Salary summary
CREATE MATERIALIZED VIEW emp_summary AS
SELECT department, AVG(salary) FROM employees GROUP BY department;
