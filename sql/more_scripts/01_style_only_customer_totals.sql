-- Completed order count and total per customer
SELECT c.customer_id,
       c.name,
       COUNT(o.order_id) AS order_count,
       SUM(o.amount)     AS total_amount
FROM customers c
INNER JOIN orders o
        ON o.customer_id = c.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name;
