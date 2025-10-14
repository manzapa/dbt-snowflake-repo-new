select
    c.customerid,
    c.customername,
    c.phone,
    c.address || ' ' || c.state as full_address,
    count(o.orderid) as total_orders
from {{ ref('stg_customers') }} c
join {{ ref('stg_orders') }} o
    on c.customerid = o.customerid
group by
    c.customerid,
    c.customername,
    c.phone,
    c.address,
    c.state
order by
    total_orders desc
limit 20
