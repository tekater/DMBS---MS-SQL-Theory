USE DBMS;

SELECT 
	Students.stud_id AS 'ID',
	FORMATMESSAGE('%s %s %s', last_name, firts_name, middle_name) AS 'Студент',
	group_name AS 'Группа'
FROM 
	Students RIGHT JOIN Groups ON [group] = group_id
WHERE
	group_name = 'PD_212'