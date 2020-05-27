USE INFO330_Proj_4
ALTER TABLE tblDETAIL

DROP COLUMN DetailDescription

SELECT * FROM tblLAPTOP


-- stored procedure for tblDETAIL
GO
CREATE PROCEDURE uspINSERTDETAIL
@DetailName numeric(6, 2),
@DetailTypeName varchar(20)
AS 
DECLARE @L_ID INT
SET @L_ID = (
	SELECT LaptopID
	FROM tblLAPTOP	
	WHERE LaptopName = @LaptopName
)
BEGIN TRAN T1
INSERT INTO tblDETAIL (DetailName, DetailDescription, LaptopID, Price, [Weight], Color, BatteryLife, ReleaseYear)
VALUES (@DetailName, @DetaiLDesc, @L_ID, @Price, @Weight, @Color, @BatteryLife, @ReleaseYear)
COMMIT TRAN T1

-- stored procedure for tblREVIEW
GO
CREATE PROCEDURE uspINSERTREVIEW
@CommentDesc varchar(500),
@RatingValue INT,
@Quantity INT,
@LaptopName varchar(50),
@Fname varchar(50),
@Lname varchar(50),
@BirthDate DATE,
@Odate DATE
AS
DECLARE @R_ID INT, @C_ID INT, @LO_ID INT, @L_ID INT, @O_ID INT, @Cust_ID INT
SET @R_ID = (
	SELECT RatingID
	FROM tblRATING
	WHERE RatingValue = @RatingValue
)
SET @C_ID = (
	SELECT CommentID
	FROM tblCOMMENT		
	WHERE CommentDescription = @CommentDesc
)
SET @L_ID = (
	SELECT LaptopID
	FROM tblLAPTOP 
	WHERE LaptopName = @LaptopName
)
SET @Cust_ID = (
	SELECT CustomerID
	FROM tblCUSTOMER
	WHERE FirstName = @Fname
	AND LastName = @Lname
	AND DateOfBirth = @BirthDate
)
SET @O_ID = (
	SELECT OrderID
	FROM tblORDER		
	WHERE CustomerID = @Cust_ID
	AND OrderDate = @Odate
)
SET @LO_ID = (
	SELECT LaptopOrderID
	FROM tblLAPTOP_ORDER
	WHERE LaptopID = @L_ID
	AND OrderID = @O_ID
	AND Quantity = @Quantity
)
BEGIN TRAN T1
INSERT INTO tblREVIEW (RatingID, CommentID, LaptopOrderID)
VALUES (@R_ID, @C_ID, @LO_ID)
COMMIT TRAN T1