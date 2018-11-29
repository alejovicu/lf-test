-- Get the t_items that has t_item_comments where the t_user belongs to an specific t_city

-- Solution 1: If the t_city is searched by city code
SELECT
    t_item.*
FROM
    t_item,
    t_item_comment,
    t_user
WHERE   t_item.pk_i_id = t_item_comment.fk_i_item_id
AND     t_item.fk_i_user_id = t_user.pk_i_id
AND     t_user.fk_i_city_id = [city code to search]

-- Solution 2: If the t_city is searched by city name
SELECT
    t_item.*
FROM
    t_item,
    t_item_comment,
    t_user,
    t_city
WHERE   t_item.pk_i_id = t_item_comment.fk_i_item_id
AND     t_item.fk_i_user_id = t_user.pk_i_id
AND     t_user.fk_i_city_id = t_city.pk_i_id
AND     t_city.s_name LIKE '[city name to search]'