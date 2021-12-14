-- original
SELECT media_type_id, (select name from media_types where id = media_type_id) as media_type, count(*)
FROM vk.media 
group by media_type_id;

-- updated
with medias_temp as
media_type_id, count(*)
FROM vk.media 