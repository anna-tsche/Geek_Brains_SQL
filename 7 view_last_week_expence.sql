-- Сводка операций за последние 7 дней

create or replace view last_week_expense as

with last_week as 
(select transactions.transaction_type_id as type_id, sum(transactions.amount) as amount
from transactions
where transaction_date >= DATE_ADD(CURDATE(), INTERVAL -7 DAY)
group by type_id)

select transaction_type.transaction_type_name as type, amount
from last_week
join transaction_type on last_week.type_id = transaction_type.id
order by amount;

SELECT * FROM last_week_expense;