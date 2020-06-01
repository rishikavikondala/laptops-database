USE INFO330_Proj_4


-- Find all laptops released before 2020 and under $1000 that received an average rating of 4 or higher.
GO
CREATE VIEW [Pre2020 Laptops under 1000 at least 4 Rating] AS
SELECT P.ProductID
FROM tblPRODUCT P
    JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
	JOIN tblREVIEW Re ON PO.ProductOrderID = Re.ProductOrderID
	JOIN tblRATING Ra ON Re.RatingID = Ra.RatingID 
WHERE Ra.RatingValue >= 4
AND P.Price < 1000
AND P.ReleaseYear < 2020


-- Find the top 3 (ranked by battery life) products of type laptop that were ordered by people younger than 25 in the West.
GO CREATE VIEW [Top 3 Laptops with Highest Battery Life Sub-25 West] AS
SELECT TOP 3 P.ProductID 
FROM tblPRODUCT P
	JOIN tblPRODUCT_ORDER PO ON P.ProductID = PO.ProductID
	JOIN tblORDER O ON PO.OrderID = O.OrderID
	JOIN tblCUSTOMER C ON O.CustomerID = C.CustomerID
	JOIN tblREGION R ON C.RegionID = R.RegionID
WHERE R.RegionName = 'West'
AND C.DateOfBirth > DateAdd(Year, -25, GetDate())
ORDER BY P.BatteryLife DESC
