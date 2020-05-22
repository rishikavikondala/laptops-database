USE INFO330_Proj_4

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