select distinct(lane_from) as location_id
from {{ ref('dim_lane') }}
union
select distinct(lane_to)
from {{ ref('dim_lane') }}

order by location_id    
