-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select users.id, name, count(*) as orders
from users
join orders on users.id = orders.user_id
group by users.id, name
order by name;