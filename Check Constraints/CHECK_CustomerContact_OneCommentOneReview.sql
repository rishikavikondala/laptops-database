USE INFO330_Proj_4

/* No customer can have a phone number with letters
or an email containing less or more than one '@' symbol */

GO
CREATE FUNCTION fn_ValidContactInfo()
RETURNS INT
AS
BEGIN
	DECLARE @RET INT = 0
	IF EXISTS (
		SELECT DISTINCT C.CustomerID
		FROM tblCUSTOMER C
		WHERE LEN(C.Email) - LEN(REPLACE(C.Email, '@', '')) <> 1
		OR C.Phone LIKE '%[^0-9]%'
	)
	SET @RET = 1
RETURN @RET
END
GO
ALTER TABLE tblCUSTOMER WITH NOCHECK
ADD CONSTRAINT CK_ValidContactInfo
CHECK (dbo.fn_ValidContactInfo() = 0)


-- Two reviews cannot have the exact same comment
GO
CREATE FUNCTION fn_CommentAppliesToOneReview()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0
    IF EXISTS (
        SELECT C.ReviewID, COUNT(C.ReviewID) AS Total
        FROM tblCOMMENT C
        GROUP BY C.ReviewID
        HAVING COUNT(C.ReviewID) >= 2
    )
    BEGIN
        SET @RET = 1
    END
RETURN @RET
END
GO
ALTER TABLE tblCOMMENT
ADD CONSTRAINT CK_CommentAppliesToOneReview
CHECK (dbo.fn_CommentAppliesToOneReview() = 0)