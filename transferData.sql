insert into historical_lesson(id,lesson_type,skill_level,genre,time,price) 
select a.id,
    a.lesson_type,
    a.skill_level,
    case
        when a.lesson_type = 'Ensamble' THEN genre = b.genre
        else genre = null
    END,
    time = a.time
    from lesson a, ensamble b