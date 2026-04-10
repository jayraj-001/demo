select * from Carts
select * from Products
select * from Users
select * from Wishlist

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

exec sp_GetAllProducts
exec sp_GetProductsById 1

UPDATE Products set isDeleted = 0
where ID> 1000






