MERGE INTO dev_catalog.silver.orders AS t
USING dev_catalog.bronze.orders_increment AS s
ON t.order_id = s.order_id
WHEN MATCHED THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *;
