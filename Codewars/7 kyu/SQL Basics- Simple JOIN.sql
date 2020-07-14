SELECT p.id, p.name, isbn, company_id, price, c.name AS company_name
FROM products AS p
INNER JOIN companies AS c
ON p.company_id = c.id;
