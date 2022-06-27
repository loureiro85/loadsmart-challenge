select 
    split_part(carrier_name, 'Carrier ', 2)::integer as carrier_id,
    carrier_name
from (
    select distinct carrier_name
    from {{ ref('stg_challenge_no_dups') }}
    where carrier_name != ' '
    )
order by carrier_id