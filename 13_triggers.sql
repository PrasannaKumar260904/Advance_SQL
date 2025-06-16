-- Trigger: Update timestamp before update
CREATE TRIGGER update_timestamp
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.updated_at = NOW();
