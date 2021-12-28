-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

SELECT * FROM products;
SELECT * FROM catalogs;

CREATE OR REPLACE VIEW product_category AS
SELECT products.name AS product, catalogs.name AS category
FROM products
LEFT JOIN catalogs 
ON products.catalog_id = catalogs.id;