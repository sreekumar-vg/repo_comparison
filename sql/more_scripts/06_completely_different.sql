-- Product catalogue: units sold and items never ordered
SELECT p.product_id,
       p.name,
       p.category,
       COALESCE(SUM(oi.qty), 0) AS units_sold,
       CASE WHEN SUM(oi.qty) IS NULL THEN 'NEVER_ORDERED' ELSE 'ACTIVE' END AS product_status
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name, p.category;
