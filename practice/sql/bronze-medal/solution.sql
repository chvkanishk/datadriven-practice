with table_ranked as 
(
select amount,
dense_rank() over(order by amount desc) as ranked
from cloud_costs)

select distinct amount from table_ranked where ranked <=3;
