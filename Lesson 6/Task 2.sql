-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select from_user_id, count(from_user_id) from vk.messages
where to_user_id = 3
group by from_user_id
order by count(from_user_id) desc
limit 1;