-- Customers with at least one completed order
SELECT customer_id, name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE status = 'COMPLETED');
