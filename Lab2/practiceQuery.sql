SELECT c.cname
FROM Customers c
WHERE c.age > (SELECT MIN(c2.age)
FROM Customers c2
WHERE c2.type = 'snowboard');