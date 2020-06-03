USE INFO330_Proj_4

-- Computed Column for total number of orders a customer has placed
GO
CREATE FUNCTION CalcNumOrdersPerCustomer(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT O.OrderID)
    FROM tblORDER O
        JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
    WHERE C.CustomerID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblCUSTOMER
ADD NumOrdersPerCustomer AS (dbo.CalcNumOrdersPerCustomer(CustomerID))

-- Computed Column for how much money a customer has spent on products of type laptop
GO
CREATE FUNCTION CalcMoneySpentOnLaptopsPerCustomer(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET NUMERIC = (
    SELECT SUM(O.OrderTotal)
    FROM tblORDER O
        JOIN tblPRODUCT_ORDER PO ON  O.OrderID = PO.OrderID
        JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
        JOIN tblPRODUCT_TYPE PT ON PT.ProductTypeID = P.ProductTypeID
        JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
    WHERE PT.ProductTypeName = 'Laptop'
    AND C.CustomerID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblCUSTOMER
ADD SumMoneySpentOnLaptopsPerCustomer AS (dbo.CalcMoneySpentOnLaptopsPerCustomer(CustomerID))