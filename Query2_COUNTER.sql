USE DBMS;

SELECT
	COUNT(*) AS 'Всего',
	sum(case when [spent] = 1 then 1 else 0 end) AS 'Проведено',
	sum (case when [spent] = 0 then 1 else 0 end) AS 'Запланировано'

FROM Schedule
WHERE
	[group]			= (SELECT group_id FROM Groups WHERE group_name = 'PD_212')
AND	
	[discipline]	= (SELECT disciplines_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')



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
	
