USE INFO330_Proj_4

/*
Count products of type laptop by the number of unique brands
that contributed features to them.
1 - 3: 'Few contributors'
4 - 5: 'Some contributors'
Greater than 5: 'Lots of contributors'
*/

SELECT (CASE
    WHEN NumBrands BETWEEN 1 AND 2
    THEN 'Few contributing brands'
    WHEN NumBrands BETWEEN 3 AND 4
    THEN 'Some contributing brands'
    WHEN NumBrands BETWEEN 5 AND 6
    THEN 'Many contributing brands'
    ELSE 'Lots of contributing brands'
END) NumBrandsLabel, COUNT(*) AS UniqueBrands
FROM (
    SELECT P.ProductID, COUNT(DISTINCT B.BrandID) AS NumBrands
    FROM tblPRODUCT P
        JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
        JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    GROUP BY P.ProductID
) AS subquery1
GROUP BY (CASE
    WHEN NumBrands BETWEEN 1 AND 2
    THEN 'Few contributing brands'
    WHEN NumBrands BETWEEN 3 AND 4
    THEN 'Some contributing brands'
    WHEN NumBrands BETWEEN 5 AND 6
    THEN 'Many contributing brands'
    ELSE 'Lots of contributing brands'
END)
ORDER BY UniqueBrands DESC

-- all laptops purchased in the South at least once
SELECT P.ProductID
FROM tblPRODUCT P
    JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
    JOIN tblORDER O ON PO.OrderID = O.OrderID
    JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
WHERE PT.ProductTypeName = 'Laptop'
AND C.State = 'South'

/*
Rank the operating system versions by number of orders in the South region
*/

SELECT *--V.VersionName, COUNT(DISTINCT O.OrderID) AS NumOrdersInSouth
FROM tblVERSION V
    JOIN tblOS OS ON V.VersionID = OS.VersionID
    JOIN tblFEATURE F ON OS.FeatureID = F.FeatureID
    JOIN tblPRODUCT_FEATURE PF ON F.FeatureID = PF.FeatureID
    JOIN tblPRODUCT P ON PF.ProductID = P.ProductID
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
    JOIN tblORDER O ON PO.OrderID = O.OrderID
    JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
    JOIN tblREGION R ON C.RegionID = R.RegionID
WHERE R.RegionName = 'South'
--GROUP BY V.VersionName

SELECT TOP 3 FeatureID, COUNT(FeatureID) AS Occurences
FROM tblPRODUCT_FEATURE
GROUP BY FeatureID
HAVING COUNT(FeatureID) > 1
ORDER BY COUNT(FeatureID) DESC