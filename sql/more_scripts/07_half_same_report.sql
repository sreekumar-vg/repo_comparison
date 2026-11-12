-- ===== Weekly management report: 4 queries =====

-- Q1: revenue by order status
SELECT status, COUNT(*) AS orders, SUM(amount) AS revenue
FROM orders
GROUP BY status;

-- Q2: completed revenue by customer country
SELECT c.country, SUM(o.amount) AS revenue
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.country;

-- Q3: top 3 customers by number of ORDERS (metric changed)
SELECT c.name, COUNT(o.order_id) AS metric
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY metric DESC, c.name
LIMIT 3;

-- Q4: cancellation rate, PENDING orders excluded from the denominator
SELECT ROUND(SUM(CASE WHEN status = 'CANCELLED' THEN 1 ELSE 0 END) * 100.0
             / SUM(CASE WHEN status <> 'PENDING' THEN 1 ELSE 0 END), 2) AS cancel_rate_pct
FROM orders;
