select 
split_part(carrier_name, 'Carrier ', 2) as carrier_id,
carrier_name 
from {{ ref('stg_challenge_no_dups') }}