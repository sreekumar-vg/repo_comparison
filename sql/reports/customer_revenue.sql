-- Revenue per active customer (developer A style)
SELECT c.customer_id,
       c.customer_name,
       SUM(o.amount)  AS total_revenue,
       COUNT(1)       AS order_count
FROM   dev_catalog.silver.orders o
INNER JOIN dev_catalog.silver.customers c
        ON o.customer_id = c.customer_id
WHERE  c.status = 'ACTIVE'
  AND  o.amount > 0
  AND  o.region IN ('EU', 'US', 'APAC')
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;
