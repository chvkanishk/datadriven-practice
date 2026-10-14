with ranked as
(select 
  category,
  product_name,
  price,
  dense_rank() over(partition by category order by price desc) as rnk 
from products
)
select 
  category,
  product_name,
  price
from ranked
where rnk=1
order by category, product_name;
