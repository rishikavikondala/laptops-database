USE INFO330_Proj_4

-- OS
GO
CREATE TABLE tblVERSION (
	VersionID INT IDENTITY (1, 1) PRIMARY KEY,
	VersionName varchar(20)
)
GO
CREATE TABLE tblSTYLUS_SUPPORT (
	StylusSupportID INT IDENTITY (1, 1) PRIMARY KEY,
	StylusSupport varchar(5)
)
-- Display
GO
CREATE TABLE tblDISPLAY_SIZE (
	DisplaySizeID INT IDENTITY (1, 1) PRIMARY KEY,
	DisplaySize decimal(3, 1)
)
GO
CREATE TABLE tblRESOLUTION (
	ResolutionID INT IDENTITY (1, 1) PRIMARY KEY,
	Resolution varchar(25)
)
-- CPU
GO
CREATE TABLE tblCLOCK_SPEED (
	ClockSpeedID INT IDENTITY (1, 1) PRIMARY KEY,
	ClockSpeed decimal(3, 1)
)
GO
CREATE TABLE tblNUM_CORES (
	NumCoresID INT IDENTITY (1, 1) PRIMARY KEY,
	NumCores INT
)
-- Graphics
GO
CREATE TABLE tblRELEASE_YEAR (
	ReleaseYearID INT IDENTITY (1, 1) PRIMARY KEY,
	ReleaseYear char(4)
)
-- Security
GO
CREATE TABLE tblSECURITY_TYPE (
	SecurityTypeID INT IDENTITY (1, 1) PRIMARY KEY,
	SecurityType varchar(30)
)
-- Webcam
GO
CREATE TABLE tblPROGRESSIVE_SCAN (
	ProgressiveScanID INT IDENTITY (1, 1) PRIMARY KEY,
	ProgressiveScan INT
)
-- Audio
GO
CREATE TABLE tblNUM_SPEAKERS (
	NumSpeakersID INT IDENTITY (1, 1) PRIMARY KEY,
	NumSpeakers INT
)
-- Storage
GO
CREATE TABLE tblSTORAGE_SIZE (
	StorageSizeID INT IDENTITY (1, 1) PRIMARY KEY,
	Size varchar(10)
)