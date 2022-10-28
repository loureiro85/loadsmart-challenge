unload ('SELECT * FROM "loadsmart"."analytics"."anl_location";')
to 's3://loadsmart-challenge-loureiro85/anl_location_'
iam_role 'arn:aws:iam::123462031101:role/dbt-s3-redshift-loadsmart'
parallel off
delimiter ','
header;