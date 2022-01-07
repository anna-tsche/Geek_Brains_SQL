-- Триггер который заполняет дату транзакции текущей датой, в случае, если дата не указана

delimiter $$
drop trigger if exists date_check;
create trigger date_check 
before insert 
on transactions
for each row 
begin
	if new.transaction_date is NULL then
		set new.transaction_date = now();
	end if;
end;$$

delimiter ;

INSERT INTO `transactions` VALUES 
(42, NULL, 7000.00, 8, NULL, 2, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 'sneakers');