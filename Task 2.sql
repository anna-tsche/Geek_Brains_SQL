-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет

select count(*) as likes_to_users_under_10
from profiles
join likes on profiles.user_id = likes.user_id 
where (year(current_date())-year(profiles.birthday)) < '10';