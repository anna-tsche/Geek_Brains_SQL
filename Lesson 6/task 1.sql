-- original from lesson
SELECT media_type_id, (select name from media_types where id = media_type_id) as media_type, count(*)
FROM vk.media 
group by media_type_id;

-- updated without using join
with medias_temp as (
select media_type_id, count(*) as count
from vk.media
group by media_type_id)

select media_type_id, (select name from media_types where id = media_type_id) as media_type, count
from medias_temp;