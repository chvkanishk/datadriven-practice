select * from cdn_logs
where bytes = (select max(bytes) from cdn_logs)
order by log_id asc 
limit 1;
