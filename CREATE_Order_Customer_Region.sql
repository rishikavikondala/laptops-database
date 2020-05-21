USE INFO330_Proj_4

CREATE TABLE tblREGION(
	RegionID INT IDENTITY(1,1) PRIMARY KEY,
	RegionName varchar(10),
	RegionDescription varchar(500)
)
GO

CREATE TABLE tblCUSTOMER(
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	RegionID INT,
	FirstName varchar(50),
	LastName varchar(50),
	DateOfBirth datetime,
	Country varchar(25),
	[State] varchar(50),
	City varchar(50),
	Street varchar(50),
	Zip char(5),
	Phone char(10),
	Email varchar(50),
	CONSTRAINT FK_RegionID FOREIGN KEY(RegionID)
	REFERENCES tblREGION(RegionID)
)
GO

CREATE TABLE tblORDER(
	OrderID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT,
	OrderDate datetime,
	ShipDate datetime,
	OrderTotal INT,
	CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID)
	REFERENCES tblCUSTOMER(CustomerID)
)
GO





