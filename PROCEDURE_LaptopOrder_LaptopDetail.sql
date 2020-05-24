USE INFO330_Proj_4
GO

--tblLAPTOP_ORDER

CREATE PROCEDURE uspInsertLaptopOrder
@LaptopName varchar(50),
@FName varchar(50),
@LName varchar(50),
@Birth date,
@OrderDate date,
@OrderTotal numeric(7,2),
@Quantity int
AS
DECLARE @L_ID INT, @O_ID INT

SET @L_ID =
(SELECT LaptopID 
FROM tblLAPTOP
WHERE LaptopName = @LaptopName)

SET @O_ID =
(SELECT O.OrderID
FROM tblORDER O
JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
WHERE C.FirstName = @FName
AND C.LastName = @LName
AND C.DateOfBirth = @Birth
AND O.OrderDate = @OrderDate
AND O.OrderTotal = @OrderTotal)

BEGIN TRAN G1
INSERT INTO tblLAPTOP_ORDER(LaptopID, OrderID, Quantity)
VALUES(@L_ID, @O_ID, @Quantity)
COMMIT TRAN G1
GO

--tblLAPTOP_DETAIL

CREATE PROCEDURE uspInsertLaptopDetail
@LaptopName varchar(50),
@DetailName varchar(20)
AS
DECLARE @L_ID INT, @D_ID INT

SET @L_ID = 
(SELECT LaptopID
FROM tblLAPTOP
WHERE LaptopName = @LaptopName)

SET @D_ID =
(SELECT DetailID
FROM tblDETAIL
WHERE DetailName = @DetailName)

BEGIN TRAN G2
INSERT INTO tblLAPTOP_DETAIL(LaptopID, DetailID)
VALUES(@L_ID, @D_ID)
COMMIT TRAN G2