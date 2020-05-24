USE INFO330_Proj_4

CREATE PROCEDURE uspNewLaptop
    @LaptopName varchar(50),
    @LaptopDescription varchar(300)
AS

BEGIN TRANSACTION T1
INSERT INTO tblLAPTOP(LaptopName, LaptopDescription)
VALUES(@LaptopName, @LaptopDescription)
COMMIT TRANSACTION T1


CREATE PROCEDURE uspNewLaptopFeature
    @FeatureName
    @LaptopName
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

BEGIN TRANSACTION T2
INSERT INTO tblLAPTOP_FEATURE(FeatureID, LaptopID)
VALUES(@FeatureID, @LaptopID)
BEGIN TRANSACTION T2