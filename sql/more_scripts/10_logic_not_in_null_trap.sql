-- Customers who never ordered
-- BUG: returns no rows because orders.customer_id contains a NULL
SELECT customer_id, name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);
