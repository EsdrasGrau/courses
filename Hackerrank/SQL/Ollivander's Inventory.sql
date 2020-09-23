SELECT w.id, p.age, w.coins_needed, w.power
FROM wands AS w
INNER JOIN wands_property AS p
ON w.code = p.code
WHERE p.is_evil = 0 AND w.coins_needed =
    (SELECT MIN(coins_needed)
     FROM wands as w1
        INNER JOIN wands_property as p1 on w1.code = p1.code
     WHERE w1.power = w.power AND p1.age=p.age)
ORDER BY w.power DESC, p.age DESC;
