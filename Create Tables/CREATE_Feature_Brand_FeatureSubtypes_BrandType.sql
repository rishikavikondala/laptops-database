USE INFO330_Proj_4
SELECT * FROM tblFEATURE

-- CREATE TABLE tblBRAND_TYPE (
--     BrandTypeID INT IDENTITY (1, 1) PRIMARY KEY,
--     BrandTypeName varchar(20),
--     BrandTypeDescription varchar(500)
-- )

-- CREATE TABLE tblBRAND (
--     BrandID INT IDENTITY (1, 1) PRIMARY KEY,
--     BrandName varchar(20),
--     BrandDescription varchar(500)
-- )
-- GO

-- CREATE TABLE tblFEATURE (
--     FeatureID INT IDENTITY (1, 1) PRIMARY KEY,
--     BrandID INT,
--     FeatureName varchar(200),
--     CONSTRAINT FK_BrandID FOREIGN KEY (BrandID)
--     REFERENCES tblBRAND(BrandID)
-- )
-- GO

CREATE TABLE tblOS (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    StylusSupportID INT,
    VersionID INT
    CONSTRAINT FK_StylusSupport FOREIGN KEY (StylusSupportID)
    REFERENCES tblSTYLUS_SUPPORT(StylusSupportID),
    CONSTRAINT FK_Version FOREIGN KEY (VersionID)
    REFERENCES tblVERSION(VersionID)
)
GO

CREATE TABLE tblDISPLAY (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    ResolutionID INT,
    DisplaySizeID INT
    CONSTRAINT FK_Resolution FOREIGN KEY (ResolutionID)
    REFERENCES tblRESOLUTION(ResolutionID),
    CONSTRAINT FK_DisplaySize FOREIGN KEY (DisplaySizeID)
    REFERENCES tblDISPLAY_SIZE(DisplaySizeID)
)
GO

CREATE TABLE tblCPU (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    NumCoresID INT,
    ClockSpeedID INT,
    CONSTRAINT FK_NumCores FOREIGN KEY (NumCoresID)
    REFERENCES tblNUM_CORES(NumCoresID),
    CONSTRAINT FK_ClockSpeed FOREIGN KEY (ClockSpeedID)
    REFERENCES tblCLOCK_SPEED(ClockSpeedID)
)
GO

CREATE TABLE tblGRAPHICS (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    ReleaseYearID INT,
    CONSTRAINT FK_ReleaseYearGPU FOREIGN KEY (ReleaseYearID)
    REFERENCES tblRELEASE_YEAR(ReleaseYearID)
)
GO

CREATE TABLE tblSECURITY (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    SecurityTypeID INT,
    CONSTRAINT FK_SecurityType FOREIGN KEY (SecurityTypeID)
    REFERENCES tblSECURITY_TYPE(SecurityTypeID)
)
GO

CREATE TABLE tblWEBCAM (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    ProgressiveScanID INT,
    CONSTRAINT FK_ProgressiveScan FOREIGN KEY (ProgressiveScanID)
    REFERENCES tblPROGRESSIVE_SCAN(ProgressiveScanID)
)
GO

CREATE TABLE tblAUDIO (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    NumSpeakersID INT,
    CONSTRAINT FK_NumSpeakers FOREIGN KEY (NumSpeakersID)
    REFERENCES tblNUM_SPEAKERS(NumSpeakersID)
)
GO

CREATE TABLE tblSTORAGE (
    FeatureID INT FOREIGN KEY REFERENCES tblFEATURE (FeatureID) NOT NULL,
    StorageSizeID INT,
    CONSTRAINT FK_StorageSize FOREIGN KEY(StorageSizeID)
    REFERENCES tblSTORAGE_SIZE(StorageSizeID)
)
GO

ALTER TABLE tblBRAND
ADD BrandTypeID INT

ALTER TABLE tblBRAND
ADD CONSTRAINT FK_BrandTypeID
FOREIGN KEY (BrandTypeID) REFERENCES tblBRAND_TYPE (BrandTypeID)