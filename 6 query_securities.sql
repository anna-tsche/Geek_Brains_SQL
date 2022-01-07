-- Список транзакций по ценным бумагам

SELECT transactions.note as ticker, transaction_type.transaction_type_name as action, currencies.currency_name as currency, sum(transactions.amount) as amount 
FROM budget_tracking.transactions
join budget_tracking.transaction_type on transactions.transaction_type_id = transaction_type.id
join budget_tracking.currencies on transactions.currency_id = currencies.id
where transactions.category_id = 10
group by ticker, action;