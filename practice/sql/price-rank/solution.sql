select
  product_name,
  category,
  price,
  dense_rank() over(partition by category order by price desc) as position 
from products
where price is not null;
