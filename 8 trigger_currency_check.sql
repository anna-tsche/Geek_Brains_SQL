-- Триггер который корреткно заполняет валюту транзакции в зависимости от счета, по которому она проходит

delimiter $$
drop trigger if exists currency_check;
create trigger currency_check 
before insert 
on transactions
FOR EACH ROW
begin
	if new.from_account_id = 1 then
		set new.currency_id = 1;
	elseif new.from_account_id = 2 then
		set new.currency_id = 1;
	elseif new.from_account_id = 3 then
		set new.currency_id = 1;
	elseif new.from_account_id = 4 then
		set new.currency_id = 1;
	elseif new.from_account_id = 5 then
		set new.currency_id = 1;
	elseif new.from_account_id = 9 then
		set new.currency_id = 1;
	elseif new.from_account_id = 10 then
		set new.currency_id = 1;
	elseif new.from_account_id = 7 then
		set new.currency_id = 2;
	elseif new.from_account_id = 6 then
		set new.currency_id = 2;
	elseif new.from_account_id = 8 then
		set new.currency_id = 3;
	end if;
end;$$

delimiter ;

INSERT INTO `transactions` VALUES 
(43, NULL, 5000.00, 8, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 'shoes');