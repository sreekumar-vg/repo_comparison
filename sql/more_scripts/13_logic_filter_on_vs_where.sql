-- All customers with their completed order count (0 if none)
SELECT c.name, COUNT(o.order_id) AS completed_orders
FROM customers c
LEFT JOIN orders o
       ON o.customer_id = c.customer_id
      AND o.status = 'COMPLETED'
GROUP BY c.name;
