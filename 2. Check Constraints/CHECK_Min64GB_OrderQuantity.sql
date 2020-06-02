USE INFO330_Proj_4

-- Less than a 2 core CPU should not be a possible feature
GO
CREATE FUNCTION fn_Min64GBStorage()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT S.FeatureID
		FROM tblSTORAGE S
		WHERE S.Gigabytes < 64
	)
	BEGIN
	SET @RET = 1
	END
RETURN @RET
END
GO
ALTER TABLE tblSTORAGE WITH NOCHECK
ADD CONSTRAINT CK_Min64GBStorage
CHECK(dbo.fn_Min64GBStorage() = 0)

--A laptop order must have a quantity between 1 and 20 inclusive
GO
CREATE FUNCTION fn_LaptopOrderBetween1And20()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT PO.ProductOrderID
		FROM tblPRODUCT_ORDER PO
		WHERE PO.Quantity < 1
		OR Quantity > 20
	)
	BEGIN
	SET @RET = 1
	END
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT_ORDER
ADD CONSTRAINT CK_QuantityBetween1And20
CHECK(dbo.fn_LaptopOrderBetween1And20() = 0)