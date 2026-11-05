with totaled as 
(
select 
  user_id,
  total_amount,
  sum(total_amount) as total_spent
from transactions 
group by user_id
),

ranked as (
select 
  user_id,
  total_spent,
  dense_rank() over(order by total_spent desc) as rnk
from totaled  
)

select user_id, total_spent
from ranked 
where rnk= 3;
