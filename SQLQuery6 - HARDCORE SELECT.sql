USE DBMS;

DECLARE @start_lesson_id  BIGINT = 
(
SELECT MIN(lesson_id)
FROM 
	Schedule,Disciplines,Groups 
WHERE 
	discipline = disciplines_id
AND
	group_name = 'PD_212' 
AND  
	discipline_name LIKE '%MS SQL%'
AND 
	spent = 1
)
PRINT @start_lesson_id;

DECLARE @end_lesson_id BIGINT = 
(
SELECT MAX(lesson_id)
FROM 
	Schedule,Disciplines,Groups 
WHERE 
	discipline = disciplines_id
AND
	group_name = 'PD_212' 
AND  
	discipline_name LIKE '%MS SQL%'
AND 
	spent = 1
)
PRINT @end_lesson_id;

DECLARE @lesson_id BIGINT = @start_lesson_id
WHILE(@lesson_id <= @end_lesson_id)
	BEGIN
--	DECLARE @students TABLE (student_id INT)
--DROP TABLE #CurrentGroup
	--SELECT 
	--	stud_id --, FORMATMESSAGE('%s %s %s', last_name,firts_name,middle_name)
	--INTO #CurrentGroup
	--FROM 
	--	Students JOIN Groups  ON [group] = group_id 
	--WHERE 
	--	[group_name] = 'PD_212'
--	SELECT * FROM #CurrentGroup
--	DECLARE @id INT
--	SELECT TOP 1 @id = #CurrentGroup.stud_id FROM #CurrentGroup
	DECLARE @iterator INT = 1
	WHILE(@iterator <= (SELECT COUNT(stud_id) FROM Students JOIN Groups ON [group] = group_id WHERE group_name = 'PD_212'))
		BEGIN
			DECLARE @id INT = (SELECT MAX(stud_id) FROM (SELECT TOP (@iterator) Students.stud_id FROM Students, Groups WHERE [group] = group_id AND group_name = 'PD_212') Students)
			PRINT (@id)
			DECLARE @is_present BIT = ROUND(RAND(@iterator * 1000000),0)
			PRINT(@is_present)

			INSERT INTO Attendance(student,lesson,present) 
			VALUES (@id,@lesson_id,@is_present)

			SET @iterator += 1
		END
		SET @lesson_id += 1
	END