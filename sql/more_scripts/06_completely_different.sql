-- Customer lifetime value ranking
SELECT c.name,
       c.country,
       SUM(o.amount) AS lifetime_value,
       RANK() OVER (ORDER BY SUM(o.amount) DESC) AS value_rank
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.name, c.country;
