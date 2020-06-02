USE INFO330_Proj_4

-- tblBRAND
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

EXEC uspINSERTBRAND @BrandName = 'Apple', @BrandDescription = 'Maker of its own OS and line of laptops', @BrandTypeName = 'FAAAM'
EXEC uspINSERTBRAND @BrandName = 'Google', @BrandDescription = 'Maker of its own OS that works with other laptop hardware brands', @BrandTypeName = 'FAAAM'
EXEC uspINSERTBRAND @BrandName = 'Microsoft', @BrandDescription = 'Maker of its own OS, which goes with their own line of laptop products and other laptop makers', @BrandTypeName = 'FAAAM'
EXEC uspINSERTBRAND @BrandName = 'Dell', @BrandDescription = 'Maker of overall laptop products and internal components that work with other OS versions', @BrandTypeName = 'Full laptop systems'
EXEC uspINSERTBRAND @BrandName = 'Samsung', @BrandDescription = 'Maker of its own line of laptop to be used with other OS versions', @BrandTypeName = 'Full laptop systems'
EXEC uspINSERTBRAND @BrandName = 'Lenovo', @BrandDescription = 'Maker of a line of laptops which work with the Windows OS', @BrandTypeName = 'Full laptop systems'
EXEC uspINSERTBRAND @BrandName = 'Acer', @BrandDescription = 'Maker of personal laptops which work with the Windows OS', @BrandTypeName = 'Full laptop systems'
EXEC uspINSERTBRAND @BrandName = 'MSI', @BrandDescription = 'Gaming laptop brand running on Windows', @BrandTypeName = 'Full laptop systems'
EXEC uspINSERTBRAND @BrandName = 'Alienware', @BrandDescription = 'Brand of gaming laptops working with Windows', @BrandTypeName = 'Full laptop systems'
EXEC uspINSERTBRAND @BrandName = 'Asus', @BrandDescription = 'Maker of personal laptops with the Windows OS', @BrandTypeName = 'Full laptop systems'
EXEC uspINSERTBRAND @BrandName = 'Intel', @BrandDescription = 'Maker of CPUs and graphics cards', @BrandTypeName = 'Laptop components'
EXEC uspINSERTBRAND @BrandName = 'Mediatek', @BrandDescription = 'Maker of CPUs', @BrandTypeName = 'Laptop components'
EXEC uspINSERTBRAND @BrandName = 'AMD', @BrandDescription = 'A maker of CPUs and graphics cards', @BrandTypeName = 'Laptop components'
EXEC uspINSERTBRAND @BrandName = 'NVIDIA', @BrandDescription = 'Large commercial and enterprise maker of GPUs', @BrandTypeName = 'Laptop components'
EXEC uspINSERTBRAND @BrandName = 'Imagination', @BrandDescription = 'A maker of GPUs', @BrandTypeName = 'Laptop components'
EXEC uspINSERTBRAND @BrandName = 'Dolby', @BrandDescription = 'Maker of audio components for other devices', @BrandTypeName = 'Audio parts'
EXEC uspINSERTBRAND @BrandName = 'AKG', @BrandDescription = 'Maker of audio parts for devices for laptops', @BrandTypeName = 'Audio parts'
EXEC uspINSERTBRAND @BrandName = 'Maxx', @BrandDescription = 'Maker of device audio systems', @BrandTypeName = 'Audio parts'
GO
USE INFO330_Proj_4
EXEC uspINSERTBRAND @BrandName = 'NoBrand', @BrandDescription = 'For features that are not associated with a brand', @BrandTypeName = NULL
-- tblFEATURE
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

-- OS
EXEC uspINSERTFEATURE @FeatureName = 'MacOS', @BrandName = 'Apple'
EXEC uspINSERTFEATURE @FeatureName = 'Windows', @BrandName = 'Microsoft'
EXEC uspINSERTFEATURE @FeatureName = 'ChromeOS', @BrandName = 'Google'
-- Display
EXEC uspINSERTFEATURE @FeatureName = 'Retina display', @BrandName = 'Apple'
EXEC uspINSERTFEATURE @FeatureName = 'Full HD Display', @BrandName = 'Google'
EXEC uspINSERTFEATURE @FeatureName = 'PixelSense display', @BrandName = 'Microsoft'
EXEC uspINSERTFEATURE @FeatureName = 'InfinityEdge Anti-Glare Non-Touch', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'FHD 60Hz IPS, 300-nits, 72% color gamut', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'UHD QLED Display', @BrandName = 'Samsung'
EXEC uspINSERTFEATURE @FeatureName = 'FHD IPS, low power, anti-glare, 400 nits', @BrandName = 'Lenovo'
EXEC uspINSERTFEATURE @FeatureName = 'InfinityEdge HDR', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'Full HD display', @BrandName = 'Acer'
EXEC uspINSERTFEATURE @FeatureName = 'FHD IPS Touch Display', @BrandName = 'Lenovo'
EXEC uspINSERTFEATURE @FeatureName = '4K IPS-Level Adobe', @BrandName = 'MSI'
EXEC uspINSERTFEATURE @FeatureName = 'FHD 144Hz, IPS, Eyesafe Display Tech + Tobii Eyetracking', @BrandName = 'Alienware'
EXEC uspINSERTFEATURE @FeatureName = 'WQHD IPS', @BrandName = 'Lenovo'
EXEC uspINSERTFEATURE @FeatureName = 'LED-backlit FHD', @BrandName = 'Asus'
EXEC uspINSERTFEATURE @FeatureName = 'FHD', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'FHD Widescreen LED', @BrandName = 'Asus'
EXEC uspINSERTFEATURE @FeatureName = 'FHD Wide screen LED', @BrandName = 'Acer'
-- CPU
EXEC uspINSERTFEATURE @FeatureName = '1.1GHz dual-core Intel Core i3, Turbo Boost up to 3.2GHz, with 4MB L3 cache', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '8th Gen Intel Core m3', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = 'Quad-core 10th Gen Intel Core i5-1035G4 Processor', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '2.6GHz 6‑core Intel Core i7, Turbo Boost up to 4.5GHz, with 12MB shared L3 cache', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = 'Quad-core 10th Gen Intel Core i7-1065G7 Processor', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '10th Generation Intel Core i7', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '8th Generation Intel Core i5-8265U Processor', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = 'Quad-core Intel i5-8265U', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = 'Mediatek MT8173', @BrandName = 'Mediatek'
EXEC uspINSERTFEATURE @FeatureName = 'Desktop Core i9-9900K', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '2.3GHz 8-core Intel Core i9, Turbo Boost up to 4.8GHz, with 16MB shared L3 cache', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '9th Generation Intel Core i7-9700', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '8th Generation Intel Core i5-8265U', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '9th Generation Intel Core i5-9300H', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = 'AMD 2nd Generation Ryzen 7 3700U', @BrandName = 'AMD'
-- Graphics
EXEC uspINSERTFEATURE @FeatureName = 'Iris Plus', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = 'Standard graphics (no GPU)', @BrandName = 'Google'
EXEC uspINSERTFEATURE @FeatureName = 'GeForce GTX 1650 4GB GDDR5', @BrandName = 'NVIDIA'
EXEC uspINSERTFEATURE @FeatureName = 'Radeon Pro', @BrandName = 'AMD'
EXEC uspINSERTFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6', @BrandName = 'NVIDIA'
EXEC uspINSERTFEATURE @FeatureName = 'GeForce MX250', @BrandName = 'NVIDIA'
EXEC uspINSERTFEATURE @FeatureName = 'Integrated UHD Graphics', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = 'Quadro T2000 with 4GB', @BrandName = 'NVIDIA'
EXEC uspINSERTFEATURE @FeatureName = 'Imagination PowerVR GX6250', @BrandName = 'Imagination'
EXEC uspINSERTFEATURE @FeatureName = 'Integrated Radeon RX Vega 10', @BrandName = 'AMD'
-- Security
EXEC uspINSERTFEATURE @FeatureName = 'Touch ID sensor', @BrandName = 'Apple'
EXEC uspINSERTFEATURE @FeatureName = 'Default password security', @BrandName = 'NoBrand'
EXEC uspINSERTFEATURE @FeatureName = 'Windows Hello', @BrandName = 'Microsoft'
EXEC uspINSERTFEATURE @FeatureName = 'Firmware TPM', @BrandName = 'Microsoft'
EXEC uspINSERTFEATURE @FeatureName = 'Thinkshield security capabilities', @BrandName = 'Lenovo'
-- Webcam
EXEC uspINSERTFEATURE @FeatureName = 'FaceTime HD camera', @BrandName = 'Apple'
EXEC uspINSERTFEATURE @FeatureName = 'Duo Cam', @BrandName = 'Google'
EXEC uspINSERTFEATURE @FeatureName = 'Front-facing camera with full HD', @BrandName = 'Microsoft'
EXEC uspINSERTFEATURE @FeatureName = '4-element lens webcam', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'FDH Webcam', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'HD Webcam', @BrandName = 'Samsung'
EXEC uspINSERTFEATURE @FeatureName = 'HD webcam', @BrandName = 'Lenovo'
EXEC uspINSERTFEATURE @FeatureName = 'Aspire 5 webcam', @BrandName = 'Acer'
EXEC uspINSERTFEATURE @FeatureName = 'HD Web cam', @BrandName = 'Lenovo'
EXEC uspINSERTFEATURE @FeatureName = 'HD web cam', @BrandName = 'MSI'
EXEC uspINSERTFEATURE @FeatureName = 'Integrated webcam', @BrandName = 'Alienware'
EXEC uspINSERTFEATURE @FeatureName = '3D IR HD Camera', @BrandName = 'Asus'
EXEC uspINSERTFEATURE @FeatureName = 'G5 15 webcam', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'G7 17 webcam', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'HD Web-cam', @BrandName = 'Asus'
EXEC uspINSERTFEATURE @FeatureName = 'HD web-cam', @BrandName = 'Acer'
-- Audio
EXEC uspINSERTFEATURE @FeatureName = 'Stereo speakers with wide stereo sound', @BrandName = 'Apple'
EXEC uspINSERTFEATURE @FeatureName = 'Front-firing speakers for better surround sound', @BrandName = 'Google'
EXEC uspINSERTFEATURE @FeatureName = 'Stereo speakers', @BrandName = 'Dolby'
EXEC uspINSERTFEATURE @FeatureName = 'Stereo speakers with Waves MaxxAudio Pro', @BrandName = 'Maxx'
EXEC uspINSERTFEATURE @FeatureName = 'High-fidelity system with force-cancelling woofers and wide stereo sound', @BrandName = 'Apple'
EXEC uspINSERTFEATURE @FeatureName = 'Omnisonic Speakers', @BrandName = 'Dolby'
EXEC uspINSERTFEATURE @FeatureName = '2.0 Speaker configuration with subwoofer', @BrandName = 'Alienware'
EXEC uspINSERTFEATURE @FeatureName = 'AKG Speaker', @BrandName = 'AKG'
EXEC uspINSERTFEATURE @FeatureName = 'Atmos Speaker System', @BrandName = 'Dolby'
EXEC uspINSERTFEATURE @FeatureName = 'Stereo speaker', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'Stereo speaker system', @BrandName = 'Acer'
EXEC uspINSERTFEATURE @FeatureName = 'Standard speakers', @BrandName = 'Lenovo'
EXEC uspINSERTFEATURE @FeatureName = 'Nahimic 3', @BrandName = 'MSI'
EXEC uspINSERTFEATURE @FeatureName = 'Sound Center via Alienware Command Center', @BrandName = 'Alienware'
EXEC uspINSERTFEATURE @FeatureName = 'Stereo speakers with high dynamic range', @BrandName = 'Apple'
EXEC uspINSERTFEATURE @FeatureName = 'SonicMaster Stereo', @BrandName = 'Asus'
EXEC uspINSERTFEATURE @FeatureName = 'Stereo Speakers', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'Stereo Speaker', @BrandName = 'Asus'
-- Storage
EXEC uspINSERTFEATURE @FeatureName = 'PCIe-based SSD', @BrandName = 'Apple'
EXEC uspINSERTFEATURE @FeatureName = 'Intel Core m3 Storage', @BrandName = 'Intel'
EXEC uspINSERTFEATURE @FeatureName = 'Solid-state drive (SSD)', @BrandName = 'Microsoft'
EXEC uspINSERTFEATURE @FeatureName = 'M.2 PCIe NVMe SSD', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = '1TB M.2 NVME SSD', @BrandName = 'Microsoft'
EXEC uspINSERTFEATURE @FeatureName = '2x PCIe M.2 SSD', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'SSD', @BrandName = 'Samsung'
EXEC uspINSERTFEATURE @FeatureName = 'PCIe SSD', @BrandName = 'Lenovo'
EXEC uspINSERTFEATURE @FeatureName = '2666MHz DDR4', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'SSD storage system', @BrandName = 'Acer'
EXEC uspINSERTFEATURE @FeatureName = 'SSD storage', @BrandName = 'Lenovo'
EXEC uspINSERTFEATURE @FeatureName = 'SSD + HDD', @BrandName = 'MSI'
EXEC uspINSERTFEATURE @FeatureName = 'PCIe M.2 SSD + SSHD Hybrid Drive', @BrandName = 'Alienware'
EXEC uspINSERTFEATURE @FeatureName = 'PCIe solid-state-drive', @BrandName = 'Asus'
EXEC uspINSERTFEATURE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @BrandName = 'Dell'
EXEC uspINSERTFEATURE @FeatureName = 'PCIe Solid-State-Drive (SSD)', @BrandName = 'Acer'

EXEC uspINSERTFEATURE @FeatureName = 'Vivobook Stereo Speaker', @BrandName = 'Asus'

/*
FEATURE SUBTYPES--FEATURE SUBTYPES--FEATURE SUBTYPES--FEATURE SUBTYPES--FEATURE SUBTYPES
*/

-- OS
GO
ALTER PROCEDURE uspINSERTOS
@FeatureName varchar(200),
@BrandName varchar(20),
@VersionName varchar(20)
AS
DECLARE @F_ID INT, @V_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
SELECT @V_ID = (
    SELECT VersionID
    FROM tblVERSION
    WHERE VersionName = @VersionName
)
BEGIN TRAN T1
INSERT INTO tblOS
(FeatureID, VersionID)
VALUES (@F_ID, @V_ID)
COMMIT TRAN T1

SELECT * FROM tblOS
EXEC uspINSERTOS @FeatureName = 'MacOS', @BrandName = 'Apple', @VersionName = 'Catalina'
EXEC uspINSERTOS @FeatureName = 'Windows', @BrandName = 'Microsoft', @VersionName = '10 Home'
EXEC uspINSERTOS @FeatureName = 'Windows', @BrandName = 'Microsoft', @VersionName = '10 Pro'
EXEC uspINSERTOS @FeatureName = 'ChromeOS', @BrandName = 'Google', @VersionName = 'Version 81'

-- Display
GO
ALTER PROCEDURE uspINSERTDISPLAY
@FeatureName varchar(200),
@BrandName varchar(20),
@Resolution varchar(25),
@DisplaySize numeric(3, 1)
AS
DECLARE @F_ID INT, @R_ID INT, @D_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
BEGIN TRAN T1
INSERT INTO tblDISPLAY(FeatureID, Resolution, DisplaySize)
VALUES (@F_ID, @Resolution, @DisplaySize)
COMMIT TRAN T1

EXEC uspINSERTDISPLAY @FeatureName = 'Retina display', @BrandName = 'Apple', @Resolution = '2500 x 1600', @DisplaySize = 13.3
EXEC uspINSERTDISPLAY @FeatureName = 'Full High-Definition Display', @BrandName = 'Google', @Resolution = '1920 x 1080', @DisplaySize = 13.3
EXEC uspINSERTDISPLAY @FeatureName = 'PixelSense display', @BrandName = 'Microsoft', @Resolution = '2736 x 1824', @DisplaySize = 12.3
EXEC uspINSERTDISPLAY @FeatureName = 'InfinityEdge Anti-Glare Non-Touch', @BrandName = 'Dell', @Resolution = '1920 x 1080', @DisplaySize = 15.6
EXEC uspINSERTDISPLAY @FeatureName = 'Retina display', @BrandName = 'Apple', @Resolution = '3072 x 1920', @DisplaySize = 16.0

EXEC uspINSERTDISPLAY @FeatureName = 'PixelSense display', @BrandName = 'Microsoft', @Resolution = '2256 x 1504', @DisplaySize = 13.5
EXEC uspINSERTDISPLAY @FeatureName = 'FHD 60Hz IPS, 300-nits, 72% color gamut', @BrandName = 'Dell', @Resolution = '1920 x 1080', @DisplaySize = 17.3
EXEC uspINSERTDISPLAY @FeatureName = 'UHD QLED Display', @BrandName = 'Samsung', @Resolution = '1920 x 1080', @DisplaySize = 15.6
EXEC uspINSERTDISPLAY @FeatureName = 'FHD IPS, low power, anti-glare, 400 nits', @BrandName = 'Lenovo', @Resolution = '1920 x 1080', @DisplaySize = 14.0
EXEC uspINSERTDISPLAY @FeatureName = 'InfinityEdge HDR', @BrandName = 'Dell', @Resolution = '1920 x 1080', @DisplaySize = 15.2

EXEC uspINSERTDISPLAY @FeatureName = 'Full HD display', @BrandName = 'Acer', @Resolution = '1920 x 1080', @DisplaySize = 15.6
EXEC uspINSERTDISPLAY @FeatureName = 'FHD IPS Touch Display', @BrandName = 'Lenovo', @Resolution = '1920 x 1080', @DisplaySize = 14.0
EXEC uspINSERTDISPLAY @FeatureName = '4K IPS-Level Adobe', @BrandName = 'MSI', @Resolution = '3840 x 2160', @DisplaySize = 17.3
EXEC uspINSERTDISPLAY @FeatureName = 'FHD 144Hz, IPS, Eyesafe Display Tech + Tobii Eyetracking', @BrandName = 'Alienware', @Resolution = '1920 x 1080', @DisplaySize = 17.3
EXEC uspINSERTDISPLAY @FeatureName = 'Retina display', @BrandName = 'Apple', @Resolution = '2880 x 1800', @DisplaySize = 15.4

EXEC uspINSERTDISPLAY @FeatureName = 'LED-backlit FHD', @BrandName = 'Asus', @Resolution = '1920 x 1080', @DisplaySize = 13.3
EXEC uspINSERTDISPLAY @FeatureName = 'FHD', @BrandName = 'Dell', @Resolution = '1920 x 1080', @DisplaySize = 15.6
EXEC uspINSERTDISPLAY @FeatureName = 'FHD', @BrandName = 'Dell', @Resolution = '1920 x 1080', @DisplaySize = 17.3
EXEC uspINSERTDISPLAY @FeatureName = 'FHD Widescreen LED', @BrandName = 'Asus', @Resolution = '1920 x 1080', @DisplaySize = 15.6
EXEC uspINSERTDISPLAY @FeatureName = 'FHD Wide screen LED', @BrandName = 'Acer', @Resolution = '1920 x 1080', @DisplaySize = 17.3

-- OS
GO
ALTER PROCEDURE uspINSERTCPU
@FeatureName varchar(200),
@BrandName varchar(20),
@NumCores INT,
@ClockSpeed numeric(3, 1)
AS
DECLARE @F_ID INT, @N_ID INT, @C_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
BEGIN TRAN T1
INSERT INTO tblCPU(FeatureID, NumCores, ClockSpeed)
VALUES (@F_ID, @NumCores, @ClockSpeed)
COMMIT TRAN T1

EXEC uspINSERTCPU @FeatureName = '1.1GHz dual-core Intel Core i3, Turbo Boost up to 3.2GHz, with 4MB L3 cache', @BrandName = 'Intel', @NumCores = 2, @ClockSpeed = 3.2
EXEC uspINSERTCPU @FeatureName = '8th Gen Intel Core m3', @BrandName = 'Intel', @NumCores = 2, @ClockSpeed = 2.6
EXEC uspINSERTCPU @FeatureName = 'Quad-core 10th Gen Intel Core i5-1035G4 Processor', @BrandName = 'Intel', @NumCores = 4, @ClockSpeed = 3.6
EXEC uspINSERTCPU @FeatureName = '9th Generation Intel Core i7-9750H', @BrandName = 'Intel', @NumCores = 6, @ClockSpeed = 4.5
EXEC uspINSERTCPU @FeatureName = '2.6GHz 6‑core Intel Core i7, Turbo Boost up to 4.5GHz, with 12MB shared L3 cache', @BrandName = 'Intel', @NumCores = 6, @ClockSpeed = 2.6

EXEC uspINSERTCPU @FeatureName = 'Quad-core 10th Gen Intel Core i7-1065G7 Processor', @BrandName = 'Intel', @NumCores = 4, @ClockSpeed = 3.9
EXEC uspINSERTCPU @FeatureName = '10th Generation Intel Core i7', @BrandName = 'Intel', @NumCores = 6, @ClockSpeed = 4.5
EXEC uspINSERTCPU @FeatureName = '8th Generation Intel Core i5-8265U Processor', @BrandName = 'Intel', @NumCores = 6, @ClockSpeed = 4.5
EXEC uspINSERTCPU @FeatureName = '10th Generation Intel Core i7', @BrandName = 'Intel', @NumCores = 4, @ClockSpeed = 3.6

EXEC uspINSERTCPU @FeatureName = 'Quad-core Intel i5-8265U', @BrandName = 'Intel', @NumCores = 4, @ClockSpeed = 1.6
EXEC uspINSERTCPU @FeatureName = 'Mediatek MT8173', @BrandName = 'Mediatek', @NumCores = 4, @ClockSpeed = 2.4
EXEC uspINSERTCPU @FeatureName = 'Desktop Core i9-9900K', @BrandName = 'Intel', @NumCores = 8, @ClockSpeed = 3.6
EXEC uspINSERTCPU @FeatureName = '9th Generation Intel Core i7-9700 ', @BrandName = 'Intel', @NumCores = 8, @ClockSpeed = 4.7
EXEC uspINSERTCPU @FeatureName = '2.3GHz 8-core Intel Core i9, Turbo Boost up to 4.8GHz, with 16MB shared L3 cache', @BrandName = 'Intel', @NumCores = 8, @ClockSpeed = 2.3

EXEC uspINSERTCPU @FeatureName = '8th Generation Intel Core i5-8265U', @BrandName = 'Intel', @NumCores = 4, @ClockSpeed = 1.6
EXEC uspINSERTCPU @FeatureName = '9th Generation Intel Core i5-9300H', @BrandName = 'Intel', @NumCores = 4, @ClockSpeed = 4.1
EXEC uspINSERTCPU @FeatureName = 'AMD 2nd Generation Ryzen 7 3700U', @BrandName = 'AMD', @NumCores = 4, @ClockSpeed = 2.3

-- Graphics
GO
ALTER PROCEDURE uspINSERTGRAPHICS
@FeatureName varchar(200),
@BrandName varchar(20),
@ReleaseYear char(4)
AS
DECLARE @F_ID INT, @Y_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
BEGIN TRAN T1
INSERT INTO tblGRAPHICS(FeatureID, ReleaseYear)
VALUES (@F_ID, @ReleaseYear)
COMMIT TRAN T1

EXEC uspINSERTGRAPHICS @FeatureName = 'Iris Plus', @BrandName = 'Intel', @ReleaseYear = '2020'
EXEC uspINSERTGRAPHICS @FeatureName = 'Standard graphics (no GPU)', @BrandName = 'Google', @ReleaseYear = '2019'
EXEC uspINSERTGRAPHICS @FeatureName = 'GeForce GTX 1650 4GB GDDR5', @BrandName = 'NVIDIA', @ReleaseYear = '2019'
EXEC uspINSERTGRAPHICS @FeatureName = 'Radeon Pro', @BrandName = 'AMD', @ReleaseYear = '2020'

EXEC uspINSERTGRAPHICS @FeatureName = 'GeForce RTX 2060 6GB GDDR6', @BrandName = 'NVIDIA', @ReleaseYear = '2019'
EXEC uspINSERTGRAPHICS @FeatureName = 'GeForce MX250', @BrandName = 'NVIDIA', @ReleaseYear = '2020'
EXEC uspINSERTGRAPHICS @FeatureName = 'Integrated UHD Graphics', @BrandName = 'Intel', @ReleaseYear = '2019'
EXEC uspINSERTGRAPHICS @FeatureName = 'Quadro T2000 with 4GB', @BrandName = 'NVIDIA', @ReleaseYear = '2019'

EXEC uspINSERTGRAPHICS @FeatureName = 'Imagination PowerVR GX6250', @BrandName = 'Imagination', @ReleaseYear = '2015'

EXEC uspINSERTGRAPHICS @FeatureName = 'Integrated Radeon RX Vega 10', @BrandName = 'AMD', @ReleaseYear = '2017'

-- Security
GO
ALTER PROCEDURE uspINSERTSECURITY
@FeatureName varchar(200),
@BrandName varchar(20),
@SecurityType varchar(30)
AS
DECLARE @F_ID INT, @S_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
SELECT @S_ID = (
    SELECT SecurityTypeID
    FROM tblSECURITY_TYPE
    WHERE SecurityType = @SecurityType
)
BEGIN TRAN T1
INSERT INTO tblSECURITY(FeatureID, SecurityTypeID)
VALUES (@F_ID, @S_ID)
COMMIT TRAN T1

EXEC uspINSERTSECURITY @FeatureName = 'Touch ID sensor', @BrandName = 'Apple', @SecurityType = 'Fingerprint'
EXEC uspINSERTSECURITY @FeatureName = 'Default password security', @BrandName = 'NoBrand', @SecurityType = 'Password'
EXEC uspINSERTSECURITY @FeatureName = 'Windows Hello', @BrandName = 'Microsoft', @SecurityType = 'Face sign-in'
EXEC uspINSERTSECURITY @FeatureName = 'Firmware TPM', @BrandName = 'Microsoft', @SecurityType = 'Face sign-in'
EXEC uspINSERTSECURITY @FeatureName = 'Thinkshield security capabilities', @BrandName = 'Lenovo', @SecurityType = 'Fingerprint'

-- Webcam
GO
ALTER PROCEDURE uspINSERTWEBCAM
@FeatureName varchar(200),
@BrandName varchar(20),
@ProgressiveScan INT
AS
DECLARE @F_ID INT, @P_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
BEGIN TRAN T1
INSERT INTO tblWEBCAM(FeatureID, ProgressiveScan)
VALUES (@F_ID, @ProgressiveScan)
COMMIT TRAN T1

EXEC uspINSERTWEBCAM @FeatureName = 'FaceTime HD camera', @BrandName = 'Apple', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'Duo Cam', @BrandName = 'Google', @ProgressiveScan = 1080
EXEC uspINSERTWEBCAM @FeatureName = 'Front-facing camera with full HD', @BrandName = 'Microsoft', @ProgressiveScan = 1080
EXEC uspINSERTWEBCAM @FeatureName = '4-element lens webcam', @BrandName = 'Dell', @ProgressiveScan = 1080

EXEC uspINSERTWEBCAM @FeatureName = 'Front-facing camera with full HD', @BrandName = 'Microsoft', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'FDH Webcam', @BrandName = 'Dell', @ProgressiveScan = 1080
EXEC uspINSERTWEBCAM @FeatureName = 'High-Definition Webcam', @BrandName = 'Samsung', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD webcam', @BrandName = 'Lenovo', @ProgressiveScan = 720

EXEC uspINSERTWEBCAM @FeatureName = 'Aspire 5 webcam', @BrandName = 'Acer', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD Web camera', @BrandName = 'Lenovo', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD web cam', @BrandName = 'MSI', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'Integrated webcam', @BrandName = 'Alienware', @ProgressiveScan = 720

EXEC uspINSERTWEBCAM @FeatureName = '3D IR HD Camera', @BrandName = 'Asus', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'G5 15 webcam', @BrandName = 'Dell', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'G7 17 webcam', @BrandName = 'Dell', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'High definition Web-cam', @BrandName = 'Asus', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD web-cam', @BrandName = 'Acer', @ProgressiveScan = 720

-- Audio
GO
CREATE PROCEDURE uspINSERTAUDIO
@FeatureName varchar(200),
@BrandName varchar(20),
@NumSpeakers INT
AS
DECLARE @F_ID INT, @S_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
BEGIN TRAN T1
INSERT INTO tblAUDIO(FeatureID, NumSpeakers)
VALUES (@F_ID, @NumSpeakers)
COMMIT TRAN T1

EXEC uspINSERTAUDIO @FeatureName = 'Stereo speakers with wide stereo sound', @BrandName = 'Apple', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Front-firing speakers for better surround sound', @BrandName = 'Google', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Dolby Stereo speakers', @BrandName = 'Dolby', @NumSpeakers = 1
EXEC uspINSERTAUDIO @FeatureName = 'Stereo speakers with Waves MaxxAudio Pro', @BrandName = 'Maxx', @NumSpeakers = 1
EXEC uspINSERTAUDIO @FeatureName = 'High-fidelity system with force-cancelling woofers and wide stereo sound', @BrandName = 'Apple', @NumSpeakers = 6

EXEC uspINSERTAUDIO @FeatureName = 'Omnisonic Speakers', @BrandName = 'Dolby', @NumSpeakers = 1
EXEC uspINSERTAUDIO @FeatureName = '2.0 Speaker configuration with subwoofer', @BrandName = 'Alienware', @NumSpeakers = 1
EXEC uspINSERTAUDIO @FeatureName = 'AKG Speaker', @BrandName = 'AKG', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Atmos Speaker System', @BrandName = 'Dolby', @NumSpeakers = 1
EXEC uspINSERTAUDIO @FeatureName = 'Stereo speaker', @BrandName = 'Dell', @NumSpeakers = 1

EXEC uspINSERTAUDIO @FeatureName = 'Stereo speaker system', @BrandName = 'Acer', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Standard speakers', @BrandName = 'Lenovo', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Nahimic 3', @BrandName = 'MSI', @NumSpeakers = 3
EXEC uspINSERTAUDIO @FeatureName = 'Sound Center via Alienware Command Center', @BrandName = 'Alienware', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Stereo speakers with high dynamic range', @BrandName = 'Apple', @NumSpeakers = 6

EXEC uspINSERTAUDIO @FeatureName = 'SonicMaster Stereo', @BrandName = 'Asus', @NumSpeakers = 1
EXEC uspINSERTAUDIO @FeatureName = 'Stereo Speakers', @BrandName = 'Dell', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Vivobook Stereo Speaker', @BrandName = 'Asus', @NumSpeakers = 1

-- Storage
GO
ALTER PROCEDURE uspINSERTSTORAGE
@FeatureName varchar(200),
@BrandName varchar(20),
@Gigabytes INT
AS
DECLARE @F_ID INT, @S_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
BEGIN TRAN T1
INSERT INTO tblSTORAGE(FeatureID, Gigabytes)
VALUES (@F_ID, @Gigabytes)
COMMIT TRAN T1

EXEC uspINSERTSTORAGE @FeatureName = 'PCIe-based SSD', @BrandName = 'Apple', @Gigabytes = 256
EXEC uspINSERTSTORAGE @FeatureName = 'Intel Core m3 Storage', @BrandName = 'Intel', @Gigabytes = 64
EXEC uspINSERTSTORAGE @FeatureName = 'Solid-state drive (SSD)', @BrandName = 'Microsoft', @Gigabytes = 128
EXEC uspINSERTSTORAGE @FeatureName = 'M.2 PCIe NVMe SSD', @BrandName = 'Dell', @Gigabytes = 256
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe-based SSD', @BrandName = 'Apple', @Gigabytes = 512

EXEC uspINSERTSTORAGE @FeatureName = '1TB M.2 NVME SSD', @BrandName = 'Microsoft', @Gigabytes = 128
EXEC uspINSERTSTORAGE @FeatureName = '2x PCIe M.2 SSD', @BrandName = 'Dell', @Gigabytes = 512
EXEC uspINSERTSTORAGE @FeatureName = 'SSD', @BrandName = 'Samsung', @Gigabytes = 512
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe SSD', @BrandName = 'Lenovo', @Gigabytes = 256
EXEC uspINSERTSTORAGE @FeatureName = '2666MHz DDR4', @BrandName = 'Dell', @Gigabytes = 64

EXEC uspINSERTSTORAGE @FeatureName = 'SSD storage system', @BrandName = 'Acer', @Gigabytes = 512
EXEC uspINSERTSTORAGE @FeatureName = 'SSD storage', @BrandName = 'Lenovo', @Gigabytes = 64
EXEC uspINSERTSTORAGE @FeatureName = 'SSD + HDD', @BrandName = 'MSI', @Gigabytes = 3000
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe M.2 SSD + SSHD Hybrid Drive', @BrandName = 'Alienware', @Gigabytes = 256
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe-based SSD', @BrandName = 'Apple', @Gigabytes = 4000

EXEC uspINSERTSTORAGE @FeatureName = 'PCIe solid-state-drive', @BrandName = 'Asus', @Gigabytes = 256
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @BrandName = 'Dell', @Gigabytes = 1028
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @BrandName = 'Dell', @Gigabytes = 512
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe solid-state-drive', @BrandName = 'Asus', @Gigabytes = 512
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe Solid-State-Drive (SSD)', @BrandName = 'Acer', @Gigabytes = 512