with store_count as (
    select
        o.storeid,
        count(o.orderid) as total_orders
    from {{ ref('stg_orders') }} o
    group by o.storeid
)

select 
    sc.total_orders,
    s.storename,
    s.storeaddress,
    s.phone
from store_count sc
left join {{ ref('stg_stores') }} s
    on sc.storeid = s.storeid
order by sc.total_orders desc
limit 5  --get top 5 as i only have 10 stores in table