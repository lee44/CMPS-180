-- Foreign Constraints

DELETE 
FROM lab3.Stores
WHERE store_id IN (SELECT store_id FROM lab3.Sales)
;

DELETE 
FROM lab3.Customers
WHERE customer_id IN (SELECT customer_id FROM lab3.Sales)
;

DELETE 
FROM lab3.Products
WHERE product_id IN (SELECT product_id FROM lab3.Sales)
;

-- General Constraints
-- 1)
-- INSERT INTO Sales 
-- VALUES (200,1,1000,'2016-09-25',1,762.35,TRUE);

-- INSERT INTO Sales 
-- VALUES (800,1,1000,'2016-09-20',1,76.35,TRUE);

-- INSERT INTO Customers
-- VALUES (12,'Deadpool','1795 Deadpool st','deadpool@gmail.com');

-- INSERT INTO Sales 
-- VALUES (300,12,1000,'2016-09-22',1,862.35,TRUE);

-- 2)
-- INSERT INTO Sales 
-- VALUES (null,1,1000,'2016-09-25',1,762.35,TRUE);

-- INSERT INTO Sales 
-- VALUES (800,1,1000,'2016-09-20',1,-76.35,TRUE);

-- INSERT INTO Customers
-- VALUES (12,null,'1795 Deadpool st','deadpool@gmail.com');

-- INSERT INTO Sales 
-- VALUES (300,12,1000,'2016-09-22',2,862.35,TRUE);