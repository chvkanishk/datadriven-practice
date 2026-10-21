with ranked as 
(select
  metric_value,
  dense_rank() OVER (order by metric_value desc) as rnk 
from employee_metrics
)

select distinct(metric_value )
from ranked
where rnk= 2;
