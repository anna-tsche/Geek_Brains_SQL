-- Список транзакций по категориям дохода

SELECT categories.category_name as category, currencies.currency_name as currency, sum(transactions.amount) as income 
FROM budget_tracking.transactions
join budget_tracking.categories on transactions.category_id = categories.id
join budget_tracking.currencies on transactions.currency_id = currencies.id
where transactions.transaction_type_id = 2
group by category
order by income;