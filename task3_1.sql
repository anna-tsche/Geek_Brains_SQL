-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello()
RETURNS TEXT DETERMINISTIC
BEGIN
   DECLARE greeting TEXT;
   DECLARE hours INT;
   SET greeting = 'default';
   SET hours = HOUR(NOW());
   IF (hours > 6 AND hours < 12) THEN
       SET greeting = 'Доброе утро';
   END IF;
   IF (hours >=12 AND hours < 18 )	THEN
   		SET greeting = 'Добрый день';
   END IF; 
   IF (hours >= 18 AND hours < 24) THEN 
   		SET greeting = 'Добрый вечер';
   END IF;
   IF (hours >= 0 AND hours <= 6) THEN 
   		SET greeting = 'Доброй ночи';
   END IF;
  
  RETURN greeting;
END//

SELECT hello()//