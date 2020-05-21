USE INFO330_Proj_4

CREATE TABLE tblBRAND (
    BrandID INT IDENTITY (1, 1) PRIMARY KEY,
    BrandName varchar(20),
    BrandDescription varchar(500)
)
GO

CREATE TABLE tblFEATURE (
    FeatureID INT IDENTITY (1, 1) PRIMARY KEY,
    BrandID INT,
    FeatureName varchar(20),
    FeatureDescription varchar(500),
    CONSTRAINT FK_BrandID FOREIGN KEY (BrandID)
    REFERENCES tblBRAND(BrandID)
)
GO

CREATE TABLE tblOS (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    Version varchar(20),
    ReleaseYear INT,
    StylusSupport varchar(5)
)
GO

CREATE TABLE tblDISPLAY (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    Resolution varchar(20),
    DisplaySize numeric(2, 1),
)
GO

CREATE TABLE tblCPU (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    NumCores INT,
    ClockSpeed numeric(2, 1)
)
GO

CREATE TABLE tblGRAPHICS (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    Model varchar(150),
    ReleaseYear INT
)
GO

CREATE TABLE tblSECURITY (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    SecurityType varchar(50)
)
GO

CREATE TABLE tblWEBCAM (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    ProgressiveScan INT
)
GO

CREATE TABLE tblAUDIO (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    NumSpeakers INT,
    NumMicrophones INT
)
GO

CREATE TABLE tblSTORAGE (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    NumGigs INT
)
GO
