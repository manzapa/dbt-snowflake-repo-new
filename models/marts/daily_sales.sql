
select
    purchased_date,
    sum(quantity) as no_items_sold,         -- total items sold per day
    sum(quantity * price) as total_sales   -- total revenue per day
from {{ ref('stg_orderitems') }}
group by purchased_date
order by purchased_date desc
