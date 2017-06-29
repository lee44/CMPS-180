INSERT INTO lab3.Sales (store_id,customer_id,product_id,purchase_date,quantity,unit_price,shipped)
(SELECT store_id,customer_id,product_id,purchase_date,quantity,unit_price,FALSE 
 FROM lab3.NewSales
 WHERE NOT EXISTS(SELECT * 
 				  FROM lab3.Sales
 				  WHERE store_id = NewSales.store_id AND
 				  		customer_id = NewSales.customer_id AND
 				  		product_id = NewSales.product_id AND
 				  		purchase_date = NewSales.purchase_date)
);
 