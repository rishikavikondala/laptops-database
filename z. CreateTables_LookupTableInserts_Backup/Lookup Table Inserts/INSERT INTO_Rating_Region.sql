USE INFO330_Proj_4

--tblRATING
INSERT INTO tblRATING(RatingValue) VALUES (1)
INSERT INTO tblRATING(RatingValue) VALUES (2)
INSERT INTO tblRATING(RatingValue) VALUES (3)
INSERT INTO tblRATING(RatingValue) VALUES (4)
INSERT INTO tblRATING(RatingValue) VALUES (5)

UPDATE tblRATING
SET RatingName = 'Poor' WHERE RatingID = 1

UPDATE tblRATING
SET RatingName = 'Fair' WHERE RatingID = 2

UPDATE tblRATING
SET RatingName = 'Average' WHERE RatingID = 3

UPDATE tblRATING
SET RatingName = 'Great' WHERE RatingID = 4

UPDATE tblRATING
SET RatingName = 'Excellent' WHERE RatingID = 5

-- DBCC CHECKIDENT (tblRATING, RESEED, 0)

--tblREGION
INSERT INTO tblREGION(RegionName, RegionDescription) VALUES('Northeast', 'Maine, New Hampshire, Vermont, Massachusetts, Rhode Island, Connecticut, New York, New Jersey, Pennsylvania')
INSERT INTO tblREGION(RegionName, RegionDescription) VALUES('Midwest', 'Ohio, Michigan, Indiana, Wisconsin, Illinois, Minnesota, Iowa, Missouri, North Dakota, South Dakota, Nebraska, Kansas')
INSERT INTO tblREGION(RegionName, RegionDescription) VALUES('South', 'Delaware, Maryland, Virginia, West Virginia, Kentucky, North Carolina, South Carolina, Tennessee, Georgia, Florida, Alabama, Mississippi, Arkansas, Louisiana, Texas, Oklahoma')
INSERT INTO tblREGION(RegionName, RegionDescription) VALUES('West', 'Montana, Idaho, Wyoming, Colorado, New Mexico, Arizona, Utah, Nevada, California, Oregon, Washington, Alaska, Hawaii')