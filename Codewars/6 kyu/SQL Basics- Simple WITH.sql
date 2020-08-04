WITH special_sales AS (
  SELECT
    *
  FROM sales
  WHERE price > 90)

SELECT d.id, d.name
FROM departments AS d
JOIN special_sales
ON d.id = special_sales.department_id
GROUP BY d.id
ORDER BY d.id;
