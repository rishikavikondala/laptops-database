USE INFO330_Proj_4

--tblLAPTOP_ORDER
GO
CREATE PROCEDURE uspInsertLaptopOrder
@LaptopName varchar(50),
@FName varchar(50),
@LName varchar(50),
@Birth DATE,
@OrderDate DATE,
@OrderTotal numeric(7,2),
@Quantity INT
AS
DECLARE @L_ID INT, @O_ID INT
SET @L_ID = (
    SELECT LaptopID 
    FROM tblLAPTOP
    WHERE LaptopName = @LaptopName
)
SET @O_ID = (
    SELECT O.OrderID
    FROM tblORDER O
        JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
    WHERE C.FirstName = @FName
    AND C.LastName = @LName
    AND C.DateOfBirth = @Birth
    AND O.OrderDate = @OrderDate
    AND O.OrderTotal = @OrderTotal
)
BEGIN TRAN T1
INSERT INTO tblLAPTOP_ORDER(LaptopID, OrderID, Quantity)
VALUES(@L_ID, @O_ID, @Quantity)
COMMIT TRAN T1

--tblLAPTOP_DETAIL
GO
CREATE PROCEDURE uspInsertLaptopDetail
@LaptopName varchar(50),
@DetailName varchar(30)
AS
DECLARE @L_ID INT, @D_ID INT
SET @L_ID = (
    SELECT LaptopID
    FROM tblLAPTOP
    WHERE LaptopName = @LaptopName
)
SET @D_ID = (
    SELECT DetailID
    FROM tblDETAIL
    WHERE DetailName = @DetailName
)
BEGIN TRAN T1
INSERT INTO tblLAPTOP_DETAIL(LaptopID, DetailID)
VALUES(@L_ID, @D_ID)
COMMIT TRAN T1