-- Sales view
SELECT o.order_id, o.amount, c.customer_name
FROM silver.orders o
JOIN silver.customers c ON o.customer_id = c.customer_id
WHERE o.amount > 0;
