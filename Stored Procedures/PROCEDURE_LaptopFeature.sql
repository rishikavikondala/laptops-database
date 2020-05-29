USE INFO330_Proj_4
DBCC CHECKIDENT (tblLAPTOP_FEATURE, RESEED, 0)
GO
CREATE PROCEDURE uspINSERTLAPTOPFEATURE
    @FeatureName varchar(200),
    @LaptopName varchar(50)
AS
DECLARE @FeatureID INT, @LaptopID INT
SET @FeatureID = (
    SELECT FeatureID
    FROM tblFEATURE
    WHERE FeatureName = @FeatureName
)
SET @LaptopID = (
    SELECT LaptopID
    FROM tblLAPTOP
    WHERE LaptopName = @LaptopName
)
BEGIN TRANSACTION T1
INSERT INTO tblLAPTOP_FEATURE(FeatureID, LaptopID)
VALUES(@FeatureID, @LaptopID)
COMMIT TRANSACTION T1
GO

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'MacOS', @LaptopName = 'Apple Macbook Air'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Retina Display', @LaptopName = 'Apple Macbook Air'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '1.1GHz dual-core Intel Core i3, Turbo Boost up to 3.2GHz, with 4MB L3 cache', @LaptopName = 'Apple Macbook Air'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Iris Plus', @LaptopName = 'Apple Macbook Air'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Touch ID sensor', @LaptopName = 'Apple Macbook Air'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FaceTime HD camera', @LaptopName = 'Apple Macbook Air'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Stereo speakers with wide stereo sound', @LaptopName = 'Apple Macbook Air'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe-based SSD', @LaptopName = 'Apple Macbook Air'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'ChromeOS', @LaptopName = 'Google Pixelbook Go'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Full HD Display', @LaptopName = 'Google Pixelbook Go'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '8th Gen Intel Core m3', @LaptopName = 'Google Pixelbook Go'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Standard graphics (no GPU)', @LaptopName = 'Google Pixelbook Go'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Google Pixelbook Go'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Duo Cam', @LaptopName = 'Google Pixelbook Go'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Front-firing speakers for better surround sound', @LaptopName = 'Google Pixelbook Go'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Intel Core m3 Storage', @LaptopName = 'Google Pixelbook Go'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Microsoft Surface Pro 7'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PixelSense display', @LaptopName = 'Microsoft Surface Pro 7'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Quad-core 10th Gen Intel Core i5-1035G4 Processor', @LaptopName = 'Microsoft Surface Pro 7'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Iris Plus', @LaptopName = 'Microsoft Surface Pro 7'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows Hello', @LaptopName = 'Microsoft Surface Pro 7'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Front-facing camera with full HD', @LaptopName = 'Microsoft Surface Pro 7'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Stereo speakers', @LaptopName = 'Microsoft Surface Pro 7'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Solid-state drive (SSD)', @LaptopName = 'Microsoft Surface Pro 7'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Dell XPS 15 Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'InfinityEdge Anti-Glare Non-Touch', @LaptopName = 'Dell XPS 15 Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @LaptopName = 'Dell XPS 15 Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce GTX 1650 4GB GDDR5', @LaptopName = 'Dell XPS 15 Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Dell XPS 15 Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '4-element lens webcam', @LaptopName = 'Dell XPS 15 Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Stereo speakers with Waves MaxxAudio Pro', @LaptopName = 'Dell XPS 15 Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'M.2 PCIe NVMe SSD', @LaptopName = 'Dell XPS 15 Laptop'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'MacOS', @LaptopName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Retina display', @LaptopName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '2.6GHz 6‑core Intel Core i7, Turbo Boost up to 4.5GHz, with 12MB shared L3 cache', @LaptopName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Radeon Pro', @LaptopName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Touch ID sensor', @LaptopName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FaceTime HD camera', @LaptopName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'High-fidelity system with force-cancelling woofers and wide stereo sound', @LaptopName = 'Apple Macbook Pro 13-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe-based SSD', @LaptopName = 'Apple Macbook Pro 13-inch'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PixelSense Display', @LaptopName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Quad-core 10th Gen Intel Core i7-1065G7 Processor', @LaptopName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Iris Plus', @LaptopName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Firmware TPM', @LaptopName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Front-facing camera with full HD', @LaptopName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Omnisonic Speakers', @LaptopName = 'Microsoft Surface Laptop 3'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '1TB M.2 NVME SSD', @LaptopName = 'Microsoft Surface Laptop 3'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FHD 60Hz IPS, 300-nits, 72% color gamut', @LaptopName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @LaptopName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6', @LaptopName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FDH Webcam', @LaptopName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '2.0 Speaker configuration with subwoofer', @LaptopName = 'Alienware M17 R1 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '2x PCIe M.2 SSD', @LaptopName = 'Alienware M17 R1 Gaming Laptop'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'UHD QLED Display', @LaptopName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '10th Generation Intel Core i7', @LaptopName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce MX250', @LaptopName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows Hello', @LaptopName = 'Samsung Galaxy Book Flex' --
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'High-Definition Webcam', @LaptopName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'AKG Speaker', @LaptopName = 'Samsung Galaxy Book Flex'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'SSD', @LaptopName = 'Samsung Galaxy Book Flex'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Lenovo ThinkPad X1'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FHD IPS, low power, anti-glare, 400 nits', @LaptopName = 'Lenovo ThinkPad X1'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '8th Generation Intel Core i5-8265U Processor', @LaptopName = 'Lenovo ThinkPad X1'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Integrated UHD Graphics', @LaptopName = 'Lenovo ThinkPad X1'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Thinkshield security capabilities', @LaptopName = 'Lenovo ThinkPad X1'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'High-Definition Webcam', @LaptopName = 'Lenovo ThinkPad X1'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Atmos Speaker System', @LaptopName = 'Lenovo ThinkPad X1'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe SSD', @LaptopName = 'Lenovo ThinkPad X1'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Dell Precision 5540'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'InfinityEdge HDR', @LaptopName = 'Dell Precision 5540'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '10th Generation Intel Core i7', @LaptopName = 'Dell Precision 5540'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Quadro T2000 with 4GB', @LaptopName = 'Dell Precision 5540'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Dell Precision 5540'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '4-element lens webcam', @LaptopName = 'Dell Precision 5540'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Built-in Stereo speaker', @LaptopName = 'Dell Precision 5540'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '2666MHz DDR4', @LaptopName = 'Dell Precision 5540'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Acer Laptop Aspire 5'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Full HD display', @LaptopName = 'Acer Laptop Aspire 5'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Quad-core Intel i5-8265U', @LaptopName = 'Acer Laptop Aspire 5'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce MX250', @LaptopName = 'Acer Laptop Aspire 5'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Acer Laptop Aspire 5'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Aspire 5 webcam', @LaptopName = 'Acer Laptop Aspire 5'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Stereo speaker system', @LaptopName = 'Acer Laptop Aspire 5'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'SSD storage system', @LaptopName = 'Acer Laptop Aspire 5'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'ChromeOS', @LaptopName = 'Lenovo Chromebook S330'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FHD IPS Touch Display', @LaptopName = 'Lenovo Chromebook S330'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Mediatek MT8173', @LaptopName = 'Lenovo Chromebook S330'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Imagination PowerVR GX6250', @LaptopName = 'Lenovo Chromebook S330'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Lenovo Chromebook S330'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'HD Web camera', @LaptopName = 'Lenovo Chromebook S330'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Standard speakers', @LaptopName = 'Lenovo Chromebook S330'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'SSD storage', @LaptopName = 'Lenovo Chromebook S330'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '4K IPS-Level Adobe', @LaptopName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Desktop Core i9-9900K', @LaptopName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6', @LaptopName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'HD web cam', @LaptopName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Nahimic 3', @LaptopName = 'MSI GT76 TITAN DT-039'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'SSD + HDD', @LaptopName = 'MSI GT76 TITAN DT-039'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Alienware Area 51m'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FHD 144Hz, IPS, Eyesafe Display Tech + Tobii Eyetracking', @LaptopName = 'Alienware Area 51m'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '9th Generation Intel Core i7-9700', @LaptopName = 'Alienware Area 51m'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6 ', @LaptopName = 'Alienware Area 51m'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Alienware Area 51m'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Integrated webcam', @LaptopName = 'Alienware Area 51m'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Sound Center via Alienware Command Center', @LaptopName = 'Alienware Area 51m'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe M.2 SSD + SSHD Hybrid Drive', @LaptopName = 'Alienware Area 51m'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'MacOS', @LaptopName = 'Apple Mac Book Pro 15-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Retina display', @LaptopName = 'Apple Mac Book Pro 15-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '2.3GHz 8-core Intel Core i9, Turbo Boost up to 4.8GHz, with 16MB shared L3 cache', @LaptopName = 'Apple Mac Book Pro 15-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Radeon Pro', @LaptopName = 'Apple Mac Book Pro 15-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Touch ID sensor', @LaptopName = 'Apple Mac Book Pro 15-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FaceTime HD camera', @LaptopName = 'Apple Mac Book Pro 15-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Stereo speakers with high dynamic range', @LaptopName = 'Apple Mac Book Pro 15-inch'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe-based SSD', @LaptopName = 'Apple Mac Book Pro 15-inch'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Asus ZenBook 13'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'LED-backlit FHD', @LaptopName = 'Asus ZenBook 13'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '8th Generation Intel Core i5-8265U', @LaptopName = 'Asus ZenBook 13'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Integrated UHD Graphics', @LaptopName = 'Asus ZenBook 13'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows Hello', @LaptopName = 'Asus ZenBook 13'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '3D IR HD Camera', @LaptopName = 'Asus ZenBook 13'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'SonicMaster Stereo', @LaptopName = 'Asus ZenBook 13'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe solid-state-drive', @LaptopName = 'Asus ZenBook 13'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FHD', @LaptopName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '9th Generation Intel Core i5-9300H', @LaptopName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce GTX 1650 4GB GDDR5', @LaptopName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'G5 15 webcam', @LaptopName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Stereo Speakers', @LaptopName = 'Dell G5 15 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @LaptopName = 'Dell G5 15 Gaming Laptop'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FHD', @LaptopName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '9th Generation Intel Core i7-9750H', @LaptopName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce RTX 2060 6GB GDDR6', @LaptopName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'G7 17 webcam', @LaptopName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Stereo Speakers', @LaptopName = 'Dell G7 17 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe NVMe SSD + SATA HDD', @LaptopName = 'Dell G7 17 Gaming Laptop'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'VivoBook 15'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FHD Widescreen LED', @LaptopName = 'VivoBook 15'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'AMD 2nd Generation Ryzen 7 3700U', @LaptopName = 'VivoBook 15'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Integrated Radeon RX Vega 10', @LaptopName = 'VivoBook 15'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'VivoBook 15'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'High definition web-cam', @LaptopName = 'VivoBook 15'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Vivobook Stereo speaker', @LaptopName = 'VivoBook 15'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe Solid-State-Drive', @LaptopName = 'VivoBook 15'

EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Windows', @LaptopName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'FHD Widescreen LED', @LaptopName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = '9th Generation Intel Core i5-9300H', @LaptopName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'GeForce GTX 1650 4GB GDDR5', @LaptopName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Default password security', @LaptopName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'HD web-cam', @LaptopName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'Stereo speaker system', @LaptopName = 'Acer Nitro 5 Gaming Laptop'
EXEC uspINSERTLAPTOPFEATURE @FeatureName = 'PCIe Solid-State-Drive', @LaptopName = 'Acer Nitro 5 Gaming Laptop'