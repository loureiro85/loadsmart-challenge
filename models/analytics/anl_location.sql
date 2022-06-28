select
    -- pickup_month,
    -- pickup_state,
    -- pickup_weekday,
    -- delivery_state,
    sum(pnl) as total_pnl,
    sum(book_price) as total_book_price,
    avg(pnl_percent) as avg_pnl_percent,
    count(*) as load_count
from {{ ref('fct_full') }}

group by pickup_state