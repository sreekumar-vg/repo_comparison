-- Customers to invite: corporate OR completed spend over 2000
SELECT customer_id FROM customers WHERE segment = 'CORPORATE'
UNION
SELECT customer_id FROM orders WHERE status = 'COMPLETED' GROUP BY customer_id HAVING SUM(amount) > 2000;
