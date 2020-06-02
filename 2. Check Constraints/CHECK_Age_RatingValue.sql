USE INFO330_Proj_4

-- A customer cannot be under 18 years of age.
GO
CREATE FUNCTION fn_MinCustAge18ToOrder() 
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
ALTER TABLE tblCUSTOMER
ADD CONSTRAINT CK_MinCustAge18ToOrder
CHECK (dbo.fn_MinCustAge18ToOrder() = 0)

-- A rating must be the range 1 - 5 inclusive
GO
ALTER FUNCTION fn_RatingOnly1to5()
RETURNS INT
AS 
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT * FROM tblRATING R
		WHERE R.RatingVALUE NOT BETWEEN 1 AND 5
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblRATING
ADD CONSTRAINT CK_RatingOnly1to5
CHECK (dbo.fn_RatingOnly1to5() = 0)