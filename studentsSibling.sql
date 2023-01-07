CREATE VIEW number_of_siblings AS
   select count(*) as students_with_siblings,number_of_siblings from (
	SELECT id,count(sibling_id) AS number_of_siblings 
		FROM student
		full join student_sibling on id=student_id
		Group by id
		ORDER BY id ASC 
		) as all_siblings
		group by number_of_siblings
		order by number_of_siblings