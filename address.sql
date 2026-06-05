select * from Users


select * from Orders
select * from OrderItems
select * from Payments


-- Address table
CREATE TABLE Addresses
(
    AddressId INT IDENTITY(1,1) PRIMARY KEY,

    UserId INT NOT NULL,

    FullName NVARCHAR(100) NOT NULL,

    PhoneNumber VARCHAR(15) NOT NULL,

    AddressLine NVARCHAR(500) NOT NULL,

    City NVARCHAR(100) NOT NULL,

    State NVARCHAR(100) NOT NULL,

    Pincode VARCHAR(10) NOT NULL,

    AddressType VARCHAR(20) NULL,

    IsDefault BIT DEFAULT 0,

    CreatedAt DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Addresses_Users
        FOREIGN KEY(UserId)
        REFERENCES Users(UserId)
        ON DELETE CASCADE
);

select * from Addresses

update Addresses 
set AddressType='Office'
WHERE AddressId=1


--Get All Address by User
CREATE PROCEDURE sp_GetAddressByUserId
@UserId int
AS
BEGIN
SELECT * FROM Addresses
WHERE UserId = @UserId
ORDER BY IsDefault DESC;
END;


--Get Address by AddressId
CREATE PROCEDURE sp_GetAddressById
(
@AddressId int
)
AS
BEGIN
SELECT * FROM Addresses
WHERE AddressId = @AddressId;
END;


--ADD Address 
ALTER PROCEDURE sp_AddAddress
(
    @UserId INT,
    @FullName NVARCHAR(100),
    @PhoneNumber VARCHAR(15),
    @AddressLine NVARCHAR(500),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @Pincode VARCHAR(10),
    @AddressType VARCHAR(20)
)
AS
BEGIN

    DECLARE @IsDefault BIT = 0;

    IF NOT EXISTS
    (
        SELECT 1
        FROM Addresses
        WHERE UserId = @UserId
    )
    BEGIN
        SET @IsDefault = 1;
    END

    INSERT INTO Addresses
    (
        UserId,
        FullName,
        PhoneNumber,
        AddressLine,
        City,
        State,
        Pincode,
        AddressType,
        IsDefault
    )
    VALUES
    (
        @UserId,
        @FullName,
        @PhoneNumber,
        @AddressLine,
        @City,
        @State,
        @Pincode,
        @AddressType,
        @IsDefault
    );

    SELECT SCOPE_IDENTITY();

END

 --UPDATE Address
 CREATE PROCEDURE sp_UpdateAddress
 (
 @AddressId int,
 @FullName varchar(100),
@PhoneNumber varchar(10),
@AddressLine varchar(500),
@City varchar(100),
@State varchar(100),
@Pincode varchar(10),
@AddressType varchar(20)
)
AS
BEGIN
UPDATE Addresses
SET 
    FullName = @FullName,
	PhoneNumber = @PhoneNumber,
	AddressLine = @AddressLine,
	City = @City,
	State = @State,
	Pincode = @Pincode,
	AddressType = @AddressType
WHERE AddressId = @AddressId;
END

--DELETE Address
CREATE PROCEDURE sp_DeleteAddress
(
@AddressId int
)
AS
BEGIN
DELETE FROM Addresses
WHERE AddressId = @AddressId;
END;


UPDATE Addresses
SET IsDefault = 0
WHERE UserId = 2;

UPDATE Addresses
SET IsDefault = 1
WHERE AddressId = 1;

select * from Addresses





-- OrderShipping Table for store Users Address data
CREATE TABLE OrderShippingAddresses
(
    OrderShippingAddressId INT IDENTITY(1,1) PRIMARY KEY,

    OrderId INT NOT NULL UNIQUE,

    FullName NVARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,

    AddressType NVARCHAR(50) NULL,

    AddressLine NVARCHAR(255) NOT NULL,
    City NVARCHAR(100) NOT NULL,
    State NVARCHAR(100) NOT NULL,
    Pincode VARCHAR(10) NOT NULL,
    Country NVARCHAR(100) NOT NULL DEFAULT 'India',

    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_OrderShippingAddresses_Orders
        FOREIGN KEY (OrderId)
        REFERENCES Orders(OrderId)
        ON DELETE CASCADE
);

select * from Orders
select * from Addresses
select * from OrderShippingAddresses

-- PROCEDURE FOR ORDERADDRESSES

ALTER PROCEDURE sp_AddOrderShippingAddress
(
@OrderId int,
@AddressId int
)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO OrderShippingAddresses
(OrderId,
FullName,
PhoneNumber,
AddressType,
AddressLine,
City,
State,
Pincode)
SELECT
@OrderId,
FullName,
PhoneNumber,
AddressType,
AddressLine,
City,
State, 
Pincode
FROM Addresses
WHERE AddressId = @AddressId;
END;



--> PROCEDURE FOR GETADDRESS FROM ORDERS
ALTER PROCEDURE sp_GetOrderShippingAddress
(
    @OrderId INT
)
AS
BEGIN

    -- Snapshot Exists
    IF EXISTS(
        SELECT 1
        FROM OrderShippingAddresses
        WHERE OrderId = @OrderId
    )
    BEGIN

        SELECT
            FullName,
            PhoneNumber,
			AddressType,
            AddressLine,
            City,
            State,
            Pincode,
			Country,
            CAST(0 AS BIT) AS IsFallback
        FROM OrderShippingAddresses
        WHERE OrderId = @OrderId;

    END

    ELSE
    BEGIN

        SELECT TOP 1
            a.FullName,
            a.PhoneNumber,
			a.AddressType,
            a.AddressLine,
            a.City,
            a.State,
            a.Pincode,
			a.Country,
            CAST(1 AS BIT) AS IsFallback
        FROM Orders o
        INNER JOIN Addresses a
            ON a.UserId = o.UserId
        WHERE o.OrderId = @OrderId
          AND a.IsDefault = 1;

    END
END


exec sp_GetOrderShippingAddress 16088
exec sp_GetOrderShippingAddress 13078

SELECT * FROM Orders Order by OrderId desc


SELECT * FROM Products
SELECT * FROM Reviews


SELECT * FROM Products
WHERE isDeleted = 1

SELECT * FROM Reviews
WHERE isDeleted = 1


UPDATE Products
SET isDeleted = 0
WHERE isDeleted = 1

UPDATE Reviews
SET isDeleted = 0
WHERE isDeleted = 1