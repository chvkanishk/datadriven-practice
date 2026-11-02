select 
  product_id,
  date_format(transaction_date,'%Y-%m') as month,
  total_amount as monthly_total,
  sum(total_amount) over(partition by product_id 
                          order by date_format(transaction_date, '%Y-%m')
                          rows between unbounded preceding and current row) as cumulative_total
from transactions
where product_id is not null;
