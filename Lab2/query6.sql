SELECT p.name, p.manufacturer, sa.purchase_date, SUM(sa.quantity)
FROM Products p, Sales sa
WHERE p.product_id = sa.product_id
GROUP BY sa.purchase_date,p.manufacturer, p.name ;