USE INFO330_Proj_4

CREATE TABLE tblCOLOR (
    ColorID INT IDENTITY (1, 1) PRIMARY KEY,
	ColorName varchar(20)
)

CREATE TABLE tblPRODUCT_TYPE (
    ProductTypeID INT IDENTITY (1, 1) PRIMARY KEY,
    ProductTypeName varchar(20),
    ProductTypeDescription varchar(500)
)