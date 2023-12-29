CREATE PROCEDURE mysp_SelectDisciplineInGroupFromSchedule
AS
BEGIN

SELECT
	group_name				AS 'Группа',
	[Дисциплина] = Disciplines.discipline_name,
	[Количество занятий] = COUNT(lesson_id)
FROM
	Schedule JOIN Groups 
	ON 
	[group] = group_id
	JOIN Disciplines 
	ON 
	discipline = disciplines_id
GROUP BY group_name, discipline_name;



SELECT
	Disciplines.discipline_name AS 'Дисциплина',
	group_name		AS 'Группа',
	Schedule.[date] AS 'Дата',
	Schedule.[time] AS 'Время',
	last_name + ' ' + first_name + ' ' + middle_name AS 'Преподаватель'
FROM
	Schedule,Groups,Disciplines,Teachers
WHERE
	discipline = disciplines_id
AND
	[group] = group_id
AND 
	teacher = teacher_id;
END
