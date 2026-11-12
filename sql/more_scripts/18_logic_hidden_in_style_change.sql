-- High-value customers: completed spend of at least 1525
SELECT c.customer_id,
       c.name,
       SUM(o.amount) AS total_spend
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name
HAVING SUM(o.amount) >= 1525;
