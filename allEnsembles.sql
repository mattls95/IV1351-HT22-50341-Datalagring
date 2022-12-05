CREATE MATERIALIZED VIEW ensembles_next_week AS
     SELECT lesson_id,number_of_seats,max_students,genre,
CASE
	WHEN number_of_seats = max_students THEN 'Full'
	WHEN number_of_seats = max_students - 1 THEN '1 seat left'
	WHEN number_of_seats = max_students - 2 THEN '2 seats left'
	ELSE 'Several seats left'
END AS seats_remaining
FROM(SELECT lesson_id, COUNT(lesson_id) AS number_of_seats,max_students,genre
	 FROM (
		SELECT a.student_id,a.lesson_id,genre,min_students,max_students FROM student_lesson A
		INNER JOIN ensemble B ON A.lesson_id = B.lesson_id
		INNER JOIN lesson c ON A.lesson_id = c.id
		WHERE date_trunc('week', time) = date_trunc('week',now() + interval ' 1 week')
		ORDER BY student_id ASC, B.lesson_id ASC) AS ensembles_in_next_week 
		GROUP BY max_students,lesson_id,genre) 
		AS unique_ensembles_in_next_week


