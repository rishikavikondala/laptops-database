USE INFO330_Proj_4

-- No laptop with the feature ‘Windows’ (for an operating system) can have a weight of less than 1 pound.

GO
CREATE FUNCTION fn_WindowsWeight() 
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT L.LaptopID
        FROM tblLAPTOP L
            JOIN tblLAPTOP_FEATURE LF ON L.LaptopID = LF.LaptopID
            JOIN tblFEATURE F ON LF.FeatureID = F.FeatureID
            JOIN tblLAPTOP_DETAIL LD ON L.LaptopID = LD.LaptopID
            JOIN tblDETAIL D ON LD.DetailID = D.DetailID
            JOIN tblDETAIL_TYPE DT ON D.DetailTypeID = DT.DetailTypeID
		WHERE F.FeatureName = 'Windows'
        AND DT.DetailTypeName = 'Weight'
        AND D.DetailName < '1.0' -- convert DetailName to numeric or decimal
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