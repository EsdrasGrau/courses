-- Chapter 1

SELECT
  *,
  -- Assign numbers to each row
  ROW_NUMBER()OVER() AS Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;
