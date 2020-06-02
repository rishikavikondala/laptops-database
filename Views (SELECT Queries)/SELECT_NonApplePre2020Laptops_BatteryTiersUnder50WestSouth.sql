USE INFO330_Proj_4

/*
Find all products of type laptop meeting the following conditions:
- not Apple
- released before 2020
- under $1000
- received an average rating of 3 or higher
- at least 500 gb storage
_ (ordered by price highest to lowest)
*/
GO
CREATE VIEW [Pre2020 Laptops under 1000 at least 3 Rating] AS
SELECT DISTINCT(P.ProductID), P.ProductName, B.BrandName, Ra.RatingValue, P.Price
FROM tblPRODUCT P
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
	JOIN tblREVIEW Re ON PO.ProductOrderID = Re.ProductOrderID
	JOIN tblRATING Ra ON Re.RatingID = Ra.RatingID 
	JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
	JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
	JOIN tblBRAND B ON F.BrandID = B.BrandID
	JOIN tblSTORAGE S ON F.FeatureID = S.FeatureID
WHERE B.BrandName != 'Apple'
AND P.AverageRating >= 3
AND P.Price < 1000
AND P.ReleaseYear < 2020
AND S.Gigabytes >= 500
ORDER BY P.Price DESC


/*
Find and group the products of type laptop that:
- have been ordered at least once by people younger than 50 in the West or South.
- into 3 groups:
	- < 5 hrs: 'low battery life'
	- >= 5 hrs and < 15 hrs: 'medium battery life'
	- >= 15 hrs: 'high battery life'
*/

GO
CREATE VIEW [Laptops Battery Life Sub-50 West or South] AS
SELECT (CASE
WHEN BattLife < 5
THEN 'low battery life'
WHEN BattLife >= 5 AND BattLife <= 15
THEN 'medium battery life'
ELSE 'high battery life'
END)
AS BatteryTier, COUNT(*) AS NumLaptops
FROM (
	SELECT P.ProductID, P.ProductName, P.BatteryLife AS BattLife
	FROM tblPRODUCT P
		JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
		JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
		JOIN tblORDER O ON PO.OrderID = O.OrderID
		JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
		JOIN tblREGION R ON C.RegionID = R.RegionID
	WHERE R.RegionName = 'West'
	OR R.RegionName = 'South'
	AND C.DateOfBirth > DateAdd(Year, -50, GetDate())
	AND PT.ProductTypeName = 'Laptop') AS TheLaptops

GROUP BY (CASE
WHEN BattLife < 5
THEN 'low battery life'
WHEN BattLife >= 5 AND BattLife <= 15
THEN 'medium battery life'
ELSE 'high battery life'
END)


