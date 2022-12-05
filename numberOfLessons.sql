CREATE VIEW number_of_lessons AS
select TO_CHAR(time, 'MONTH') as month,
count(*) as all_lessons,
sum(case when lesson_type = 'Single lesson' then 1 else 0 end) as single_lessons,
sum(case when lesson_type = 'Group lesson' then 1 else 0 end) as group_lessons,
sum(case when lesson_type = 'Ensamble' then 1 else 0 end) as ensambles
FROM lesson WHERE EXTRACT(YEAR FROM time) = '2022' 
GROUP BY TO_CHAR(time, 'MONTH')
ORDER BY TO_CHAR(time, 'MONTH') ASC;