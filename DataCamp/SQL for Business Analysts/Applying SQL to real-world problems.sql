SELECT c.first_name,
	     c.last_name,
       p.amount
FROM payment AS p
INNER JOIN customer AS c
  ON p.customer_id = c.customer_id
WHERE active = true
ORDER BY p.amount DESC;

SELECT active, 
       COUNT(p.payment_id) AS num_transactions, 
       AVG(p.amount) AS avg_amount, 
       SUM(p.amount) AS total_amount
FROM payment AS p
INNER JOIN customer AS c
  ON p.customer_id = c.customer_id
GROUP BY active;

SELECT name, 
	STRING_AGG(title, ',') AS film_titles
FROM film AS f
INNER JOIN language AS l
  ON f.language_id = l.language_id
WHERE release_year = 2010
  AND rating = 'G'
GROUP BY name;