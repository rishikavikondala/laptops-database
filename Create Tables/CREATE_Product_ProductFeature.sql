USE INFO330_Proj_4

CREATE TABLE tblPRODUCT_FEATURE (
    ProductFeatureID INT IDENTITY (1, 1) PRIMARY KEY,
    FeatureID INT,
    ProductID INT
)
GO

ALTER TABLE tblPRODUCT_FEATURE
ADD CONSTRAINT FK_ProductID
FOREIGN KEY (ProductID) REFERENCES tblPRODUCT(ProductID)

ALTER TABLE tblPRODUCT_FEATURE
ADD CONSTRAINT FK_FeatureID
FOREIGN KEY (FeatureID) REFERENCES tblFEATURE(FeatureID)

CREATE TABLE tblPRODUCT (
    ProductID INT IDENTITY (1, 1) PRIMARY KEY,
    ProductName varchar(30),
    ColorID char(4),
    ProductTypeID INT,
    ReleaseYear char(4),
    BatteryLife numeric(3, 1),
    Weight numeric(3, 1),
    Price numeric(6, 2)
)