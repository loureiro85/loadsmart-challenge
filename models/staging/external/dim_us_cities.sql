select *,

city || ',' ||state_code as city_state

 from {{ source('external', 'us_cities') }}