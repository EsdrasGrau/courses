SELECT city AS c, length(city) AS l
FROM   station
ORDER BY l DESC, c ASC
LIMIT 1;

SELECT city AS c, length(city) AS l
FROM   station
ORDER BY l ASC, c ASC
LIMIT 1;
