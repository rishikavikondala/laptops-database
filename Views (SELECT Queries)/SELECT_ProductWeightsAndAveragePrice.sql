USE INFO330_Proj_4

/*
Find the top 3 lightest products of type laptop in order, which:
- run on non-Windows OS,
- have a display resolution of 2880 x 1800
- consists of any color except black
- must have been ordered at least once in the last year.
*/
GO
CREATE VIEW [NonWindows colored 2880x1800 light laptops ordered min once in last year] AS
SELECT DISTINCT TOP 3 P.ProductName, C.ColorName, subq1.FeatureName, D.Resolution, P.Weight
FROM tblPRODUCT P
    JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
    JOIN tblCOLOR C ON P.ColorID = C.ColorID
    JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
    JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
    JOIN tblDISPLAY D ON F.FeatureID = D.FeatureID
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
    JOIN tblORDER O ON PO.OrderID = O.OrderID
    JOIN (
        SELECT P.ProductID, F.FeatureName
        FROM tblPRODUCT P
            JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
            JOIN tblCOLOR C ON P.ColorID = C.ColorID
            JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
            JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
            JOIN tblOS OS ON F.FeatureID = OS.FeatureID
            JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
            JOIN tblORDER O ON PO.OrderID = O.OrderID
        WHERE F.FeatureName != 'Windows'
        ) AS subq1 ON P.ProductID = subq1.ProductID
WHERE D.Resolution = '2880 x 1800'
AND C.ColorName NOT LIKE '%Black%'
AND PT.ProductTypeName = 'Laptop'
AND O.OrderDate > DATEADD(YEAR,-1,GETDATE())
ORDER BY P.Weight

/* 
Find the average price of a product of type laptop:
- with an Intel CPU that has at least 2 cores
- battery life greater than or equal to 10 hours
- released in the last 2 years
- purchased only by customers over 30 years old.
*/
GO
CREATE VIEW [Avg Price 2Year Old Laptop with 2Core Intel CPU and Min 30Yr Old Customers] AS
SELECT CONVERT(numeric(6, 2), AVG(P.Price)) AS AveragePrice
FROM tblPRODUCT_FEATURE PF
    JOIN tblPRODUCT P ON PF.ProductID = P.ProductID
    JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
    JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
    JOIN tblCPU CPU ON F.FeatureID = CPU.FeatureID
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
    JOIN tblORDER O ON PO.OrderID = O.OrderID
    JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
WHERE F.BrandID = (
    SELECT B.BrandID
    FROM tblBRAND B
    WHERE B.BrandName = 'Intel'
)
AND CPU.NumCores >= 2
AND P.BatteryLife >= 10.0
AND P.ReleaseYear > DATEADD(YEAR, -2, GETDATE())
AND C.DateOfBirth < DATEADD(YEAR, -30, GETDATE())
AND PT.ProductTypeName = 'Laptop'