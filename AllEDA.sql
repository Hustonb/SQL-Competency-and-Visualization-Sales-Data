/* Note that EDA is being performed in SQL to demonstrate SQL proficiency; even though these insights could be derived in the visualization tool
 without these scripts. The more impressive queries have been included earlier on, with more standard ones at the end of each section below.
*/
-- EDA pertaining to orders (section 1):
-- Rank the most profitable orders.
WITH Temp AS (
    SELECT 
        o.OrderID, 
        SUM(o.QuantityPurchased * p.price) AS OrderPrice, 
        c.Name AS CustomerName,
        GROUP_CONCAT(p.Name SEPARATOR ',') AS ProductsOrdered
    FROM 
        orders o 
        LEFT JOIN products p ON o.productID = p.ProductID
        LEFT JOIN customers c ON o.CustomerID = c.CustomerID
    GROUP BY 
        o.OrderID, c.Name
)
SELECT 
    *, 
    RANK() OVER (ORDER BY OrderPrice DESC) AS Rnk 
FROM 
    Temp;

-- Explore the monthly average sale price and monthly largest sale.
SELECT 
	OrderMonth, 
    OrderYear,
    MAX(Price) AS MaxPrice, 
    AVG(Price) AS AvgPrice
FROM (
    SELECT 
        *, 
        SUM(ProductPrice * QuantityPurchased) AS Price 
    FROM (
        SELECT 
            o.OrderID AS OrderID, 
            o.OrderDate AS OrderDate, 
            MONTH(o.OrderDate) AS OrderMonth, 
            YEAR(o.OrderDate) AS OrderYear,
            p.Name AS Product, 
            p.Price AS ProductPrice, 
            o.QuantityPurchased AS QuantityPurchased
        FROM 
            orders o 
            LEFT JOIN products p ON o.ProductID = p.ProductID
    ) Innersub
    group by OrderID
) OuterSub 
GROUP BY 
    OrderMonth, 
    OrderYear;
    
 -- Most popular product by zip code.
SELECT 
    ZipCode, 
    ProductID, 
    Name, 
    QuantityPurchased 
FROM (
    SELECT 
        *, 
        MAX(QuantityPurchased) OVER (PARTITION BY ZipCode) AS MaxByZipCode 
    FROM (
        SELECT 
            p.ProductID, 
            p.Name, 
            SUM(o.QuantityPurchased) AS QuantityPurchased, 
            c.ZipCode
        FROM 
            orders o 
            LEFT JOIN products p ON o.ProductID = p.ProductID
            LEFT JOIN customers c ON o.CustomerID = c.CustomerID
        GROUP BY 
            ZipCode, ProductID
    ) innersub
) Outersub 
WHERE 
    QuantityPurchased = MaxByZipCode;

-- Most popular products.
SELECT
    p.ProductID,
    p.Name,
    SUM(QuantityPurchased) AS NumOrders
FROM
    orders o
    LEFT JOIN products p ON o.ProductID = p.ProductID
GROUP BY
    p.ProductID
ORDER BY
    p.ProductID;

 -- Count of orders.
 SELECT max(OrderID) AS NumOrders 
	FROM 
	Orders;
 
 -- Total revenue.
 SELECT sum(Revenue) AS Revenue 
 FROM (
	SELECT price*QuantityPurchased AS Revenue 
    FROM orders o 	
		LEFT JOIN products p ON o.ProductID=p.ProductID
) sub;

-- Average order price.
 SELECT sum(Revenue)/NumOrders AS AvgPrice
 FROM (
	SELECT price*QuantityPurchased AS Revenue,
		max(OrderID) OVER() AS NumOrders
    FROM orders o 	
		LEFT JOIN products p ON o.ProductID=p.ProductID
) sub;

-- EDA pertaining to the customers and their membership status (section 2):
-- Total spent, largest order, average order for members vs non-members.
 SELECT 
	SUM(Price) AS TotalSpent, 
	MAX(Price) AS MaxOrder, 
    AVG(Price) AS AvgOrder, 
    Member 
    FROM (
	 SELECT o.OrderID, 
			sum(o.QuantityPurchased*p.Price) AS Price,
			c.Member
          FROM 
			   orders o LEFT JOIN customers c ON o.CustomerID=c.CustomerID
			   LEFT JOIN products p ON o.ProductID=p.ProductID
			   GROUP BY o.OrderID
			   HAVING Member=1
               ) Members
UNION
 SELECT 
	SUM(Price) AS TotalSpent, 
    MAX(Price) AS MaxOrder, 
    AVG(Price) AS AvgOrder, 
    Member 
    FROM (
	 SELECT o.OrderID, 
			SUM(o.QuantityPurchased*p.Price) AS Price,
			c.Member
		  FROM 
			   orders o LEFT JOIN customers c ON o.CustomerID=c.CustomerID
			   LEFT JOIN products p ON o.ProductID=p.ProductID
			   GROUP BY o.OrderID
			   HAVING Member=0
               ) NonMembers;

 -- Number of members vs non-members, and % of customers who are members.
   SELECT 
        COUNT(Member) AS CustomerCount, 
        SUM(Member) AS MemberCount,
        COUNT(Member)-SUM(Member) AS NonMemberCount,
        SUM(Member)/COUNT(Member)*100 AS MemberPercentage
	FROM 
         customers; 

-- Customers ranked by total spent.
WITH Temp AS (
    SELECT 
       c.Name,
        SUM(o.QuantityPurchased*p.Price) AS TotalSpent
    FROM 
        orders o 
        LEFT JOIN products p ON o.productID = p.ProductID
        LEFT JOIN customers c ON o.CustomerID = c.CustomerID
    GROUP BY 
        c.CustomerID, c.Name
)
SELECT 
    *, 
    RANK() OVER (ORDER BY TotalSpent DESC) as Rnk 
FROM 
    Temp;
    
-- Number of Customers by zip code.
SELECT
	ZipCode, 
	COUNT(CustomerID) AS CustomerCount
FROM 
	customers
GROUP BY ZipCode
ORDER BY CustomerCount DESC;
               
-- EDA pertaining to storage of the products (section 3):
-- Summary table displaying the number of items stored in different locations.
WITH Temp AS (
    SELECT 
        p.Name, 
        s.LocationStored, 
        s.StorageID, 
        COUNT(s.StorageID) AS Inventory, 
        SUM(COUNT(s.StorageID)) OVER () AS TotalInventory 
    FROM 
        products p
        LEFT JOIN storage s ON p.StorageID = s.StorageID 
    GROUP BY 
        s.LocationStored, p.ProductID
    HAVING 
        s.StorageID NOT IN (1, 2)
    ORDER BY 
        s.StorageID, Inventory
)
SELECT 
    Name, 
    LocationStored, 
    Inventory, 
    (Inventory / TotalInventory * 100) AS InvPercent 
FROM 
    Temp;

-- Total quantity and inventory value by product.
WITH GroupedStorage AS (
    SELECT 
        p.Name, 
        p.ProductID, 
        p.Price, 
        SUM(s.Quantity) AS TotalQuantity 
    FROM 
        storage s
        LEFT JOIN products p ON s.StorageID = p.StorageID 
    GROUP BY 
        p.ProductID
)
SELECT 
    *, 
    TotalQuantity * Price AS InventoryValue 
FROM 
    GroupedStorage;

-- Total inventory value.
SELECT 
SUM(p.price * s.Quantity) AS TotalInvValue 
FROM 
    Products p 
    LEFT JOIN storage s ON p.StorageID = s.StorageID 
WHERE 
    s.StorageID NOT IN (1, 2);