with t1 as 
(select 
  svc_name,
  min(uptime) over(partition by svc_name) as min_uptime
from svc_health)

select distinct svc_name, min_uptime 
from t1
order by min_uptime
limit 10;
