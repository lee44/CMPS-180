SELECT p.name,s.product_id
FROM Products p, Sales s
WHERE s.purchase_date = '07/04/2016' AND 
s.product_id = p.product_id;