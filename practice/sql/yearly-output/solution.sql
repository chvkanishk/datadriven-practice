select 
  year(publish_date) as year,
  count(content_id) as items_published,
  avg(duration_seconds) as avg_duration
from content_items
where year(publish_date) is not null
group by year(publish_date)
order by year(publish_date);
