-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

update users
set created_at = convert(created_at,datetime)
where created_at is not null;
update users
set created_at = convert(updated_at,datetime)
where updated_at is not null;