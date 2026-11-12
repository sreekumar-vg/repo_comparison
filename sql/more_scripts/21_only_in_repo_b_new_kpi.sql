-- New KPI: share of revenue from electronics (added in repo_b)
SELECT ROUND(SUM(CASE WHEN p.category = 'ELECTRONICS' THEN oi.qty * oi.unit_price ELSE 0 END) * 100.0
             / SUM(oi.qty * oi.unit_price), 2) AS electronics_share_pct
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id;
