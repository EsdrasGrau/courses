SELECT race, COUNT(race)
FROM demographics
GROUP BY race
ORDER BY race DESC;
