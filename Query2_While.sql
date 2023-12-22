USE DBMS;

SET DATEFIRST 1

--DECLARE @discipline			SMALLINT	= 14
--DECLARE @discipline			SMALLINT	= (SELECT disciplines_id FROM Disciplines WHERE discipline_name LIKE '%Java');

DECLARE @discipline			SMALLINT	= 7;
DECLARE @teacher			INT			= 2
DECLARE @group				INT			= 3
DECLARE @start_date			DATE		= '2023-12-01'
DECLARE @date				DATE		= @start_date
DECLARE @interval			INT			= IIF(DATEPART(dw,@date) = 5,3,2)
DECLARE @time				TIME		= '18:30'
DECLARE @number_of_lessons	TINYINT		= (SELECT number_of_lessons FROM dbo.Disciplines WHERE disciplines_id = @discipline);

DECLARE @counter			INT			= 0


while (@counter < @number_of_lessons)
BEGIN
--  IF1
	IF  ( 
		SELECT COUNT(*) 
		FROM Schedule 
		WHERE [group] = @group AND discipline = @discipline AND [date] = @date AND [time] = @time
		) = 0
			BEGIN

	INSERT INTO Schedule(discipline, teacher, [date], [time], spent, [group])
	VALUES				(@discipline, @teacher, @date, @time,
						IIF(@date < GETDATE(),1,0), @group);

			END
	SET			@counter = @counter + 1;
	
--		IF2
		IF  ( 
		SELECT COUNT(*) 
		FROM Schedule 
		WHERE [group] = @group AND discipline = @discipline AND [date] = @date AND [time] = DATEADD(mi,90,CONVERT(TIME, @time))
		) = 0
			BEGIN

	INSERT INTO Schedule(discipline, teacher, [date], [time], spent, [group])
	VALUES				(@discipline, @teacher, @date, DATEADD(mi,90,CONVERT(TIME, @time)),
						IIF(@date < GETDATE(),1,0), @group);

			END
	SET			@counter = @counter + 1;


	SET			@date		= DATEADD(dd,@interval,@date)
	SET			@interval	= IIF(DATEPART(dw,@date) = 5, 3, 2) 
END
