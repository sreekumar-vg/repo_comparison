-- Parentheses dropped: AND binds first, so all of customer 2's orders (any status) are included
SELECT order_id, customer_id, status, amount
FROM orders
WHERE status = 'COMPLETED'
  AND amount > 1000 OR customer_id = 2;
