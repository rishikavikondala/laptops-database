USE INFO330_Proj_4

/* A customer must have ordered a laptop in order to place a review for it. */

CREATE FUNCTION fn_CustomerMustOrderToReview()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0
    IF EXISTS (
        SELECT *
        FROM tblCUSTOMER C
            JOIN tblORDER O ON C.CustomerID = O.CustomerID
            JOIN tblLAPTOP_ORDER LO ON O.OrderID = LO.OrderID
            JOIN tblREVIEW R ON LO.LaptopOrderID = R.LaptopOrderID
        WHERE C.CustomerID = O.CustomerID
        AND O.OrderID = LO.OrderID
        AND R.LaptopOrderID = LO.LaptopOrderID
    )
    BEGIN
        SET @RET = 1
    END
RETURN @RET
END

GO
ALTER TABLE tblREVIEW
ADD CONSTRAINT ck.CustomerOrderReview
CHECK(dbo.fn_CustomerMustOrderToReview() = 0)

/* No customer with an invalid address or with an address outside of the united states can place an order  */

CREATE FUNCTION fn_InvalidAddressOutsideUS()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0
    IF EXISTS (
        SELECT *
        FROM tblCUSTOMER C
            JOIN tblORDER O ON C.CustomerID = O.CustomerID
        WHERE (C.Zip = NULL
        OR C.Street = NULL
        OR C.City = NULL
        OR C.State = NULL
        OR C.Country = NULL)
        AND C.Country != 'United States'
    )
    BEGIN
        SET @RET = 1
    END
RETURN @RET
END

GO
ALTER TABLE tblORDER
ADD CONSTRAINT ck.NoInvalidAddressOrOutsideUS
CHECK (dbo.fn_InvalidAddressOutsideUS() = 0)
