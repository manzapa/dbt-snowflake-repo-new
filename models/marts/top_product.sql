--display top 10 selling products
select
    p.productid,
    p.product_name,
    sum(oi.quantity) as total_quantity_sold,           -- total items sold
    sum(oi.quantity * oi.price) as total_sales_amount  -- total rev
from {{ ref('stg_orderitems') }} oi
join {{ ref('stg_productname') }} p
    on oi.productid = p.productid
group by
    p.productid,
    p.product_name
order by
    total_sales_amount desc  
limit 10                   
