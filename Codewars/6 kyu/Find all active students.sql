-- With sqlite, as sqlite doesn't manage booleans you need to add 1 for true or
-- 0 for false.
SELECT *
FROM students
WHERE IsActive = 1;
