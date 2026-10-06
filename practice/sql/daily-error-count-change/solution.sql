with tables as 
(select 
  cast(first_at as date) as error_dates,
  count(*) as error_count
from err_tracks
group by cast(first_at as date)
)

select 
  error_dates,
  error_count,
  lag(error_count) over(order by error_dates) as prev_count,
  error_count - lag(error_count) over(order by error_dates) as day_over_day_change
from tables;
