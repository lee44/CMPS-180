ALTER TABLE lab3.Sales
ALTER COLUMN store_id SET NOT NULL;

ALTER TABLE lab3.Sales
ADD CONSTRAINT positive_price CHECK (unit_price > 0);

ALTER TABLE lab3.Customers
ALTER COLUMN name SET NOT NULL;

ALTER TABLE lab3.Sales
ADD CONSTRAINT total_price CHECK((quantity*unit_price) <= 1000 )