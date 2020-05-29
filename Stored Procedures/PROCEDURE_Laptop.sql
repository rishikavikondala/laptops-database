USE INFO330_Proj_4

DBCC CHECKIDENT (tblLAPTOP_FEATURE, RESEED, 0)

--DELETE FROM tblLAPTOP
-- INSERT INTO tblLAPTOP

SELECT * FROM tblLAPTOP_FEATURE

GO
ALTER PROCEDURE uspINSERTLAPTOP
    @LaptopName varchar(50),
    @ReleaseYear char(4),
    @ColorName varchar(20)
AS
DECLARE @Y_ID INT, @C_ID INT
SELECT @Y_ID = (
    SELECT ReleaseYearID
    FROM tblRELEASE_YEAR
    WHERE ReleaseYear = @ReleaseYear
)
SELECT @C_ID = (
    SELECT ColorID
    FROM tblCOLOR
    WHERE ColorName = @ColorName
)
BEGIN TRANSACTION T1
INSERT INTO tblLAPTOP(LaptopName, ReleaseYearID, ColorID)
VALUES(@LaptopName, @Y_ID, @C_ID)
COMMIT TRANSACTION T1
GO

EXEC uspINSERTLAPTOP @LaptopName = 'Apple Macbook Air', @ReleaseYear = '2020', @ColorName = 'Gold'
EXEC uspINSERTLAPTOP @LaptopName = 'Google Pixelbook Go', @ReleaseYear = '2019', @ColorName = 'Black'
EXEC uspINSERTLAPTOP @LaptopName = 'Microsoft Surface Pro 7', @ReleaseYear = '2019', @ColorName = 'Red'
EXEC uspINSERTLAPTOP @LaptopName = 'Dell XPS 15 Laptop', @ReleaseYear = '2020', @ColorName = 'Grey'
EXEC uspINSERTLAPTOP @LaptopName = 'Apple Macbook Pro 13-inch', @ReleaseYear = '2020', @ColorName = 'Silver'

EXEC uspINSERTLAPTOP @LaptopName = 'Microsoft Surface Laptop 3', @ReleaseYear = '2019', @ColorName = 'Artic Blue'
EXEC uspINSERTLAPTOP @LaptopName = 'Alienware M17 R1 Gaming Laptop', @ReleaseYear = '2019', @ColorName = 'Silver'
EXEC uspINSERTLAPTOP @LaptopName = 'Samsung Galexy Book Flex', @ReleaseYear = '2020', @ColorName = 'Royal Blue'
EXEC uspINSERTLAPTOP @LaptopName = 'Lenovo ThinkPad X1', @ReleaseYear = '2019', @ColorName = 'Black'
EXEC uspINSERTLAPTOP @LaptopName = 'Dell Precision 5540', @ReleaseYear = '2019', @ColorName = 'Black'

EXEC uspINSERTLAPTOP @LaptopName = 'Acer Laptop Aspire 5', @ReleaseYear = '2019', @ColorName = 'Black'
EXEC uspINSERTLAPTOP @LaptopName = 'Lenovo Chromebook S330', @ReleaseYear = '2018', @ColorName = 'Business Black'
EXEC uspINSERTLAPTOP @LaptopName = 'MSI GT76 TITAN DT-039', @ReleaseYear = '2019', @ColorName = 'Aluminum Black'
EXEC uspINSERTLAPTOP @LaptopName = 'Alienware Area 51m', @ReleaseYear = '2019', @ColorName = 'Lunar Light'
EXEC uspINSERTLAPTOP @LaptopName = 'Apple Mac Book Pro 15-inch', @ReleaseYear = '2019', @ColorName = 'Space Gray'

EXEC uspINSERTLAPTOP @LaptopName = 'Asus ZenBook 13', @ReleaseYear = '2018', @ColorName = 'Royal Blue'
EXEC uspINSERTLAPTOP @LaptopName = 'Dell G5 15 Gaming Laptop', @ReleaseYear = '2019', @ColorName = 'Space Black'
EXEC uspINSERTLAPTOP @LaptopName = 'Dell G7 17 Gaming Laptop', @ReleaseYear = '2019', @ColorName = 'Black'
EXEC uspINSERTLAPTOP @LaptopName = 'VivoBook 15', @ReleaseYear = '2019', @ColorName = 'Transparent Silver'
EXEC uspINSERTLAPTOP @LaptopName = 'Acer Nitro 5 Gaming Laptop', @ReleaseYear = '2019', @ColorName = 'Black'