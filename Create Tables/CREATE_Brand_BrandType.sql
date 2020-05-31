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

ALTER TABLE tblBRAND
ADD BrandTypeID INT

ALTER TABLE tblBRAND
ADD CONSTRAINT FK_BrandTypeID
FOREIGN KEY (BrandTypeID) REFERENCES tblBRAND_TYPE (BrandTypeID)