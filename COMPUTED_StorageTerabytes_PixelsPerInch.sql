USE INFO330_Proj_4

-- Computed column for converting laptop storage quantities into terabytes.

GO
ALTER FUNCTION fn_CalcSizeInTerabytes(@PK INT)
RETURNS INT
AS
BEGIN
    DECLARE @RET INT =
        (SELECT SUM(tCO.Credits)
        FROM tblSTORAGE_SIZE tCO
            JOIN tblDEPARTMENT tD ON tCO.DeptID = tD.DeptID
            JOIN tblCLASS tC ON tCO.CourseID = tC.CourseID
            JOIN tblCLASS_LIST tCL ON tC.ClassID = tCL.ClassID
        WHERE tD.DeptAbbrev = @PK
        AND tCL.Grade > 3.4)
RETURN @RET
END
GO

ALTER TABLE tblSTORAGE_SIZE
ADD CalcNumInfoCreds AS (dbo.fn_CalcSizeInTerabytes(size))

-- Computed column for pixels per inch for laptop display.

