select 
split_part(shipper_name, 'Shipper ', 2) as shipper_id,
shipper_name 
from {{ ref('stg_challenge_no_dups') }}