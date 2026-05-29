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
CREATE PROCEDURE sp_AddAddress
(
@UserId int,
@FullName varchar(100),
@PhoneNumber varchar(10),
@AddressLine varchar(500),
@City varchar(100),
@State varchar(100),
@Pincode varchar(10),
@AddressType varchar(20),
@IsDefault BIT
)
AS
 BEGIN
 INSERT INTO Addresses
 (UserId,FullName,PhoneNumber,AddressLine,City,State,Pincode,AddressType,IsDefault)
 VALUES 
 (@UserId,@FullName,@PhoneNumber,@AddressLine,@City,@State,@Pincode,@AddressLine, @IsDefault);
 END;


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