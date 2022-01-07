-- Создайте таблицу logs типа Archive. 
-- Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается 
-- время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.

drop table if exists logs;
create table logs(
	id serial,
	created_at datetime NOT NULL DEFAULT NOW(),
	table_name varchar(63),
	name varchar(63))
engine = Archive;

DELIMITER $$
DROP TRIGGER IF EXISTS `users_log_trigger`;
CREATE TRIGGER `users_log_trigger` 
AFTER INSERT ON users 
FOR EACH ROW
	BEGIN
		 INSERT INTO logs (table_name, id, name)
			     VALUES ('users', NEW.id, NEW.name);
	END$$
    
INSERT INTO users 
SET name = 'John Doe', birthday_at = '1990.03.22'$$


DROP TRIGGER IF EXISTS `catalogs_log_trigger`;
CREATE TRIGGER `catalogs_log_trigger` 
AFTER INSERT ON catalogs
FOR EACH ROW
	BEGIN
		 INSERT INTO logs (table_name, id, name)
			     VALUES ('catalogs', NEW.id, NEW.name);
	END$$

INSERT INTO catalogs SET name = 'NEW'$$


DROP TRIGGER IF EXISTS `products_log_trigger`;
CREATE TRIGGER `products_log_trigger`
AFTER INSERT ON products
FOR EACH ROW
	BEGIN
		 INSERT INTO logs (table_name, id, name)
			     VALUES ('products', NEW.id, NEW.name);
	END$$
    
INSERT INTO products SET name = 'New Product', price = 14000, catalog_id = 8$$
