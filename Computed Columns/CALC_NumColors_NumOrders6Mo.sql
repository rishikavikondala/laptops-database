USE INFO330_Proj_4

-- Computed Column for number of products of type laptop for a particular color
GO
CREATE FUNCTION CalcNumLaptopsPerColor(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT P.ProductID)
    FROM tblPRODUCT P
        JOIN tblCOLOR C on P.ColorID = C.ColorID
    WHERE C.ColorID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblCOLOR
ADD NumLaptopsPerColor AS (dbo.CalcNumLaptopsPerColor(ColorID))

-- Computed Column for number of orders for a laptop in the past 6 months
GO
CREATE FUNCTION CalcNumOrdersPast6Months(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT O.OrderID)
    FROM tblORDER O
        JOIN tblPRODUCT_ORDER PO ON O.OrderID = PO.OrderID
		JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
    WHERE P.ProductID = @PK
	AND O.OrderDate >= DateAdd(Month, -6, GetDate())
)
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT
ADD NumOrdersPast6Months AS (dbo.CalcNumOrdersPast6Months(ProductID))