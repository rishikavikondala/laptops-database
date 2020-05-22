USE INFO330_Proj_4

CREATE TABLE tblDETAIL (
	DetailID INT IDENTITY (1, 1) PRIMARY KEY,
	DetailName varchar(20),
	DetailDescription varchar(500),
	LaptopID INT,
	Price INT,
	Weight INT,
	Color varchar(20),
	BatteryLife FLOAT,
	ReleaseYear INT
	CONSTRAINT FK_LaptopID FOREIGN KEY (LaptopID)
    REFERENCES tblLaptop(LaptopID)
)
GO

CREATE TABLE tblREVIEW (
  ReviewID INT IDENTITY (1, 1) PRIMARY KEY,
  RatingID INT,
  CommentID INT,
  LaptopOrderID INT,
  CONSTRAINT FK_RatingID FOREIGN KEY (RatingID)
  REFERENCES tblRATING(RatingID),
  CONSTRAINT FK_CommentID FOREIGN KEY (CommentID)
  REFERENCES tblCOMMENT(CommentID),
  CONSTRAINT FK_LaptopOrderID FOREIGN KEY(LaptopOrderID)
  REFERENCES tblLAPTOP_ORDER(LaptopOrderID)
)
GO 

CREATE TABLE tblCOMMENT (
	CommentID INT IDENTITY (1, 1) PRIMARY KEY,
	CommentDescription varchar(500)
)
GO 
CREATE TABLE tblRATING (
	RatingID INT IDENTITY (1, 1) PRIMARY KEY,
	RatingValue INT
)

