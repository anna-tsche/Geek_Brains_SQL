-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

select flights.id, cities_from.name, cities_to.name
from flights
join cities AS cities_from ON flights.from = cities_from.label
join cities AS cities_to ON flights.to = cities_to.label;