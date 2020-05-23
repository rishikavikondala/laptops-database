USE INFO330_Proj_4

-- stored procedures for tblDETAIL and tblREVIEW

CREATE PROCEDURE uspInsertDetail
@Price INT,
@Weight INT, 
@Color varchar(20),
@BatteryLife FLOAT,
@ReleaseYear INT,
@LaptopName varchar(30),
@DetailName varchar(20),
@DetailDesc varchar(500)

AS 
DECLARE @L_ID INT
SET @L_ID = (SELECT LaptopID FROM tblLAPTOP	
				WHERE LaptopName = @LaptopName)
BEGIN TRAN T
INSERT INTO tblDETAIL (DetailName, DetailDescription, LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear)
VALUES (@DetailName, @DetaiLDesc, @L_ID, @Price, @Weight, @Color, @BatteryLife, @ReleaseYear)
COMMIT TRAN T



CREATE PROCEDURE uspInsertReview
@CommentDesc varchar(500),
@RatingValue INT,
@Quantity INT,
@LaptopName varchar(30),
@Fname varchar(50),
@Lname varchar(50),
@BirthDate datetime,
@Odate datetime

AS
DECLARE @R_ID INT, @C_ID INT, @LO_ID INT, @L_ID INT, @O_ID INT, @Cust_ID INT
SET @R_ID = (SELECT RatingID FROM tblRATING
				WHERE RatingValue = @RatingValue)
SET @C_ID = (SELECT CommentID FROM tblCOMMENT		
				WHERE CommentDescription = @CommentDesc)
SET @L_ID = (SELECT LaptopID FROM tblLAPTOP 
				WHERE LaptopName = @LaptopName)
SET @Cust_ID = (SELECT CustomerID FROM tblCUSTOMER
				WHERE FirstName = @Fname
				AND LastName = @Lname
				AND DateOfBirth = @BirthDate)
SET @O_ID = (SELECT OrderID FROM tblORDER		
				WHERE CustomerID = @Cust_ID
				AND OrderDate = @Odate)
SET @LO_ID = (SELECT LaptopOrderID FROM tblLAPTOP_ORDER
				WHERE LaptopID = @L_ID
				AND OrderID = @O_ID
				AND Quantity = @Quantity)
BEGIN TRAN G
INSERT INTO tblREVIEW (RatingID, CommentID, LaptopOrderID)
VALUES (@R_ID, @C_ID, @LO_ID)
COMMIT TRAN G