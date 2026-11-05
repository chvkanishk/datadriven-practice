with joined as (
select 
  t.product_id,
  t.quantity, 
  p.category,
  p.product_name,
  sum(t.quantity) as total_quantity
from transactions t
left join products p
  on t.product_id = p.product_id
where t.product_id is not null
group by p.product_name
),

ranked as  
(
select 
  category,
  product_name,
  total_quantity,
  row_number() over(partition by category order by total_quantity desc) as rnk 
from joined
)

select *
from ranked 
where rnk<=2
;
