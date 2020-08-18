SELECT id,
CASE
  WHEN base % factor = 0 THEN 'true'::boolean
  ELSE 'false'::boolean END AS res
FROM kata;
-- other solution

select id, base % factor = 0 as res from kata

--
SELECT id, MOD(base, factor) = 0 AS res FROM kata;
