## Overview

This dbt project has educational purpose for Indicium Academy 4th challenge. 

In this project we use Northwind Traders data to create a Data Warehouse. 

Raw data was uploaded to BigQuery by bq command-line tool, with csvs uploaded previously to Google Cloud Storage. There is no automated pipeline using Stitch, because I had already practiced this method before, now the intention is to develop a Singer tap and target to move data from the provided PostgreSQL (which can be treated as the source database) to the BigQuery, using Apache Airflow countinous integration. This is intented to serve as learning for both Singer and Airflow tools. 