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

-- CHAPTER 3
-- Increase rental_rate by one dollar for R-rated movies
UPDATE film
SET rental_rate = rental_rate + 1
WHERE rating = 'R'

UPDATE film
SET rental_rate = rental_rate - 1
WHERE film_id IN
  (SELECT film_id from actor AS a
   INNER JOIN film_actor AS f
      ON a.actor_id = f.actor_id
   WHERE last_name IN ('WILLIS', 'CHASE', 'WINSLET', 'GUINESS', 'HUDSON'));


-- Delete films that cost most than 25 dollars
DELETE FROM film
WHERE replacement_cost > 25;

-- Use the list of film_id values to DELETE all R & NC-17 rated films from inventory.
DELETE FROM inventory
WHERE film_id IN (
  SELECT film_id FROM film
  WHERE rating IN ('R', 'NC-17')
);

-- Delete records from the `film` table that are either rated as R or NC-17.
DELETE FROM film
WHERE rating IN ('R', 'NC-17')

SELECT category AS film_category, 
       AVG(length) AS average_length
FROM film AS f
INNER JOIN category AS c
  ON f.film_id = c.film_id
WHERE release_year BETWEEN 2005
  AND 2010
GROUP BY category;
