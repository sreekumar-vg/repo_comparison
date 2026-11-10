MERGE INTO prd_catalog.silver.orders AS t
USING prd_catalog.bronze.orders_increment AS s
ON t.order_id = s.order_id AND t.line_id = s.line_id
WHEN MATCHED AND s.updated_at > t.updated_at THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *;
