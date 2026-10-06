with inner_join as
(select 
  count(*) as inner_row_count 
from users u 
inner join ad_impressions ad
on u.user_id = ad.user_id
),

left_join as
(select 
  count(*) as left_row_count
from users u 
left join ad_impressions ad
on u.user_id = ad.user_id
),

full_join as
(select 
  count(*) as full_row_count
from users u 
full outer join ad_impressions ad
on u.user_id = ad.user_id
)

select 
  'inner_join' as join_type,
  inner_row_count as row_count 
from inner_join
union 
select 
  'left_join' as join_type,
  left_row_count as row_count 
from left_join
union 
select 
  'full_outer_join' as join_type,
  full_row_count as row_count 
from full_join;
