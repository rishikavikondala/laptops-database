USE INFO330_Proj_4

--tblDETAIL
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (1, 999, 2.8, 'Gold' , 12, 2020)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (2, 649, 2, 'Black', 12, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (3, 749.99, 1.41, 'Red', 10.5, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (4, 1799.99, 4, 'Grey', 20.5, 2020)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (5, 2399, 4.3, 'Silver', 11, 2020)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (6, 1599.99, 2.89, 'Artic Blue', 11.5, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (7, 1794.99, 5.79, 'Silver', 2.5, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (8, 949.99, 3.5, 'Royal Blue', 19, 2020)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (9, 1353.87, 2.4, 'Black', 18.3, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (10, 1829, 3.39, 'Black', 6.2, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (11, 659.99, 3.97, 'Black', 11, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (12, 429, 3.3, 'Business Black', 10, 2018)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (13, 4599.99, 9.92, 'Aluminum Black', 6, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (14, 2544.99, 8.54, 'Lunar Light', 2, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (15, 1353.87, 2.4, 'Black', 18.3, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (16, 999.99, 2.6, 'Royal Blue', 14, 2018)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (17, 949.99, 5.9, 'Space Black', 6.33, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (18, 1729.99, 6.9, 'Black', 6.33, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (19, 599.99, 3.75, 'Transparent Silver', 9, 2019)
INSERT INTO tblDETAIL(LaptopID, Price, Weight, Color, BatteryLife, ReleaseYear) VALUES (20, 879.99, 5.73, 'Black', 7, 2019)


--tblREVIEW
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (5, 1, 1)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (3, 2, 2)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (4, 3, 3)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (4, 4, 4)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (5, 5, 5)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (5, 6, 6)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (5, 7, 7)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (3, 8, 8)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (5, 9, 9)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (4, 10, 10)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (4, 11, 11)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (3, 12, 12)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (2, 13, 13)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (1, 14, 14)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (5, 15, 15)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (3, 16, 16)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (5, 17, 17)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (1, 18, 18)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (5, 19, 19)
INSERT INTO tblREVIEW(RatingID, CommentID, LaptopOrderID) VALUES (2, 20, 20)


--tblCOMMENT

INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Great for software development. The physical device has a nice design and is not too heavy.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Would work well for someone whose life runs through Google products. Wish it was more versatile.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Really convenient to be able to switch from laptop to tablet. Lightweight and great battery life.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Amazing battery life for such a powerful product. Best for those who need lots of computing power for a long time.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Excellent for design software (Adobe CC) and watching movies. Integrates really well with other Apple devices.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Lovely refined designed bundled in a light weight package. Thank you!')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Looking for a high quality gaming laptop and that is just what I got. Works great!')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Lightweight and works OK for my needs as a student. Battery life could last longer while running certain programs.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Kids wanted a laptop to play with, works great and was a cheap, indestructable laptop! Love it!')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Great purchase, beautiful display, and works well for all of my needs. Battery life is unmatched!')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Great for gaming, but a little noisy.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Affordable product. Does everything I need it to just well enough.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Alright for work and video editing. Screen quality could be much better.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Battery life is not as advertised, unresponsive trackpad.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Excellent for everything I use it for including video editing, photo editing, and streaming.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Love the long battery life but the storage space is way too low for the price.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('My son always uses this to play Fornite! He has not had any problems so far so good job!')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Way too expensive and clunky for a laptop. You are better off just building a pc. The webcam is terrible.')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('This is a super good laptop for work. It is relatively cheap, lightweight, and has a great battery life. Would recommend!')
INSERT INTO tblCOMMENT(CommentDescription) VALUES ('Touchpad did not work as soon as I got it. Save yourself the hassle and get something better.')


--tblRATING
INSERT INTO tblRATING(RatingValue) VALUES (1)
INSERT INTO tblRATING(RatingValue) VALUES (2)
INSERT INTO tblRATING(RatingValue) VALUES (3)
INSERT INTO tblRATING(RatingValue) VALUES (4)
INSERT INTO tblRATING(RatingValue) VALUES (5)



DELETE FROM tblCOMMENT
DELETE FROM tblRATING
DELETE FROM tblREVIEW

DBCC CHECKIDENT (tblREVIEW, RESEED, 0)
SELECT * FROM tblCOMMENT
SELECT * FROM tblRATING
SELECT * FROM tblREVIEW