-- Pivot salaries by month
SELECT emp_id,
  MAX(CASE WHEN month = 'Jan' THEN salary END) AS Jan_Salary,
  MAX(CASE WHEN month = 'Feb' THEN salary END) AS Feb_Salary
FROM salaries
GROUP BY emp_id;
