select distinct(pickup_location) as location_id
from {{ ref('dim_lane') }}
union
select distinct(delivery_location)
from {{ ref('dim_lane') }}

order by location_id    
