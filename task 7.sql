SELECT dayname(date_add(birthday_at, interval (year(now()) - year(birthday_at)) year)) as birthday, count(*) as count
FROM users
GROUP BY birthday
order by count desc;