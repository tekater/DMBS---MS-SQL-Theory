USE DBMS;

SELECT COUNT(*)
FROM Schedule
WHERE
	[group]			= (SELECT group_id FROM Groups WHERE group_name = 'PD_212')
AND	
	[discipline]	= (SELECT disciplines_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')