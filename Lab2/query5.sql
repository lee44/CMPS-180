SELECT sa.customer_id, sa.purchase_date
FROM Sales sa,(SELECT product_id
			   FROM Products
			   WHERE manufacturer = 'Kellogg')p
WHERE sa.price > 49.98 AND sa.shipped = 'true' AND 
sa.store_id = (SELECT store_id
					 FROM Stores
					 WHERE manager = 'George Jetson') AND 
p.product_id = sa.product_id;