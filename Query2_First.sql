USE DBMS;

--INSERT INTO dbo.Schedule VALUES (1,1, '2022-12-12','14:30',1,3)
--INSERT INTO dbo.Schedule VALUES (31,3, '2022-12-14','14:30',1,3)

--INSERT INTO dbo.Schedule (discipline,teacher,[date],[time],spent,[group])
--VALUES (1,1, '2022-12-21','14:30',1,3)

SELECT 
	dbo.Disciplines.discipline_name AS 'Дисциплина',
	dbo.Groups.group_name			AS 'Группа',
	dbo.Schedule.[date]				AS 'Дата',
	dbo.Schedule.[time]				AS 'Время',
	dbo.Teachers.last_name	+	' ' +
	dbo.Teachers.first_name +	' ' +
	dbo.Teachers.middle_name		AS 'Преподаватель',
	[Статус Занятия]				= IIF(dbo.Schedule.spent = 1,'Проведено','Запланировано')
FROM
	dbo.Schedule,dbo.Groups,dbo.Disciplines,dbo.Teachers
WHERE
	dbo.Schedule.discipline = dbo.Disciplines.disciplines_id
AND
	dbo.Schedule.[group]	= dbo.Groups.group_id
AND
	dbo.Schedule.teacher	= dbo.Teachers.teacher_id;
