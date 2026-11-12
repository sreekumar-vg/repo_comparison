# Databricks notebook source
# MAGIC %md
# MAGIC ## Order enrichment - refactored by developer B

# COMMAND ----------

from pyspark.sql import functions as F

orders = spark.table('prd_catalog.silver.orders')
orders = (orders
          .where(col('amount') > 0))
orders = orders.withColumn('net_amount', col('amount') - col('discount'))

# COMMAND ----------

# MAGIC %sql
# MAGIC select order_id,
# MAGIC        net_amount
# MAGIC from   prd_catalog.silver.orders_enriched
# MAGIC where  100 < net_amount;
