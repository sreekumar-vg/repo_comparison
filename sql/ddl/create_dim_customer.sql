CREATE TABLE IF NOT EXISTS dev_catalog.gold.dim_customer (
  customer_id BIGINT NOT NULL,
  customer_name STRING,
  credit_limit DECIMAL(10,2),
  created_at TIMESTAMP
) USING DELTA;
