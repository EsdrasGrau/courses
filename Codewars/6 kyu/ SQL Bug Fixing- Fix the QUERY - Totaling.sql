SELECT
  DATE(s.transaction_date) as day,
  d.name AS department,
  COUNT(s.id) AS sale_count
  FROM department AS d
    JOIN sale AS s
    on d.id = s.department_id
  group by day, department
  order by day;
