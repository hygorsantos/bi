CREATE FUNCTION [dbo].[DAYSADDNOWK](@addDate AS DATE, @numDays AS INT)
RETURNS DATETIME
AS
BEGIN
    WHILE @numDays>0
    BEGIN
       SET @addDate=DATEADD(d,1,@addDate)
       IF DATENAME(DW,@addDate)='saturday' SET @addDate=DATEADD(d,1,@addDate)
       IF DATENAME(DW,@addDate)='sunday' SET @addDate=DATEADD(d,1,@addDate)
  
       SET @numDays=@numDays-1
    END
  
    RETURN CAST(@addDate AS DATETIME)
END