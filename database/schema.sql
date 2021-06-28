-- use https://www.quickdatabasediagrams.com/ to diagram the schema 
-- Schema creation goes here

DROP TABLE IF EXISTS Customers CASCADE;
DROP TABLE IF EXISTS Addresses CASCADE;
DROP TABLE IF EXISTS Products CASCADE;
DROP TABLE IF EXISTS Categories CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;

CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    addresses_id INTEGER,
);

CREATE TABLE Addresses (
    id SERIAL PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zipcode VARCHAR(9) NOT NULL
);

CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cost decimal NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0
    categories_id INTEGER
);

CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    categories_name VARCHAR(100)
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    products_id INTEGER,
    products_quantity INTEGER NOT NULL,
    orders_date DATE NOT NULL
    customers_id INTEGER
);

ALTER TABLE Customers
ADD CONSTRAINT fk_customers_addresses_id
FOREIGN KEY (addresses_id) REFERENCES Addresses(id);

ALTER TABLE Products
ADD CONSTRAINT fk_products_categories_id
FOREIGN KEY (categories_id) REFERENCES Categories(id);

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_products_id
FOREIGN KEY (products_id) REFERENCES Products(id);

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_customers_id
FOREIGN KEY (customers_id) REFERENCES Customers(id);

-- Customer as cu
-- -
-- id int FK >- Order.customer_id
-- first_name varchar(100)
-- last_name varchar(100)
-- email varchar(50)
-- addresses_id int FK >- Addresses.id

-- Addresses as a
-- -
-- id int
-- street varchar(100)
-- city varchar(100)
-- state varchar(2)
-- zipcode varchar(9)

-- Product as p
-- -
-- id int FK >-< Order.product_id
-- name varchar(100)
-- cost decimal
-- quantity int
-- category_id int FK >- Category.id

-- Category as ca
-- -
-- id int
-- category_name varchar(100)

-- Order as o
-- -
-- id int
-- product_id int
-- product_quantity int
-- customer_id