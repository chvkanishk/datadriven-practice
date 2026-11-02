select 
  user_id,
  transaction_date,
  sum(total_amount) over(partition by user_id order by transaction_date 
                        range between unbounded preceding and current row) as running_total
from transactions;
