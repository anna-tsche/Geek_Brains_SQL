-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- вспомогательная таблица с самыми молодыми пользователями
with youngest as (
	select user_id, birthday
	from vk.profiles
	order by birthday desc
	limit 10)
-- выбираем сумму лайков пользователей
select count(media_id) + count(post_id) + count(message_id) as "total likes by youngest users" from vk.likes
where user_id in (select user_id from youngest);