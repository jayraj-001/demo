select * from Users

delete from Users
where UserId > 2

select * from Reviews

delete from Reviews
where ReviewId > 1

select * from Products

select * from Products


INSERT INTO [dbo].[Products]
(Name, Description, Category, Price, Rating, Stock, Brand, Images, isDeleted)
VALUES
('iPhone 14', 'Latest Apple smartphone with A15 chip', 'Electronics', 79999.00, 4.50, 25, 'Apple', '/images/iphone14.png', 0),

('Samsung Galaxy S23', 'Flagship Samsung phone with great camera', 'Electronics', 74999.00, 4.30, 30, 'Samsung', '/images/s23.png', 0),

('Nike Air Max', 'Comfortable running shoes', 'Footwear', 5999.00, 4.20, 50, 'Nike', '/images/nike-airmax.png', 0),

('Adidas Sneakers', 'Stylish casual sneakers', 'Footwear', 4999.00, 4.10, 40, 'Adidas', '/images/adidas.png', 0),

('HP Laptop', '15-inch laptop with 8GB RAM', 'Electronics', 55000.00, 4.00, 15, 'HP', '/images/hp-laptop.png', 0),

('Dell Inspiron', 'Reliable laptop for daily use', 'Electronics', 60000.00, 4.20, 10, 'Dell', '/images/dell.png', 0),

('Boat Headphones', 'Wireless Bluetooth headphones', 'Accessories', 1999.00, 4.30, 100, 'Boat', '/images/boat.png', 0),

('Sony Headphones', 'Noise cancelling headphones', 'Accessories', 8999.00, 4.60, 20, 'Sony', '/images/sony.png', 0),

('Puma T-Shirt', 'Cotton casual t-shirt', 'Clothing', 999.00, 4.00, 60, 'Puma', '/images/puma.png', 0),

('Levis Jeans', 'Denim slim fit jeans', 'Clothing', 2499.00, 4.20, 35, 'Levis', '/images/levis.png', 0);



