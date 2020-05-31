USE INFO330_Proj_4

/*
No product of type laptop can have a weight of less than 1 pound.
*/

GO
ALTER FUNCTION fn_WindowsWeight() 
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT DISTINCT P.ProductID
        FROM tblPRODUCT P
            JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
        WHERE PT.ProductTypeName = 'Laptop'
        AND P.Weight < 1.0
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT WITH NOCHECK
ADD CONSTRAINT CK_WindowsWeight
CHECK (dbo.fn_WindowsWeight() = 0)

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='tblPRODUCT'

ALTER TABLE tblPRODUCT
DROP CONSTRAINT CK_WindowsWeight

-- No laptop with the operating system feature MacOS and OS version Catalina can have a graphics card made by brand 'NVIDIA'.

-- GO
-- CREATE FUNCTION fn_NvidiaGraphics()
-- RETURNS INT
-- AS
-- BEGIN
--     DECLARE @RET INT = 0
--     IF EXISTS (
--         SELECT DISTINCT P.ProductID
--         FROM tblPRODUCT P
--             JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
--             JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
--             JOIN tblOS O ON F.FeatureID = O.FeatureID
--             JOIN tblVERSION V ON O.VersionID = V.VersionID
--             JOIN (
--                 SELECT * FROM tblFEATURE F
--                 WHERE F.FeatureName LIKE '%GeForce%' https://www.w3schools.com/sql/sql_like.asp
--                 OR F.FeatureName LIKE '%Quadro%'
--             ) AS subq1 ON F.FeatureID = subq1.FeatureID
--         WHERE F.FeatureName = 'Windows'
--         -- AND V.VersionName = 'Catalina'
--     )
--     SET @RET = 1
-- RETURN @RET
-- END
-- GO
-- ALTER TABLE tblPRODUCT_FEATURE
-- ADD CONSTRAINT CK_NvidiaGraphics
-- CHECK (dbo.fn_NvidiaGraphics() = 0)