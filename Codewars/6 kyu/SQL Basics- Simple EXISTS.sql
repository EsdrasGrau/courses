SELECT d.id, d.name
FROM departments AS d
WHERE EXISTS
(SELECT price FROM sales WHERE d.id = sales.department_id AND price > 98);
