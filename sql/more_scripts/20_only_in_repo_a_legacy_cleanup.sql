-- Legacy: list zero-amount cancelled orders for cleanup (removed in repo_b)
SELECT order_id FROM orders WHERE status = 'CANCELLED' AND amount = 0;
