copy jaffle_shop.customers( id, first_name, last_name)
from 's3://dbt-data-lake-123462031101/jaffle_shop_customers.csv'
iam_role 'arn:aws:iam::123462031101:role/dbt-workshop-dbtRedshiftSpectrumRole-18UYF038YGC1U'
region 'us-east-1'
delimiter ','
ignoreheader 1
acceptinvchars;

copy jaffle_shop.orders(id, user_id, order_date, status)
from 's3://dbt-data-lake-123462031101/jaffle_shop_orders.csv'
iam_role 'arn:aws:iam::123462031101:role/dbt-workshop-dbtRedshiftSpectrumRole-18UYF038YGC1U'
region 'us-east-1'
delimiter ','
ignoreheader 1
acceptinvchars;

copy stripe.payment(id, orderid, paymentmethod, status, amount, created)
from 's3://dbt-data-lake-123462031101/stripe_payments.csv'
iam_role 'arn:aws:iam::123462031101:role/dbt-workshop-dbtRedshiftSpectrumRole-18UYF038YGC1U'
region 'us-east-1'
delimiter ','
ignoreheader 1
Acceptinvchars;
