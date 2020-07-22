SELECT capital
FROM countries
WHERE continent IN ('Africa','Afrika')  AND country LIKE 'E%'
ORDER BY capital
LIMIT 3;
