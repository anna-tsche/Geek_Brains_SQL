-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

with activity as (
select user_id
from vk.likes
union all

select from_user_id as user_id
from vk.friendship_requests
union all

select from_user_id as user_id
from vk.messages
)

select user_id, count(*) as "recorded activity" from activity
group by user_id
order by count(user_id) asc
limit 10;