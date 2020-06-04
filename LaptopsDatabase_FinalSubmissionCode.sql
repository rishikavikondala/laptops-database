USE INFO330_Proj_4

/*
STORED PROCEDURES
Rishi --> 
Tanner --> 
Brian -->
Ryan -->
*/

-- stored procedure for tblFEATURE
GO
ALTER PROCEDURE uspINSERTFEATURE
@FeatureName varchar(200),
@BrandName varchar(20)
AS
DECLARE @B_ID INT
SELECT @B_ID = (
    SELECT BrandID
    FROM tblBRAND
    WHERE BrandName = @BrandName
)
BEGIN TRAN T1
INSERT INTO tblFEATURE
(BrandID, FeatureName)
VALUES (@B_ID, @FeatureName)
COMMIT TRAN T1

-- stored procedure for tblBRAND
GO
CREATE PROCEDURE uspINSERTBRAND
@BrandName varchar(20),
@BrandDescription varchar(500),
@BrandTypeName varchar(20)
AS
DECLARE @BT_ID INT
SELECT @BT_ID = (
    SELECT BrandTypeID
    FROM tblBRAND_TYPE
    WHERE BrandTypeName = @BrandTypeName
)
BEGIN TRAN T1
INSERT INTO tblBRAND
(BrandName, BrandDescription, BrandTypeID)
VALUES (@BrandName, @BrandDescription, @BT_ID)
COMMIT TRAN T1

-- stored procedure for tblPRODUCT
GO
CREATE PROCEDURE uspINSERTPRODUCT
    @ProductName varchar(50),
    @ColorName varchar(20),
    @ProductTypeName varchar(20),
    @ReleaseYear char(4),
    @BatteryLife numeric(3, 1),
    @Weight numeric(3, 1),
    @Price numeric(6, 2)
AS
DECLARE @C_ID INT, @PT_ID INT
SELECT @C_ID = (
    SELECT ColorID
    FROM tblCOLOR
    WHERE ColorName = @ColorName
)
SELECT @PT_ID = (
    SELECT ProductTypeID
    FROM tblPRODUCT_TYPE
    WHERE ProductTypeName = @ProductTypeName
)
BEGIN TRANSACTION T1
INSERT INTO tblPRODUCT(ProductName, ColorID, ProductTypeID, ReleaseYear, BatteryLife, [Weight], Price)
VALUES(@ProductName, @C_ID, @PT_ID, @ReleaseYear, @BatteryLife, @Weight, @Price)
COMMIT TRANSACTION T1

-- stored procedure for tblPRODUCT_FEATURE
GO
CREATE PROCEDURE uspINSERTPRODUCTFEATURE
    @FeatureName varchar(200),
    @ProductName varchar(50)
AS
DECLARE @F_ID INT, @P_ID INT
SET @F_ID = (
    SELECT FeatureID
    FROM tblFEATURE
    WHERE FeatureName = @FeatureName
)
SET @P_ID = (
    SELECT ProductID
    FROM tblPRODUCT
    WHERE ProductName = @ProductName
)
BEGIN TRANSACTION T1
INSERT INTO tblPRODUCT_FEATURE(FeatureID, ProductID)
VALUES(@F_ID, @P_ID)
COMMIT TRANSACTION T1

-- stored procedure for tblPRODUCT_ORDER
GO
CREATE PROCEDURE uspINSERTPRODUCTORDER
@ProductName varchar(50),
@FName varchar(50),
@LName varchar(50),
@Birth DATE,
@OrderDate DATE,
@ShipDate DATE,
@OrderTotal numeric(7,2),
@Quantity INT
AS
DECLARE @P_ID INT, @O_ID INT
SET @P_ID = (
    SELECT ProductID 
    FROM tblPRODUCT
    WHERE ProductName = @ProductName
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
INSERT INTO tblPRODUCT_ORDER(ProductID, OrderID, Quantity)
VALUES(@P_ID, @O_ID, @Quantity)
COMMIT TRAN T1

-- stored procedure for tblORDER
GO
CREATE PROCEDURE uspINSERTORDER
@FName varchar(50),
@LName varchar(50),
@Birth DATE,
@OrderDate DATE,
@ShipDate DATE,
@OrderTotal numeric(7,2)
AS
DECLARE @C_ID INT = (
	SELECT CustomerID 
	FROM tblCUSTOMER
	WHERE FirstName = @FName
	AND LastName = @LName
	AND DateOfBirth = @Birth
)
BEGIN TRAN T1
INSERT INTO tblORDER(CustomerID, OrderDate, ShipDate, OrderTotal)
VALUES(@C_ID, @OrderDate, @ShipDate, @OrderTotal)
COMMIT TRAN T1

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
@Zip char(5),
@Phone char(10),
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

-- stored procedure for tblREVIEW
GO
CREATE PROCEDURE uspINSERTREVIEW
@RatingValue INT,
@Quantity INT,
@ProductName varchar(50),
@Fname varchar(50),
@Lname varchar(50),
@BirthDate DATE,
@Odate DATE
AS
DECLARE @R_ID INT, @C_ID INT,@P_ID INT, @O_ID INT, @PO_ID INT
SET @R_ID = (
	SELECT RatingID
	FROM tblRATING
	WHERE RatingValue = @RatingValue
)
SET @P_ID = (
	SELECT ProductID
	FROM tblPRODUCT 
	WHERE ProductName = @ProductName
)
SET @C_ID = (
	SELECT CustomerID
	FROM tblCUSTOMER
	WHERE FirstName = @Fname
	AND LastName = @Lname
	AND DateOfBirth = @BirthDate
)
SET @O_ID = (
	SELECT OrderID
	FROM tblORDER		
	WHERE CustomerID = @C_ID
	AND OrderDate = @Odate
)
SET @PO_ID = (
	SELECT ProductOrderID
	FROM tblPRODUCT_ORDER
	WHERE ProductID = @P_ID
	AND OrderID = @O_ID
	AND Quantity = @Quantity
)
BEGIN TRAN T1
INSERT INTO tblREVIEW (RatingID, ProductOrderID)
VALUES (@R_ID, @PO_ID)
COMMIT TRAN T1

/*
BUSINESS RULES / CHECK CONSTRAINTS--BUSINESS RULES / CHECK CONSTRAINTS--BUSINESS RULES / CHECK CONSTRAINTS
*/

/*
RISHI KAVIKONDALA
No product of type laptop can have a weight of less than 1 pound.
*/
GO
CREATE FUNCTION fn_WindowsWeight() 
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT DISTINCT P.ProductID
        FROM tblPRODUCT P
            JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
        WHERE PT.ProductTypeName = 'Laptop'
        AND P.Weight < 1.0
	)
	BEGIN
        SET @RET = 1
    END
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT WITH NOCHECK
ADD CONSTRAINT CK_WindowsWeight
CHECK (dbo.fn_WindowsWeight() = 0)

/*
RISHI KAVIKONDALA
No Macbook can have an NVIDIA graphics card
*/
GO
CREATE FUNCTION fn_NoNvidiaInApple()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0
    IF EXISTS (
        SELECT * 
        FROM tblPRODUCT_FEATURE PF
            JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
            JOIN tblPRODUCT P ON PF.ProductID = P.ProductID
            JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
            JOIN tblBRAND B ON F.BrandID = B.BrandID
        WHERE P.ProductName LIKE '%Macbook%'
        AND F.BrandID = (
            SELECT B.BrandID
            FROM tblBRAND B
            WHERE B.BrandName = 'NVIDIA'
        )
        AND PT.ProductTypeName = 'Laptop'
    )
    BEGIN
        SET @RET = 1
    END
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT_FEATURE WITH NOCHECK
ADD CONSTRAINT CK_NoNvidiaInApple
CHECK(dbo.fn_NoNvidiaInApple() = 0)

/*
TANNER KOOISTRA 
No customer can have a phone number with letters or an email containing less or more than one '@' symbol
*/
GO
CREATE FUNCTION fn_ValidContactInfo()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT DISTINCT C.CustomerID
		FROM tblCUSTOMER C
		WHERE LEN(C.Email) - LEN(REPLACE(C.Email, '@', '')) <> 1
		OR C.Phone LIKE '%[^0-9]%'
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblCUSTOMER WITH NOCHECK
ADD CONSTRAINT CK_ValidContactInfo
CHECK (dbo.fn_ValidContactInfo() = 0)

/*
TANNER KOOISTRA
Two reviews cannot have the exact same comment
*/
GO
CREATE FUNCTION fn_CommentAppliesToOneReview()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0
    IF EXISTS (
        SELECT C.ReviewID, COUNT(C.ReviewID) AS Total
        FROM tblCOMMENT C
        GROUP BY C.ReviewID
        HAVING COUNT(C.ReviewID) >= 2
    )
    BEGIN
        SET @RET = 1
    END
RETURN @RET
END
GO
ALTER TABLE tblCOMMENT WITH NOCHECK
ADD CONSTRAINT CK_CommentAppliesToOneReview
CHECK (dbo.fn_CommentAppliesToOneReview() = 0)

/*
BRIAN YING
Less than 64GB storage should not be a possible feature
*/
GO
CREATE FUNCTION fn_Min64GBStorage()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT S.FeatureID
		FROM tblSTORAGE S
		WHERE S.Gigabytes < 64
	)
	BEGIN
	SET @RET = 1
	END
RETURN @RET
END
GO
ALTER TABLE tblSTORAGE WITH NOCHECK
ADD CONSTRAINT CK_Min64GBStorage
CHECK(dbo.fn_Min64GBStorage() = 0)

/*
BRIAN YING
A product order must have a quantity between 1 and 20 inclusive
*/
GO
CREATE FUNCTION fn_ProductOrderBetween1And20()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT PO.ProductOrderID
		FROM tblPRODUCT_ORDER PO
		WHERE PO.Quantity < 1
		OR PO.Quantity > 20
	)
	BEGIN
	SET @RET = 1
	END
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT_ORDER WITH NOCHECK
ADD CONSTRAINT CK_QuantityBetween1And20
CHECK(dbo.fn_ProductOrderBetween1And20() = 0)

/*
RYAN KIM
A customer cannot be under 18 years of age.
*/
GO
CREATE FUNCTION fn_MinCustAge18ToOrder() 
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT CustomerID FROM tblCUSTOMER 
		WHERE DateOfBirth > DateAdd(Year, -18, GetDate())
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblCUSTOMER WITH NOCHECK
ADD CONSTRAINT CK_MinCustAge18ToOrder
CHECK (dbo.fn_MinCustAge18ToOrder() = 0)

/*
RYAN KIM
A rating must be the range 1 - 5 inclusive
*/
GO
CREATE FUNCTION fn_RatingOnly1to5()
RETURNS INT
AS 
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT * FROM tblRATING R
		WHERE R.RatingVALUE NOT BETWEEN 1 AND 5
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblRATING WITH NOCHECK
ADD CONSTRAINT CK_RatingOnly1to5
CHECK (dbo.fn_RatingOnly1to5() = 0)



/* COMPUTED COLUMNS--COMPUTED COLUMNS--COMPUTED COLUMNS--COMPUTED COLUMNS--COMPUTED COLUMNS--COMPUTED COLUMNS */

/*
RISHI KAVIKONDALA
Computed column for number of products of type laptop per security type
(Security types are: Face ID, Touch ID, default password)
*/
GO
CREATE FUNCTION CalcNumLaptopsPerSecurityType(@PK INT)
RETURNS
INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT P.ProductID)
    FROM tblPRODUCT P
        JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
        JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
        JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
        JOIN tblSECURITY S ON F.FeatureID = S.FeatureID
        JOIN tblSECURITY_TYPE ST ON S.SecurityTypeID = ST.SecurityTypeID
    WHERE ST.SecurityTypeID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblSECURITY_TYPE
ADD NumLaptopsPerSecurityType AS (dbo.CalcNumLaptopsPerSecurityType(SecurityTypeID))

/*
RISHI KAVIKONDALA
Computed column for number of orders per region
*/
GO
CREATE FUNCTION CalcNumOrdersPerRegion(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT O.OrderID)
    FROM tblORDER O
        JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
        JOIN tblREGION R ON C.RegionID = R.RegionID
    WHERE R.RegionID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblREGION
ADD NumOrdersPerRegion AS (dbo.CalcNumOrdersPerRegion(RegionID))

/*
TANNER KOOISTRA
Computed Column for total number of orders a customer has placed
*/
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

/*
TANNER KOOISTRA
Computed Column for how much money a customer has spent on products of type laptop
*/
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

/*
BRIAN YING
Average Rating for a product
*/
GO
CREATE FUNCTION AvgLaptopRating(@PK INT)
RETURNS
NUMERIC(2,1)
AS
BEGIN
DECLARE @RET NUMERIC(2,1) = (
	SELECT AVG(R.RatingValue)
	FROM tblRATING R
	JOIN tblREVIEW RE ON R.RatingID = RE.RatingID
	JOIN tblPRODUCT_ORDER PO ON RE.ProductOrderID = PO.ProductOrderID
	JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
	JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
	WHERE P.ProductID = @PK
	AND PT.ProductTypeName = 'Laptop')
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT
ADD AverageRating AS (dbo.AvgLaptopRating(ProductID))

/*
BRIAN YING
Number of Orders previously placed for a product
*/
GO
CREATE FUNCTION NumOfOrdersLaptop(@PK INT)
RETURNS
INT
AS
BEGIN
DECLARE @RET INT = (
	SELECT COUNT(DISTINCT PO.ProductOrderID)
	FROM tblPRODUCT_ORDER PO
	JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
	JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
	WHERE P.ProductID = @PK
	AND PT.ProductTypeName = 'Laptop')
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT
ADD NumberOfOrdersPlaced AS (dbo.NumOfOrdersLaptop(ProductID))

/*
RYAN KIM
Number of products that have a particular color
*/
GO
CREATE FUNCTION CalcNumLaptopsPerColor(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT P.ProductID)
    FROM tblPRODUCT P
        JOIN tblCOLOR C ON P.ColorID = C.ColorID
    WHERE C.ColorID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblCOLOR
ADD NumLaptopsPerColor AS (dbo.CalcNumLaptopsPerColor(ColorID))

/*
RYAN KIM
Number of times a rating value was assigned in the past 6 months
*/
GO
CREATE FUNCTION CalcNumRatingsPast6Months(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(R.RatingID)
    FROM tblREVIEW R
		JOIN tblRATING RA ON R.RatingID = RA.RatingID
        JOIN tblPRODUCT_ORDER PO ON R.ProductOrderID = PO.ProductOrderID
        JOIN tblORDER O ON PO.OrderID = O.OrderID
    WHERE R.RatingID = @PK
	AND O.OrderDate >= DateAdd(Month, -6, GetDate())
)
RETURN @RET
END
GO
ALTER TABLE tblRATING
ADD NumRatingsPast6Months AS (dbo.CalcNumRatingsPast6Months(RatingID))

/* VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS--VIEWS */

/*
RISHI KAVIKONDALA
Count products of type laptop by the number of unique brands
that contributed features to them.
1 - 3: 'Few contributors'
4 - 5: 'Some contributors'
Greater than 5: 'Lots of contributors'
*/
GO
CREATE VIEW [Brands Contributions to Laptops] AS
SELECT TOP 4 (CASE
    WHEN NumBrands BETWEEN 1 AND 2
    THEN 'Few contributing brands'
    WHEN NumBrands BETWEEN 3 AND 4
    THEN 'Some contributing brands'
    WHEN NumBrands BETWEEN 5 AND 6
    THEN 'Many contributing brands'
    ELSE 'Lots of contributing brands'
END) NumBrandsLabel, COUNT(*) AS UniqueBrands
FROM (
    SELECT P.ProductID, COUNT(DISTINCT B.BrandID) AS NumBrands
    FROM tblPRODUCT P
        JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
        JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
        JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE PT.ProductTypeName = 'Laptop'
    GROUP BY P.ProductID
) AS subquery1
GROUP BY (CASE
    WHEN NumBrands BETWEEN 1 AND 2
    THEN 'Few contributing brands'
    WHEN NumBrands BETWEEN 3 AND 4
    THEN 'Some contributing brands'
    WHEN NumBrands BETWEEN 5 AND 6
    THEN 'Many contributing brands'
    ELSE 'Lots of contributing brands'
END)
ORDER BY UniqueBrands DESC

/*
RISHI KAVIKONDALA
Rank the top 3 most expensive products of type laptop
with an average rating greater than 3.0
that rely on external audio part producing brands for their audio systems 
*/
GO
CREATE VIEW [Costliest Laptops With External Audio Parts And High Ratings] AS
SELECT TOP 3 P.ProductName, P.Price, P.AverageRating
FROM tblPRODUCT_FEATURE PF
    JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
    JOIN tblPRODUCT P ON PF.ProductID = P.ProductID
    JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
    JOIN tblBRAND B ON F.BrandID = B.BrandID
    JOIN tblBRAND_TYPE BT ON B.BrandTypeID = BT.BrandTypeID
WHERE BT.BrandTypeID = (
    SELECT BT.BrandTypeID
    FROM tblBRAND_TYPE BT
    WHERE BT.BrandTypeName LIKE '%Audio%'
)
AND P.AverageRating > 3.0
AND PT.ProductTypeName = 'Laptop'
ORDER BY P.Price DESC

/*
TANNER KOOISTRA
Find the top 3 lightest products of type laptop in order, which:
- run on non-Windows OS,
- have a display resolution of 2880 x 1800
- consists of any color except black
- must have been ordered at least once in the last year.
*/
GO
CREATE VIEW [NonWindows colored 2880x1800 light laptops ordered min once in last year] AS
SELECT DISTINCT TOP 3 P.ProductName, C.ColorName, subq1.FeatureName, D.Resolution, P.Weight
FROM tblPRODUCT P
    JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
    JOIN tblCOLOR C ON P.ColorID = C.ColorID
    JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
    JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
    JOIN tblDISPLAY D ON F.FeatureID = D.FeatureID
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
    JOIN tblORDER O ON PO.OrderID = O.OrderID
    JOIN (
        SELECT P.ProductID, F.FeatureName
        FROM tblPRODUCT P
            JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
            JOIN tblCOLOR C ON P.ColorID = C.ColorID
            JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
            JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
            JOIN tblOS OS ON F.FeatureID = OS.FeatureID
            JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
            JOIN tblORDER O ON PO.OrderID = O.OrderID
        WHERE F.FeatureName != 'Windows'
        ) AS subq1 ON P.ProductID = subq1.ProductID
WHERE D.Resolution = '2880 x 1800'
AND C.ColorName NOT LIKE '%Black%'
AND PT.ProductTypeName = 'Laptop'
AND O.OrderDate > DATEADD(YEAR,-1,GETDATE())
ORDER BY P.Weight

/* 
TANNER KOOISTRA
Find the average price of a product of type laptop:
- with an Intel CPU that has at least 2 cores
- battery life greater than or equal to 10 hours
- released in the last 2 years
- purchased only by customers over 30 years old.
*/
GO
CREATE VIEW [Avg Price 2Year Old Laptop with 2Core Intel CPU and Min 30Yr Old Customers] AS
SELECT CONVERT(numeric(6, 2), AVG(P.Price)) AS AveragePrice
FROM tblPRODUCT_FEATURE PF
    JOIN tblPRODUCT P ON PF.ProductID = P.ProductID
    JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
    JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
    JOIN tblCPU CPU ON F.FeatureID = CPU.FeatureID
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
    JOIN tblORDER O ON PO.OrderID = O.OrderID
    JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
WHERE F.BrandID = (
    SELECT B.BrandID
    FROM tblBRAND B
    WHERE B.BrandName = 'Intel'
)
AND CPU.NumCores >= 2
AND P.BatteryLife >= 10.0
AND P.ReleaseYear > DATEADD(YEAR, -2, GETDATE())
AND C.DateOfBirth < DATEADD(YEAR, -30, GETDATE())
AND PT.ProductTypeName = 'Laptop'

/*
BRIAN YING
Find the three lowest priced 2019-released laptops that:
- run on Windows 10 Home
- has at least 1 speaker
- and weighs more than 3 lbs.
*/
GO
CREATE VIEW [Cheapest 2019 Laptops With Windows 10 Home, One Speaker, Over 3 Pounds] AS
SELECT TOP 3 P.ProductID, P.ProductName
FROM tblPRODUCT P
	JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
	JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
	JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
	JOIN tblOS OS ON PF.FeatureID = OS.FeatureID
	JOIN tblVERSION V ON OS.VersionID = V.VersionID
	JOIN tblAUDIO A ON PF.FeatureID = A.FeatureID
WHERE F.FeatureName = 'Windows'
AND V.VersionName = '10 Home'
AND P.ReleaseYear = '2019'
AND PT.ProductTypeName = 'Laptop'
AND A.NumSpeakers >= 1
AND P.Weight > 3
ORDER BY P.Price ASC

/*
BRIAN YING
Find the customers who have:
- ordered over $1000 of laptop(s) in the last six months
- that also have never been rated below 3 stars
*/
GO
CREATE VIEW [Customers With Over $1000 Last 6 Months For Laptops Never Under 3 Stars] AS
SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.OrderTotal) AS AmountSpent
FROM tblCUSTOMER C
	JOIN tblORDER O ON C.CustomerID = O.CustomerID
	JOIN tblPRODUCT_ORDER PO ON O.OrderID = PO.OrderID
	JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
	JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
	JOIN (
		SELECT P.ProductID
		FROM tblRATING R
			JOIN tblREVIEW RE ON R.RatingID = RE.RatingID
			JOIN tblPRODUCT_ORDER PO ON RE.ProductOrderID = PO.ProductOrderID
			JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
			JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
		WHERE PT.ProductTypeName = 'Laptop'
		AND P.ProductID NOT IN (
			SELECT P.ProductID
			FROM tblPRODUCT P
				JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
				JOIN tblREVIEW R ON PO.ProductOrderID = R.ProductOrderID
				JOIN tblRATING RA ON R.RatingID = RA.RatingID
			WHERE RA.RatingValue < 3)
	) AS subq1 ON P.ProductID = subq1.ProductID
WHERE O.OrderDate >= DATEADD(MONTH, -6, GETDATE())
AND PT.ProductTypeName = 'Laptop'
GROUP BY C.CustomerID, C.FirstName, C.LastName
HAVING SUM(O.OrderTotal) > 1000

/*
RYAN KIM 
Find the top 5 products of type laptop meeting the following conditions:
- not affiliated with Apple
- a graphics card made by NVIDIA
- received an average rating of 3 or higher
- priced under $1000
- released before 2020
- (ordered output by price highest to lowest)
*/
GO
CREATE VIEW [Pre2020 Laptops under 1000 at least 3 Rating] AS
SELECT DISTINCT TOP 5 P.ProductName, F.FeatureName, P.AverageRating, P.Price
FROM tblPRODUCT P
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
	JOIN tblREVIEW Re ON PO.ProductOrderID = Re.ProductOrderID
	JOIN tblRATING Ra ON Re.RatingID = Ra.RatingID 
	JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
	JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
	JOIN tblBRAND B ON F.BrandID = B.BrandID
	JOIN tblGRAPHICS G ON F.FeatureID = G.FeatureID
WHERE P.ProductName NOT LIKE '%Apple%'
AND P.ProductName NOT LIKE '%Macbook%'
AND F.BrandID = (
	SELECT BrandID
	FROM tblBRAND
	WHERE BrandName = 'NVIDIA'
)
AND P.AverageRating >= 3
AND P.Price < 1000
AND P.ReleaseYear < 2020
ORDER BY P.Price DESC

/*
RYAN KIM
Find and group the products of type laptop that:
- have been ordered at least once by people younger than 50 in the West or South.
- into 3 groups:
	- < 5 hrs: 'low battery life'
	- >= 5 hrs and < 15 hrs: 'medium battery life'
	- >= 15 hrs: 'high battery life'
*/
GO
CREATE VIEW [Laptops Battery Life Sub-50 West or South] AS
SELECT (CASE
WHEN BattLife < 5
THEN 'Low battery life'
WHEN BattLife >= 5 AND BattLife <= 15
THEN 'Medium battery life'
ELSE 'High battery life'
END)
AS BatteryTier, COUNT(*) AS NumLaptops
FROM (
	SELECT P.ProductID, P.ProductName, P.BatteryLife AS BattLife
	FROM tblPRODUCT P
		JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
		JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
		JOIN tblORDER O ON PO.OrderID = O.OrderID
		JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
		JOIN tblREGION R ON C.RegionID = R.RegionID
	WHERE R.RegionName = 'West'
	OR R.RegionName = 'South'
	AND C.DateOfBirth > DateAdd(Year, -50, GetDate())
	AND PT.ProductTypeName = 'Laptop') AS TheLaptops
GROUP BY (CASE
WHEN BattLife < 5
THEN 'Low battery life'
WHEN BattLife >= 5 AND BattLife <= 15
THEN 'Medium battery life'
ELSE 'High battery life'
END)