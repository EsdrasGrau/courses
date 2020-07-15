SELECT d.id, d.name
FROM departments AS d
WHERE d.id IN
 (SELECT department_id
  FROM sales
  WHERE price > 98);
