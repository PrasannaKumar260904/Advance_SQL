-- Constraints and Data Types: ENUM
CREATE TABLE status (
  id INT PRIMARY KEY,
  state ENUM('active', 'inactive', 'pending') NOT NULL
);
