select 
  user_id,
  product_id,
  total_amount,
  transaction_date,
  sum(total_amount) over(partition by user_id order by transaction_date 
                        rows between unbounded preceding and current row) as cumulative_sales
from transactions;
