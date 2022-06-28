select 
    year_month as pickup_month,
    weekday_name as pickup_weekday,
    -- pickup_state,
    -- delivery_state,
    round((pnl/book_price) * 100, 1) as pnl_percent,
    *

from {{ ref('fct_pre_processed') }}

left join {{ ref('dim_lane') }}
on {{ ref('fct_pre_processed') }}.lane={{ ref('dim_lane') }}.lane_id

left join {{ ref('dim_calendar') }}
on date({{ ref('fct_pre_processed') }}.pickup_date) = {{ ref('dim_calendar') }}.date

where book_price > 0

order by pickup_month