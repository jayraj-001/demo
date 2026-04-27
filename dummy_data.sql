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



ALTER TABLE Products
ALTER COLUMN Description VARCHAR(MAX);




UPDATE Products
SET Description = 'The iPhone 14 is a premium smartphone designed for performance, durability, and user experience. It features a powerful A15 Bionic chip that ensures smooth multitasking, fast app loading, and efficient power usage. The device comes with a stunning Super Retina display that delivers vibrant colors and sharp visuals, making it perfect for streaming videos, gaming, and browsing. Its advanced dual-camera system allows users to capture high-quality photos and videos even in low light conditions. With improved battery life, the iPhone 14 supports all-day usage without frequent charging. It also includes enhanced safety features such as crash detection and emergency SOS. Built with high-quality materials, it offers excellent durability and a premium feel. This smartphone is ideal for users who want reliability, performance, and a seamless ecosystem experience.'
WHERE Name = 'iPhone 14';


UPDATE Products
SET Description = 'The Samsung Galaxy S23 is a flagship smartphone that combines powerful performance with innovative features. It is equipped with a high-performance processor that ensures smooth operation for gaming, multitasking, and daily usage. The device features a stunning AMOLED display that provides vibrant colors and excellent clarity, enhancing the viewing experience. Its advanced camera system allows users to capture professional-quality photos and videos, even in challenging lighting conditions. The phone also offers excellent battery life, ensuring long hours of uninterrupted usage. With its sleek design and premium build quality, it feels comfortable to hold and use. Additional features like fast charging, wireless charging, and enhanced security make it a reliable choice. The Galaxy S23 is perfect for users who want a balance of performance, style, and advanced technology in a smartphone.'
WHERE Name = 'Samsung Galaxy S23';


UPDATE Products
SET Description = 'Nike Air Max shoes are designed to provide exceptional comfort, support, and style for everyday wear and athletic activities. These shoes feature advanced cushioning technology that absorbs impact and reduces stress on the feet, making them ideal for long hours of use. The breathable upper material ensures proper airflow, keeping your feet cool and dry throughout the day. With a durable sole and excellent grip, they offer stability on various surfaces. The modern design and stylish look make them suitable for both sports and casual outfits. Whether you are running, walking, or simply going out, Nike Air Max shoes deliver a perfect combination of performance and fashion. Their lightweight construction enhances mobility, while the premium materials ensure long-lasting durability. These shoes are a great choice for anyone seeking comfort, quality, and style.'
WHERE Name = 'Nike Air Max';


UPDATE Products
SET Description = 'Adidas Sneakers are known for their comfort, durability, and stylish design, making them a popular choice for everyday wear. These sneakers are crafted using high-quality materials that provide long-lasting performance and reliability. The cushioned sole offers excellent support, reducing strain on your feet during extended use. Their lightweight construction ensures ease of movement, making them suitable for walking, running, or casual outings. The breathable fabric helps maintain proper ventilation, keeping your feet fresh and comfortable. With a sleek and modern appearance, Adidas sneakers can easily complement various outfits. They are designed to deliver both functionality and fashion, making them ideal for people who value comfort and style. Whether for daily activities or light sports, these sneakers provide a dependable and comfortable experience.'
WHERE Name = 'Adidas Sneakers';


UPDATE Products
SET Description = 'The HP Laptop is a reliable and efficient device designed for both personal and professional use. It features a powerful processor and sufficient RAM to handle everyday tasks such as browsing, document editing, and multimedia consumption. The 15-inch display provides clear and vibrant visuals, making it suitable for work and entertainment. Its durable build quality ensures long-term usability, while the lightweight design makes it easy to carry. The laptop offers multiple connectivity options, including USB ports, HDMI, and wireless connectivity for seamless integration with other devices. With a long-lasting battery, users can work or study without frequent interruptions. It also includes essential security features to protect your data. The HP Laptop is an excellent choice for students, professionals, and anyone looking for a dependable computing device.'
WHERE Name = 'HP Laptop';


UPDATE Products
SET Description = 'Dell Inspiron laptops are designed to deliver consistent performance and reliability for everyday computing needs. Equipped with modern processors and sufficient memory, these laptops can handle multitasking, web browsing, and office applications efficiently. The display offers good clarity and color reproduction, making it suitable for both work and entertainment. Its sturdy build ensures durability, while the ergonomic keyboard provides comfortable typing. The laptop includes multiple connectivity options, allowing easy connection to external devices and accessories. With a long battery life, it supports extended usage without frequent charging. The sleek and professional design adds to its appeal. Dell Inspiron is an ideal choice for users who need a dependable laptop for work, study, or daily tasks.'
WHERE Name = 'Dell Inspiron';


UPDATE Products
SET Description = 'Boat Headphones are designed to provide high-quality audio and comfort at an affordable price. These wireless headphones feature advanced Bluetooth connectivity for seamless pairing with smartphones and other devices. The sound quality is clear and balanced, delivering an enjoyable listening experience for music, movies, and calls. With a lightweight design and cushioned ear pads, they ensure comfort during extended use. The long battery life allows uninterrupted playback for hours, making them suitable for travel and daily use. Built with durable materials, they offer good longevity. Additional features like built-in microphone and easy controls enhance usability. Boat headphones are a great choice for users looking for budget-friendly audio devices without compromising on quality.'
WHERE Name = 'Boat Headphones';


UPDATE Products
SET Description = 'Sony Headphones are known for their superior sound quality and advanced noise cancellation technology. These headphones are designed to deliver an immersive audio experience, allowing users to enjoy music, movies, and calls without external disturbances. The comfortable ear cushions and adjustable headband ensure a perfect fit for long listening sessions. With high-quality drivers, they produce clear highs, deep bass, and balanced sound. The headphones also support wireless connectivity, providing convenience and freedom of movement. Their long battery life ensures uninterrupted usage throughout the day. Built with premium materials, they offer durability and a sleek design. Sony headphones are ideal for users who value high-quality audio and comfort.'
WHERE Name = 'Sony Headphones';


UPDATE Products
SET Description = 'Puma T-Shirts are designed to offer comfort, style, and durability for everyday wear. Made from high-quality cotton fabric, these t-shirts provide a soft and breathable feel, ensuring all-day comfort. The lightweight material allows easy movement, making them suitable for casual outings, workouts, or lounging. With modern designs and vibrant colors, Puma t-shirts add a stylish touch to your wardrobe. They are easy to maintain and retain their shape and color even after multiple washes. The brand ensures high standards of quality and comfort. Whether paired with jeans or sportswear, these t-shirts provide a versatile and fashionable option. Puma t-shirts are a perfect choice for those who value comfort and style.'
WHERE Name = 'Puma T-Shirt';


UPDATE Products
SET Description = 'Levis Jeans are crafted with premium denim to provide durability, comfort, and timeless style. These jeans are designed to fit perfectly and enhance your overall appearance. The high-quality fabric ensures long-lasting performance and resistance to wear and tear. With a slim fit design, they offer a modern and stylish look suitable for various occasions. The breathable material ensures comfort throughout the day. Levis jeans are easy to pair with different types of clothing, making them a versatile addition to your wardrobe. They are designed to maintain their shape and color even after repeated use. Known for their quality and craftsmanship, Levis jeans are an excellent choice for anyone looking for reliable and stylish denim wear.'
WHERE Name = 'Levis Jeans';



select * from Products
select * from Users
select * from Carts
select * from Reviews