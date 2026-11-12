with gap as 
(
select 
  issued - lag(issued) over(order by issued) as issue_gap,
  expires -lag(expires) over (order by expires) as max_expire
from api_tokens
where expires is not null
)

select 
  max(issue_gap) as max_issue_gap_days,
  max(max_expire) as 	max_expire_gap_days
from gap;
