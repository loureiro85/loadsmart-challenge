copy external.us_cities( ID, STATE_CODE, STATE_NAME, CITY, COUNTY, LATITUDE, LONGITUDE)
from 's3://loadsmart-challenge-loureiro85/us_cities.csv'
iam_role 'arn:aws:iam::123462031101:role/dbt-s3-redshift-loadsmart'
region 'us-east-1'
delimiter ','
ignoreheader 1
acceptinvchars;

copy internal.data_challenge( loadsmart_id, lane, quote_date, book_date, source_date, pickup_date, delivery_date, book_price, source_price, pnl, mileage, equipment_type, carrier_rating, sourcing_channel, vip_carrier, carrier_dropped_us_count, carrier_name, shipper_name, carrier_on_time_to_pickup, carrier_on_time_to_delivery, carrier_on_time_overall, pickup_appointment_time, delivery_appointment_time, has_mobile_app_tracking, has_macropoint_tracking, has_edi_tracking, contracted_load, load_booked_autonomously, load_sourced_autonomously, load_was_cancelled)
from 's3://loadsmart-challenge-loureiro85/DataChallenge.csv'
iam_role 'arn:aws:iam::123462031101:role/dbt-s3-redshift-loadsmart'
region 'us-east-1'
delimiter ','
ignoreheader 1
dateformat as 'auto'
timeformat as 'auto'
trimblanks
removequotes
acceptinvchars;
