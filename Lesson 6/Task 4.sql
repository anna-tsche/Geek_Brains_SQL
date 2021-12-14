-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select 	gender, COUNT(*)
from vk.likes l join vk.profiles p 
on l.user_id = p.user_id 
group by gender;