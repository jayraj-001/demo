1) Product table
USE [ecomDB]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 4/20/2026 05:51:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NULL,
	[Category] [varchar](50) NULL,
	[Price] [numeric](18, 2) NULL,
	[Rating] [decimal](3, 2) NULL,
	[Stock] [int] NULL,
	[Brand] [varchar](100) NULL,
	[Images] [varchar](255) NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [isDeleted]
GO



2)Carts table
USE [ecomDB]
GO

/****** Object:  Table [dbo].[Carts]    Script Date: 4/20/2026 05:52:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Carts](
	[Cart_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Created_At] [datetime] NULL,
	[Updated_At] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cart_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_User_Product] UNIQUE NONCLUSTERED 
(
	[User_Id] ASC,
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Carts] ADD  DEFAULT ((1)) FOR [Quantity]
GO

ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [Created_At]
GO

ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Cart_Product]
GO

ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Cart_User]
GO



3)Reviews table
USE [ecomDB]
GO

/****** Object:  Table [dbo].[Reviews]    Script Date: 4/20/2026 05:52:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Rating] [decimal](3, 2) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO

ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((0)) FOR [isDeleted]
GO

ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO

ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO



4) Users Table
USE [ecomDB]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 4/20/2026 05:53:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsOtpVerified] [bit] NOT NULL,
	[OtpAttempts] [int] NOT NULL,
	[LoginAttempts] [int] NOT NULL,
	[RefreshToken] [nvarchar](200) NULL,
	[RefreshTokenExpiry] [datetime] NULL,
	[LockoutEnd] [datetime] NULL,
	[LastOtpSent] [datetime] NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Address] [nvarchar](255) NULL,
	[OtpCode] [nvarchar](10) NULL,
	[OtpExpiry] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT ('User') FOR [Role]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsOtpVerified]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [OtpAttempts]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [LoginAttempts]
GO





-- SP
1)ALTER PROCEDURE [dbo].[sp_AddProducts]
(
@Name varchar(100),
@Description varchar(255),
@Category varchar(50),
@Price decimal(10,2),
@Stock int,
@Brand varchar(50),
@Images varchar(255)
)
AS 
BEGIN
INSERT INTO Products
(Name,Description,Category,Price,Rating,Stock,Brand,Images)
VALUES
(@Name,@Description,@Category,@Price,0,@Stock,@Brand,@Images)
END;


2)
ALTER PROCEDURE [dbo].[sp_AddReview]
    @ProductId INT,
    @UserId INT,
    @Rating DECIMAL(3,2),
    @Comment NVARCHAR(MAX)
AS
BEGIN
IF EXISTS ( SELECT 1 FROM Reviews WHERE UserId = @UserId AND ProductId=@ProductId AND isDeleted = 0)
BEGIN
UPDATE Reviews
SET Rating = @Rating,
Comment = @Comment,
CreatedAt = GETDATE()
WHERE UserId=@UserId AND ProductId=@ProductId AND isDeleted = 0;

SELECT 'Review UPdated' AS MESSAGE;
END
ELSE
BEGIN
    INSERT INTO Reviews(ProductId, UserId, Rating, Comment,CreatedAt)
    VALUES (@ProductId, @UserId, @Rating, @Comment,GETDATE());

	SELECT 'Review Added' AS MESSAGE;
	END

	UPDATE Products
	SET Rating = (	
	SELECT ROUND(ISNULL(AVG(Rating), 0),2)
	FROM Reviews
	WHERE ProductId = @ProductId
	AND isDeleted = 0
	)
	WHERE ProductId = @ProductId
	AND isDeleted = 0
END


3)
ALTER PROCEDURE [dbo].[sp_DeleteProducts]
@ProductId INT
AS 
BEGIN

IF EXISTS(SELECT 1 FROM Products WHERE ProductId = @ProductId AND isDeleted=0)
BEGIN
UPDATE Products
SET isDeleted = 1
WHERE ProductId = @ProductId AND isDeleted = 0

UPDATE Reviews
SET isDeleted = 1
WHERE ProductId = @ProductId AND isDeleted = 0
END

ELSE
BEGIN
SELECT 'Product Not found' AS Message
END
END


4)
ALTER PROCEDURE [dbo].[sp_DeleteReview]
@UserId int,
@ProductId int
AS
BEGIN
UPDATE Reviews
SET isDeleted = 1
WHERE UserId = @UserId AND ProductId= @ProductId AND isDeleted = 0;

UPDATE Products
SET Rating = (
    SELECT ROUND(ISNULL(AVG(Rating),0),2)
    FROM Reviews
    WHERE ProductId = @ProductId
	AND isDeleted = 0
)
WHERE ProductId = @ProductId
AND isDeleted = 0;
END


5)
ALTER PROCEDURE [dbo].[sp_GetAllProducts]
AS
BEGIN
SELECT 
P.ProductId,
P.Name,
P.Description,
P.Category,
P.Price,
 ISNULL(P.Rating, 0) AS Rating,
P.Stock,
P.Brand,
P.Images,

    (
        SELECT COUNT(*)
        FROM Reviews R
        WHERE R.ProductId = P.ProductId
        AND R.isDeleted = 0
    ) AS TotalReviews
 FROM Products AS P
 WHERE P.isDeleted=0;
 END


 6)
 ALTER PROCEDURE [dbo].[sp_GetCartById]
@UserId int
AS
BEGIN
SELECT 
C.Product_Id,
P.Name,
P.Price,
C.Quantity,
P.Images
FROM Carts AS C
INNER JOIN Products AS P
ON C.Product_Id=P.ProductId
WHERE C.User_Id=@UserId
AND P.isDeleted = 0;
END;


7)
ALTER PROCEDURE [dbo].[sp_GetReviewsByProductId]
    @ProductId INT
AS
BEGIN
    SELECT 
        r.Rating,
        r.Comment,
        r.CreatedAt,
        u.Name AS UserName,
		r.UserId
    FROM Reviews r
    JOIN Users u ON r.UserId = u.UserId
    WHERE r.ProductId = @ProductId
	AND r.isDeleted=0
    ORDER BY r.CreatedAt DESC
END


8)
ALTER PROCEDURE [dbo].[sp_RemoveCartById]
@UserId int,
@ProductId int
AS
BEGIN
DELETE FROM Carts 
WHERE User_Id = @UserId AND Product_Id = @ProductId
END;



9)
ALTER PROCEDURE [dbo].[sp_UpdateCartQty]
@UserId int,
@ProductId int,
@Quantity int
AS
BEGIN
UPDATE Carts
SET Quantity = @Quantity
WHERE User_Id=@UserId AND Product_Id=@ProductId;
END;


10)
ALTER PROCEDURE [dbo].[sp_UpdateProducts]
(
@ProductId INT,
@Name VARCHAR(50),
@Description VARCHAR(255),
@Category VARCHAR(50),
@Price DECIMAL(10,2),
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
Stock=@Stock,
Brand=@Brand,
Images = ISNULL(@Images, Images)
WHERE ProductId = @ProductId
AND isDeleted = 0;
END;


11)
ALTER PROCEDURE [dbo].[sp_UpdateReview]
@UserId int,
@ProductId int,
@Rating DECIMAL(3,2),
@Comment nvarchar(max)
as
begin
UPDATE Reviews
SET
Rating = @Rating,
Comment = @Comment,
CreatedAt = GETDATE()
WHERE UserId = @UserId AND ProductId = @ProductId AND isDeleted=0;

UPDATE Products
SET Rating = (
SELECT ROUND(ISNULL(AVG(Rating),0),2)
FROM Reviews WHERE ProductId = @ProductId
AND isDeleted = 0 )
WHERE ProductId = @ProductId
AND isDeleted = 0 ;
END


12)
ALTER PROCEDURE [dbo].[sp_GetProductsById]
@ProductId int
AS
BEGIN
SELECT 
P.ProductId,
P.Name,
P.Description,
P.Category,
P.Price,
 ISNULL(P.Rating, 0) AS Rating,
P.Stock,
P.Brand,
P.Images,
    (
        SELECT COUNT(*)
        FROM Reviews R
        WHERE R.ProductId = P.ProductId
        AND R.isDeleted = 0
    ) AS TotalReviews
 FROM Products AS P
 WHERE ProductId = @ProductId
 AND P.isDeleted = 0;
 END



 ALTER TABLE Reviews
ALTER COLUMN Rating DECIMAL(3,2) NOT NULL

ALTER TABLE Reviews
DROP CONSTRAINT CK__Reviews__Rating__02FC7413;

UPDATE Reviews
SET isDeleted = 0
WHERE ReviewId < 3030

ALTER TABLE Reviews
ADD isDeleted BIT DEFAULT 0;





select * from Products
select * from Users
select * from Carts
select * from Reviews



CREATE TABLE Wishlists (
    WishlistId INT IDENTITY(1,1) PRIMARY KEY,

    UserId INT NOT NULL,
    ProductId INT NOT NULL,

    Created_At DATETIME NOT NULL DEFAULT GETDATE(),

    -- 🔗 Foreign Keys
    CONSTRAINT FK_Wishlist_User 
        FOREIGN KEY (UserId) REFERENCES Users(UserId)
        ON DELETE CASCADE,

    CONSTRAINT FK_Wishlist_Product 
        FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
        ON DELETE CASCADE,

    -- 🚫 Prevent duplicate wishlist items
    CONSTRAINT UQ_User_Product_Wishlist 
        UNIQUE (UserId, ProductId)
);




CREATE PROCEDURE sp_AddToWishlist
    @UserId INT,
    @ProductId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent duplicate
    IF NOT EXISTS (
        SELECT 1 FROM Wishlists 
        WHERE UserId = @UserId AND ProductId = @ProductId
    )
    BEGIN
        INSERT INTO Wishlists (UserId, ProductId)
        VALUES (@UserId, @ProductId);
    END
END


CREATE PROCEDURE sp_RemoveFromWishlist
    @UserId INT,
    @ProductId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Wishlists
    WHERE UserId = @UserId AND ProductId = @ProductId;
END




CREATE PROCEDURE sp_GetWishlistByUser
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        w.WishlistId,
        p.ProductId,
        p.Name,
        p.Price,
        p.Images
    FROM Wishlists w
    INNER JOIN Products p ON w.ProductId = p.ProductId
    WHERE w.UserId = @UserId
    ORDER BY w.Created_At DESC;
END

exec sp_GetWishlistByUser 2


select * from Orders

CREATE PROCEDURE [dbo].[sp_GetOrdersByUser]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        o.OrderId,
        o.TotalAmount,
        o.PaymentStatus,
        o.Status,
        o.CreatedAt
    FROM Orders o
    WHERE o.UserId = @UserId
    ORDER BY o.CreatedAt DESC;
END