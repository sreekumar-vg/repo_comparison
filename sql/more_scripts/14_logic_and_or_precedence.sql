-- Completed orders that are large OR belong to customer 2
SELECT order_id, customer_id, status, amount
FROM orders
WHERE status = 'COMPLETED'
  AND (amount > 1000 OR customer_id = 2);
