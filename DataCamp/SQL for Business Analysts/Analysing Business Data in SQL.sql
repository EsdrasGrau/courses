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

