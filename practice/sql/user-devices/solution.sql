with t1 as (
select u.username, u.user_id, us.device_id
from users u
join user_sessions us
on u.user_id = us.user_id
)

select distinct(t.username), d.device_type from t1 t
join devices d
on t.device_id = d.device_id;
