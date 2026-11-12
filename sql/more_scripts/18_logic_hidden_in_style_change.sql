/* ------------------------------------------------------------
   high_value_customers.sql
   Refactor: style guide v2, clearer aliases, documentation.
   No functional change intended.
   ------------------------------------------------------------ */
select
      cst.customer_id
    , cst.name
    , sum(ord.amount) as total_spend      -- completed orders only
from customers cst
inner join orders ord
        on ord.customer_id = cst.customer_id
where ord.status = 'COMPLETED'
group by
      cst.customer_id
    , cst.name
having sum(ord.amount) > 1525             -- threshold
;
