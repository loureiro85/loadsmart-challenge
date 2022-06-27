select 
loadsmart_id,
lane_to,
lane_from,
latitude as lat_to,
longitude as long_to
from {{ ref('stg_city_state') }} 
left join {{ ref('stg_us_cities') }} 
on {{ ref('stg_us_cities') }}.city_state={{ ref('stg_city_state') }}.lane_to