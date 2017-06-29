CREATE VIEW unshipped_products AS
SELECT p.name,p.manufacturer
FROM lab3.Sales l, lab3.Products p
WHERE l.product_id = p.product_id
GROUP BY p.name, p.manufacturer, l.product_id
HAVING SUM(case when l.shipped = 'true' then 1 else 0 end) < 1
ORDER BY p.name,p.manufacturer ASC;
