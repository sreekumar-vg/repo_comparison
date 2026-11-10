-- Remove duplicate records keeping the latest version
CREATE OR REPLACE TEMP VIEW dedup_orders AS
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY updated_at DESC) AS rn
  FROM silver.orders
) WHERE rn = 1;
