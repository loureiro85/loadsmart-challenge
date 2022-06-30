# DBT concepts
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




TODO:
- Draw Solution Architecture


- Create source
- Create models
- Create tests
- Document
- Test unique (columns to use as id)
- Test sources for duplicated rows

