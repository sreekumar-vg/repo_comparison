/*
   Customer totals report
   Reformatted to team style guide v2 (lower-case keywords, leading commas)
*/
select
      cust.customer_id
    , cust.name
    , count(ord.order_id) as order_count   -- completed orders only
    , sum(ord.amount)     as total_amount
from customers as cust
join orders as ord on cust.customer_id = ord.customer_id
where ord.status = 'COMPLETED'
group by
      cust.customer_id
    , cust.name
;
