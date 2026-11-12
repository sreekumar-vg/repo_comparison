-- Filter moved to WHERE: the LEFT JOIN silently becomes an INNER JOIN
SELECT c.name, COUNT(o.order_id) AS completed_orders
FROM customers c
LEFT JOIN orders o
       ON o.customer_id = c.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.name;
