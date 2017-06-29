CREATE SCHEMA lab2;

ALTER ROLE jocalee SET SEARCH_PATH TO lab2;

CREATE TABLE Stores(
store_id INTEGER PRIMARY KEY NOT NULL ,
name CHAR(20), 
address VARCHAR(50) NOT NULL ,
manager CHAR(20),
UNIQUE(name,address)
);

CREATE TABLE Cust(
customer_id INTEGER PRIMARY KEY NOT NULL , 
name CHAR(20) NOT NULL , 
address VARCHAR(50), 
email CHAR(20),
UNIQUE(name,email,address)
);

CREATE TABLE Products(
product_id INTEGER PRIMARY KEY NOT NULL , 
name CHAR(20) NOT NULL , 
category CHAR(20), 
manufacturer CHAR(20) NOT NULL,
UNIQUE(name,manufacturer,category) 
);

CREATE TABLE Sales(
store_id INTEGER NOT NULL , 
customer_id INTEGER NOT NULL , 
product_id INTEGER NOT NULL , 
purchase_date DATE NOT NULL , 
quantity INTEGER NOT NULL , 
price DECIMAL(6,2) NOT NULL , 
shipped BOOLEAN,
PRIMARY KEY(store_id,customer_id,product_id,purchase_date)
);

CREATE TABLE Sailors(
sid INTEGER ,
sname CHAR(10),
rating INTEGER,
age DECIMAL(3,1)
);

CREATE TABLE Customers(
cid INTEGER,
cname CHAR(6),
level CHAR(10),
type CHAR(10),
age INTEGER
);
