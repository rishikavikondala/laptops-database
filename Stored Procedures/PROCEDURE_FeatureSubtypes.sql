USE INFO330_Proj_4
DBCC CHECKIDENT (tblDISPLAY, RESEED, 0)

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

EXEC uspINSERTOS @FeatureName = 'MacOS', @BrandName = 'Apple', @VersionName = 'Catalina'
EXEC uspINSERTOS @FeatureName = 'Windows', @BrandName = 'Microsoft', @VersionName = '10 Home'
EXEC uspINSERTOS @FeatureName = 'Windows', @BrandName = 'Microsoft', @VersionName = '10 Pro'
EXEC uspINSERTOS @FeatureName = 'ChromeOS', @BrandName = 'Google', @VersionName = '81.0.4044.127'
-- Display
GO
ALTER PROCEDURE uspINSERTDISPLAY
@FeatureName varchar(200),
@BrandName varchar(20),
@Resolution varchar(25),
@DisplaySize decimal(3, 1)
AS
DECLARE @F_ID INT, @R_ID INT, @D_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
SELECT @R_ID = (
    SELECT ResolutionID
    FROM tblRESOLUTION
    WHERE Resolution = @Resolution
)
SELECT @D_ID = (
    SELECT DisplaySizeID
    FROM tblDISPLAY_SIZE
    WHERE DisplaySize = @DisplaySize
)
BEGIN TRAN T1
INSERT INTO tblDISPLAY(FeatureID, ResolutionID, DisplaySizeID)
VALUES (@F_ID, @R_ID, @D_ID)
COMMIT TRAN T1

EXEC uspINSERTDISPLAY @FeatureName = 'Retina display', @BrandName = 'Apple', @Resolution = '2500 x 1600', @DisplaySize = 13.3
EXEC uspINSERTDISPLAY @FeatureName = 'Full HD Display', @BrandName = 'Google', @Resolution = '1920 x 1080', @DisplaySize = 13.3
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
CREATE PROCEDURE uspINSERTCPU
@FeatureName varchar(200),
@BrandName varchar(20),
@NumCores INT,
@ClockSpeed decimal(3, 1)
AS
DECLARE @F_ID INT, @N_ID INT, @C_ID INT
SELECT @F_ID = (
    SELECT F.FeatureID
    FROM tblFEATURE F
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE F.FeatureName = @FeatureName
    AND B.BrandName = @BrandName
)
SELECT @N_ID = (
    SELECT NumCoresID
    FROM tblNUM_CORES
    WHERE NumCores = @NumCores
)
SELECT @C_ID = (
    SELECT ClockSpeedID
    FROM tblCLOCK_SPEED
    WHERE ClockSpeed = @ClockSpeed
)
BEGIN TRAN T1
INSERT INTO tblCPU(FeatureID, NumCoresID, ClockSpeedID)
VALUES (@F_ID, @N_ID, @C_ID)
COMMIT TRAN T1

SELECT  * FROM tblCPU

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
CREATE PROCEDURE uspINSERTGRAPHICS
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
SELECT @Y_ID = (
    SELECT ReleaseYearID
    FROM tblRELEASE_YEAR
    WHERE ReleaseYear = @ReleaseYear
)
BEGIN TRAN T1
INSERT INTO tblGRAPHICS(FeatureID, ReleaseYearID)
VALUES (@F_ID, @Y_ID)
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
CREATE PROCEDURE uspINSERTWEBCAM
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
SELECT @P_ID = (
    SELECT ProgressiveScanID
    FROM tblPROGRESSIVE_SCAN
    WHERE ProgressiveScan = @ProgressiveScan
)
BEGIN TRAN T1
INSERT INTO tblWEBCAM(FeatureID, ProgressiveScanID)
VALUES (@F_ID, @P_ID)
COMMIT TRAN T1

EXEC uspINSERTWEBCAM @FeatureName = 'FaceTime HD camera', @BrandName = 'Apple', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'Duo Cam', @BrandName = 'Google', @ProgressiveScan = 1080
EXEC uspINSERTWEBCAM @FeatureName = 'Front-facing camera with full HD', @BrandName = 'Microsoft', @ProgressiveScan = 1080
EXEC uspINSERTWEBCAM @FeatureName = '4-element lens webcam', @BrandName = 'Dell', @ProgressiveScan = 1080

EXEC uspINSERTWEBCAM @FeatureName = 'Front-facing camera with full HD', @BrandName = 'Microsoft', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'FDH Webcam', @BrandName = 'Dell', @ProgressiveScan = 1080
EXEC uspINSERTWEBCAM @FeatureName = 'HD Webcam', @BrandName = 'Samsung', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD webcam', @BrandName = 'Lenovo', @ProgressiveScan = 720

EXEC uspINSERTWEBCAM @FeatureName = 'Aspire 5 webcam', @BrandName = 'Acer', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD Web cam', @BrandName = 'Lenovo', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD web cam', @BrandName = 'MSI', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'Integrated webcam', @BrandName = 'Alienware', @ProgressiveScan = 720

EXEC uspINSERTWEBCAM @FeatureName = '3D IR HD Camera', @BrandName = 'Asus', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'G5 15 webcam', @BrandName = 'Dell', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'G7 17 webcam', @BrandName = 'Dell', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD Web-cam', @BrandName = 'Asus', @ProgressiveScan = 720
EXEC uspINSERTWEBCAM @FeatureName = 'HD web-cam', @BrandName = 'Acer', @ProgressiveScan = 720
-- Audio
GO
ALTER PROCEDURE uspINSERTAUDIO
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
SELECT @S_ID = (
    SELECT NumSpeakersID
    FROM tblNUM_SPEAKERS
    WHERE NumSpeakers = @NumSpeakers
)
BEGIN TRAN T1
INSERT INTO tblAUDIO(FeatureID, NumSpeakersID)
VALUES (@F_ID, @S_ID)
COMMIT TRAN T1

EXEC uspINSERTAUDIO @FeatureName = 'Stereo speakers with wide stereo sound', @BrandName = 'Apple', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Front-firing speakers for better surround sound', @BrandName = 'Google', @NumSpeakers = 2
EXEC uspINSERTAUDIO @FeatureName = 'Stereo speakers', @BrandName = 'Dolby', @NumSpeakers = 1
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
EXEC uspINSERTAUDIO @FeatureName = 'Stereo Speaker', @BrandName = 'Asus', @NumSpeakers = 1
-- Storage
GO
CREATE PROCEDURE uspINSERTSTORAGE
@FeatureName varchar(200),
@BrandName varchar(20),
@Size INT
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
    SELECT StorageSizeID
    FROM tblSTORAGE_SIZE
    WHERE Size = @Size
)
BEGIN TRAN T1
INSERT INTO tblSTORAGE(FeatureID, StorageSizeID)
VALUES (@F_ID, @S_ID)
COMMIT TRAN T1

EXEC uspINSERTSTORAGE @FeatureName = 'PCIe-based SSD', @BrandName = 'Apple', @Size = 256
EXEC uspINSERTSTORAGE @FeatureName = 'Intel Core m3 Storage', @BrandName = 'Intel', @Size = 64
EXEC uspINSERTSTORAGE @FeatureName = 'Solid-state drive (SSD)', @BrandName = 'Microsoft', @Size = 128
EXEC uspINSERTSTORAGE @FeatureName = 'M.2 PCIe NVMe SSD', @BrandName = 'Dell', @Size = 256
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe-based SSD', @BrandName = 'Apple', @Size = 512

EXEC uspINSERTSTORAGE @FeatureName = '1TB M.2 NVME SSD', @BrandName = 'Microsoft', @Size = 128
EXEC uspINSERTSTORAGE @FeatureName = '2x PCIe M.2 SSD', @BrandName = 'Dell', @Size = 512
EXEC uspINSERTSTORAGE @FeatureName = 'SSD', @BrandName = 'Samsung', @Size = 512
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe SSD', @BrandName = 'Lenovo', @Size = 256
EXEC uspINSERTSTORAGE @FeatureName = '2666MHz DDR4', @BrandName = 'Dell', @Size = 64

EXEC uspINSERTSTORAGE @FeatureName = 'SSD storage system', @BrandName = 'Acer', @Size = 512
EXEC uspINSERTSTORAGE @FeatureName = 'SSD storage', @BrandName = 'Lenovo', @Size = 64
EXEC uspINSERTSTORAGE @FeatureName = 'SSD + HDD', @BrandName = 'MSI', @Size = 3000
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe M.2 SSD + SSHD Hybrid Drive', @BrandName = 'Alienware', @Size = 1256
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe-based SSD', @BrandName = 'Apple', @Size = 4000

EXEC uspINSERTSTORAGE @FeatureName = 'PCIe solid-state-drive', @BrandName = 'Asus', @Size = 256
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @BrandName = 'Dell', @Size = 1028
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @BrandName = 'Dell', @Size = 512
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe solid-state-drive', @BrandName = 'Asus', @Size = 512
EXEC uspINSERTSTORAGE @FeatureName = 'PCIe Solid-State-Drive (SSD)', @BrandName = 'Acer', @Size = 512