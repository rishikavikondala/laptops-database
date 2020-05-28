USE INFO330_Proj_4

/*
Find the average display size of Windows laptops with at least 128GB of storage space
and are priced above $800, that also have a 1080p webcam.
*/

SELECT AVG(D.DetailName)
FROM tblLAPTOP L
    JOIN tblLAPTOP_FEATURE LF ON L.LaptopID = LF.LaptopID
    JOIN tblFEATURE F ON LF.FeatureID = F.FeatureID
    JOIN tblSTORAGE S ON F.FeatureID = S.FeatureID
    JOIN tblSTORAGE_SIZE SS ON S.StorageSizeID = SS.StorageSizeID
    JOIN tblWEBCAM W ON F.FeatureID = W.FeatureID
    JOIN tblPROGRESSIVE_SCAN PS ON W.ProgressiveScanID = PS.ProgressiveScanID
    JOIN tblLAPTOP_DETAIL LD ON L.LaptopID = LD.LaptopID
    JOIN tblDETAIL D ON LD.DetailID = D.DetailID
    JOIN tblDETAIL_TYPE DT ON D.DetailTypeID = DT.DetailTypeID
WHERE F.FeatureName = 'Windows'
AND SS.Size >= 128
AND D.DetailName > '800'
AND DT.DetailTypeName = 'Price'
AND PS.ProgressiveScan = 1080

/*
Find the number of 2019-released laptops with a battery life greater than 8 hours 
that were ordered by customers in the midwest or west regions of the country.
*/

SELECT COUNT(*) AS BatteryMore8HrsMidwestWest2019
FROM tblLAPTOP L
    JOIN tblRELEASE_YEAR RY ON L.ReleaseYearID = RY.ReleaseYearID
    JOIN tblLAPTOP_ORDER LO ON L.LaptopID = LO.LaptopID
    JOIN tblORDER O ON LO.OrderID = O.OrderID
    JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
    JOIN tblREGION R ON C.RegionID = R.RegionID
    JOIN tblLAPTOP_DETAIL LD ON L.LaptopID = LD.LaptopID
    JOIN tblDETAIL D ON LD.DetailID = D.DetailID
    JOIN tblDETAIL_TYPE DT ON D.DetailTypeID = DT.DetailTypeID
WHERE RY.ReleaseYear = '2019'
AND DT.DetailTypeName = 'Battery Life'
AND D.DetailName > '8.0'
AND R.RegionName = 'Midwest'
OR R.RegionName = 'West'