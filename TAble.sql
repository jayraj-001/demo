CREATE TABLE Carts(
cart_id int primary key identity(1,1),
User_Id int
FOREIGN KEY(User_Id) REFERENCES Users(User_id),
Images varchar(255),
Title varchar(100),
Price decimal(5,2),
Quantity int,
isDeleted BIT
);

ALTER TABLE Carts
ADD CONSTRAINT isDeleted_bit
DEFAULT 0 FOR isDeleted;


CREATE TABLE Wishlist(
W_id int primary key identity(1,1),
U_ID INT,
P_ID INT,
Images varchar(255),
Title varchar(100),
Price decimal(5,2),

FOREIGN KEY (U_ID)
REFERENCES Users (User_id),

FOREIGN KEY (P_ID)
REFERENCES Products(ID)
)

ALTER TABLE Wishlist
ADD isDeleted BIT NOT NULL DEFAULT 0;

ALTER TABLE Users
ADD isDeleted BIT NOT NULL DEFAULT 0;

ALTER TABLE Carts
ADD P_ID INT NOT NULL
FOREIGN KEY(P_ID) REFERENCES PRODUCTS(ID);

ALTER TABLE Products
ADD isDeleted BIT NOT NULL DEFAULT 0;


ALTER TABLE Products
ADD User_Id INT NOT NULL;


ALTER TABLE Products
ADD CONSTRAINT fk_products
FOREIGN KEY (User_Id)
REFERENCES Users (User_id);





