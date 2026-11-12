-- "Simplified": integer / integer truncates the decimals (762.5 becomes 762)
SELECT customer_id, SUM(amount) / COUNT(*) AS avg_value
FROM orders
WHERE status = 'COMPLETED' AND customer_id IS NOT NULL
GROUP BY customer_id;
