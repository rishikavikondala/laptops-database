USE INFO330_Proj_4
DBCC CHECKIDENT (tblPRODUCT_ORDER, RESEED, 0)

-- tblPRODUCT_ORDER Stored Procedure
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

--Populating tblLAPTOP_ORDER with Stored Procedures

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Apple Macbook Air',
@FName = 'Can',
@LName = 'Carey',
@Birth = '1984-05-16',
@OrderDate = '2019-12-13',
@ShipDate = '2019-12-15',
@OrderTotal = 1067.93,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Google Pixelbook Go',
@FName = 'Lesley',
@LName = 'Tillman',
@Birth = '1971-03-29',
@OrderDate = '2019-11-28',
@ShipDate = '2019-11-30',
@OrderTotal = 676.26,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Microsoft Surface Pro 7',
@FName = 'Poppy',
@LName = 'Oneil',
@Birth = '1998-08-05',
@OrderDate = '2019-04-19',
@ShipDate = '2019-04-21',
@OrderTotal = 804.74,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Dell XPS 15 Laptop',
@FName = 'Rae',
@LName = 'Porter',
@Birth = '2000-10-19',
@OrderDate = '2019-10-05',
@ShipDate = '2019-10-07',
@OrderTotal = 1960.19,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Apple Macbook Pro 13-inch',
@FName = 'Sonnie',
@LName = 'Sadler',
@Birth = '1984-01-04',
@OrderDate = '2020-03-02',
@ShipDate = '2020-03-04',
@OrderTotal = 2494.96,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Microsoft Surface Laptop 3',
@FName = 'Aizah',
@LName = 'Talley',
@Birth = '1995-09-10',
@OrderDate = '2020-01-11',
@ShipDate = '2020-01-15',
@OrderTotal = 998.78,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Alienware M17 R1 Gaming Laptop',
@FName = 'Jaydon',
@LName = 'Tyson',
@Birth = '1990-12-15',
@OrderDate = '2020-04-08',
@ShipDate = '2020-04-09',
@OrderTotal = 2240.21,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Samsung Galaxy Book Flex',
@FName = 'Ryan',
@LName = 'Muller',
@Birth = '1999-04-12',
@OrderDate = '2019-11-28',
@ShipDate = '2019-11-30',
@OrderTotal = 1270.10,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Lenovo ThinkPad X1',
@FName = 'Zachary',
@LName = 'Easton',
@Birth = '1992-02-22',
@OrderDate = '2019-06-22',
@ShipDate = '2019-06-24',
@OrderTotal = 980.77,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Dell Precision 5540',
@FName = 'Sydney',
@LName = 'Ni',
@Birth = '2000-07-28',
@OrderDate = '2020-02-02',
@ShipDate = '2020-02-03',
@OrderTotal = 1949.11,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Acer Laptop Aspire 5',
@FName = 'Kevin',
@LName = 'Anderson',
@Birth = '1999-12-27',
@OrderDate = '2019-04-21',
@ShipDate = '2019-04-23',
@OrderTotal = 2980.49,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Lenovo Chromebook S330',
@FName = 'Jared',
@LName = 'Hong',
@Birth = '1997-05-02',
@OrderDate = '2019-11-11',
@ShipDate = '2019-11-13',
@OrderTotal = 401.11,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'MSI GT76 TITAN DT-039',
@FName = 'Aditya',
@LName = 'Balaga',
@Birth = '1980-12-21',
@OrderDate = '2020-03-02',
@ShipDate = '2020-03-04',
@OrderTotal = 870.79,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Alienware Area 51m',
@FName = 'Trinity',
@LName = 'Nguyen',
@Birth = '1995-12-02',
@OrderDate = '2020-05-11',
@ShipDate = '2020-05-13',
@OrderTotal = 609.09,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Apple MacBook Pro 15-inch',
@FName = 'Richard',
@LName = 'Dong',
@Birth = '1969-06-09',
@OrderDate = '2019-09-14',
@ShipDate = '2019-09-16',
@OrderTotal = 1567.05,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Asus ZenBook 13',
@FName = 'Bob',
@LName = 'Blekins',
@Birth = '2001-01-04',
@OrderDate = '2019-10-24',
@ShipDate = '2019-10-26',
@OrderTotal = 1057.49,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Dell G5 15 Gaming Laptop',
@FName = 'Jeremy',
@LName = 'Hodge',
@Birth = '1990-03-27',
@OrderDate = '2019-12-20',
@ShipDate = '2019-12-22',
@OrderTotal = 1016.49,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Dell G7 17 Gaming Laptop',
@FName = 'Anne',
@LName = 'Long',
@Birth = '1980-08-09',
@OrderDate = '2020-02-02',
@ShipDate = '2020-02-04',
@OrderTotal = 1799.19,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'VivoBook 15',
@FName = 'Bill',
@LName = 'Parker',
@Birth = '1985-05-03',
@OrderDate = '2019-07-27',
@ShipDate = '2019-07-29',
@OrderTotal = 653.24,
@Quantity = 1

EXEC uspINSERTPRODUCTORDER
@ProductName = 'Acer Nitro 5 Gaming Laptop',
@FName = 'Derek',
@LName = 'Pill',
@Birth = '1998-06-18',
@OrderDate = '2020-04-11',
@ShipDate = '2020-04-13',
@OrderTotal = 915.19,
@Quantity = 1

--tblORDER Stored Procedure
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

--Populating tblORDER with Stored Procedures
EXEC uspINSERTORDER
@FName = 'Can',
@LName = 'Carey',
@Birth = '1984-05-16',
@OrderDate = '2019-12-13',
@ShipDate = '2019-12-15',
@OrderTotal = 1067.93

EXEC uspINSERTORDER
@FName = 'Lesley',
@LName = 'Tillman',
@Birth = '1971-03-29',
@OrderDate = '2019-11-28',
@ShipDate = '2019-11-30',
@OrderTotal = 676.26

EXEC uspINSERTORDER
@FName = 'Poppy',
@LName = 'Oneil',
@Birth = '1998-08-05',
@OrderDate = '2019-04-19',
@ShipDate = '2019-04-21',
@OrderTotal = 804.74

EXEC uspINSERTORDER
@FName = 'Rae',
@LName = 'Porter',
@Birth = '2000-10-19',
@OrderDate = '2019-10-05',
@ShipDate = '2019-10-07',
@OrderTotal = 1960.19

EXEC uspINSERTORDER
@FName = 'Sonnie',
@LName = 'Sadler',
@Birth = '1984-01-04',
@OrderDate = '2020-03-02',
@ShipDate = '2020-03-04',
@OrderTotal = 2494.96

EXEC uspINSERTORDER
@FName = 'Aizah',
@LName = 'Talley',
@Birth = '1995-09-10',
@OrderDate = '2020-01-11',
@ShipDate = '2020-01-15',
@OrderTotal = 998.78

EXEC uspINSERTORDER
@FName = 'Jaydon',
@LName = 'Tyson',
@Birth = '1990-12-15',
@OrderDate = '2020-04-08',
@ShipDate = '2020-04-09',
@OrderTotal = 2240.21

EXEC uspINSERTORDER
@FName = 'Ryan',
@LName = 'Muller',
@Birth = '1999-04-12',
@OrderDate = '2019-11-28',
@ShipDate = '2019-11-30',
@OrderTotal = 1270.10

EXEC uspINSERTORDER
@FName = 'Zachary',
@LName = 'Easton',
@Birth = '1992-02-22',
@OrderDate = '2019-06-22',
@ShipDate = '2019-06-24',
@OrderTotal = 980.77

EXEC uspINSERTORDER
@FName = 'Sydney',
@LName = 'Ni',
@Birth = '2000-07-28',
@OrderDate = '2020-02-02',
@ShipDate = '2020-02-03',
@OrderTotal = 1949.11

EXEC uspINSERTORDER
@FName = 'Kevin',
@LName = 'Anderson',
@Birth = '1999-12-27',
@OrderDate = '2019-04-21',
@ShipDate = '2019-04-23',
@OrderTotal = 2980.49

EXEC uspINSERTORDER
@FName = 'Jared',
@LName = 'Hong',
@Birth = '1997-05-02',
@OrderDate = '2019-11-11',
@ShipDate = '2019-11-13',
@OrderTotal = 401.11

EXEC uspINSERTORDER
@FName = 'Aditya',
@LName = 'Balaga',
@Birth = '1980-12-21',
@OrderDate = '2020-03-02',
@ShipDate = '2020-03-04',
@OrderTotal = 870.79

EXEC uspINSERTORDER
@FName = 'Trinity',
@LName = 'Nguyen',
@Birth = '1995-12-02',
@OrderDate = '2020-05-11',
@ShipDate = '2020-05-13',
@OrderTotal = 609.09

EXEC uspINSERTORDER
@FName = 'Richard',
@LName = 'Dong',
@Birth = '1969-06-09',
@OrderDate = '2019-09-14',
@ShipDate = '2019-09-16',
@OrderTotal = 1567.05

EXEC uspINSERTORDER
@FName = 'Bob',
@LName = 'Blekins',
@Birth = '2001-01-04',
@OrderDate = '2019-10-24',
@ShipDate = '2019-10-26',
@OrderTotal = 1057.49

EXEC uspINSERTORDER
@FName = 'Jeremy',
@LName = 'Hodge',
@Birth = '1990-03-27',
@OrderDate = '2019-12-20',
@ShipDate = '2019-12-22',
@OrderTotal = 1016.49

EXEC uspINSERTORDER
@FName = 'Anne',
@LName = 'Long',
@Birth = '1980-08-09',
@OrderDate = '2020-02-02',
@ShipDate = '2020-02-04',
@OrderTotal = 1799.19

EXEC uspINSERTORDER
@FName = 'Bill',
@LName = 'Parker',
@Birth = '1985-05-03',
@OrderDate = '2019-07-27',
@ShipDate = '2019-07-29',
@OrderTotal = 653.24

EXEC uspInsertORDER
@FName = 'Derek',
@LName = 'Pill',
@Birth = '1998-06-18',
@OrderDate = '2020-04-11',
@ShipDate = '2020-04-13',
@OrderTotal = 915.19