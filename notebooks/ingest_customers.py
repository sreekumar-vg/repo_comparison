# Databricks notebook source
# MAGIC %md
# MAGIC ## Ingest customers

# COMMAND ----------

dbutils.widgets.text("load_date", "")
catalog = "prd_catalog"
source_path = "abfss://raw@stprddata.dfs.core.windows.net/customers/"

# COMMAND ----------

df = spark.read.format("parquet").load(source_path)
df = df.filter("status IN ('ACTIVE', 'PENDING')")
df = df.dropDuplicates(["customer_id"])

# COMMAND ----------

df.write.mode("append").saveAsTable(f"{catalog}.silver.customers")
