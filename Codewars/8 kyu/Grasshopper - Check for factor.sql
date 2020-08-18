SELECT id,
CASE
  WHEN base % factor = 0 THEN 'true'::boolean
  ELSE 'false'::boolean END AS res
FROM kata;
