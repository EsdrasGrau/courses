SELECT p.*, COUNT(t.name) AS toy_count
FROM people AS p
JOIN toys AS t
ON p.id = t.people_id
GROUP BY p.id;
