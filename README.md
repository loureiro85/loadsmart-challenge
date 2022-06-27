# loadsmart-challenge
Loadsmart - Analytics Engineer - Challenge

Loose ideas:
- ETL -> ELT
  - EL extract from csv file and load to Data Warehouse
  - T - Transform with DBT, based on the model created within a notebook

- tables naming - prefixes:
  - dim - dim_shippers etc.
  - stg - stg_customers

- models: modular piece of logic

# Concepts
## Dimensions
"""Dimensions provide the “who, what, where, when, why, and how” context surrounding a business process event. Dimension tables contain the descriptive attributes used by BI applications for ﬁltering and grouping the facts. With the grain of a fact table ﬁrmly in mind, all the possible dimensions can be identiﬁed. Whenever possible, a dimension should be single valued when associated with a given fact row.
""" [https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/dimensions-for-context/]

## Facts for measurement
"""Facts are the measurements that result from a business process event and are almost always numeric. A single fact table row has a one-to-one relationship to a measurement event as described by the fact table’s grain. Thus a fact table corresponds to a physical observable event, and not to the demands of a particular report. Within a fact table, only facts consistent with the declared grain are allowed. For example, in a retail sales transaction, the quantity of a product sold and its extended price are good facts, whereas the store manager’s salary is disallowed.
"""
[https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/facts-for-measurement/]


Other references (from Kimball)[https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/]

## DBT concepts
Source, Staging, Intermediate, Fact, Dimension
folders: models/marts models/staging/source_name

# Data Analyst requirements
Here is an hypothetical scenario where a Data Analyst wants to perform the following investigation:
1. what factors explain the carrier rating `carrier_rating`

# Steps
Steps:
1. Create this repo
2. Create and activate virtual environment:
   1. `pyenv virtualenv 3.10.0 loadsmart_3.10.0`
   2. `pyenv local loadsmart_3.10.0`
3. Install packages:
   1. Pandas
   2. Cloudformation linter `pip install cfn-lint`
4. Copy challenge pdf (to /docs) and csv (/data/raw) from email
5. Set up Data Warehouse:
   1. (Tutorial)[https://docs.getdbt.com/guides/getting-started/getting-set-up/setting-up-redshift]
   2. Copy AWS Redshift Cloudformation (template)[https://github.com/aws-samples/aws-modernization-with-dbtlabs/blob/main/resources/cloudformation/create-dbtworkshop-infr] to `create-dbtworkshop-infr.yaml`
6. Data modelling
   1. Data understanding notebook
   2. Identify dimensions and facts
   3. Remove duplicated columns and rows
   4. Separate tables in dimensions and fact table. What is the fact itself? It is the load being carried.
7. Create DataWarehouse stack
   1. Create based on the (tutorial)[https://docs.getdbt.com/guides/getting-started/getting-set-up/setting-up-redshift] based on the following (CloudFormation template)[https://github.com/aws-samples/aws-modernization-with-dbtlabs/blob/main/resources/cloudformation/create-dbtworkshop-infr]
   2. (Template diagram)[docs/redshift_cloudformation_diagram.png]
   3. AWS CloudFormation Stack Name: `dbt-workshop`
   4. 26 AWS resources were created. Among them, the most relevant are:
      1. AWS::Redshift::Cluster `dbtRedshiftCluster`
      2. AWS::S3::Bucket `DataLakeBucket` `s3://dbt-data-lake-123462031101`
8. Access Redshift:
   1. create schemas:
      ```
      create schema if not exists jaffle_shop;
      create schema if not exists stripe;
      ```
   2. create tables:
      ```
      create table jaffle_shop.customers(
        id integer,
        first_name varchar(50),
        last_name varchar(50)
      );

      create table jaffle_shop.orders(
        id integer,
        user_id integer,
        order_date date,
        status varchar(50),
        _etl_loaded_at timestamp default current_timestamp
      );

      create table stripe.payment(
        id integer,
        orderid integer,
        paymentmethod varchar(50),
        status varchar(50),
        amount integer,
        created date,
        _batched_at timestamp default current_timestamp
      );
      ```
   3. copy data from S3: run query from `copy_data_from_s3.sql`
   4. check select * from each table:
      ```
      select * from jaffle_shop.customers;
      select * from jaffle_shop.orders;
      select * from stripe.payment;
      ```
   5. At this point, a Redshift instance was created and training data was loaded to it from S3.



TODO:
- Draw Solution Architecture
- Finish DBT Course
- Implement model in DBT
- Implement generic tests



- Create source
- Create models
- Create tests
- Document
- Test unique (columns to use as id)
- Test sources for duplicated rows

- First transformation std_raw_no_dups
- Doc block acceptable values

- https://www.flerlagetwins.com/2021/09/calendar-table.html#:~:text=With%20a%20calendar%20table%2C%20we,just%20a%20simple%20join%2Frelationship.

- order by shipper_id and carrier_id