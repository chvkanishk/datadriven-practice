with ranked as (
select 
  salary,
  dense_rank() over(order by salary desc) as rnk
from employees
)
select distinct(salary)
from ranked 
where rnk = 2;
