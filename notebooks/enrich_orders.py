# Databricks notebook source
# MAGIC %md
# MAGIC ## Enrich orders (developer A)

# COMMAND ----------

from pyspark.sql import functions as F

orders = spark.table("dev_catalog.silver.orders")
orders = orders.filter(F.col("amount") > 0)  # drop refunds
orders = orders.withColumn("net_amount", F.col("amount") - F.col("discount"))

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT order_id, net_amount FROM dev_catalog.silver.orders_enriched WHERE net_amount > 100
