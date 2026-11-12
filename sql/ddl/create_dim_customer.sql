CREATE TABLE IF NOT EXISTS prd_catalog.gold.dim_customer (
  customer_id BIGINT NOT NULL,
  customer_name STRING,
  credit_limit DECIMAL(18,2),
  segment STRING,
  created_at TIMESTAMP
) USING DELTA;
