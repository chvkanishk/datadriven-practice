with t1 as 
(select 
  region,
  svc_name,
  amount
from cloud_costs 
Union all 
select 
  region,
  svc_name,
  amount
from cost_allocs),

ranked as 
(select 
  region,svc_name,
  dense_rank() over (partition by region order by amount asc nulls first) as rn_low,
  dense_rank() over (partition by region order by amount desc nulls last) as rn_high
from t1 )  

select
  region,
  min(case when rn_high = 1 then svc_name end) as most_expensive,
  min(case when rn_low = 1 then svc_name end) as cheapest
from ranked
group by region
ORDER BY region;
