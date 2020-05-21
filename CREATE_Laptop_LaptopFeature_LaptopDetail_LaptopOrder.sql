USE INFO330_Proj_4

CREATE TABLE tblLAPTOP_FEATURE (
    LaptopFeatureID INT IDENTITY (1, 1) PRIMARY KEY,
    FeatureID INT,
    LaptopID INT
)
GO

CREATE TABLE tblLAPTOP (
    LaptopID INT IDENTITY (1, 1) PRIMARY KEY,
    LaptopName varchar(30),
    LaptopDescription varchar(500)
)
GO

CREATE TABLE tblLAPTOP_DETAIL (
    LaptopDetailID INT IDENTITY (1, 1) PRIMARY KEY,
    LaptopID INT,
    DetailID INT
)
GO

CREATE TABLE tblLAPTOP_ORDER (
    LaptopOrderID INT IDENTITY (1, 1) PRIMARY KEY,
    LaptopID INT,
    OrderID INT,
    Quantity INT
)
GO

GO
ALTER TABLE tblLAPTOP_FEATURE
ADD CONSTRAINT FK_FeatureID2 FOREIGN KEY (FeatureID) REFERENCES tblFEATURE(FeatureID)

GO
ALTER TABLE tblLAPTOP_FEATURE
ADD CONSTRAINT FK_LaptopID FOREIGN KEY (LaptopID) REFERENCES tblLAPTOP(LaptopID)

GO
ALTER TABLE tblLAPTOP_DETAIL
ADD CONSTRAINT FK_LaptopID2 FOREIGN KEY (LaptopID) REFERENCES tblLAPTOP(LaptopID)

GO
ALTER TABLE tblLAPTOP_DETAIL 
ADD CONSTRAINT FK_DetailID FOREIGN KEY (DetailID) REFERENCES tblDETAIL(DetailID)

GO
ALTER TABLE tblLAPTOP_ORDER
ADD CONSTRAINT FK_LaptopID3 FOREIGN KEY (LaptopID) REFERENCES tblLAPTOP(LaptopID)

GO
ALTER TABLE tblLAPTOP_ORDER
ADD CONSTRAINT FK_OrderID FOREIGN KEY (OrderID) REFERENCES tblORDER(OrderID)