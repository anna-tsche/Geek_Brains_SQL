-- Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT from_user_id, to_user_id, count(*) AS number_of_messages
FROM messages
	JOIN users ON users.id = messages.from_user_id
WHERE messages.to_user_id = 3 
GROUP BY messages.from_user_id
ORDER BY number_of_messages DESC
LIMIT 1; 