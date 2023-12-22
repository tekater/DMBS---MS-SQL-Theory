USE DBMS;



--- Счётчик пар
SELECT 
	[Количество пар] = 'MS SQL',
	COUNT(*)										AS 'Всего',
	sum(case when [spent] = 1 then 1 else 0 end)	AS 'Проведено',
	sum (case when [spent] = 0 then 1 else 0 end)	AS 'Запланировано'
FROM Schedule
WHERE
	[group]			= (SELECT group_id FROM Groups WHERE group_name = 'PD_212')
AND	
	[discipline]	= (SELECT disciplines_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')



-- Подсчёт пар по ID
SELECT 
	dbo.Schedule.[discipline]						AS 'id Предметa',
	COUNT(*)										AS 'Всего',
	sum(case when [spent] = 1 then 1 else 0 end)	AS 'Проведено',
	sum (case when [spent] = 0 then 1 else 0 end)	AS 'Запланировано'
FROM 
Schedule,Disciplines
WHERE
	[group]			= (SELECT group_id FROM Groups WHERE group_name = 'PD_212')
AND
	dbo.Schedule.[discipline] = dbo.Disciplines.disciplines_id
GROUP BY 
	dbo.Schedule.[discipline]



--- Счётчик пар Преподавателей
SELECT 
	dbo.Teachers.last_name	+	' ' +
	dbo.Teachers.first_name +	' ' +
	dbo.Teachers.middle_name	AS 'Препод',
	COUNT(*)					AS 'Всего пар',
	sum(case when [spent] = 1 AND [date] >= '2023-12-01'then 1 else 0 end)													AS 'Проведено пар в декабре',
	sum(case when [spent] = 0 AND [date] >= '2023-12-01' AND [date] < '2024-01-01' then 1 else 0 end)						AS 'Запланировано пар в декабре',
	sum(case when [spent] = [spent] AND [date] >= '2023-12-01' AND [date] < '2024-01-01' then 1 else 0 end)					AS 'Всего пар в декабре',
	IIF(sum(case when [spent] = [spent] AND [date] >= '2023-12-01' AND [date] < '2024-01-01' then 1 else 0 end) = 0,0,
	31.0 / sum(case when [spent] = [spent] AND [date] >= '2023-12-01' AND [date] < '2024-01-01' then 1 else 0 end))			AS 'Среднее число пар в декабре',
	(sum(case when [spent] = [spent] AND [date] >= '2023-12-01' AND [date] < '2024-01-01' then 1 else 0 end) * 12) / 365.0	AS 'Среднее число пар в год',
	(sum(case when [spent] = [spent] AND [date] >= '2023-12-01' AND [date] < '2024-01-01' then 1 else 0 end) * 12) / 30.0	AS 'Среднее число пар за 30 дней в году',
	sum(case when [spent] = 1 AND [date] >= '2023-12-01' AND [date] < '2024-01-01' then [rate] else 0 end) AS 'ЗП за Декабрь' 

FROM 
	Schedule,Teachers,Disciplines
WHERE
	dbo.Schedule.[discipline] = dbo.Disciplines.disciplines_id
AND
	dbo.Schedule.teacher	= dbo.Teachers.teacher_id
GROUP BY 
	dbo.Teachers.last_name	+	' ' +
	dbo.Teachers.first_name +	' ' +
	dbo.Teachers.middle_name

		

--SELECT 
--	COUNT(*) AS 'Всего'
--FROM Schedule
--WHERE
--	[group]			= (SELECT group_id FROM Groups WHERE group_name = 'PD_212')
--AND	
--	[discipline]	= (SELECT disciplines_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')


	
--SELECT 
--	COUNT(*) AS 'Проведено'
--FROM Schedule
--WHERE
--	[group]			= (SELECT group_id FROM Groups WHERE group_name = 'PD_212')
--AND	
--	[discipline]	= (SELECT disciplines_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
--AND
--	[spent]			= 1
	
