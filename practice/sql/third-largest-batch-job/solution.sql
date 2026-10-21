select 
  job_name,
  sum(rows_done) as total_rows 
from batch_jobs 
group by job_name
order by sum(rows_done) desc 
limit 3;
