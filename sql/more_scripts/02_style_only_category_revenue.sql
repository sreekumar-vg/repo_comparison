WITH item_revenue AS (
    SELECT p.category, oi.qty * oi.unit_price AS line_total
    FROM order_items oi
    JOIN orders o   ON o.order_id = oi.order_id
    JOIN products p ON p.product_id = oi.product_id
    WHERE o.status <> 'CANCELLED'
)
SELECT category, SUM(line_total) AS revenue
FROM item_revenue
GROUP BY category
HAVING SUM(line_total) > 0;
