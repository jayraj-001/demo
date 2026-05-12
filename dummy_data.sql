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






INSERT INTO [dbo].[Products]
(Name, Description, Category, Price, Rating, Stock, Brand, Images, isDeleted)
VALUES

('iPhone 15 Pro',
'The iPhone 15 Pro delivers a premium smartphone experience with its advanced titanium design, powerful A17 Pro chip, and impressive camera system. It features a stunning Super Retina XDR display that offers vibrant colors and sharp details for gaming, streaming, and daily use. The improved battery life ensures long hours of productivity and entertainment without interruption. With advanced photography capabilities including cinematic video recording and enhanced night mode, users can capture professional-quality photos effortlessly. The device also supports fast charging, secure Face ID authentication, and smooth iOS performance. Built for durability and speed, this smartphone is ideal for users who want flagship performance and modern design in one device.',
'Electronics', 134999.00, 0.00, 20, 'Apple', '/images/iphone15pro.png', 0),

('Samsung Galaxy Z Fold 5',
'The Samsung Galaxy Z Fold 5 is an innovative foldable smartphone designed for productivity and entertainment enthusiasts. It features a large immersive AMOLED display that unfolds into a tablet-like experience, making multitasking seamless and efficient. Powered by a flagship Snapdragon processor, the device ensures smooth gaming, app usage, and performance-heavy tasks. Its premium hinge mechanism provides durability while maintaining a sleek and elegant appearance. The advanced triple camera system captures high-quality photos and videos in different lighting conditions. Users can enjoy S Pen support, powerful battery optimization, and fast charging technology. Perfect for professionals and tech lovers, this device combines portability, innovation, and premium smartphone performance in one compact package.',
'Electronics', 154999.00, 0.00, 12, 'Samsung', '/images/zfold5.png', 0),

('OnePlus 12',
'The OnePlus 12 offers flagship-level performance with a sleek design and smooth user experience. Equipped with a high-refresh-rate AMOLED display, it delivers fluid scrolling and immersive visuals for gaming and media consumption. The smartphone is powered by a high-performance processor that handles multitasking effortlessly while maintaining power efficiency. Its advanced camera setup captures detailed and vibrant images with enhanced AI photography features. Fast charging technology ensures the battery powers up quickly, reducing downtime for users on the go. OxygenOS provides a clean and responsive software experience with useful customization features. Ideal for users seeking speed, reliability, and premium design, the OnePlus 12 combines performance and style at a competitive price point.',
'Electronics', 69999.00, 0.00, 28, 'OnePlus', '/images/oneplus12.png', 0),

('Realme GT Neo',
'The Realme GT Neo is a performance-oriented smartphone designed for gamers and multitasking users. Featuring a vibrant AMOLED display with a high refresh rate, the device ensures smooth animations and responsive touch controls. Its powerful chipset delivers excellent gaming performance while maintaining efficient battery consumption. The smartphone includes a versatile camera setup capable of capturing sharp photos and stable videos in various environments. Fast charging support allows users to quickly recharge the device and continue their activities without delays. The stylish design, lightweight build, and modern software features make it attractive for young users. Combining affordability with strong hardware specifications, the Realme GT Neo is a solid choice for entertainment and productivity needs.',
'Electronics', 32999.00, 0.00, 35, 'Realme', '/images/realmegtneo.png', 0),

('Asus ROG Phone 8',
'The Asus ROG Phone 8 is built specifically for mobile gaming enthusiasts who demand high performance and immersive gameplay. It features a fast AMOLED display with an ultra-high refresh rate for smooth visuals and reduced motion blur. Powered by a top-tier gaming processor and advanced cooling technology, the device handles demanding games without overheating. The large battery ensures extended gaming sessions while fast charging minimizes waiting time. Enhanced stereo speakers provide rich sound quality, creating a more engaging entertainment experience. Customizable gaming controls and RGB lighting add to its premium gaming appeal. This smartphone is ideal for users seeking desktop-level gaming performance combined with modern smartphone functionality and durability.',
'Electronics', 89999.00, 0.00, 10, 'Asus', '/images/rog8.png', 0),

('MacBook Air M3',
'The MacBook Air M3 combines portability, efficiency, and exceptional performance in a sleek lightweight design. Powered by Apple’s advanced M3 chip, it delivers fast processing speeds and smooth multitasking for students, professionals, and creators. The Retina display provides vivid colors and sharp visuals, making it ideal for video editing, browsing, and entertainment. With impressive battery life, users can work throughout the day without frequent charging. The silent fanless design ensures quiet operation while maintaining efficient thermal management. Built with premium materials and optimized macOS integration, the laptop offers a seamless and reliable user experience. Perfect for productivity and creative tasks, the MacBook Air M3 is a dependable premium laptop choice.',
'Electronics', 124999.00, 0.00, 18, 'Apple', '/images/macbookairm3.png', 0),

('Lenovo Legion 5',
'The Lenovo Legion 5 is a powerful gaming laptop designed for gamers and content creators who require high performance. Equipped with a fast processor and dedicated graphics card, it delivers smooth gameplay and efficient multitasking. The high-refresh-rate display enhances gaming visuals with sharp detail and reduced lag during fast-paced action. Advanced cooling technology keeps temperatures under control during extended usage sessions. The laptop also features a comfortable keyboard with customizable backlighting, making gaming and typing more enjoyable. Multiple connectivity options and a durable build improve convenience and long-term usability. Ideal for both work and entertainment, the Lenovo Legion 5 balances gaming power, modern design, and everyday productivity effectively.',
'Electronics', 95999.00, 0.00, 14, 'Lenovo', '/images/legion5.png', 0),

('Acer Aspire 7',
'The Acer Aspire 7 is a versatile laptop built for students, professionals, and casual gamers who need balanced performance. Featuring a modern processor and dedicated graphics support, it handles daily multitasking, office work, and entertainment smoothly. The Full HD display offers clear visuals with vibrant colors suitable for movies, browsing, and creative tasks. Its stylish and durable design makes it portable for work and study environments. The laptop includes multiple ports for easy connectivity with external devices and accessories. Fast storage ensures quicker boot times and application loading speeds, improving productivity throughout the day. Combining affordability with dependable performance, the Acer Aspire 7 is an excellent choice for users seeking value and efficiency.',
'Electronics', 67999.00, 0.00, 22, 'Acer', '/images/aspire7.png', 0),

('Nike Revolution 7',
'The Nike Revolution 7 running shoes are designed for comfort, flexibility, and everyday performance. Featuring lightweight cushioning and breathable mesh material, they provide excellent support during walking, jogging, and workouts. The durable rubber outsole offers strong grip and traction on different surfaces, enhancing stability during movement. Its modern sporty design makes the shoes suitable for both athletic activities and casual wear. The padded collar and soft insole improve overall comfort, allowing users to wear them for extended periods without discomfort. Built with quality materials and attention to detail, these shoes ensure durability and reliable performance. Ideal for fitness enthusiasts and casual users, the Nike Revolution 7 combines style, comfort, and practicality.',
'Footwear', 6499.00, 0.00, 45, 'Nike', '/images/revolution7.png', 0),

('Adidas Ultraboost',
'The Adidas Ultraboost shoes are engineered for superior comfort and energy return, making them ideal for running and everyday use. The responsive cushioning technology absorbs impact effectively while providing a soft and supportive feel with every step. A breathable knit upper ensures proper airflow, keeping feet cool and comfortable during long hours of wear. The flexible outsole enhances grip and movement on multiple surfaces, supporting active lifestyles. Designed with a stylish modern appearance, these shoes easily pair with sportswear and casual outfits. Lightweight construction reduces fatigue during extended walking or workouts. Perfect for athletes and fashion-conscious users alike, the Adidas Ultraboost delivers premium comfort, durability, and performance in a sleek package.',
'Footwear', 12999.00, 0.00, 30, 'Adidas', '/images/ultraboost.png', 0),

('Puma Running Shoes',
'The Puma Running Shoes provide excellent comfort and flexibility for users with active lifestyles. Designed with breathable fabric and lightweight cushioning, these shoes help reduce foot strain during exercise and daily activities. The durable sole ensures reliable traction and stability on various surfaces, making them suitable for running, walking, and gym sessions. Their stylish sporty design enhances casual outfits while maintaining athletic functionality. Soft padding around the ankle area improves overall comfort for long hours of wear. Built with quality craftsmanship and durable materials, the shoes are designed for long-term usage. Perfect for fitness enthusiasts and regular users, Puma Running Shoes offer a balance of comfort, affordability, and modern style.',
'Footwear', 5499.00, 0.00, 40, 'Puma', '/images/pumarun.png', 0),

('Reebok Sports Shoes',
'The Reebok Sports Shoes are crafted to support active movement with comfort and durability. Featuring lightweight construction and responsive cushioning, these shoes provide excellent support for workouts, jogging, and daily wear. The breathable upper material promotes airflow, helping keep feet cool during intense activities. A strong outsole offers reliable grip and stability on multiple surfaces, improving safety and performance. The ergonomic design ensures flexibility and natural foot movement for enhanced comfort throughout the day. Stylish aesthetics make them suitable for both sportswear and casual fashion. Combining performance-focused features with modern design, the Reebok Sports Shoes are ideal for individuals seeking dependable athletic footwear at a practical price.',
'Footwear', 4999.00, 0.00, 38, 'Reebok', '/images/reeboksports.png', 0),

('Boat Airdopes 441',
'The Boat Airdopes 441 wireless earbuds deliver immersive audio quality and convenient true wireless connectivity for music lovers. Featuring powerful drivers and deep bass technology, they provide rich sound for music, movies, and gaming experiences. The lightweight ergonomic design ensures comfortable usage for extended periods without discomfort. With Bluetooth connectivity and stable pairing, users can enjoy uninterrupted listening and hands-free calling. The compact charging case offers additional battery backup for all-day use while supporting fast charging functionality. Sweat and water resistance make the earbuds suitable for workouts and outdoor activities. Ideal for students, professionals, and travelers, the Boat Airdopes 441 combines affordability, portability, and quality audio performance effectively.',
'Accessories', 2499.00, 0.00, 80, 'Boat', '/images/airdopes441.png', 0),

('Sony WH-1000XM5',
'The Sony WH-1000XM5 headphones offer industry-leading noise cancellation and exceptional audio quality for premium listening experiences. Equipped with advanced sound technology, they deliver crisp vocals, balanced bass, and immersive music playback. The intelligent noise-canceling system effectively reduces surrounding distractions, making them perfect for travel, work, and relaxation. Soft ear cushions and lightweight construction provide lasting comfort during long listening sessions. The long battery life supports extended use, while quick charging ensures minimal downtime. Smart touch controls and voice assistant integration improve convenience and usability. Designed for audiophiles and professionals, the Sony WH-1000XM5 headphones combine luxury, comfort, and cutting-edge sound performance in a sleek modern design.',
'Accessories', 29999.00, 0.00, 16, 'Sony', '/images/sonyxm5.png', 0),

('JBL Flip 6',
'The JBL Flip 6 portable speaker delivers powerful sound performance in a compact and durable design. Featuring deep bass and clear audio output, it enhances music listening experiences indoors and outdoors. The waterproof and dustproof construction makes it suitable for parties, travel, and outdoor adventures. Its long-lasting battery provides hours of uninterrupted playback, ensuring entertainment throughout the day. Bluetooth connectivity allows easy pairing with smartphones, tablets, and other devices for wireless streaming convenience. The rugged body design ensures durability while maintaining portability for easy carrying. Ideal for music enthusiasts who enjoy powerful portable audio, the JBL Flip 6 combines reliability, sound quality, and modern functionality effectively.',
'Accessories', 11999.00, 0.00, 25, 'JBL', '/images/jblflip6.png', 0),

('Puma Hoodie',
'The Puma Hoodie is designed for comfort, warmth, and casual everyday fashion. Made from soft premium fabric, it provides a cozy feel suitable for cooler weather and relaxed outings. The breathable material ensures comfort while maintaining durability through regular use and washing. Featuring a modern sporty design with adjustable hood and front pockets, it combines practicality with style effortlessly. Ribbed cuffs and hem improve fit while helping retain warmth during outdoor activities. The versatile appearance pairs well with jeans, joggers, and sportswear for different occasions. Ideal for students and active individuals, the Puma Hoodie offers a comfortable blend of fashion, functionality, and long-lasting quality.',
'Clothing', 2999.00, 0.00, 55, 'Puma', '/images/pumahoodie.png', 0),

('Levis Denim Jacket',
'The Levis Denim Jacket is a timeless fashion piece crafted with durable premium denim for long-lasting wear. Its classic design complements casual outfits while providing a stylish layered appearance suitable for multiple seasons. The comfortable fit allows easy movement and all-day wearability without compromising style. Featuring strong stitching, button closures, and practical pockets, the jacket combines durability with functionality effectively. The versatile design pairs effortlessly with jeans, t-shirts, and sneakers for a modern casual look. High-quality fabric ensures resistance to regular wear and maintains its shape after repeated use. Perfect for fashion-conscious individuals, the Levis Denim Jacket delivers iconic style, comfort, and reliability in one wardrobe essential.',
'Clothing', 4999.00, 0.00, 32, 'Levis', '/images/levisjacket.png', 0),

('Roadster Casual Shirt',
'The Roadster Casual Shirt is designed for modern everyday fashion with a comfortable and stylish appearance. Made from breathable cotton fabric, it provides softness and comfort throughout the day in different weather conditions. The slim-fit design enhances overall style while maintaining flexibility for easy movement. Durable stitching and quality buttons ensure long-lasting usage even with regular wear. Suitable for casual outings, college, and office environments, the shirt pairs easily with jeans and trousers. Its lightweight material allows comfortable all-day wear without irritation or discomfort. Combining affordability, trendy design, and reliable fabric quality, the Roadster Casual Shirt is a practical wardrobe choice for young professionals and students.',
'Clothing', 1499.00, 0.00, 48, 'Roadster', '/images/roadstershirt.png', 0),

('Allen Solly Polo T-Shirt',
'The Allen Solly Polo T-Shirt combines premium comfort with smart casual style suitable for daily wear and social occasions. Crafted from soft breathable fabric, it keeps users comfortable during long hours of activity while maintaining a polished appearance. The classic polo collar and modern fit create a stylish look that pairs effortlessly with jeans, chinos, and shorts. Durable stitching and quality fabric ensure long-term usability and resistance to fading after washing. Lightweight construction improves comfort during warm weather conditions. The versatile design makes it suitable for casual meetings, travel, and weekend outings. Perfect for individuals seeking comfortable yet fashionable clothing, the Allen Solly Polo T-Shirt offers elegance, practicality, and everyday reliability.',
'Clothing', 1799.00, 0.00, 50, 'Allen Solly', '/images/allensollypolo.png', 0);



INSERT INTO [dbo].[Products]
(Name, Description, Category, Price, Rating, Stock, Brand, Images, isDeleted)
VALUES

('Samsung Smart TV 55 Inch',
'The Samsung Smart TV 55 Inch delivers an immersive entertainment experience with its ultra-clear 4K resolution and vibrant color technology. Designed for modern homes, it features a sleek bezel-less design that enhances viewing aesthetics while saving space. Built-in smart functionality allows seamless access to streaming platforms, apps, and voice assistants for convenient control. The powerful sound system enhances movies, sports, and gaming sessions with rich audio quality. Multiple connectivity options including HDMI, USB, and wireless casting improve compatibility with external devices. Energy-efficient performance and durable construction ensure reliable long-term use. Perfect for family entertainment and modern living rooms, this television combines advanced technology with premium visual performance.',
'Electronics', 58999.00, 0.00, 18, 'Samsung', '/images/samsungtv55.png', 0),

('LG OLED Smart TV',
'The LG OLED Smart TV offers premium picture quality with deep blacks, vibrant colors, and exceptional contrast levels. Powered by advanced AI image processing, it enhances visual clarity and delivers cinematic viewing experiences for movies and games. The ultra-slim design adds elegance to modern interiors while maximizing screen immersion. Smart features allow easy access to streaming services, voice assistants, and personalized content recommendations. Dolby Atmos sound technology creates rich and immersive audio performance for complete home entertainment. Smooth refresh rates improve gaming and sports viewing with reduced motion blur. Built for performance and style, the LG OLED Smart TV is ideal for users seeking luxury entertainment technology and modern functionality.',
'Electronics', 129999.00, 0.00, 10, 'LG', '/images/lgoled.png', 0),

('Mi Smart Watch',
'The Mi Smart Watch combines fitness tracking, smart notifications, and stylish design in a compact wearable device. Equipped with health monitoring features such as heart rate tracking, sleep analysis, and step counting, it supports users in maintaining an active lifestyle. The bright touchscreen display provides easy navigation and clear visibility in different lighting conditions. Long battery life ensures uninterrupted usage throughout the week without frequent charging. Water resistance makes it suitable for workouts and outdoor activities. Smartphone connectivity allows users to receive calls, messages, and app alerts directly on the watch. Perfect for fitness enthusiasts and professionals, the Mi Smart Watch delivers convenience, performance, and affordability in one device.',
'Electronics', 6999.00, 0.00, 60, 'Xiaomi', '/images/mismartwatch.png', 0),

('Apple Watch Series 9',
'The Apple Watch Series 9 is a premium smartwatch designed to enhance productivity, fitness, and connectivity for modern users. Featuring a bright Retina display and smooth watchOS interface, it offers quick access to notifications, apps, and health features. Advanced fitness tracking capabilities include heart monitoring, workout tracking, sleep analysis, and activity goals. The powerful processor ensures smooth performance and efficient battery management throughout daily use. Seamless integration with Apple devices improves convenience for calls, messaging, and smart controls. Durable construction and water resistance make it suitable for workouts and outdoor activities. Combining style, innovation, and advanced technology, the Apple Watch Series 9 is ideal for active and connected lifestyles.',
'Electronics', 45999.00, 0.00, 20, 'Apple', '/images/applewatch9.png', 0),

('Canon EOS 1500D',
'The Canon EOS 1500D DSLR camera is designed for photography enthusiasts who want professional-quality images and videos. Equipped with a high-resolution sensor and advanced image processor, it captures detailed and vibrant photos in different lighting conditions. The ergonomic design ensures comfortable handling during long photography sessions. Built-in WiFi and connectivity features allow quick sharing of photos to smartphones and social media platforms. Multiple shooting modes support creativity for portraits, landscapes, and action photography. Full HD video recording delivers smooth and sharp footage suitable for content creation. Perfect for beginners and hobbyists, the Canon EOS 1500D offers reliable performance, user-friendly controls, and impressive image quality.',
'Electronics', 42999.00, 0.00, 15, 'Canon', '/images/canon1500d.png', 0),

('Nikon D5600',
'The Nikon D5600 DSLR camera provides outstanding photography performance with advanced imaging capabilities and intuitive controls. Featuring a high-quality sensor and fast autofocus system, it captures sharp images with excellent detail and vibrant colors. The vari-angle touchscreen display enhances convenience for creative shooting angles and video recording. Built-in wireless connectivity enables quick photo sharing and remote camera operation using smartphones. Lightweight construction improves portability for travel and outdoor photography sessions. Multiple scene modes and manual settings support both beginners and experienced photographers. Ideal for capturing portraits, landscapes, and videos, the Nikon D5600 combines flexibility, image quality, and reliable performance in a compact camera body.',
'Electronics', 54999.00, 0.00, 12, 'Nikon', '/images/nikond5600.png', 0),

('HP Wireless Mouse',
'The HP Wireless Mouse is designed for smooth navigation and comfortable daily computer usage. Featuring ergonomic contours and responsive tracking technology, it provides precise cursor movement for office work, browsing, and multitasking. Wireless connectivity eliminates cable clutter and allows flexible usage across desks and workspaces. The compact lightweight design makes it easy to carry during travel and remote work situations. Long battery life ensures uninterrupted performance without frequent replacements. Compatible with laptops and desktop systems, it supports quick setup through plug-and-play functionality. Ideal for students, professionals, and home users, the HP Wireless Mouse offers convenience, reliability, and comfortable usability at an affordable price.',
'Accessories', 899.00, 0.00, 120, 'HP', '/images/hpmouse.png', 0),

('Logitech Mechanical Keyboard',
'The Logitech Mechanical Keyboard delivers responsive typing performance and durability for gamers, programmers, and professionals. Featuring tactile mechanical switches, it provides satisfying feedback and accurate key presses for extended typing sessions. The sturdy build quality ensures long-lasting reliability even with heavy daily usage. Adjustable backlighting enhances visibility in low-light environments while adding a modern aesthetic appearance. Dedicated multimedia controls improve convenience for music and productivity tasks. The ergonomic design supports comfortable hand positioning, reducing fatigue during long hours of use. Compatible with multiple operating systems and devices, the Logitech Mechanical Keyboard combines premium typing experience, functionality, and modern design effectively.',
'Accessories', 7499.00, 0.00, 45, 'Logitech', '/images/logitechkeyboard.png', 0),

('Dell Monitor 24 Inch',
'The Dell Monitor 24 Inch provides sharp visuals and comfortable viewing for work, gaming, and entertainment purposes. Featuring Full HD resolution and vibrant color reproduction, it ensures detailed image clarity during daily computer usage. The slim bezel design maximizes screen space while creating a modern professional appearance. Adjustable tilt functionality enhances viewing comfort during long working sessions. Multiple connectivity options including HDMI and VGA improve compatibility with desktops, laptops, and gaming consoles. Flicker-free technology and reduced blue light support eye comfort during extended screen time. Ideal for office setups and home environments, the Dell Monitor combines performance, reliability, and stylish design in a compact display solution.',
'Electronics', 12999.00, 0.00, 26, 'Dell', '/images/dellmonitor24.png', 0),

('Asus Gaming Monitor',
'The Asus Gaming Monitor is engineered for smooth gameplay and immersive visual performance. Featuring a high refresh rate and fast response time, it reduces motion blur and screen tearing during competitive gaming sessions. The Full HD display delivers vibrant colors and sharp detail for games, movies, and creative tasks. Adaptive sync technology enhances gameplay fluidity and improves overall responsiveness. Adjustable stand settings support comfortable viewing positions for long gaming hours. Multiple ports allow seamless connectivity with gaming consoles, PCs, and multimedia devices. Built with modern aesthetics and reliable durability, the Asus Gaming Monitor is ideal for gamers seeking performance, speed, and visual quality.',
'Electronics', 22999.00, 0.00, 14, 'Asus', '/images/asusgamingmonitor.png', 0),

('Nike Sports Cap',
'The Nike Sports Cap is designed for comfort, sun protection, and stylish casual wear. Made from lightweight breathable fabric, it helps keep users cool during outdoor activities and workouts. The adjustable strap ensures a secure and personalized fit for different head sizes. Durable stitching and quality materials provide long-lasting usage while maintaining comfort throughout the day. Its sporty design pairs easily with athletic and casual outfits for versatile styling options. Sweat-absorbing technology improves usability during running, gym sessions, and sports activities. Ideal for fitness enthusiasts and everyday wear, the Nike Sports Cap combines practicality, durability, and modern fashion appeal.',
'Accessories', 1299.00, 0.00, 75, 'Nike', '/images/nikesportscap.png', 0),

('Adidas Gym Bag',
'The Adidas Gym Bag offers spacious storage and durable construction for fitness enthusiasts and travelers. Designed with multiple compartments, it helps organize gym clothes, shoes, accessories, and personal essentials efficiently. The lightweight yet strong material ensures durability while remaining comfortable to carry. Adjustable shoulder straps improve convenience and portability during daily commutes and travel. Water-resistant fabric provides additional protection against moisture and light rain conditions. Stylish sporty aesthetics complement athletic lifestyles and casual use. Suitable for gym sessions, sports activities, and short trips, the Adidas Gym Bag combines functionality, durability, and modern design for active users.',
'Accessories', 2499.00, 0.00, 55, 'Adidas', '/images/adidasgymbag.png', 0),

('Puma Track Pants',
'The Puma Track Pants are designed for comfort, flexibility, and sporty everyday style. Crafted from soft breathable fabric, they provide excellent comfort during workouts, jogging, and casual activities. The elastic waistband and adjustable fit enhance mobility and convenience for different body types. Lightweight construction helps reduce discomfort during long hours of wear while maintaining durability through regular usage. Side pockets provide practical storage for small essentials during outdoor activities. The modern athletic design pairs well with hoodies, t-shirts, and sneakers for a stylish casual appearance. Ideal for active individuals, the Puma Track Pants combine functionality, comfort, and versatile sportswear fashion.',
'Clothing', 2199.00, 0.00, 48, 'Puma', '/images/pumatrackpants.png', 0),

('Levis Casual Shirt',
'The Levis Casual Shirt combines premium fabric quality with timeless modern style suitable for daily wear. Made from breathable cotton material, it provides all-day comfort while maintaining a polished appearance. The slim-fit tailoring enhances overall fashion appeal without restricting movement. Durable stitching and quality finishing ensure long-term reliability even with regular washing and use. Suitable for office wear, casual outings, and social events, the shirt pairs effortlessly with jeans and trousers. Lightweight construction improves comfort during warm weather conditions. Designed for style-conscious individuals, the Levis Casual Shirt delivers a balance of elegance, comfort, and dependable craftsmanship.',
'Clothing', 1999.00, 0.00, 42, 'Levis', '/images/leviscasualshirt.png', 0),

('US Polo T-Shirt',
'The US Polo T-Shirt offers a stylish casual look combined with superior comfort for everyday wear. Crafted from soft breathable fabric, it keeps users comfortable throughout the day in different weather conditions. The classic fit and polo collar create a refined appearance suitable for casual outings and semi-formal occasions. Durable stitching and fade-resistant material improve long-term usability and maintain product quality after repeated washes. Lightweight construction allows ease of movement and enhances comfort during regular activities. The versatile design pairs easily with jeans, chinos, and shorts. Perfect for modern casual fashion, the US Polo T-Shirt combines comfort, elegance, and practicality.',
'Clothing', 1699.00, 0.00, 52, 'US Polo', '/images/uspolotshirt.png', 0),

('Woodland Boots',
'The Woodland Boots are designed for durability, outdoor performance, and rugged style. Made with premium leather material and strong sole construction, they provide excellent support for trekking, hiking, and everyday wear. The cushioned interior enhances comfort during long walking sessions while reducing foot fatigue. Durable grip patterns on the outsole improve traction on uneven and slippery surfaces for better stability. Water-resistant properties increase protection during outdoor adventures and changing weather conditions. The classic rugged appearance complements jeans and outdoor clothing effortlessly. Ideal for travelers and adventure enthusiasts, the Woodland Boots combine strength, comfort, and long-lasting reliability.',
'Footwear', 6999.00, 0.00, 28, 'Woodland', '/images/woodlandboots.png', 0),

('Skechers Walking Shoes',
'The Skechers Walking Shoes are built for maximum comfort and support during daily walking and casual activities. Featuring memory foam cushioning and breathable fabric, they provide a soft and lightweight feel for long hours of wear. Flexible outsole construction improves natural movement and reduces strain on feet during walking sessions. The slip-on design enhances convenience while maintaining a secure fit. Stylish aesthetics make them suitable for casual outfits and travel use. Durable materials ensure long-lasting performance with regular daily usage. Perfect for individuals seeking comfort-focused footwear, the Skechers Walking Shoes combine practicality, lightweight comfort, and modern design effectively.',
'Footwear', 5999.00, 0.00, 34, 'Skechers', '/images/skecherswalking.png', 0),

('Red Tape Formal Shoes',
'The Red Tape Formal Shoes are crafted for elegance, comfort, and professional styling suitable for office and formal occasions. Made from premium leather material, they offer durability and a polished appearance that complements formal attire. Cushioned insoles provide comfort during extended working hours and events. The durable outsole ensures stable grip and long-term usability with regular use. Fine stitching and quality finishing enhance the sophisticated overall design. Lightweight construction allows easy movement without discomfort during long wear periods. Ideal for professionals and formal gatherings, the Red Tape Formal Shoes deliver classic style, dependable quality, and everyday comfort.',
'Footwear', 4499.00, 0.00, 30, 'Red Tape', '/images/redtapeformal.png', 0),

('Boat Bluetooth Speaker',
'The Boat Bluetooth Speaker delivers powerful portable sound with modern wireless convenience for music lovers. Featuring deep bass output and clear audio performance, it enhances entertainment experiences at home, parties, and outdoor activities. Compact lightweight construction improves portability while maintaining durability for daily usage. Bluetooth connectivity ensures seamless pairing with smartphones, laptops, and tablets for wireless music streaming. Long battery life supports hours of uninterrupted playback during travel and gatherings. Water-resistant design adds extra protection for outdoor environments and casual adventures. Perfect for users seeking affordable audio quality and portability, the Boat Bluetooth Speaker combines performance, style, and convenience effectively.',
'Accessories', 3499.00, 0.00, 70, 'Boat', '/images/boatspeaker.png', 0),

('JBL Tune 760NC',
'The JBL Tune 760NC headphones provide immersive sound quality and active noise cancellation for uninterrupted listening experiences. Equipped with powerful drivers, they deliver balanced bass, clear vocals, and detailed audio suitable for music, movies, and gaming. Lightweight foldable construction improves portability and comfort during long listening sessions. Bluetooth connectivity enables wireless convenience while maintaining stable audio performance. Long battery life ensures extended entertainment without frequent charging interruptions. Soft ear cushions enhance comfort and reduce outside noise effectively. Designed for students, travelers, and professionals, the JBL Tune 760NC headphones combine premium sound, modern functionality, and stylish design.',
'Accessories', 8999.00, 0.00, 22, 'JBL', '/images/jbl760nc.png', 0),

('Noise Smart Band',
'The Noise Smart Band is a compact fitness wearable designed to help users track health and daily activities efficiently. Featuring step counting, heart rate monitoring, calorie tracking, and sleep analysis, it supports healthy lifestyle management. The bright display ensures easy visibility and smooth navigation through notifications and fitness data. Lightweight comfortable straps make it suitable for all-day usage during workouts and regular activities. Water resistance enhances durability and usability during outdoor sessions and exercise routines. Smartphone connectivity allows users to receive calls, messages, and app notifications conveniently. Combining affordability, modern features, and stylish design, the Noise Smart Band is perfect for active individuals.',
'Electronics', 2999.00, 0.00, 65, 'Noise', '/images/noisesmartband.png', 0),

('Sony Soundbar',
'The Sony Soundbar enhances home entertainment systems with powerful surround sound and premium audio clarity. Featuring advanced audio tuning and deep bass technology, it delivers immersive sound experiences for movies, gaming, and music playback. Slim compact construction allows easy placement in modern living rooms without occupying much space. Bluetooth and HDMI connectivity options improve compatibility with televisions, smartphones, and multimedia devices. Wireless subwoofer support enhances low-frequency sound output for cinematic experiences. User-friendly controls and remote functionality provide convenient operation during daily usage. Ideal for home entertainment enthusiasts, the Sony Soundbar combines elegant design, rich sound quality, and modern connectivity features.',
'Electronics', 24999.00, 0.00, 18, 'Sony', '/images/sonysoundbar.png', 0),

('Philips Trimmer',
'The Philips Trimmer is designed for precise grooming and comfortable daily personal care. Equipped with sharp stainless-steel blades and adjustable trimming settings, it delivers accurate beard and hair styling results. The ergonomic lightweight design improves grip and handling during grooming sessions. Long battery life ensures uninterrupted cordless usage for convenience at home and during travel. Easy cleaning functionality and detachable attachments enhance maintenance and hygiene. Durable construction ensures reliable long-term performance with regular use. Suitable for modern grooming needs, the Philips Trimmer combines precision, comfort, portability, and dependable functionality in one compact grooming device.',
'Accessories', 1999.00, 0.00, 58, 'Philips', '/images/philipstrimmer.png', 0),

('Havells Hair Dryer',
'The Havells Hair Dryer provides efficient hair styling performance with compact and user-friendly design. Featuring multiple heat and speed settings, it allows customized drying and styling according to hair type and preference. Lightweight ergonomic construction improves handling comfort during regular use. Advanced airflow technology helps reduce drying time while maintaining hair smoothness and shine. Overheat protection enhances safety and ensures reliable long-term performance. Foldable design improves portability and storage convenience during travel. Suitable for daily grooming and styling needs, the Havells Hair Dryer combines practicality, efficiency, and durable performance in an affordable personal care appliance.',
'Accessories', 1599.00, 0.00, 46, 'Havells', '/images/havellshairdryer.png', 0),

('Wildcraft Backpack',
'The Wildcraft Backpack is designed for students, travelers, and professionals who require durable and spacious storage solutions. Featuring multiple compartments and organized pockets, it provides convenient storage for laptops, books, accessories, and essentials. Padded shoulder straps improve carrying comfort during long commutes and travel sessions. Water-resistant material protects belongings from light rain and accidental spills. Strong zippers and durable stitching ensure long-lasting reliability under daily usage conditions. The modern versatile design suits school, office, and outdoor activities effectively. Combining functionality, durability, and stylish appearance, the Wildcraft Backpack is a practical everyday companion for organized and comfortable carrying needs.',
'Accessories', 2799.00, 0.00, 50, 'Wildcraft', '/images/wildcraftbag.png', 0);

select * from Products