# Databricks notebook source
# MAGIC %md
# MAGIC ## Ingest customers

# COMMAND ----------

dbutils.widgets.text("load_date", "")
catalog = "dev_catalog"
source_path = "abfss://raw@stdevdata.dfs.core.windows.net/customers/"

# COMMAND ----------

df = spark.read.format("parquet").load(source_path)
df = df.filter("status = 'ACTIVE'")
df = df.dropDuplicates(["customer_id"])

# COMMAND ----------

df.write.mode("overwrite").saveAsTable(f"{catalog}.silver.customers")
