with ranked as (
select
  amount,
  dense_rank() over(order by amount desc) as rnk
from cloud_costs
)
select 
  distinct(amount)
from ranked
where rnk=2;
