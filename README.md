
# Advanced_SQL

**Advanced SQL Topics with Input and Output Table Examples**

---

## 1. Window Functions  
**Input Table: `employees`**

| id | name  | department | salary |
|----|-------|------------|--------|
| 1  | Alice | HR         | 60000  |
| 2  | Bob   | HR         | 50000  |
| 3  | Carol | IT         | 70000  |
| 4  | Dave  | IT         | 80000  |

**Query:**

```sql
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM employees;
```

**Output Table:**

| name  | department | salary | rank |
|-------|------------|--------|------|
| Alice | HR         | 60000  | 1    |
| Bob   | HR         | 50000  | 2    |
| Dave  | IT         | 80000  | 1    |
| Carol | IT         | 70000  | 2    |

---

## 2. Common Table Expressions (CTE)

**Query:**

```sql
WITH HighEarners AS (
  SELECT name, salary FROM employees WHERE salary > 60000
)
SELECT * FROM HighEarners;
```

**Output Table:**

| name  | salary |
|-------|--------|
| Carol | 70000  |
| Dave  | 80000  |

---

## 3. Recursive CTE

**Query:**

```sql
WITH RECURSIVE nums AS (
  SELECT 1 AS num
  UNION ALL
  SELECT num + 1 FROM nums WHERE num < 5
)
SELECT * FROM nums;
```

**Output Table:**

| num |
|-----|
| 1   |
| 2   |
| 3   |
| 4   |
| 5   |

---

## 4. Subqueries

**Query:**

```sql
SELECT name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

**Output Table:**

| name  |
|-------|
| Carol |
| Dave  |

---

## 5. Set Operations  
**Input Tables:**

**emp1**

| name  |
|-------|
| Alice |
| Bob   |

**emp2**

| name  |
|-------|
| Bob   |
| Carol |

**Query (INTERSECT):**

```sql
SELECT name FROM emp1
INTERSECT
SELECT name FROM emp2;
```

**Output Table:**

| name |
|------|
| Bob  |

---

## 6. Pivoting  
**Input Table: `salaries`**

| emp_id | month | salary |
|--------|-------|--------|
| 1      | Jan   | 3000   |
| 1      | Feb   | 3200   |

**Query:**

```sql
SELECT emp_id,
  MAX(CASE WHEN month = 'Jan' THEN salary END) AS Jan_Salary,
  MAX(CASE WHEN month = 'Feb' THEN salary END) AS Feb_Salary
FROM salaries
GROUP BY emp_id;
```

**Output Table:**

| emp_id | Jan_Salary | Feb_Salary |
|--------|------------|------------|
| 1      | 3000       | 3200       |

---

## 7. JSON Functions  
**Input Table: `products`**

| id | details                       |
|----|-------------------------------|
| 1  | {"price":100, "brand":"Nike"} |

**Query:**

```sql
SELECT JSON_EXTRACT(details, '$.brand') AS brand FROM products;
```

**Output Table:**

| brand |
|-------|
| "Nike" |

---

## 8. Advanced Joins  
**Query (Anti Join):**

```sql
SELECT a.id FROM A a
LEFT JOIN B b ON a.id = b.id
WHERE b.id IS NULL;
```

Use Case: Find items in A not present in B.

---

## 9. Ranking and Percentiles

**Query:**

```sql
SELECT name, salary, NTILE(2) OVER (ORDER BY salary DESC) AS quartile
FROM employees;
```

**Output Table:**

| name  | salary | quartile |
|-------|--------|----------|
| Dave  | 80000  | 1        |
| Carol | 70000  | 1        |
| Alice | 60000  | 2        |
| Bob   | 50000  | 2        |

---

## 10. ROLLUP

**Query:**

```sql
SELECT department, SUM(salary)
FROM employees
GROUP BY ROLLUP(department);
```

**Output Table:**

| department | SUM(salary) |
|------------|-------------|
| HR         | 110000      |
| IT         | 150000      |
| NULL       | 260000      |

---

## 11. Temporary Table

**Query:**

```sql
CREATE TEMPORARY TABLE temp_emp AS
SELECT * FROM employees WHERE salary > 60000;
```

---

## 12. Execution Plan

**Query:**

```sql
EXPLAIN SELECT * FROM employees WHERE salary > 50000;
```

Output Table: Execution plan with index usage.

---

## 13. Triggers

```sql
CREATE TRIGGER update_timestamp
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.updated_at = NOW();
```

---

## 14. Stored Procedures

```sql
DELIMITER //
CREATE PROCEDURE GetHighEarners()
BEGIN
  SELECT * FROM employees WHERE salary > 60000;
END //
DELIMITER ;
```

---

## 15. Transactions

```sql
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

---

## 16. Error Handling

```sql
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
  ROLLBACK;
END;
```

---

## 17. Performance Optimization

Use indexed columns in `WHERE`, avoid `SELECT *`, use `LIMIT`, analyze with `EXPLAIN`.

---

## 18. Materialized Views

```sql
CREATE MATERIALIZED VIEW emp_summary AS
SELECT department, AVG(salary) FROM employees GROUP BY department;
```

---

## 19. Dynamic SQL

```sql
SET @sql = 'SELECT * FROM employees';
PREPARE stmt FROM @sql;
EXECUTE stmt;
```

---

## 20. Constraints & Data Types

```sql
CREATE TABLE status (
  id INT PRIMARY KEY,
  state ENUM('active', 'inactive', 'pending') NOT NULL
);
```

---

**Feel free to fork and contribute by adding more advanced SQL concepts or improving examples!**
