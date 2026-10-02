select 
  svc_name,
  bill_date,
  amount,
  amount - lag(amount) over(partition by svc_name order by bill_date) as price_change
from cloud_costs;
