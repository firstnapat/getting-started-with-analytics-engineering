select 
    average_order_count

from {{ ref('average_orders_per_hour') }}
where 1 < 0
-- where average_order_count < 0