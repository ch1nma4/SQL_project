use sql_project;

-- 1
select products.ProductName , orderss.Firsts ,orderss.Middle,orderss.Lasts
from products
JOIN  orderss 
ON (products.p_id = orderss.o_id);


-- 2
select ProductLabel,InventoryOnHand,NumberReceived 
from products 
JOIN purchases
ON (products.p_id = purchases.pur_id); 


-- 3
select ProductLabel,InventoryOnHand,NumberReceived,Product_ID
from products
JOIN purchases
ON (products.p_id = purchases.pur_id)
where ProductLabel  like 'R%'
having Product_ID <= 15
order by  Product_ID; 


-- 4
select ProductLabel,avg(NumberReceived) 
from products 
JOIN purchases
ON (products.p_id = purchases.pur_id);


-- 5
select ProductName, NumberShipped as Shipped_Product
from products
JOIN orderss
ON (products.p_id = orderss.o_id)
group by NumberShipped
order by Shipped_Product ;


-- 6
select ProductName, sum(NumberShipped) AS Shipped_Product
from products
JOIN orderss
ON (products.p_id = orderss.o_id) ;


-- 7
select ProductName, NumberShipped,firsts,Middle,Lasts
from products
JOIN orderss
ON (products.p_id = orderss.o_id)
having NumberShipped <= 10
order by NumberShipped DESC ;


-- 8
select ProductName,NumberReceived,PurchaseDate,supplier
from products
JOIN purchases
ON(products.p_id = purchases.pur_id)
Join suppliers
ON (purchases.pur_id = suppliers.s_id)
order by NumberReceived;


-- 9
select ProductLabel,NumberReceived,PurchaseDate,supplier
from products
JOIN purchases
ON(products.p_id = purchases.pur_id)
Join suppliers
ON (purchases.pur_id = suppliers.s_id)
where ProductLabel like "B%"
having NumberReceived <= 15
order by NumberReceived;


-- 10
select ProductLabel,InventoryShipped,InventoryOnHand,firsts,Middle , Lasts,  Product_ID as products
from products
JOIN orderss
ON(products.p_id = orderss.o_id)
where Product_ID  between 1 AND 10
order by products;


-- 11  
select CONCAT(ProductName,' ',PartNumber) AS Product_Details,
CONCAT(firsts,' ',Middle,' ',Lasts) as FullName , 
COUNT(Product_ID) as Product_No
from products 
JOIN orderss
ON (products.p_id = orderss.o_id)
group by Product_ID
order by Product_No desc;



-- 12
select CONCAT(ProductName,' ',PartNumber) as Product_Details, NumberReceived, PurchaseDate, supplier
from products
JOIN purchases
ON (products.p_id = purchases.pur_id)
JOIN suppliers
ON(purchases.pur_id = suppliers.s_id)
having NumberReceived >= 5
order by NumberReceived;


-- 13
select  ProductLabel, InventoryShipped, InventoryOnHand, firsts, Middle , Lasts,  Product_ID as products
from products
JOIN orderss
ON(products.p_id = orderss.o_id)
where firsts like 'F%'AND Middle like '%f' AND Lasts like 'A%' 
order by products;


-- 14
select ProductLabel, NumberReceived, PurchaseDate, supplier
from products
JOIN purchases
ON (products.p_id = purchases.pur_id)
JOIN suppliers
ON(purchases.pur_id = suppliers.s_id)
where supplier like 'R%' 
having NumberReceived <=20 
order by NumberReceived;


-- 15
select ProductLabel,InventoryOnHand, NumberReceived,PurchaseDate,supplier
from products
JOIN purchases
ON(products.p_id = purchases.pur_id)
Join suppliers
ON (purchases.pur_id = suppliers.s_id)
where InventoryOnHand  BETWEEN '2015-11-03' AND '2020-01-20'
order by NumberReceived;

-- 16
select ProductName , Title, firsts , Lasts, Product_ID 
from products 
JOIN orderss
ON(products.p_id = orderss.o_id)
where Product_ID < (select avg(Product_ID) from orderss)
order by Product_ID ;


-- 17
select ProductLabel,InventoryShipped,MinimumRequired as Required,PurchaseDate,supplier
from products
JOIN purchases
ON(products.p_id = purchases.pur_id)
JOIN suppliers
ON (purchases.pur_id = suppliers.s_id)
where MinimumRequired < (select avg(MinimumRequired) from products) AND
PurchaseDate BETWEEN '2010-05-22' and '2020-12-31'
group by MinimumRequired
order by Required;

-- 18
select CONCAT(ProductName,' ',PartNumber) as Product_Details ,
StartingInventory , InventoryReceived ,
CONCAT(firsts,' ',Middle,' ',Lasts) as FullName,NumberShipped AS shipped, OrderDate
from products
JOIN orderss
ON(products.p_id = orderss.o_id)
where NumberShipped > (select avg(NumberShipped) from orderss) AND
StartingInventory BETWEEN '2005-04-21' and '2015-12-31'
order by Shipped limit 1 offset 3;


-- 19
select ProductLabel,InventoryOnHand,NumberReceived,supplier
from products
JOIN purchases
ON(products.p_id = purchases.pur_id)
Join suppliers
ON (purchases.pur_id = suppliers.s_id)
where InventoryOnHand  BETWEEN '2015-11-03' AND '2020-01-20' AND supplier like "H%"
order by NumberReceived;


-- 20
select ProductLabel,MinimumRequired,
Title, CONCAT(firsts,' ',Middle,' ',Lasts) as FullName
from products
JOIN orderss
ON (products.p_id = orderss.o_id)
where MinimumRequired <=15 AND Title like "M%"
order by MinimumRequired DESC;








