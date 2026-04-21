select * from Products
SELECT DISTINCT CATEGORY FROM Products

ALTER PROCEDURE sp_SearchProducts
(
    @SearchText VARCHAR(100) = NULL,
    @MinPrice DECIMAL(10,2)= NULL,
    @MaxPrice DECIMAL(10,2) = NULL,
    @Category VARCHAR(50) = NULL,
    @MinRating DECIMAL(3,2) = NULL
)
AS
BEGIN
    SELECT 
        P.ProductId,
        P.Name,
        P.Description,
        P.Category,
        P.Price,
        P.Rating,
        P.Stock,
        P.Brand,
        P.Images,
        (
            SELECT COUNT(*)
            FROM Reviews R
            WHERE R.ProductId = P.ProductId
            AND R.isDeleted = 0
        ) AS TotalReviews
    FROM Products P
    WHERE P.isDeleted = 0
    AND (
        @SearchText IS NULL OR 
       P.Name LIKE '%' + @SearchText + '%' OR
        P.Description LIKE '%' + @SearchText + '%'
    )

    AND (@MinPrice IS NULL OR P.Price >= @MinPrice)
    AND (@MaxPrice IS NULL OR P.Price <= @MaxPrice)

    AND (@Category IS NULL OR P.Category LIKE '%' + @Category + '%')

    AND (@MinRating IS NULL OR P.Rating >= @MinRating)
END

exec sp_SearchProducts 'a',10000,100000,'ele',1

exec sp_SearchProducts @SearchText='a' ,@Category='e'



ALTER PROCEDURE sp_GetProductSuggestions
    @SearchText VARCHAR(100)
AS
BEGIN

IF (@SearchText  IS NULL  OR @SearchText='')
return;

    SELECT TOP 10
        ProductId,
        Name
    FROM Products
    WHERE isDeleted = 0
        AND LOWER(Name) LIKE LOWER(@SearchText) + '%'
    ORDER BY 
	CASE
	WHEN LOWER(Name) = LOWER(@SearchText) THEN 1
	WHEN LOWER(Name) LIKE LOWER(@SearchText) + '%' THEN 2
	ELSE 3
	END,
	Name;
END

exec sp_GetProductSuggestions @MinRating

SELECT Name FROM Products Order BY 1

select * from Products

exec sp_SearchProducts @MinRating=3

