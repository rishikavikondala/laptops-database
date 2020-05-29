USE INFO330_Proj_4
GO

--A laptop must have at elast 64GB of storage space

CREATE FUNCTION fn_64gbOrMore()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT S.FeatureID
		FROM tblSTORAGE S
			JOIN tblLAPTOP_FEATURE LF ON S.FeatureID = LF.FeatureID
			JOIN tblLAPTOP L ON LF.LaptopID = L.LaptopID
		WHERE S.NumGigs < 64
	)
	BEGIN
	SET @RET = 1
	END
RETURN @RET
END
GO

ALTER TABLE tblLAPTOP
ADD CONSTRAINT CK_AtLeast64gbStorage
CHECK(dbo.fn_64gbOrMore() = 0)
GO

--A laptop order must have a quantity between 1 and 20 inclusive

CREATE FUNCTION fn_LaptopOrderBetween1And20()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT LaptopOrderID
		FROM tblLAPTOP_ORDER
		WHERE Quantity < 1 OR Quantity > 20
	)
	BEGIN
	SET @RET = 1
	END
RETURN @RET
END
GO

ALTER TABLE tblLAPTOP_ORDER
ADD CONSTRAINT CK_QuantityBetween1And20
CHECK(dbo.fn_LaptopOrderBetween1And20() = 0)
