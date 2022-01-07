-- Сводка 10 самых крупных покупок за последний год

create or replace view last_year_biggest as

with last_year as 
(select id, category_id, amount, note
from transactions
where transaction_date >= DATE_ADD(CURDATE(), INTERVAL -1 year) 
and note is not null -- в базе по заданной конвенции повторяющиеся транзакции, не являющиеся покупками (ипотека, плата за свет и т.д.) не содержат комментарий в поле 'note'
and (transaction_type_id = 1 or transaction_type_id = 4) -- только затраты и покупка ценных бумаг
order by amount desc
limit 10)

select categories.category_name as category, note as purchase, amount
from last_year
join categories on last_year.category_id = categories.id
order by amount desc;

SELECT * FROM last_year_biggest;