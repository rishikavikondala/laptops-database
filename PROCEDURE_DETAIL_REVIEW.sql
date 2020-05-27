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
DECLARE @DT_ID INT
SET @DT_ID = (
	SELECT DetailTypeID
	FROM tblDETAIL_TYPE	
	WHERE DetailTypeName = @DetailTypeName
)
BEGIN TRAN T1
INSERT INTO tblDETAIL (DetailName, DetailTypeID)
VALUES (@DetailName, @DT_ID)
COMMIT TRAN T1

EXEC uspINSERTDETAIL @DetailName = 999.00, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 2.8, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 12.0, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 649.00, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 2.0, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 749.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 1.41, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 10.5, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 1799.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 4.0, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 20.5, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 2399.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 4.3, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 11.0, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 1599.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 2.89, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 11.5, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 1794.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 5.79, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 2.5, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 949.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 3.5, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 19, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 1353.87, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 2.4, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 18.3, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 1829.00, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 3.39, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 6.2, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 659.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 3.97, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 249.00, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 3.3, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 10.0, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 4599.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 9.92, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 6.0, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 2544.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 8.54, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 2.0, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 3229.00, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 4.02, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 999.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 2.6, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 14.0, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 5.9, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 6.33, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 1729.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 6.9, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 599.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 3.75, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 9.0, @DetailTypeName = 'Battery Life'
EXEC uspINSERTDETAIL @DetailName = 879.99, @DetailTypeName = 'Price'
EXEC uspINSERTDETAIL @DetailName = 5.73, @DetailTypeName = 'Weight'
EXEC uspINSERTDETAIL @DetailName = 7.0, @DetailTypeName = 'Battery Life'



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

EXEC uspINSERTREVIEW @CommentDesc = , @RatingValue = , @Quantity = , @LaptopName , = @Fname = , @Lname = , @BirthDate = , @Odate = 