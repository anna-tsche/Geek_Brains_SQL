-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. 
-- Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.


DELIMITER //

CREATE TRIGGER check_not_null_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF 'null_try' = COALESCE(NEW.name, NEW.description, 'null_try') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Canceled. Input name or description!';
    END IF;
END//

CREATE TRIGGER check_not_null_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF 'null_try' = COALESCE(NEW.name, NEW.description, 'null_try') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Canceled. Name or description required!';
    END IF;
END//

DELIMITER ;

INSERT INTO products (name, description) VALUES ('XXX', 'YYY');
SELECT * FROM products;
INSERT INTO products (name, description) VALUES (NULL, 'ZZZ');
SELECT * FROM products;
INSERT INTO products (name, description) VALUES (NULL, NULL);
SELECT * FROM products;
UPDATE products SET name = NULL WHERE id = 1;
SELECT * FROM products;
UPDATE products SET description = NULL WHERE id = 1;
SELECT * FROM products;