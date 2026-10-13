with joined_table  as (
select 
  p.category,
  p.product_name,
  sum(t.total_amount) as product_revenue
from transactions t
left join products p
on t.product_id = p.product_id
group by category, product_name
),

rnked as (
select 
  *,
  dense_rank() over(partition by category order by product_revenue desc) as rnk 
from joined_table
)

select 
  category,
  product_name,
  product_revenue 
from rnked 
where rnk =1 and category is not null;
