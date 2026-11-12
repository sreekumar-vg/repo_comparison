/* Developer B: same report, different formatting habits */
select cust.CUSTOMER_ID, cust.CUSTOMER_NAME, sum(ord.AMOUNT) total_revenue, count(*) order_count
from prd_catalog.silver.customers as cust
join prd_catalog.silver.orders as ord on cust.customer_id = ord.customer_id
where ord.region in ('APAC','EU','US') and 0 < ord.amount and cust.status = 'ACTIVE'
group by cust.customer_id, cust.customer_name
order by total_revenue asc
