USE INFO330_Proj_4

-- stored procedure for tblCUSTOMER
GO
CREATE PROCEDURE uspINSERTCUSTOMER
@FName varchar(50),
@LName varchar(50),
@DOB DATE,
@RegionName varchar(10),
@Country varchar(25),
@ResState varchar(50),
@City varchar(50),
@Street varchar(50),
@Zip varchar(5),
@Phone varchar(10),
@Email varchar(50)
AS
DECLARE @REG_ID INT
SET @REG_ID = (
	SELECT RegionID
	FROM tblREGION
	WHERE RegionName = @RegionName
)
BEGIN TRAN T1
INSERT INTO tblCUSTOMER(FirstName, LastName, DateOfBirth, RegionID, Country, [State], City, Street, Zip, Phone, Email)
VALUES (@FName, @LName, @DOB, @REG_ID, @Country, @ResState, @City, @Street, @Zip, @Phone, @Email)
COMMIT TRAN T1

EXEC uspINSERTCUSTOMER
@FName = '',
@LName = '',
@DOB = '',
@RegionName = '',
@Country = 'United States',
@ResState = '',
@City = '',
@Street = '',
@Zip = '',
@Phone = '', 
@Email = ''

EXEC uspINSERTCUSTOMER
@FName = 'Can',
@LName = 'Carey',
@DOB = '1984-5-16',
@RegionName = 'Midwest',
@Country = 'United States',
@ResState = 'Minnesota',
@City = 'Saint Cloud',
@Street = '3899 Newton Street',
@Zip = '56301',
@Phone = '3202984548', 
@Email = 'cancarey1984@live.com'

EXEC uspINSERTCUSTOMER
@FName = 'Lesley',
@LName = 'Tillman',
@DOB = 'United States',
@RegionName = 'Midwest',
@Country = 'United States',
@ResState = 'Missouri',
@City = 'St.Louis',
@Street = '170 Hyde Park Road',
@Zip = '63199',
@Phone = '6135550127', 
@Email = 'ltillman1@yahoo.com'

EXEC uspINSERTCUSTOMER
@FName = 'Poppy',
@LName = 'Oneil',
@DOB = '1998-8-5',
@RegionName = 'West',
@Country = 'United States',
@ResState = 'California',
@City = 'Fremont',
@Street = '4575 Driftwood Road',
@Zip = '94539',
@Phone = '5102181897', 
@Email = 'poppy.oneil@outlook.com'

EXEC uspINSERTCUSTOMER
@FName = 'Rae',
@LName = 'Porter',
@DOB = '2000-10-19',
@RegionName = 'Northeast',
@Country = 'United States',
@ResState = 'New York',
@City = 'Hicksville',
@Street = '1960 Central Drive',
@Zip = '11612',
@Phone = '5163506948', 
@Email = 'raeporter010@me.com'

EXEC uspINSERTCUSTOMER
@FName = 'Sonnie',
@LName = 'Sadler',
@DOB = '1984-1-4',
@RegionName = 'South',
@Country = 'United States',
@ResState = 'Georgia',
@City = 'Atlanta',
@Street = '18 Parkes Road',
@Zip = '30301',
@Phone = '2380440350', 
@Email = 'sonnie.sadler@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Aizah',
@LName = 'Talley',
@DOB = '1995-9-10',
@RegionName = 'Midwest',
@Country = 'United States',
@ResState = 'South Dakota',
@City = 'Watertown',
@Street = '719 3rd St NW',
@Zip = '57201',
@Phone = '4783902836', 
@Email = 'atalley@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Jaydon',
@LName = 'Tyson',
@DOB = '1990-12-15',
@RegionName = 'West',
@Country = 'United States',
@ResState = 'Hawaii',
@City = 'Kapaa',
@Street = '872 Kamalu Rd',
@Zip = '96746',
@Phone = '9827395103', 
@Email = 'tysonj@comcast.com'

EXEC uspINSERTCUSTOMER
@FName = 'Ryan',
@LName = 'Muller',
@DOB = '1999-4-12',
@RegionName = 'South',
@Country = 'United States',
@ResState = 'Kentucky',
@City = 'Sharpsburg',
@Street = '1981 Ratliff Rd',
@Zip = '40374',
@Phone = '6201994283', 
@Email = 'ryanmuller@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Zachary',
@LName = 'Easton',
@DOB = '1992-2-22',
@RegionName = 'South',
@Country = 'United States',
@ResState = 'Maryland',
@City = 'Ellicott City',
@Street = '3004 Ridge Rd',
@Zip = '21043',
@Phone = '1503865203', 
@Email = 'eastonz1992@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Sydney',
@LName = 'Ni',
@DOB = '2000-7-28',
@RegionName = 'Northeast',
@Country = 'United States',
@ResState = 'Massachusetts',
@City = 'Lexington',
@Street = '11 Brandon St',
@Zip = '02421',
@Phone = '7818623769', 
@Email = 'sydneyni@me.com'

EXEC uspINSERTCUSTOMER
@FName = 'Kevin',
@LName = 'Anderson',
@DOB = '1999-12-27',
@RegionName = 'West',
@Country = 'United States',
@ResState = 'California',
@City = 'San Jose',
@Street = '119 Vista Dr.',
@Zip = '95019',
@Phone = '4082992123', 
@Email = 'kanderson@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Jared',
@LName = 'Hong',
@DOB = '1997-5-2',
@RegionName = 'West',
@Country = 'United States',
@ResState = 'Arizona',
@City = 'Phoenix',
@Street = '749 Orange Tree Ln.',
@Zip = '87912',
@Phone = '6029926678', 
@Email = 'hong.jared@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Aditya',
@LName = 'Balaga',
@DOB = '1980-12-21',
@RegionName = 'Northeast',
@Country = 'United States',
@ResState = 'New York',
@City = 'New York',
@Street = '67711 Prima Don Ln.',
@Zip = '12389',
@Phone = '2121290808', 
@Email = 'a.balaga@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Trinity',
@LName = 'Nguyen',
@DOB = '1995-12-2',
@RegionName = 'West',
@Country = 'United States',
@ResState = 'Washington',
@City = 'Seattle',
@Street = '78797 Oakville Ave.',
@Zip = '98195',
@Phone = '2069890123', 
@Email = 'tynn@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Richard',
@LName = 'Dong',
@DOB = '1969-6-9',
@RegionName = 'South',
@Country = 'United States',
@ResState = 'Florida',
@City = 'Tallahassee',
@Street = '420 Nutmeg Rd.',
@Zip = '32301',
@Phone = '8504206090', 
@Email = 'richdong@hotmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Bob',
@LName = 'Blekins',
@DOB = '2001-1-4',
@RegionName = 'Midwest',
@Country = 'United States',
@ResState = 'Ohio',
@City = 'Elyria',
@Street = '114 High Noon Street',
@Zip = '44035',
@Phone = '4402629942', 
@Email = 'boboblek123@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Jeremy',
@LName = 'Hodge',
@DOB = '1990-3-27',
@RegionName = 'Midwest',
@Country = 'United States',
@ResState = 'Indiana',
@City = 'Highland',
@Street = '645 South Jockey Hollow Dr.',
@Zip = '46322',
@Phone = '2192374434', 
@Email = 'jhodge563@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Anne',
@LName = 'Long',
@DOB = '1980-8-9',
@RegionName = 'South',
@Country = 'United States',
@ResState = 'Georgia',
@City = 'Cumming',
@Street = '9361 West Rockwell Road',
@Zip = '30040',
@Phone = '4702398293', 
@Email = 'long.a55@yahoo.com'

EXEC uspINSERTCUSTOMER
@FName = 'Bill',
@LName = 'Parker',
@DOB = '1985-5-3',
@RegionName = 'Northeast',
@Country = 'United States',
@ResState = 'New York',
@City = 'Farmingdale',
@Street = '7080 Deerfield Ave.',
@Zip = '11735',
@Phone = '5162492782', 
@Email = 'billparking99@gmail.com'

EXEC uspINSERTCUSTOMER
@FName = 'Derek',
@LName = 'Pill',
@DOB = '1998-6-18',
@RegionName = 'South',
@Country = 'United States',
@ResState = 'Georgia',
@City = 'Winder',
@Street = '8537 Dogwood Drive',
@Zip = '30680',
@Phone = '4702099799', 
@Email = 'derekpill1998@gmail.com'

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