USE INFO330_Proj_4

--A customer cannot be under 18 years of age.
GO
CREATE FUNCTION fn_NoYounger18Order() 
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT CustomerID FROM tblCUSTOMER 
		WHERE DateOfBirth > DateAdd(Year, -18, GetDate())
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblORDER
ADD CONSTRAINT CK_MustBe18
CHECK (dbo.fn_NoYounger18Order() = 0)

--Rating values must be between 1 and 5 inclusive
GO
CREATE FUNCTION fn_RatingOnly1to5()
RETURNS INT
AS 
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT RatingValue FROM tblRATING	
		WHERE RatingValue NOT BETWEEN 1 AND 5
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblRATING
ADD CONSTRAINT CK_Rating1to5
CHECK (dbo.fn_RatingOnly1to5() = 0)