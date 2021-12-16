-- Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

select * from catalogs 
where id in (5, 1, 2)
order by field(id, 5, 1, 2);