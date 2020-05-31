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

DBCC CHECKIDENT (tblREVIEW, RESEED, 0)