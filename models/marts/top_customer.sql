with customers as (
    select * from {{ ref('stg_customers') }}
),

top_customers as (
    select 
        customerid,
        count(orderid) as total_orders
    from {{ ref('stg_orders') }}
    group by customerid
)

select
    c.customerid,
    c.customername,
    c.phone,
    c.address || ' ' || c.state as full_address,
    coalesce(tc.total_orders, 0) as total_orders
from customers c
left join top_customers tc
    on c.customerid = tc.customerid
limit 10
