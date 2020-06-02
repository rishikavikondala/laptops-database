USE INFO330_Proj_4

-- Number of products that have a particular color
GO
CREATE FUNCTION CalcNumLaptopsPerColor(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT P.ProductID)
    FROM tblPRODUCT P
        JOIN tblCOLOR C ON P.ColorID = C.ColorID
    WHERE C.ColorID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblCOLOR
ADD NumLaptopsPerColor AS (dbo.CalcNumLaptopsPerColor(ColorID))

-- Number of times a rating value was assigned in the past 6 months
GO
CREATE FUNCTION CalcNumRatingsPast6Months(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(R.RatingID)
    FROM tblREVIEW R
		JOIN tblRATING RA ON R.RatingID = RA.RatingID
        JOIN tblPRODUCT_ORDER PO ON R.ProductOrderID = PO.ProductOrderID
        JOIN tblORDER O ON PO.OrderID = O.OrderID
    WHERE R.RatingID = @PK
	AND O.OrderDate >= DateAdd(Month, -6, GetDate())
)
RETURN @RET
END
GO
ALTER TABLE tblRATING
ADD NumRatingsPast6Months AS (dbo.CalcNumRatingsPast6Months(RatingID))