-- Average completed order value per customer
SELECT customer_id, ROUND(SUM(amount) * 1.0 / COUNT(*), 2) AS avg_value
FROM orders
WHERE status = 'COMPLETED' AND customer_id IS NOT NULL
GROUP BY customer_id;
