CREATE TABLE Orders (
    OrderId INT IDENTITY PRIMARY KEY,

    UserId INT NOT NULL,

    TotalAmount DECIMAL(10,2) NOT NULL,

    Status VARCHAR(30) NOT NULL DEFAULT 'Pending',
    PaymentStatus VARCHAR(20) NOT NULL DEFAULT 'Pending',

    CreatedAt DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Orders_User
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
        ON DELETE NO ACTION  
);



CREATE TABLE OrderItems (
    OrderItemId INT IDENTITY PRIMARY KEY,

    OrderId INT NOT NULL,
    ProductId INT NOT NULL,

    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_OrderItems_Order
        FOREIGN KEY (OrderId)
        REFERENCES Orders(OrderId)
        ON DELETE CASCADE,

    CONSTRAINT FK_OrderItems_Product
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId)
        ON DELETE NO ACTION
);




select * from Payments

CREATE TABLE Payments (
    Payment_Id INT IDENTITY(1,1) PRIMARY KEY,

    OrderId INT NOT NULL,
    UserId INT NOT NULL,

    Amount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL,         -- Success/Failed/Pending
    PaymentMethod VARCHAR(50) NOT NULL, -- Mock/Razorpay/Stripe
    TransactionId NVARCHAR(100) NULL,

    Created_At DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Payments_Order
        FOREIGN KEY (OrderId)
        REFERENCES Orders(OrderId)
        ON DELETE NO ACTION
);




CREATE PROCEDURE sp_SavePayment
    @OrderId INT,
    @UserId INT,
    @Amount DECIMAL(10,2),
    @Status VARCHAR(20),
    @PaymentMethod VARCHAR(50),
    @TransactionId NVARCHAR(100)
AS
BEGIN
    INSERT INTO Payments (
        OrderId,
        UserId,
        Amount,
        Status,
        PaymentMethod,
        TransactionId
    )
    VALUES (
        @OrderId,
        @UserId,
        @Amount,
        @Status,
        @PaymentMethod,
        @TransactionId
    );
END



CREATE PROCEDURE sp_UpdateOrderPayment
    @OrderId INT,
    @PaymentStatus VARCHAR(20),
    @OrderStatus VARCHAR(30)
AS
BEGIN
    UPDATE Orders
    SET 
        PaymentStatus = @PaymentStatus,
        Status = @OrderStatus
    WHERE OrderId = @OrderId
END


CREATE PROCEDURE sp_CreateOrder
    @UserId INT,
    @TotalAmount DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Orders (UserId, TotalAmount)
    VALUES (@UserId, @TotalAmount)

    SELECT SCOPE_IDENTITY()
END


CREATE PROCEDURE sp_AddOrderItem
    @OrderId INT,
    @ProductId INT,
    @Quantity INT,
    @Price DECIMAL(10,2)
AS
BEGIN
    INSERT INTO OrderItems (OrderId, ProductId, Quantity, Price)
    VALUES (@OrderId, @ProductId, @Quantity, @Price)
END




select * from Orders
select * from Payments
select * from OrderItems

INSERT INTO Orders(UserId,TotalAmount)
VALUES
(2,135067)





CREATE PROCEDURE [dbo].[sp_ReduceStock]
    @OrderId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- ✅ Check stock availability
        IF EXISTS (
            SELECT 1
            FROM Products p
            INNER JOIN OrderItems oi ON p.ProductId = oi.ProductId
            WHERE oi.OrderId = @OrderId
              AND p.Stock < oi.Quantity
        )
        BEGIN
            RAISERROR('Insufficient stock for one or more products', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- ✅ Reduce stock
        UPDATE p
        SET p.Stock = p.Stock - oi.Quantity
        FROM Products p
        INNER JOIN OrderItems oi ON p.ProductId = oi.ProductId
        WHERE oi.OrderId = @OrderId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- 🔥 Handle error safely
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END





CREATE PROCEDURE [dbo].[sp_RemovePurchasedItems]
    @UserId INT,
    @OrderId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE c
    FROM Carts c
    INNER JOIN OrderItems oi 
        ON c.Product_Id = oi.ProductId
    WHERE c.User_Id = @UserId
      AND oi.OrderId = @OrderId;
END




CREATE PROCEDURE [dbo].[sp_GetInvoiceByOrderId]
    @OrderId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        o.OrderId,
        u.Name,
		u.Address,
        u.Email,
        o.TotalAmount,
        o.CreatedAt,
        o.PaymentStatus
    FROM Orders o
    INNER JOIN Users u ON o.UserId = u.UserId
    WHERE o.OrderId = @OrderId;


    SELECT
        p.Name,
        oi.Quantity,
        oi.Price,
        (oi.Quantity * oi.Price) AS SubTotal
    FROM OrderItems oi
    INNER JOIN Products p ON oi.ProductId = p.ProductId
    WHERE oi.OrderId = @OrderId;
END
