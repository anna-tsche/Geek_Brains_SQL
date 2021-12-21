-- Определить кто больше поставил лайков (всего): мужчины или женщины

select
       gender, count(*) as likes_count
from
     vk.likes inner join vk.profiles on likes.user_id=profiles.user_id
group by gender
order by count(*) desc;