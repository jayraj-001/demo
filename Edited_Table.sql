ALTER TABLE Users Add  Address varchar(100);

ALTER TABLE Users Drop CONSTRAINT DF__Users__DateOfBir__267ABA7A

ALTER TABLE Products Drop CONSTRAINT fk_products

ALTER TABLE Users DROP COLUMN DateOfBirth

ALTER TABLE Products DROP COLUMN User_Id

ALTER TABLE Products
ALTER COLUMN Price NUMERIC(18,2)

EXEC sp_rename 'GetAllProducts', 'sp_GetAllProducts'

EXEC sp_rename 'GetProductsById', 'sp_GetProductsById'

EXEC sp_rename 'AddProducts', 'sp_AddProducts'

EXEC sp_rename 'UpdateProducts', 'sp_UpdateProducts'

EXEC sp_rename 'DeleteProducts', 'sp_DeleteProducts'

UPDATE Products set isDeleted = 0
where ID> 1000

select * from Products

SELECT * FROM Products WHERE Id = 1

select * from Users

select * from Products





CREATE TABLE [dbo].[Users]
(
    [UserId] INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL UNIQUE,
    [Password] NVARCHAR(255) NOT NULL,
    [Role] NVARCHAR(20) NOT NULL DEFAULT 'User',

    [IsDeleted] BIT NOT NULL DEFAULT 0,
    [IsOtpVerified] BIT NOT NULL DEFAULT 0,

    [OtpAttempts] INT NOT NULL DEFAULT 0,
    [LoginAttempts] INT NOT NULL DEFAULT 0,

    [RefreshToken] NVARCHAR(200) NULL,
    [RefreshTokenExpiry] DATETIME NULL,

    [LockoutEnd] DATETIME NULL,
    [LastOtpSent] DATETIME NULL,

    [PhoneNumber] NVARCHAR(15) NULL,
    [Address] NVARCHAR(255) NULL,

    [OtpCode] NVARCHAR(10) NULL,
    [OtpExpiry] DATETIME NULL
)


select * from Users

delete from Users where UserId > 0









CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](255) NULL,
	[Category] [varchar](50) NULL,
	[Price] [numeric](18, 2) NULL,
	[Rating] [decimal](3, 2) NULL,
	[Stock] [int] NULL,
	[Brand] [varchar](100) NULL,
	[Images] [varchar](255) NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [isDeleted]
GO


ALTER PROCEDURE [dbo].[sp_AddProducts]
(
@Name varchar(100),
@Description varchar(255),
@Category varchar(50),
@Price decimal(10,2),
@Rating decimal(3,2),
@Stock int,
@Brand varchar(50),
@Images varchar(255)
)
AS 
BEGIN
INSERT INTO Products
(Name,Description,Category,Price,Rating,Stock,Brand,Images)
VALUES
(@Name,@Description,@Category,@Price,@Rating,@Stock,@Brand,@Images)
END;




ALTER PROCEDURE [dbo].[sp_DeleteProducts]
@ID INT
AS 
BEGIN
UPDATE Products
SET isDeleted = 1
WHERE ID = @ID
END;


ALTER PROCEDURE [dbo].[sp_GetAllProducts]
AS
BEGIN
SELECT 
P.ID,
P.Name,
P.Description,
P.Category,
P.Price,
P.Rating,
P.Stock,
P.Brand,
P.Images
 FROM Products AS P
 WHERE P.isDeleted=0;
 END


 ALTER PROCEDURE [dbo].[sp_GetProductsById]
@ID int
AS
BEGIN
SELECT 
P.ID,
P.Name,
P.Description,
P.Category,
P.Price,
P.Rating,
P.Stock,
P.Brand,
P.Images
 FROM Products AS P
 WHERE ID = @ID
 AND P.isDeleted = 0;
 END


 ALTER PROCEDURE [dbo].[sp_UpdateProducts]
(
@ID INT,
@Name VARCHAR(50),
@Description VARCHAR(255),
@Category VARCHAR(50),
@Price DECIMAL(10,2),
@Rating DECIMAL(3,2),
@Stock INT,
@Brand VARCHAR(50),
@Images VARCHAR(255)
)
AS 
BEGIN
UPDATE Products
SET 
Name = @Name,
Description=@Description,
Category=@Category,
Price=@Price,
Rating=@Rating,
Stock=@Stock,
Brand=@Brand,
Images = ISNULL(@Images, Images)
WHERE ID = @ID
AND isDeleted = 0;
END;






