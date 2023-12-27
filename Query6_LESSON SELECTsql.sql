USE DBMS;

--DELETE FROM Attendance

SET DATEFIRST 1

SELECT
	[Ñòóäåíò] = FORMATMESSAGE('%s %s %s',last_name,firts_name,middle_name),
	[Ãðóïïà] = Groups.group_name,
	[Äåíü íåäåëè] = DATENAME(DW,Schedule.[date]),
	[Äàòà] = Schedule.[date],
	[Âðåìÿ] = Schedule.[time],
	[Ïðèñóòñòâèå] = IIF(Attendance.present = 1,'Áûë','Ïðîãóëÿë'),
	[Äèñöèïëèíà] = Disciplines.discipline_name
FROM
	Attendance, Schedule, Students, Groups, Disciplines
WHERE
	Attendance.student=Students.stud_id
AND
	Attendance.lesson = Schedule.lesson_id
AND
	Schedule.discipline = Disciplines.disciplines_id
AND
	Schedule.[group] = Groups.group_id
--AND
--	Schedule.[date] = '2023-12-18'
--AND
--	Schedule.[time] = '18:30'
