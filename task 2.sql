-- Выведите список товаров products и разделов catalogs, который соответствует товару.

select products.id, products.name as 'product name', catalogs.name as 'catalog section'
from products
join catalogs on products.catalog_id = catalogs.id
group by products.id, products.name, catalogs.name
order by products.id;