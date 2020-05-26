USE INFO330_Proj_4
SELECT * FROM tblLAPTOP

-- INSERT INTO tblLAPTOP
GO
CREATE PROCEDURE uspINSERTLAPTOP
    @LaptopName varchar(50),
    @ReleaseYear char(4)
AS
BEGIN TRANSACTION T1
INSERT INTO tblLAPTOP(LaptopName, ReleaseYear)
VALUES(@LaptopName, @ReleaseYear)
COMMIT TRANSACTION T1

-- INSERT INTO tblLAPTOP_FEATURE
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
BEGIN TRANSACTION T1