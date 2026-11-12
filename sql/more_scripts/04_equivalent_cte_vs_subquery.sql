-- Same report using derived tables instead of a CTE
SELECT s.customer_id, s.total
FROM (SELECT customer_id, SUM(amount) AS total
      FROM orders
      WHERE customer_id IS NOT NULL AND status = 'COMPLETED'
      GROUP BY customer_id) s
WHERE s.total > (
    SELECT AVG(t.total)
    FROM (SELECT SUM(amount) AS total
          FROM orders
          WHERE customer_id IS NOT NULL AND status = 'COMPLETED'
          GROUP BY customer_id) t
);
