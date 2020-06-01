USE INFO330_Proj_4
GO

--Average Rating for a product
CREATE FUNCTION AvgLaptopRating(@PK INT)
RETURNS
NUMERIC(2,1)
AS
BEGIN
DECLARE @RET NUMERIC(2,1) = (
	SELECT AVG(R.RatingValue)
	FROM tblRATING R
	JOIN tblREVIEW RE ON R.RatingID = RE.RatingID
	JOIN tblPRODUCT_ORDER PO ON RE.ProductOrderID = PO.ProductOrderID
	JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
	JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
	WHERE P.ProductID = @PK
	AND PT.ProductTypeName = 'Laptop')
RETURN @RET
END
GO

ALTER TABLE tblPRODUCT
ADD AverageRating AS (dbo.AvgLaptopRating(ProductID))
GO

--Number of Orders previously placed for a product 
CREATE FUNCTION NumOfOrdersLaptop(@PK INT)
RETURNS
INT
AS
BEGIN
DECLARE @RET INT = (
	SELECT COUNT(DISTINCT PO.ProductOrderID)
	FROM tblPRODUCT_ORDER PO
	JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
	JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
	WHERE P.ProductID = @PK
	AND PT.ProductTypeName = 'Laptop')
RETURN @RET
END
GO

ALTER TABLE tblPRODUCT
ADD NumberOfOrdersPlaced AS (dbo.NumOfOrdersLaptop(ProductID))

