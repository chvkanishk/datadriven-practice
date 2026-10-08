select 
  log_id,
  server_name,
  log_level,
  message,
  response_time_ms,
  min(log_timestamp) as log_timestamp
from server_logs 
group by server_name,message
having min(log_timestamp) >=current_date - interval '90 day';
