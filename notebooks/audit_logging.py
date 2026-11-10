# Databricks notebook source
spark.sql('INSERT INTO prd_catalog.audit.run_log SELECT current_timestamp(), "orders"')
