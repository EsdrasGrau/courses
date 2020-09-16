SELECT ROUND(AVG(salary),0) - ROUND(AVG(REPLACE(salary, '0', '')),0)
FROM employees;
