-- Number of orders per customer
SELECT c.name, COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.name;
