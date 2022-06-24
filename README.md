# loadsmart-challenge
Loadsmart - Analytics Engineer - Challenge



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