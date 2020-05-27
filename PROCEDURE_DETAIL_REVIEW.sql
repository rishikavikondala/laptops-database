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

EXEC uspINSERTREVIEW @CommentDesc = 'Great for software development. The physical device has a nice design and is not too heavy.', @RatingValue = 5, @Quantity = 1, @LaptopName = 'Apple Macbook Air', @Fname = 'Can', @Lname = 'Carey', @BirthDate = '1984-05-16', @Odate = '2019-12-13'
EXEC uspINSERTREVIEW @CommentDesc = 'Would work well for someone whose life runs through Google products. Wish it was more versatile.', @RatingValue = 3, @Quantity = 1, @LaptopName = 'Google Pixelbook Go', @Fname = 'Lesley', @Lname = 'Tillman', @BirthDate = '1971-03-29', @Odate = '2019-11-28'
EXEC uspINSERTREVIEW @CommentDesc = 'Really convenient to be able to switch from laptop to tablet. Lightweight and great battery life.', @RatingValue = 4, @Quantity = 1, @LaptopName = 'Microsoft Surface Pro 7', @Fname = 'Poppy', @Lname = 'Oniel', @BirthDate = '1988-08-05', @Odate = '2019-04-19'
EXEC uspINSERTREVIEW @CommentDesc = 'Amazing battery life for such a powerful product. Best for those who need lots of computing power for a long time.', @RatingValue = 4, @Quantity = 1, @LaptopName = 'Dell XPS 15 Laptop', @Fname = 'Rae', @Lname = 'Porter', @BirthDate = '2000-10-19', @Odate = '2019-10-05'
EXEC uspINSERTREVIEW @CommentDesc = 'Excellent for design software (Adobe CC) and watching movies. Integrates really well with other Apple devices.', @RatingValue = 5, @Quantity = 1, @LaptopName = 'Apple Macbook Pro 13-inch', @Fname = 'Sonnie', @Lname = 'Sadler', @BirthDate = '1984-01-04', @Odate = '2020-03-02'
EXEC uspINSERTREVIEW @CommentDesc = 'Lovely refined designed bundled in a light weight package. Thank you! ', @RatingValue = 5, @Quantity = 1, @LaptopName = 'Microsoft Surface Laptop 3', @Fname = 'Aizah', @Lname = 'Talley', @BirthDate = '1995-09-10', @Odate = '2020-01-11'
EXEC uspINSERTREVIEW @CommentDesc = 'Looking for a high quality gaming laptop and that is just what I got. Works great! ', @RatingValue = 5, @Quantity = 1, @LaptopName = 'Alienware M17 R1 Gaming Laptop', @Fname = 'Jaydon', @Lname = 'Tyson', @BirthDate = '1990-12-15', @Odate = '2020-04-08'
EXEC uspINSERTREVIEW @CommentDesc = 'Lightweight and works OK for my needs as a student. Battery life could last longer while running certain programs.', @RatingValue = 3, @Quantity = 1, @LaptopName = 'Samsung Galexy Book Flex', @Fname = 'Ryan', @Lname = 'Muller', @BirthDate = '1999-04-12', @Odate = '2019-11-28'
EXEC uspINSERTREVIEW @CommentDesc = 'Kids wanted a laptop to play with, works great and was a cheap, indestructable laptop! Love it! ', @RatingValue = 5, @Quantity = 1, @LaptopName = 'Lenovo ThinkPad X1', @Fname = 'Zachary', @Lname = 'Easton', @BirthDate = '1992-02-22', @Odate = '2019-06-24'
EXEC uspINSERTREVIEW @CommentDesc = 'Great purchase, beautiful display, and works well for all of my needs. Battery life is unmatched!', @RatingValue = 4, @Quantity = 1, @LaptopName = 'Dell Precision 5540', @Fname = 'Sydney', @Lname = 'Ni', @BirthDate = '2000-07-28', @Odate = '2020-02-02'
EXEC uspINSERTREVIEW @CommentDesc = 'Great for gaming, but a little noisy.', @RatingValue = 4, @Quantity = 1, @LaptopName = 'Acer Laptop Aspire 5 NX.HDGAA.002', @Fname = 'Kevin', @Lname = 'Anderson', @BirthDate = '1999-12-27', @Odate = '2019-04-21'
EXEC uspINSERTREVIEW @CommentDesc = 'Affordable product. Does everything I need it to just well enough.', @RatingValue = 3, @Quantity = 1, @LaptopName = 'Lenovo Chromebook S330', @Fname = 'Jared', @Lname = 'Hong', @BirthDate = '1997-05-02', @Odate = '2019-11-11'
EXEC uspINSERTREVIEW @CommentDesc = 'Alright for work and video editing. Screen quality could be much better.', @RatingValue = 2, @Quantity = 1, @LaptopName = 'MSI GT76 TITAN DT-039', @Fname = 'Aditya', @Lname = 'Balaga', @BirthDate = '1980-12-21', @Odate = '2020-03-02'
EXEC uspINSERTREVIEW @CommentDesc = 'Battery life is not as advertised, unresponsive trackpad.', @RatingValue = 1, @Quantity = 1, @LaptopName = 'ALienware Area 51m', @Fname = 'Trinity', @Lname = 'Nguyen', @BirthDate = '1995-12-02', @Odate = '2020-05-11'
EXEC uspINSERTREVIEW @CommentDesc = 'Excellent for everything I use it for including video editing, photo editing, and streaming.', @RatingValue = 5, @Quantity = 1, @LaptopName = 'Apple Mac Book Pro 15-inch', @Fname = 'Richard', @Lname = 'Dong', @BirthDate = '1969-06-09', @Odate = '2019-09-14'
EXEC uspINSERTREVIEW @CommentDesc = 'Love the long battery life but the storage space is way too low for the price.', @RatingValue = 3, @Quantity = 1, @LaptopName = 'Asus ZenBook 13', @Fname = 'Bob', @Lname = 'Blekins', @BirthDate = '2001-01-04', @Odate = '2019-10-24'
EXEC uspINSERTREVIEW @CommentDesc = 'My son always uses this to play Fornite! He has not had any problems so far so good job!', @RatingValue = 5, @Quantity = 1, @LaptopName = 'Dell G5 15 Gaming Laptop', @Fname = 'Jeremy', @Lname = 'Hodge', @BirthDate = '1990-03-27', @Odate = '2019-12-20'
EXEC uspINSERTREVIEW @CommentDesc = 'Way too expensive and clunky for a laptop. You are better off just building a pc. The webcam is terrible.', @RatingValue = 1, @Quantity = 1, @LaptopName = 'Dell G7 Gaming Laptop', @Fname = 'Anne', @Lname = 'Long', @BirthDate = '1980-08-08', @Odate = '2020-02-02'
EXEC uspINSERTREVIEW @CommentDesc = 'This is a super good laptop for work. It is relatively cheap, lightweight, and has a great battery life. Would recommend!', @RatingValue = 5, @Quantity = 1, @LaptopName = 'VivoBook 15', @Fname = 'Bill', @Lname = 'Parker', @BirthDate = '1985-05-03', @Odate = '2019-07-27'
EXEC uspINSERTREVIEW @CommentDesc = 'Touchpad did not work as soon as I got it. Save yourself the hassle and get something better.', @RatingValue = 2, @Quantity = 1, @LaptopName = 'Acer Nitro 5 Gaming Laptop', @Fname = 'Derek', @Lname = 'Pill', @BirthDate = '1998-06-18', @Odate = '2020-04-11'
