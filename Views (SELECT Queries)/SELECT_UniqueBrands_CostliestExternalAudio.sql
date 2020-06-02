USE INFO330_Proj_4
/*
Count products of type laptop by the number of unique brands
that contributed features to them.
1 - 3: 'Few contributors'
4 - 5: 'Some contributors'
Greater than 5: 'Lots of contributors'
*/
GO
CREATE VIEW [Brands Contributions to Laptops] AS
SELECT TOP 4 (CASE
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
        JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
        JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
        JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
        JOIN tblBRAND B ON F.BrandID = B.BrandID
    WHERE PT.ProductTypeName = 'Laptop'
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
Rank the top 3 most expensive products of type laptop
with an average rating greater than 3.0
that rely on external audio part producing brands for their audio systems 
*/

CREATE VIEW [Costliest Laptops With External Audio Parts And High Ratings] AS
SELECT TOP 3 P.ProductName, P.Price, P.AverageRating
FROM tblPRODUCT_FEATURE PF
    JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
    JOIN tblPRODUCT P ON PF.ProductID = P.ProductID
    JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
    JOIN tblBRAND B ON F.BrandID = B.BrandID
    JOIN tblBRAND_TYPE BT ON B.BrandTypeID = BT.BrandTypeID
WHERE BT.BrandTypeID = (
    SELECT BT.BrandTypeID
    FROM tblBRAND_TYPE BT
    WHERE BT.BrandTypeName LIKE '%Audio%'
)
AND P.AverageRating > 3.0
AND PT.ProductTypeName = 'Laptop'
ORDER BY P.Price DESC