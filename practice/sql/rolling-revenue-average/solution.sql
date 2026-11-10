with months as (

select 
  date_format(transaction_date, '%Y-%m') as ym,
  sum(case when total_amount > 0 then total_amount else 0 end) as sumed
  -- avg(total_amount) over(order by date_format(transaction_date, '%Y-%m')
  --                      rows between 2 preceding and current row) as rolling_avg
from transactions
group by date_format(transaction_date, '%Y-%m')

)

select 
  ym,
  avg(sumed) over(order by ym
                  rows between 2 preceding and current row) as rolling_avg
from months;
