select 
  endpoint,
  latency,
  avg(latency) over(
                partition by endpoint
                order by call_time,
                call_id rows between unbounded preceding and current row) as running_avg
from api_calls
where latency is not null;
