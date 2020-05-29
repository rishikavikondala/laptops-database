USE INFO330_Proj_4

/*
No laptop released in or after 2015 with:
- the feature ‘Windows’ (for an operating system)
- Windows versions '10 Home' or '10 Pro'
can have a weight of less than 1 pound.
*/

GO
CREATE FUNCTION fn_WindowsWeight() 
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT L.LaptopID
        FROM tblLAPTOP L
            JOIN tblRELEASE_YEAR RY ON L.ReleaseYearID = RY.ReleaseYearID
            JOIN tblLAPTOP_FEATURE LF ON L.LaptopID = LF.LaptopID
            JOIN tblFEATURE F ON LF.FeatureID = F.FeatureID
            JOIN tblOS O ON F.FeatureID = O.FeatureID
            JOIN tblVERSION V ON O.VersionID = V.VersionID
            JOIN tblWEIGHT W ON L.WeightID = W.WeightID
        WHERE RY.ReleaseYear >= 2015
		AND F.FeatureName = 'Windows'
        AND V.VersionName = '10 Home'
        OR V.VersionName = '10 Pro'
        AND W.Weight < 1.0
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblLAPTOP_FEATURE
ADD CONSTRAINT CK_WindowsWeight
CHECK (dbo.fn_WindowsWeight() = 0)

-- No laptop released after the end of 2015 with the operating system feature MacOS and OS version Catalina can have a graphics card made by brand 'NVIDIA'.

GO
CREATE FUNCTION fn_NvidiaGraphics()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0
    IF EXISTS (
        SELECT L.LaptopID
        FROM tblLAPTOP L
            JOIN tblRELEASE_YEAR RY ON L.ReleaseYearID = RY.ReleaseYearID
            JOIN tblLAPTOP_FEATURE LF ON L.LaptopID = LF.LaptopID
            JOIN tblFEATURE F ON LF.FeatureID = F.FeatureID
            JOIN tblBRAND B ON F.BrandID = B.BrandID
            JOIN tblOS O ON F.FeatureID = O.FeatureID
            JOIN tblVERSION V ON O.VersionID = V.VersionID
        WHERE RY.ReleaseYear > '2015'
        AND F.FeatureName = 'MacOS'
        AND V.VersionName = 'Catalina'
        AND B.BrandName = 'NVIDIA'
    )
    SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblLAPTOP_FEATURE
ADD CONSTRAINT CK_NvidiaGraphics
CHECK (dbo.fn_NvidiaGraphics() = 0)