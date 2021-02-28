-- Calculate revenue
SELECT 
  SUM(meal_price * order_quantity) AS revenue
  FROM meals
  JOIN orders 
  ON meals.meal_id = orders.meal_id
-- Keep only the records of customer ID 15
WHERE user_id = 15;

SELECT 
  DATE_TRUNC('week', order_date) :: DATE AS delivr_week,
  -- Calculate revenue
  SUM(meal_price * order_quantity) AS revenue
  FROM meals
  JOIN orders 
  ON meals.meal_id = orders.meal_id
-- Keep only the records in June 2018
WHERE order_date BETWEEN '2018-06-01' AND '2018-06-30'
GROUP BY delivr_week
ORDER BY delivr_week ASC;

WITH cost_and_quantities AS (
SELECT
    meals.meal_id,
    SUM(stocked_quantity) AS quantity,
    SUM(meal_cost * stocked_quantity) AS cost
FROM meals
JOIN stock
ON meals.meal_id = stock.meal_id
GROUP BY meals.meal_id
)

SELECT
    SUM(cost)
FROM cost_and_quantities



SELECT
  -- Calculate cost per meal ID
  meals.meal_id,
  SUM(meal_cost * stocked_quantity) AS cost
FROM meals
JOIN stock 
ON meals.meal_id = stock.meal_id
GROUP BY meals.meal_id
ORDER BY cost DESC
-- Only the top 5 meal IDs by purchase cost
LIMIT 5;

-- 1 of 3
/* Alice wants to know how much Delivr spent per month on average during its early months (before September 2018). You'll need to write two queries to solve this problem:

A query to calculate cost per month, wrapped in a CTE,
A query that averages monthly cost before September 2018 by referencing the CTE.
*/

-- 1
SELECT
  -- Calculate cost
  DATE_TRUNC('month', stocking_date)::DATE AS delivr_month,
  SUM(meal_cost * stocked_quantity) AS cost
FROM meals
JOIN stock 
ON meals.meal_id = stock.meal_id
GROUP BY delivr_month
ORDER BY delivr_month ASC;

-- 2
-- Declare a CTE named monthly_cost
WITH monthly_cost AS (
  SELECT
    DATE_TRUNC('month', stocking_date)::DATE AS delivr_month,
    SUM(meal_cost * stocked_quantity) AS cost
  FROM meals
  JOIN stock ON meals.meal_id = stock.meal_id
  GROUP BY delivr_month)

SELECT *
FROM monthly_cost;

-- 3
-- Declare a CTE named monthly_cost
WITH monthly_cost AS (
  SELECT
    DATE_TRUNC('month', stocking_date)::DATE AS delivr_month,
    SUM(meal_cost * stocked_quantity) AS cost
  FROM meals
  JOIN stock ON meals.meal_id = stock.meal_id
  GROUP BY delivr_month)

SELECT
  -- Calculate the average monthly cost before September
  AVG(cost)
FROM monthly_cost
WHERE delivr_month < '2018-09-01';


-- Calculate revenue per eatery in the revenue CTE.
-- Calculate cost per eatery in the cost CTE.
-- Join the two CTEs and calculate profit per eatery.
WITH revenue AS (
  -- Calculate revenue per eatery
  SELECT 
     meals.eatery,
     SUM(meal_price * order_quantity) AS revenue
    FROM meals
    JOIN orders 
    ON meals.meal_id = orders.meal_id
   GROUP BY eatery),

  cost AS (
  -- Calculate cost per eatery
  SELECT 
     meals.eatery,
     SUM(meal_cost * stocked_quantity) AS cost
    FROM meals
    JOIN stock ON meals.meal_id = stock.meal_id
   GROUP BY eatery)

   -- Calculate profit per eatery
   SELECT 
     revenue.eatery,
     revenue - cost AS profit
     FROM revenue
     JOIN cost 
     ON revenue.eatery = cost.eatery
    ORDER BY profit DESC;

--Calculate revenue per month in the revenue CTE.
--Calculate cost per month in the cost CTE.
--Join the two CTEs and calculate profit per month.
-- Set up the revenue CTE
WITH revenue AS ( 
	SELECT
		DATE_TRUNC('month', order_date) :: DATE AS delivr_month,
		SUM(meal_price * order_quantity) AS revenue
	FROM meals
	JOIN orders 
	ON meals.meal_id = orders.meal_id
	GROUP BY delivr_month),
-- Set up the cost CTE
  cost AS (
 	SELECT
		DATE_TRUNC('month', stocking_date) :: DATE AS delivr_month,
		SUM(meal_cost * stocked_quantity) AS cost
	FROM meals
    JOIN stock ON meals.meal_id = stock.meal_id
	GROUP BY delivr_month)
-- Calculate profit by joining the CTEs
SELECT
	revenue.delivr_month,
	revenue - cost AS profit
FROM revenue
JOIN cost 
ON revenue.delivr_month = cost.delivr_month
ORDER BY revenue.delivr_month ASC;