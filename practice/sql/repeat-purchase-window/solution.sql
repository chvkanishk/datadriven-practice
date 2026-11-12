with gaps as 
(
select 
  user_id,
  transaction_date - lag(transaction_date) over(partition by user_id order by transaction_date)  as gap
from transactions
)

select 
  distinct(user_id) as user_id
from gaps 
where gap >65 and gap <=80;
