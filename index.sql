--Indexes

-- Search by Product Name
CREATE INDEX IX_Products_Name
ON Products(Name);

-- Filter by Category
CREATE INDEX IX_Products_Category
ON Products(Category);

-- Filter by Price
CREATE INDEX IX_Products_Price
ON Products(Price);

-- Filter by Rating
CREATE INDEX IX_Products_Rating
ON Products(Rating);

-- Search + Filter Combined
CREATE INDEX IX_Products_Category_Price_Rating
ON Products(Category, Price, Rating);

-- Brand Search
CREATE INDEX IX_Products_Brand
ON Products(Brand);



-- Login Email
CREATE UNIQUE INDEX IX_Users_Email
ON Users(Email);

-- Username Search
CREATE INDEX IX_Users_Username
ON Users(Name);



-- User Cart Fetch
CREATE INDEX IX_Cart_UserId
ON Carts(User_Id);

-- Product Lookup in Cart
CREATE INDEX IX_Cart_ProductId
ON Carts(Product_Id);

-- Combined Query
CREATE INDEX IX_Cart_User_Product
ON Carts(User_Id, Product_Id);


-- Orders by User
CREATE INDEX IX_Orders_UserId
ON Orders(UserId);

-- Order Status
CREATE INDEX IX_Orders_Status
ON Orders(Status);

-- Payment Status
CREATE INDEX IX_Orders_PaymentStatus
ON Orders(PaymentStatus);

-- Order Date
CREATE INDEX IX_Orders_CreatedAt
ON Orders(CreatedAt);




-- Fetch Order Items
CREATE INDEX IX_OrderItems_OrderId
ON OrderItems(OrderId);

-- Product in Orders
CREATE INDEX IX_OrderItems_ProductId
ON OrderItems(ProductId);

-- Combined
CREATE INDEX IX_OrderItems_Order_Product
ON OrderItems(OrderId, ProductId);



CREATE INDEX IX_Reviews_ProductId
ON Reviews(ProductId);

CREATE INDEX IX_Reviews_UserId
ON Reviews(UserId);

CREATE INDEX IX_Reviews_Rating
ON Reviews(Rating);



select * from Wishlists

CREATE INDEX IX_Wishlist_UserId
ON Wishlists(UserId);

CREATE INDEX IX_Wishlist_ProductId
ON Wishlists(ProductId);






-- Find payment by Order
CREATE INDEX IX_Payments_OrderId
ON Payments(OrderId);

-- Find user payment history
CREATE INDEX IX_Payments_UserId
ON Payments(UserId);

-- Filter by payment status
CREATE INDEX IX_Payments_Status
ON Payments(Status);

-- Unique transaction id
CREATE UNIQUE INDEX IX_Payments_TransactionId
ON Payments(TransactionId);

-- Sort/filter by payment date
CREATE INDEX IX_Payments_CreatedAt
ON Payments(Created_At);

-- Combined index for dashboard queries
CREATE INDEX IX_Payments_User_Status
ON Payments(UserId, Status);






