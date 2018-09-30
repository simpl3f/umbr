Задание на знание SQL:
SELECT MIN(id) as min_id, MIN(group_id) as group_id, COUNT(*) 
FROM (SELECT row_number() over (order by id) - row_number() over (partition by group_id order by id) as subgroup, id, group_id FROM users ) AS users1
GROUP BY group_id, subgroup
ORDER BY min_id
