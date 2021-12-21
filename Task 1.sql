-- Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

select from_user_id, to_user_id, count(*) as number_of_messages
from messages
	join users on users.id = messages.from_user_id
where messages.to_user_id = 3 
group by messages.from_user_id
order by number_of_messages desc
limit 1; 