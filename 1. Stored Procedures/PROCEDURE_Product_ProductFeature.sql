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

--DBCC CHECKIDENT (tblPRODUCT_FEATURE, RESEED, 0)
--Product_Feature

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

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'MacOS', @ProductName = 'Apple Macbook Air'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Retina Display', @ProductName = 'Apple Macbook Air'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '1.1GHz dual-core Intel Core i3, Turbo Boost up to 3.2GHz, with 4MB L3 cache', @ProductName = 'Apple Macbook Air'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Iris Plus', @ProductName = 'Apple Macbook Air'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Touch ID sensor', @ProductName = 'Apple Macbook Air'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FaceTime HD camera', @ProductName = 'Apple Macbook Air'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Stereo speakers with wide stereo sound', @ProductName = 'Apple Macbook Air'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe-based SSD', @ProductName = 'Apple Macbook Air'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'ChromeOS', @ProductName = 'Google Pixelbook Go'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Full HD Display', @ProductName = 'Google Pixelbook Go'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '8th Gen Intel Core m3', @ProductName = 'Google Pixelbook Go'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Standard graphics (no GPU)', @ProductName = 'Google Pixelbook Go'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Google Pixelbook Go'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Duo Cam', @ProductName = 'Google Pixelbook Go'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Front-firing speakers for better surround sound', @ProductName = 'Google Pixelbook Go'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Intel Core m3 Storage', @ProductName = 'Google Pixelbook Go'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Microsoft Surface Pro 7'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PixelSense display', @ProductName = 'Microsoft Surface Pro 7'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Quad-core 10th Gen Intel Core i5-1035G4 Processor', @ProductName = 'Microsoft Surface Pro 7'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Iris Plus', @ProductName = 'Microsoft Surface Pro 7'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows Hello', @ProductName = 'Microsoft Surface Pro 7'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Front-facing camera with full HD', @ProductName = 'Microsoft Surface Pro 7'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Stereo speakers', @ProductName = 'Microsoft Surface Pro 7'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Solid-state drive (SSD)', @ProductName = 'Microsoft Surface Pro 7'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Dell XPS 15 Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'InfinityEdge Anti-Glare Non-Touch', @ProductName = 'Dell XPS 15 Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @ProductName = 'Dell XPS 15 Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce GTX 1650 4GB GDDR5', @ProductName = 'Dell XPS 15 Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Dell XPS 15 Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '4-element lens webcam', @ProductName = 'Dell XPS 15 Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Stereo speakers with Waves MaxxAudio Pro', @ProductName = 'Dell XPS 15 Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'M.2 PCIe NVMe SSD', @ProductName = 'Dell XPS 15 Laptop'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'MacOS', @ProductName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Retina display', @ProductName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '2.6GHz 6‑core Intel Core i7, Turbo Boost up to 4.5GHz, with 12MB shared L3 cache', @ProductName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Radeon Pro', @ProductName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Touch ID sensor', @ProductName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FaceTime HD camera', @ProductName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'High-fidelity system with force-cancelling woofers and wide stereo sound', @ProductName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe-based SSD', @ProductName = 'Apple Macbook Pro 13-inch'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PixelSense Display', @ProductName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Quad-core 10th Gen Intel Core i7-1065G7 Processor', @ProductName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Iris Plus', @ProductName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Firmware TPM', @ProductName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Front-facing camera with full HD', @ProductName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Omnisonic Speakers', @ProductName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '1TB M.2 NVME SSD', @ProductName = 'Microsoft Surface Laptop 3'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FHD 60Hz IPS, 300-nits, 72% color gamut', @ProductName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @ProductName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6', @ProductName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FDH Webcam', @ProductName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '2.0 Speaker configuration with subwoofer', @ProductName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '2x PCIe M.2 SSD', @ProductName = 'Alienware M17 R1 Gaming Laptop'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'UHD QLED Display', @ProductName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '10th Generation Intel Core i7', @ProductName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce MX250', @ProductName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows Hello', @ProductName = 'Samsung Galaxy Book Flex' --
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'High-Definition Webcam', @ProductName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'AKG Speaker', @ProductName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'SSD', @ProductName = 'Samsung Galaxy Book Flex'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Lenovo ThinkPad X1'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FHD IPS, low power, anti-glare, 400 nits', @ProductName = 'Lenovo ThinkPad X1'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '8th Generation Intel Core i5-8265U Processor', @ProductName = 'Lenovo ThinkPad X1'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Integrated UHD Graphics', @ProductName = 'Lenovo ThinkPad X1'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Thinkshield security capabilities', @ProductName = 'Lenovo ThinkPad X1'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'High-Definition Webcam', @ProductName = 'Lenovo ThinkPad X1'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Atmos Speaker System', @ProductName = 'Lenovo ThinkPad X1'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe SSD', @ProductName = 'Lenovo ThinkPad X1'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Dell Precision 5540'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'InfinityEdge HDR', @ProductName = 'Dell Precision 5540'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '10th Generation Intel Core i7', @ProductName = 'Dell Precision 5540'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Quadro T2000 with 4GB', @ProductName = 'Dell Precision 5540'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Dell Precision 5540'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '4-element lens webcam', @ProductName = 'Dell Precision 5540'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Built-in Stereo speaker', @ProductName = 'Dell Precision 5540'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '2666MHz DDR4', @ProductName = 'Dell Precision 5540'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Acer Laptop Aspire 5'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Full HD display', @ProductName = 'Acer Laptop Aspire 5'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Quad-core Intel i5-8265U', @ProductName = 'Acer Laptop Aspire 5'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce MX250', @ProductName = 'Acer Laptop Aspire 5'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Acer Laptop Aspire 5'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Aspire 5 webcam', @ProductName = 'Acer Laptop Aspire 5'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Stereo speaker system', @ProductName = 'Acer Laptop Aspire 5'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'SSD storage system', @ProductName = 'Acer Laptop Aspire 5'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'ChromeOS', @ProductName = 'Lenovo Chromebook S330'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FHD IPS Touch Display', @ProductName = 'Lenovo Chromebook S330'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Mediatek MT8173', @ProductName = 'Lenovo Chromebook S330'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Imagination PowerVR GX6250', @ProductName = 'Lenovo Chromebook S330'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Lenovo Chromebook S330'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'HD Web camera', @ProductName = 'Lenovo Chromebook S330'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Standard speakers', @ProductName = 'Lenovo Chromebook S330'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'SSD storage', @ProductName = 'Lenovo Chromebook S330'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '4K IPS-Level Adobe', @ProductName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Desktop Core i9-9900K', @ProductName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6', @ProductName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'HD web cam', @ProductName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Nahimic 3', @ProductName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'SSD + HDD', @ProductName = 'MSI GT76 TITAN DT-039'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Alienware Area 51m'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FHD 144Hz, IPS, Eyesafe Display Tech + Tobii Eyetracking', @ProductName = 'Alienware Area 51m'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '9th Generation Intel Core i7-9700', @ProductName = 'Alienware Area 51m'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6 ', @ProductName = 'Alienware Area 51m'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Alienware Area 51m'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Integrated webcam', @ProductName = 'Alienware Area 51m'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Sound Center via Alienware Command Center', @ProductName = 'Alienware Area 51m'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe M.2 SSD + SSHD Hybrid Drive', @ProductName = 'Alienware Area 51m'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'MacOS', @ProductName = 'Apple MacBook Pro 15-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Retina display', @ProductName = 'Apple MacBook Pro 15-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '2.3GHz 8-core Intel Core i9, Turbo Boost up to 4.8GHz, with 16MB shared L3 cache', @ProductName = 'Apple MacBook Pro 15-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Radeon Pro', @ProductName = 'Apple MacBook Pro 15-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Touch ID sensor', @ProductName = 'Apple MacBook Pro 15-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FaceTime HD camera', @ProductName = 'Apple MacBook Pro 15-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Stereo speakers with high dynamic range', @ProductName = 'Apple MacBook Pro 15-inch'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe-based SSD', @ProductName = 'Apple MacBook Pro 15-inch'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Asus ZenBook 13'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'LED-backlit FHD', @ProductName = 'Asus ZenBook 13'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '8th Generation Intel Core i5-8265U', @ProductName = 'Asus ZenBook 13'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Integrated UHD Graphics', @ProductName = 'Asus ZenBook 13'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows Hello', @ProductName = 'Asus ZenBook 13'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '3D IR HD Camera', @ProductName = 'Asus ZenBook 13'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'SonicMaster Stereo', @ProductName = 'Asus ZenBook 13'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe solid-state-drive', @ProductName = 'Asus ZenBook 13'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FHD', @ProductName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '9th Generation Intel Core i5-9300H', @ProductName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce GTX 1650 4GB GDDR5', @ProductName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'G5 15 webcam', @ProductName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Stereo Speakers', @ProductName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @ProductName = 'Dell G5 15 Gaming Laptop'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FHD', @ProductName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @ProductName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6', @ProductName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'G7 17 webcam', @ProductName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Stereo Speakers', @ProductName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @ProductName = 'Dell G7 17 Gaming Laptop'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'VivoBook 15'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FHD Widescreen LED', @ProductName = 'VivoBook 15'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'AMD 2nd Generation Ryzen 7 3700U', @ProductName = 'VivoBook 15'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Integrated Radeon RX Vega 10', @ProductName = 'VivoBook 15'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'VivoBook 15'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'High definition web-cam', @ProductName = 'VivoBook 15'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Vivobook Stereo speaker', @ProductName = 'VivoBook 15'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe Solid-State-Drive', @ProductName = 'VivoBook 15'

EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Windows', @ProductName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'FHD Widescreen LED', @ProductName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = '9th Generation Intel Core i5-9300H', @ProductName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'GeForce GTX 1650 4GB GDDR5', @ProductName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Default password security', @ProductName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'HD web-cam', @ProductName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'Stereo speaker system', @ProductName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTPRODUCTFEATURE @FeatureName = 'PCIe Solid-State-Drive', @ProductName = 'Acer Nitro 5 Gaming Laptop'