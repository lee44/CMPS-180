ALTER TABLE lab3.Sales
ADD FOREIGN KEY (store_id)
REFERENCES lab3.Stores(store_id);

ALTER TABLE lab3.Sales
ADD FOREIGN KEY (customer_id)
REFERENCES lab3.Customers(customer_id);

ALTER TABLE lab3.Sales
ADD FOREIGN KEY (product_id)
REFERENCES lab3.Products(product_id);