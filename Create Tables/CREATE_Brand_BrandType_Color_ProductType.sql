USE INFO330_Proj_4

GO
CREATE TABLE tblBRAND_TYPE (
    BrandTypeID INT IDENTITY (1, 1) PRIMARY KEY,
    BrandTypeName varchar(20),
    BrandTypeDescription varchar(500)
)

GO
CREATE TABLE tblBRAND (
    BrandID INT IDENTITY (1, 1) PRIMARY KEY,
    BrandName varchar(20),
    BrandDescription varchar(500)
)

ALTER TABLE tblBRAND
ADD BrandTypeID INT

ALTER TABLE tblBRAND
ADD CONSTRAINT FK_BrandTypeID
FOREIGN KEY (BrandTypeID) REFERENCES tblBRAND_TYPE (BrandTypeID)

CREATE TABLE tblCOLOR (
    ColorID INT IDENTITY (1, 1) PRIMARY KEY,
	ColorName varchar(20)
)

CREATE TABLE tblPRODUCT_TYPE (
    ProductTypeID INT IDENTITY (1, 1) PRIMARY KEY,
    ProductTypeName varchar(20),
    ProductTypeDescription varchar(500)
)