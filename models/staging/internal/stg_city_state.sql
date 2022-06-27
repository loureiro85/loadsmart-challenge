select 
loadsmart_id,
split_part(lane, ' -> ', 1) as lane_from,
split_part(lane, ' -> ', 2) as lane_to,
split_part(lane_from, ',', 1) as city_from, 
split_part(lane_from, ',', 2) as state_code_from,
split_part(lane_to, ',', 1) as city_to, 
split_part(lane_to, ',', 2) as state_code_to

from {{ ref('stg_challenge_no_dups') }}
