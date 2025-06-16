-- Anti Join: Find records in A not in B
SELECT a.id FROM A a
LEFT JOIN B b ON a.id = b.id
WHERE b.id IS NULL;
