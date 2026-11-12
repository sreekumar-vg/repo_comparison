-- Q1: number of customers per segment
SELECT segment, COUNT(*) AS customers
FROM customers
GROUP BY segment;

-- Q2: units sold per product
SELECT p.name, SUM(oi.qty) AS units
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.name;

-- Q3: retail customers only
SELECT customer_id, name
FROM customers
WHERE segment = 'RETAIL';

-- Q4: average completed order value
SELECT AVG(amount) AS avg_order_value
FROM orders
WHERE status = 'COMPLETED';
