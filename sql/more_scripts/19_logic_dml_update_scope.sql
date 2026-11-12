-- Expire stale pending orders placed before April
UPDATE orders
SET status = 'EXPIRED'
WHERE status = 'PENDING'
  AND order_date < '2026-04-01';
-- @check: SELECT order_id, status FROM orders
