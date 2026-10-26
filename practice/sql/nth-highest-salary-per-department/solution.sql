with rnk as (
select 
  department,
  emp_name,
  salary,
  dense_rank() over(partition by department order by salary desc) as rnked
  from employees
)

select
  department,
  emp_name,
  salary
from rnk
where rnked =3;
