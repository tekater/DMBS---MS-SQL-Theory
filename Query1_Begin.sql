USE DBMS;


SELECT	Students.last_name AS 'Фамилия',
		Students.firts_name AS 'Имя', 
		Students.middle_name AS 'Отчество', 
		Groups.group_name AS 'Группа',
		DATEDIFF(hour,Students.birth_date,GETDATE()) / 8766 AS 'Возраст',
		Directions.direction_name AS 'Направление'
FROM	
Students, Groups,Directions
WHERE	
Students.[group] = Groups.group_id
AND 
Groups.direction = Directions.direction_id
AND
Directions.direction_name = 'Разработка программного обеспечения'
ORDER BY -- Сортировка
Students.birth_date DESC;

-- ASC - Ascendin (в порядке возрастания)
-- DESC - Descrnding (В порядке убывания)

--AND Directions.direction_name = 'Java Development';
--AND		Groups.group_name = 'PD_212';
