CREATE VIEW lesson_average_instructor AS
    SELECT instructor_id, count(*) FROM lesson 
    WHERE EXTRACT(YEAR FROM time) = '2022'
    AND EXTRACT(MONTH FROM time) = date_part('month', (SELECT current_timestamp)) 
    GROUP BY instructor_id HAVING COUNT(*) > 1
    ORDER BY count(*) DESC;
