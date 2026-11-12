-- Q1 2026 orders
SELECT order_id, order_date, amount
FROM orders
WHERE order_date >= '2026-01-01'
  AND order_date <= '2026-03-31';
