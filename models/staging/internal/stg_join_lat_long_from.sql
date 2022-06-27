select 
loadsmart_id,

lane_from,
latitude as lat_from,
longitude as long_from,

lane_to,
lat_to,
long_to

from {{ ref('stg_join_lat_long_to') }} 
left join {{ ref('stg_us_cities') }} 
on {{ ref('stg_us_cities') }}.city_state={{ ref('stg_join_lat_long_to') }}.lane_from