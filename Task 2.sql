-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет

SELECT count(*) AS likes_to_users_under_10
FROM profiles
JOIN likes ON profiles.user_id = likes.user_id 
WHERE (YEAR(current_date())-YEAR(profiles.birthday)) < '10';