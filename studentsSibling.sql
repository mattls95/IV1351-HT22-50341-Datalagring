CREATE VIEW number_of_siblings AS
    SELECT student_id, count(student_id) AS "Number of siblings"
	FROM student_sibling GROUP BY student_id 
	ORDER BY student_id ASC;