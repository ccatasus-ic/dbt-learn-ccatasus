select  o.order_id
        ,o.customer_id
        ,SUM(p.amount) as total_amount
from    {{ ref('stg_orders') }} as o
        inner join {{ ref('stg_payments') }} as p
            on o.order_id = p.order_id
where   p.status = 'success'
group by
        o.order_id
        ,o.customer_id