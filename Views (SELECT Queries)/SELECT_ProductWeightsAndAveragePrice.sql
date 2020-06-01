USE INFO330_Proj_4

-- Find the products of type laptop in order from lightest to heaviest, which run on non-Windows OS,
-- have a display size of 2880 x 1800, and consist of any color except black ordered in the last year.

SELECT P.ProductID, P.ProductName, C.ColorName, subq1.FeatureName, D.Resolution, P.Weight
FROM tblPRODUCT P
    JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
    JOIN tblCOLOR C ON P.ColorID = C.ColorID
    JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
    JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
    JOIN tblDISPLAY D ON F.FeatureID = D.FeatureID
    --JOIN tblOS OS ON F.FeatureID = OS.FeatureID
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
ORDER BY P.Weight

-- Find the average price of an Intel Laptop with number of cores greater than 2, battery life greater
-- than or equal to 10 hours, released in the last 2 years, and purchased by customers over 30 years old.

SELECT AVG(P.Price) AS AveragePrice
FROM tblPRODUCT P
    JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
    JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
    JOIN tblBRAND B ON F.BrandID = B.BrandID
    JOIN tblCPU CPU ON F.FeatureID = CPU.FeatureID
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
    JOIN tblORDER O ON PO.OrderID = O.OrderID
    JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
WHERE B.BrandName = 'Intel'
AND CPU.NumCores > 2
AND P.BatteryLife >= 10.0
AND P.ReleaseYear > DATEADD(YEAR, -2, GETDATE())
AND C.DateOfBirth < DATEADD(YEAR, -30, GETDATE())