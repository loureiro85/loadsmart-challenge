select 
lane_id,
split_part(lane_id, ' -> ', 1) as lane_from,
split_part(lane_id, ' -> ', 2) as lane_to

from (
    select distinct(lane) as lane_id
    from {{ ref('stg_challenge_no_dups') }}
    order by lane_id
    )
