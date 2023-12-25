USE DBMS;

SELECT
	[Преподаватель]	= FORMATMESSAGE('%s %s %s',last_name, first_name, middle_name),
	[Ставка за пару] = FORMAT(Teachers.rate,'C','us-us'),
	[Количество пар] = COUNT(teacher),
	[Заработная плата] = FORMAT(COUNT (teacher) * Teachers.rate,'C','us-us')
FROM 
	Schedule,Teachers
WHERE
	Schedule.teacher = Teachers.teacher_id
AND
	[date] BETWEEN '2023-12-01' AND '2023-12-31'
GROUP BY
	Teachers.last_name, Teachers.first_name, Teachers.middle_name,Teachers.rate;
