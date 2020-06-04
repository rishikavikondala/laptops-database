USE INFO330_Proj_4

-- Computed column for number of products of type laptop per security type
-- Security types are: Face ID, Touch ID, default password
GO
CREATE FUNCTION CalcNumLaptopsPerSecurityType(@PK INT)
RETURNS
INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT P.ProductID)
    FROM tblPRODUCT P
        JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
        JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
        JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
        JOIN tblSECURITY S ON F.FeatureID = S.FeatureID
        JOIN tblSECURITY_TYPE ST ON S.SecurityTypeID = ST.SecurityTypeID
    WHERE ST.SecurityTypeID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblSECURITY_TYPE
ADD NumLaptopsPerSecurityType AS (dbo.CalcNumLaptopsPerSecurityType(SecurityTypeID))

-- Computed column for number of orders per region
GO
CREATE FUNCTION CalcNumOrdersPerRegion(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(DISTINCT O.OrderID)
    FROM tblORDER O
        JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
        JOIN tblREGION R ON C.RegionID = R.RegionID
    WHERE R.RegionID = @PK
)
RETURN @RET
END
GO
ALTER TABLE tblREGION
ADD NumOrdersPerRegion AS (dbo.CalcNumOrdersPerRegion(RegionID))