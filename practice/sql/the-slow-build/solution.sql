with months as 
(
select 
  date_format(transaction_date,'%Y-%m') as months,
  sum(total_amount) as monthly_revenue
from transactions
WHERE YEAR(transaction_date) = 2026
group by date_format(transaction_date,'%Y-%m')
)


select 
  *,
  truncate(avg(monthly_revenue) over(order by months
       rows between unbounded preceding and current row),0) as cumulative_avg
from months;
