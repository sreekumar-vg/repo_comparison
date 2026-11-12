-- q1 (style change only)
select segment
     , count(*) as customers
from customers
group by segment;

-- q2 (style change only: aliases + layout)
select prod.name
     , sum(line.qty) as units
from order_items line
inner join products prod on line.product_id = prod.product_id
group by prod.name;

-- q3 (LOGIC change: SMB added to the filter)
select customer_id, name
from customers
where segment in ('RETAIL', 'SMB');

-- q4 (LOGIC change: status filter removed, cancelled/pending now included)
select avg(amount) as avg_order_value
from orders;
