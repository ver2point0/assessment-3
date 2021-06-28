-- use https://www.quickdatabasediagrams.com/ to diagram the schema 
-- Schema creation goes here

DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Addresses CASCADE;
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS Category CASCADE;
DROP TABLE IF EXISTS Order CASCADE;

CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email_name VARCHAR(50) NOT NULL,
    addresses_id INTEGER,
);

CREATE TABLE Addresses (
    id SERIAL PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zipcode VARCHAR(9) NOT NULL
);

CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cost decimal NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0
    category_id INTEGER
);

CREATE TABLE Category (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Order (
    id SERIAL PRIMARY KEY,
    product_id INTEGER,
    product_quantity INTEGER NOT NULL,
    order_date DATE NOT NULL
    customer_id INTEGER
);

ALTER TABLE Customer
ADD CONSTRAINT fk_customer_addresses_id
FOREIGN KEY (addresses_id) REFERENCES Addresses(id);

ALTER TABLE Product
ADD CONSTRAINT fk_product_category_id
FOREIGN KEY (category_id) REFERENCES Category(id);

ALTER TABLE Order
ADD CONSTRAINT fk_order_product_id
FOREIGN KEY (product_id) REFERENCES Product(id);

ALTER TABLE Order
ADD CONSTRAINT fk_order_customer_id
FOREIGN KEY (customer_id) REFERENCES Customer(id);

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