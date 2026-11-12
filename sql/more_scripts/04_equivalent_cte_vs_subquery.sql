-- Customers whose completed spend is above the average customer spend
WITH spend AS (
    SELECT customer_id, SUM(amount) AS total
    FROM orders
    WHERE status = 'COMPLETED' AND customer_id IS NOT NULL
    GROUP BY customer_id
)
SELECT customer_id, total
FROM spend
WHERE total > (SELECT AVG(total) FROM spend);
