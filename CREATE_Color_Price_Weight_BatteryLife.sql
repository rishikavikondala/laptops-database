USE INFO330_Proj_4

CREATE TABLE tblCOLOR (
    ColorID INT IDENTITY (1, 1) PRIMARY KEY,
	ColorName varchar(20)
)

CREATE TABLE tblBATTERY_LIFE (
    BatteryLifeID INT IDENTITY (1, 1) PRIMARY KEY,
    BatteryLife numeric(3, 1)
)

CREATE TABLE tblWEIGHT (
    WeightID INT IDENTITY (1, 1) PRIMARY KEY,
    [Weight] numeric(2, 1)
)

CREATE TABLE tblPRICE (
    PriceID INT IDENTITY (1, 1) PRIMARY KEY,
    Price numeric(7, 2)
)