select * from Users;
select * from Products;
select * from Carts

select * from Carts where User_Id=2

update Products
set isDeleted = 0
where isDeleted = 1

EXEC sp_rename 'Products.ID', 'ProductId'

EXEC sp_rename 'Cart' ,'Carts'


CREATE TABLE Cart (
    Cart_Id INT IDENTITY(1,1) PRIMARY KEY,
    User_Id INT NOT NULL,
    Product_Id INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    Created_At DATETIME DEFAULT GETDATE(),
    Updated_At DATETIME NULL,

    CONSTRAINT FK_Cart_User FOREIGN KEY (User_Id)
        REFERENCES Users(UserId)
        ON DELETE CASCADE,

    CONSTRAINT FK_Cart_Product FOREIGN KEY (Product_Id)
        REFERENCES Products(ProductId)
        ON DELETE CASCADE,
);

ALTER TABLE Cart
ADD CONSTRAINT UQ_User_Product UNIQUE (User_Id, Product_Id)



CREATE PROCEDURE sp_GetCartById
@UserId int
AS
BEGIN
SELECT 
C.Product_Id,
P.Name,
P.Price,
C.Quantity
FROM Cart AS C
INNER JOIN Products AS P
ON C.Product_Id=P.ProductId
WHERE C.User_Id=@UserId;
END;

exec sp_GetCartById 1


CREATE PROCEDURE sp_RemoveCartById
@UserId int,
@ProductId int
AS
BEGIN
DELETE FROM Cart 
WHERE User_Id = @UserId AND Product_Id = @ProductId
END;


exec sp_RemoveCartById 11,1


CREATE PROCEDURE sp_UpdateCartQty
@UserId int,
@ProductId int,
@Qty int
AS
BEGIN
UPDATE Cart
SET Quantity = @Qty
WHERE User_Id=@UserId AND Product_Id=@ProductId;
END;

exec sp_UpdateCartQty 1,12,3