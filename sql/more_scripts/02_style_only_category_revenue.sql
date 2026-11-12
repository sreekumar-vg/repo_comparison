-- Revenue by product category (excluding cancelled orders)
-- CTE renamed, aliases renamed, != used instead of <>, single-line layout
with lines as (select prd.category, itm.qty * itm.unit_price as line_total from order_items itm inner join orders hdr on itm.order_id = hdr.order_id inner join products prd on itm.product_id = prd.product_id where hdr.status != 'CANCELLED')
select category, sum(line_total) as revenue from lines group by category having sum(line_total) > 0;
