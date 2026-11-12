-- UNION ALL keeps duplicates: customer 2 appears twice
SELECT customer_id FROM customers WHERE segment = 'CORPORATE'
UNION ALL
SELECT customer_id FROM orders WHERE status = 'COMPLETED' GROUP BY customer_id HAVING SUM(amount) > 2000;
