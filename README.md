# loadsmart-challenge
Loadsmart - DENB - Analytics Engineer - 2002 Challenge



# 06-29

README.md with the steps necessary to test your proposed solution:
- [GitHub](https://github.com/loureiro85/loadsmart-challenge)
- Check dashboard on [link]
- DataWarehouse screenshot

Disclaimer:
- First version of the ELT process and dashboard. There surely is room for improvement. Feedback is welcomed.

Next steps:
- Collect feedback from Loadsmart experts
  - Analytics Engineer - To validate and learn best practices
  - Data Analyst - To understand value
  - Data Engineer - To understand data infrastructure and available data

- Apply Loadsmart best practices, regarding:
  - project structure
  - database schema
  - naming
  - testing
  - commit
  - documentation
  - analytics dataset
  - dashboard connection

# Challenge Process
Challenge Process:
1. Data Understanding - Jupyter Notebook
2. Data Infrastructure provisioning - AWS S3, Redshift, Security Groups, CloudFormation
3. Data Modeling - DBT cloud
4. Data Visualization - Google Data Studio

## 1. Data Understanding
Data understanding was based on exploring the provided CSV file with Jupyter Notebooks (`notebooks`).

## 2. Data Infrastructure Provisioning

- Provision S3 bucket, Redshift cluster, Security Groups, etc. with DBT CloudFormation template (`cloud_formation_templates/create-dbtworkshop-infr.yml`)
- Load CSV files to S3 bucket (`data/raw`). * Data folder would normally be ignored from git. It`s synchronized for the ease of sharing in the context of this challenge.
- Create database schemas, namely `internal` and `external` (`extract_load/create_schemas.sql`)
- Create tables (`extract_load/create_table.sql`)
- Copy data from CSV in S3 to tables in Redshift (`extract_load/copy_from_s3.sql`)

## 3. Data Modeling
Data was modeled with DBT source and model files (`.sql` and `.yml` in `/models`).

Additional sources were added, namely:
- us_cities.csv - containing latitude and longitude coordinates (among other fields) for US cities
- calendar.csv

## 4. Data Visualization
Analyzes were created based on dimensions.
The following analyzes were made:
- Pickup State
- Lane
- Weekday
- Delay
- Time
- Equipment
- Carrier Rating