SELECT customer_id,
       SUM(amount) AS total,
       CASE WHEN SUM(amount) >= 2000 THEN 'GOLD'
            WHEN SUM(amount) >= 1000 THEN 'SILVER'
            ELSE 'BRONZE' END AS tier
FROM orders
WHERE status = 'COMPLETED' AND customer_id IS NOT NULL
GROUP BY customer_id;
