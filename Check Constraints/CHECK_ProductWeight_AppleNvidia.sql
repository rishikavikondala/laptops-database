USE INFO330_Proj_4

-- No product of type laptop can have a weight of less than 1 pound.

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

-- No product by Apple can have an NVIDIA graphics card

GO
CREATE FUNCTION fn_NoNvidiaInApple()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0
    IF EXISTS (
        SELECT * 
        FROM tblPRODUCT_FEATURE PF
            JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
            JOIN tblPRODUCT P ON PF.ProductID = P.ProductID
            JOIN tblBRAND B ON F.BrandID = B.BrandID
        WHERE P.ProductName LIKE '%Apple%'
        AND F.BrandID = (
            SELECT B.BrandID
            FROM tblBRAND B
            WHERE B.BrandName = 'NVIDIA'
        )
    )
    BEGIN
        SET @RET = 1
    END
RETURN @RET
END
GO
ALTER TABLE tblPRODUCT_FEATURE
ADD CONSTRAINT CK_NoNvidiaInApple
CHECK(dbo.fn_NoNvidiaInApple() = 0)