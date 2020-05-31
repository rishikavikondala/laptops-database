USE INFO330_Proj_4
DBCC CHECKIDENT (tblPRODUCT, RESEED, 0)
DELETE FROM tblPRODUCT

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
GO

EXEC uspINSERTPRODUCT
@ProductName = 'Apple Macbook Air',
@ColorName = 'Gold', 
@ProductTypeName = 'Laptop', 
@ReleaseYear = '2020',
@BatteryLife = 12.0,
@Weight = 2.8,
@Price = 999.00

EXEC uspINSERTPRODUCT
@ProductName = 'Google Pixelbook Go', 
@ColorName = 'Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019',
@BatteryLife = 12.0,
@Weight = 2.0,
@Price = 649.00

EXEC uspINSERTPRODUCT
@ProductName = 'Microsoft Surface Pro 7',
@ColorName = 'Red',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019',
@BatteryLife = 10.5,
@Weight = 1.4,
@Price = 749.99

EXEC uspINSERTPRODUCT
@ProductName = 'Dell XPS 15 Laptop',
@ColorName = 'Grey',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2020', 
@BatteryLife = 20.5,
@Weight = 4.0,
@Price = 1799.99

EXEC uspINSERTPRODUCT
@ProductName = 'Apple Macbook Pro 13-inch',
@ColorName = 'Silver',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2020',
@BatteryLife = 11.0,
@Weight = 4.30,
@Price = 2399.00

EXEC uspINSERTPRODUCT
@ProductName = 'Microsoft Surface Laptop 3',
@ColorName = 'Artic Blue',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019', 
@BatteryLife = 11.5,
@Weight = 2.9,
@Price = 1599.99

EXEC uspINSERTPRODUCT
@ProductName = 'Alienware M17 R1 Gaming Laptop',
@ColorName = 'Silver',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019', 
@BatteryLife = 2.5,
@Weight = 5.8,
@Price = 1794.99

EXEC uspINSERTPRODUCT
@ProductName = 'Samsung Galaxy Book Flex',
@ColorName = 'Royal Blue',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2020',
@BatteryLife = 19.0,
@Weight = 2.4,
@Price = 949.99

EXEC uspINSERTPRODUCT
@ProductName = 'Lenovo ThinkPad X1',
@ColorName = 'Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019', 
@BatteryLife = 18.3,
@Weight = 2.4,
@Price = 1353.87

EXEC uspINSERTPRODUCT
@ProductName = 'Dell Precision 5540',
@ColorName = 'Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019',
@BatteryLife = 6.2,
@Weight = 3.4,
@Price = 1829.00

EXEC uspINSERTPRODUCT
@ProductName = 'Acer Laptop Aspire 5',
@ColorName = 'Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019',
@BatteryLife = 11.0,
@Weight = 4.0,
@Price = 659.99

EXEC uspINSERTPRODUCT
@ProductName = 'Lenovo Chromebook S330',
@ColorName = 'Business Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2018',
@BatteryLife = 10.0,
@Weight = 3.3,
@Price = 249.99

EXEC uspINSERTPRODUCT
@ProductName = 'MSI GT76 TITAN DT-039',
@ColorName = 'Aluminum Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019',
@BatteryLife = 6.0,
@Weight = 9.9,
@Price = 4599.99

EXEC uspINSERTPRODUCT
@ProductName = 'Alienware Area 51m',
@ColorName = 'Lunar Light',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019',
@BatteryLife = 2.0,
@Weight = 8.5,
@Price = 2544.99

EXEC uspINSERTPRODUCT
@ProductName = 'Apple MacBook Pro 15-inch',
@ColorName = 'Space Gray',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019', 
@BatteryLife = 10.0,
@Weight = 4.0,
@Price = 3229.00

EXEC uspINSERTPRODUCT
@ProductName = 'Asus ZenBook 13',
@ColorName = 'Royal Blue',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2018', 
@BatteryLife = 14.0,
@Weight = 2.6,
@Price = 999.99

EXEC uspINSERTPRODUCT
@ProductName = 'Dell G5 15 Gaming Laptop',
@ColorName = 'Space Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019', 
@BatteryLife = 6.3,
@Weight = 5.9,
@Price = 949.99

EXEC uspINSERTPRODUCT
@ProductName = 'Dell G7 17 Gaming Laptop',
@ColorName = 'Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019', 
@BatteryLife = 6.3,
@Weight = 6.9,
@Price = 1729.99

EXEC uspINSERTPRODUCT
@ProductName = 'VivoBook 15',
@ColorName = 'Transparent Silver',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019', 
@BatteryLife = 9.0,
@Weight = 3.8,
@Price = 599.99

EXEC uspINSERTPRODUCT
@ProductName = 'Acer Nitro 5 Gaming Laptop',
@ColorName = 'Black',
@ProductTypeName = 'Laptop',
@ReleaseYear = '2019', 
@BatteryLife = 7.0,
@Weight = 5.7,
@Price = 879.99