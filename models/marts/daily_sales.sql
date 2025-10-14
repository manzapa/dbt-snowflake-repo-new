
select
    purchased_date,
    sum(quantity) as no_items_sold,         -- total items sold /day
    sum(quantity * price) as total_sales   -- total rev /day
from {{ ref('stg_orderitems') }}
group by purchased_date
order by purchased_date desc
