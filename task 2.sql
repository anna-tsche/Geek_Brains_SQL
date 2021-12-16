update users
set created_at = convert(created_at,datetime)
where created_at is not null;
update users
set created_at = convert(updated_at,datetime)
where updated_at is not null;