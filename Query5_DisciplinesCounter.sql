USE DBMS;

SELECT
	[Дисциплина] = dbo.Disciplines.discipline_name,
	[Количество занятий] = COUNT(discipline),
	[Количество проведённых занятий] = sum(CASE WHEN [spent] = 1 THEN 1 ELSE 0 END),
	[Количество запланированных занятий] = sum(CASE WHEN [spent] = 0 THEN 1 ELSE 0 END)
FROM	
	Schedule, Disciplines
WHERE
	Schedule.discipline = Disciplines.disciplines_id
GROUP BY
	Disciplines.discipline_name;
