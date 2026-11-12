-- COUNT(*) counts the NULL row produced by the LEFT JOIN, so customers with no orders show 1
SELECT c.name, COUNT(*) AS order_count
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.name;
