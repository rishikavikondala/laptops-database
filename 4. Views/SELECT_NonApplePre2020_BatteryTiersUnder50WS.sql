USE INFO330_Proj_4

/*
Find the top 5 products of type laptop meeting the following conditions:
- not affiliated with Apple
- a graphics card made by NVIDIA
- received an average rating of 3 or higher
- priced under $1000
- released before 2020
- (ordered output by price highest to lowest)
*/
GO
CREATE VIEW [Pre2020 Laptops under 1000 at least 3 Rating] AS
SELECT DISTINCT TOP 5 P.ProductName, F.FeatureName, P.AverageRating, P.Price
FROM tblPRODUCT P
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
	JOIN tblREVIEW Re ON PO.ProductOrderID = Re.ProductOrderID
	JOIN tblRATING Ra ON Re.RatingID = Ra.RatingID 
	JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
	JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
	JOIN tblBRAND B ON F.BrandID = B.BrandID
	JOIN tblGRAPHICS G ON F.FeatureID = G.FeatureID
WHERE P.ProductName NOT LIKE '%Apple%'
AND P.ProductName NOT LIKE '%Macbook%'
AND F.BrandID = (
	SELECT BrandID
	FROM tblBRAND
	WHERE BrandName = 'NVIDIA'
)
AND P.AverageRating >= 3
AND P.Price < 1000
AND P.ReleaseYear < 2020
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
THEN 'Low battery life'
WHEN BattLife >= 5 AND BattLife <= 15
THEN 'Medium battery life'
ELSE 'High battery life'
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
THEN 'Low battery life'
WHEN BattLife >= 5 AND BattLife <= 15
THEN 'Medium battery life'
ELSE 'High battery life'
END)