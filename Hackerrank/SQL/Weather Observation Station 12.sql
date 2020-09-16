SELECT city
FROM STATION
WHERE UPPER(LEFT(city,1)) NOT IN ('A', 'E', 'I', 'O', 'U')
  AND UPPER(RIGHT(city,1)) NOT IN ('A', 'E', 'I', 'O', 'U')
GROUP BY city
ORDER BY city ASC;
