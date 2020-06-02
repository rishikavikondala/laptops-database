USE INFO330_Proj_4

/*
Find the three lowest priced 2019-released laptops that:
- run on Windows 10 Home
- has at least 1 speaker
- and weighs more than 3 lbs.
*/
GO
CREATE VIEW [Cheapest 2019 Laptops With Windows 10 Home, One Speaker, Over 3 Pounds] AS
SELECT TOP 3 P.ProductID, P.ProductName
FROM tblPRODUCT P
	JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
	JOIN tblPRODUCT_FEATURE PF ON P.ProductID = PF.ProductID
	JOIN tblFEATURE F ON PF.FeatureID = F.FeatureID
	JOIN tblOS OS ON PF.FeatureID = OS.FeatureID
	JOIN tblVERSION V ON OS.VersionID = V.VersionID
	JOIN tblAUDIO A ON PF.FeatureID = A.FeatureID
WHERE F.FeatureName = 'Windows'
AND V.VersionName = '10 Home'
AND P.ReleaseYear = '2019'
AND PT.ProductTypeName = 'Laptop'
AND A.NumSpeakers >= 1
AND P.Weight > 3
ORDER BY P.Price ASC

/*Find the customers who have:
- ordered over $1000 of laptop(s) in the last six months
- that also have an average rating over 3 stars.
*/
GO
CREATE VIEW [Customers With Over $1000 Last 6 Months For Laptops Over 3 Stars] AS
SELECT C.CustomerID, SUM(O.OrderTotal) AS AmountSpent
FROM tblCUSTOMER C
	JOIN tblORDER O ON C.CustomerID = O.CustomerID
	JOIN tblPRODUCT_ORDER PO ON O.OrderID = PO.OrderID
	JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
	JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
	JOIN (
		SELECT P.ProductID, AVG(R.RatingValue) AS AverageRating
		FROM tblRATING R
			JOIN tblREVIEW RE ON R.RatingID = RE.RatingID
			JOIN tblPRODUCT_ORDER PO ON RE.ProductOrderID = PO.ProductOrderID
			JOIN tblPRODUCT P ON PO.ProductID = P.ProductID
			JOIN tblPRODUCT_TYPE PT ON P.ProductTypeID = PT.ProductTypeID
		WHERE PT.ProductTypeName = 'Laptop'
		GROUP BY P.ProductID
		HAVING AVG(R.RatingValue) > 3
	) AS subq1 ON P.ProductID = subq1.ProductID
WHERE O.OrderDate >= DATEADD(MONTH, -6, GETDATE())
AND PT.ProductTypeName = 'Laptop'
GROUP BY C.CustomerID
HAVING SUM(O.OrderTotal) > 1000
