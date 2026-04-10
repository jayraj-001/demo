--USERS SP

-- 1)GET ALL USERS THAT ARE NOT DELETED
--CREATE PROCEDURE GetUsers
--AS 
--BEGIN
--SELECT *
-- FROM Users
-- WHERE isDeleted = 0;
-- END

-- EXEC GetUsers



--2)GET SPECIFIC USER BY THEIR ID
--alter PROCEDURE GetUsersById
--@User_Id INT
--AS 
--BEGIN
--SELECT *
-- FROM Users
-- WHERE User_id = @User_Id AND isDeleted = 0;
-- END

-- EXEC GetUsersById 3


----3)CREATE USERS
--CREATE PROCEDURE AddUsers
--(
--@User_id INT,
--@Name varchar(100),
--@Email VARCHAR(100),
--@PhoneNumber VARCHAR(15),
--@DateOfBirth DATE,
--@Password VARCHAR(255)
--)
--AS
--BEGIN
--INSERT INTO Users
--(Name,Email, PhoneNumber,DateOfBirth,Password)
--VALUES
--(@Name,@Email,@PhoneNumber,@DateOfBirth,@Password);
--END;




----4) UPDATE USERS
--CREATE PROCEDURE UpdateUsers
--(
--@User_id INT,
--@Name VARCHAR(100),
--@Email VARCHAR(100),
--@PhoneNumber VARCHAR(15),
--@DateOfBirth DATE,
--@Password VARCHAR(255)
--)
--AS 
--BEGIN
--Update Users
-- SET
-- Name=@Name,
-- Email = @Email,
-- PhoneNumber=@PhoneNumber,
-- DateOfBirth=@DateOfBirth,
-- Password=@Password
-- WHERE User_id= @User_id
-- AND isDeleted = 0;
--END;





---- 5) DELETE USER(SOFT DELETE)
--CREATE PROCEDURE DeleteUser
--@User_Id INT 
--AS 
--BEGIN 
--SELECT *
-- FROM Users AS U
-- UPDATE Users
-- SET isDeleted = 1
-- WHERE User_id = @User_Id;
-- END

-- EXEC DeleteUser 1



----PRODUCTS SP
--6) GET ALL PRODUCTS

--CREATE PROCEDURE GetAllProducts
--AS
--BEGIN
--SELECT 
--P.ID,
--P.Title,
--P.Description,
--P.Category,
--P.Price,
--P.Rating,
--P.Stock,
--P.Brand,
--P.Images,
--P.User_Id
-- FROM Products AS P
-- WHERE P.isDeleted=0;
-- END

-- EXEC GetAllProducts



----7) GET PRODUCTSBYID
--ALTER PROCEDURE GetProductsById
--@ID int
--AS
--BEGIN
--SELECT 
--P.ID,
--P.Title,
--P.Description,
--P.Category,
--P.Price,
--P.Rating,
--P.Stock,
--P.Brand,
--P.Images,
--P.User_Id
-- FROM Products AS P
-- WHERE ID = @ID
-- AND P.isDeleted = 0;
-- END

-- EXEC GetProductsById 6


----8) GET PRODUCTS BY SPECIFIC USER
--CREATE PROCEDURE GetProductsByUser
--@User_Id INT
--AS
--BEGIN
--SELECT 
--P.ID,
--P.Title,
--P.Description,
--P.Category,
--P.Price,
--P.Rating,
--P.Stock,
--P.Brand,
--P.Images,
--P.User_Id
-- FROM Products AS P
-- WHERE User_Id = @User_Id
-- AND P.isDeleted = 0;
-- END

-- EXEC GetProductsByUser 1


----9) ADD PRODUCTS

--CREATE PROCEDURE AddProducts
--(
--@Title varchar(100),
--@Description varchar(255),
--@Category varchar(50),
--@Price decimal(10,2),
--@Rating decimal(3,2),
--@Stock int,
--@Brand varchar(50),
--@Images varchar(255),
--@User_Id int 
--)
--AS 
--BEGIN
--INSERT INTO Products
--(Title,Description,Category,Price,Rating,Stock,Brand,Images,User_Id)
--VALUES
--(@Title,@Description,@Category,@Price,@Rating,@Stock,@Brand,@Images,@User_Id)
--END;


-- 10) UPDATE SPECIFIC PRODUCTS

--CREATE PROCEDURE UpdateProducts
--(
--@ID INT,
--@Title VARCHAR(50),
--@Description VARCHAR(255),
--@Category VARCHAR(50),
--@Price DECIMAL(10,2),
--@Rating DECIMAL(3,2),
--@Stock INT,
--@Brand VARCHAR(50),
--@Images VARCHAR(255),
--@User_Id INT
--)
--AS 
--BEGIN
--UPDATE Products
--SET 
--Title = @Title,
--Description=@Description,
--Category=@Category,
--Price=@Price,
--Rating=@Rating,
--Stock=@Stock,
--Brand=@Brand,
--Images=@Images,
--User_Id=@User_Id
--WHERE ID = @ID
--AND isDeleted = 0;
--END;



----11) DELETE PRODUCTS(SOFT)
--ALTER PROCEDURE DeleteProducts
--@ID INT
--AS 
--BEGIN
--UPDATE Products
--SET isDeleted = 1
--WHERE ID = @ID
--END;

--EXEC DeleteProducts 1


--CART SP

----12) GET ALL CART(ADMIN)

--alter PROCEDURE GetAllCarts
--AS
--BEGIN
--SELECT C.cart_id,
--C.User_Id,
--C.Images,
--C.Title,
--C.Price,
--C.Quantity,
--C.P_ID,
--(C.Quantity * C.Price) AS Total,
--sum(c.Quantity * C.Price) OVER() as GrandTotal
-- FROM Carts AS C
-- WHERE C.isDeleted = 0;
-- END;

-- EXEC GetAllCarts



-- 13) GET SPECIFIC USER_ID

--CREATE PROCEDURE GetUserCartById
--@User_Id INT
--AS
--BEGIN
--SELECT 
--C.cart_id,
--C.User_Id,
--C.Images,
--C.Title,
--C.Price,
--C.Quantity,
--(C.Quantity * C.Price) AS Total,
--sum(c.Quantity * C.Price) OVER() as GrandTotal
--FROM Carts AS C
--WHERE C.User_Id = @User_Id
--AND isDeleted = 0;
--END

--exec GetUserCartById 1



--14) ADD TO CART
--alter PROCEDURE AddToCarts
--(
--@User_Id int,
--@P_ID int,
--@Images varchar(255),
--@Title varchar(100),
--@Price decimal(10,2),
--@Quantity int
--)
--AS
--BEGIN

--IF EXISTS (
--SELECT 1 FROM Carts
--WHERE User_Id = @User_Id AND P_ID = @P_ID AND isDeleted=0
--)
--BEGIN
--UPDATE Carts
--SET Quantity = Quantity + @Quantity
--WHERE User_Id = @User_Id AND P_ID = @P_ID AND isDeleted = 0;
--END 

--ELSE
--BEGIN
--INSERT INTO Carts
--(User_Id,P_ID,Images,Title,Price,Quantity)
--VALUES
--(@User_Id,@P_ID,@Images,@Title,@Price,@Quantity)
--END
--END;



----15) UPDATE CARTS

--CREATE PROCEDURE UpdateCart
--(
--@User_Id int,
--@P_id int,
--@Quantity int
--)
--AS 
--BEGIN

--IF @Quantity <= 0
--BEGIN
--	UPDATE Carts
--	SET isDeleted=1
--	WHERE User_Id = @User_Id AND P_ID = @P_id AND isDeleted = 0;
--	RETURN
--	END;

--UPDATE Carts 
--SET Quantity = @Quantity
--WHERE User_Id = @User_Id
--AND P_ID = @P_id
--AND isDeleted = 0;
--END;



----16) DELETE CART
--ALTER PROCEDURE DeleteCart
--@User_id int,
--@P_ID int
--AS
--BEGIN

--IF NOT EXISTS (
--SELECT 1 FROM Carts
--WHERE User_Id = @User_id 
--AND P_ID = @P_ID
--AND isDeleted = 0)
--RETURN;

--UPDATE Carts
--SET isDeleted = 1
--WHERE P_ID = @P_ID AND User_Id = @User_id
--AND isDeleted = 0;
--END;

 


--Wishlist SP
-- 17) USER specific GetById WL

--CREATE PROCEDURE GetWishListByUser
--@U_ID int
--AS
--BEGIN
--SELECT W.W_id,
--W.U_ID,
--W.P_ID,
--W.Images,
--W.Title,
--W.Price
--FROM Wishlist AS W
--WHERE W.U_ID = @U_ID  AND W.isDeleted = 0;
--END;

--EXEC GetWishListByUser 1



---- 18) CREATE WISHLIST

--CREATE PROCEDURE AddWishlist
--(
--@U_ID INT,
--@P_ID INT,
--@Images VARCHAR(255),
--@Title VARCHAR(100),
--@Price DECIMAL(10,2)
--)
--AS
--BEGIN
--INSERT INTO Wishlist
--(U_ID,P_ID,Images,Title,Price)
--VALUES
--(@U_ID,@P_ID,@Images,@Title,@Price)
--END;


--19) DELETE WISHLIST
--CREATE PROCEDURE DeleteWishList
--@U_ID int,
--@P_ID int
--AS
--BEGIN

--IF NOT EXISTS (
--SELECT 1 FROM Wishlist 
--WHERE U_ID = @U_ID AND P_ID = @P_ID AND isDeleted = 0)
--RETURN;

--UPDATE Wishlist
--SET isDeleted = 1
--WHERE U_ID = @U_ID AND P_ID = @P_ID AND isDeleted = 0
--END;


SELECT * FROM Users
SELECT * FROM Products
SELECT * FROM Carts
SELECT * FROM Wishlist