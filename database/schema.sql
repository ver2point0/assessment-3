-- use https://www.quickdatabasediagrams.com/ to diagram the schema 

-- Schema creation goes here
-- Customer as cu
-- -
-- id int
-- first_name varchar(100)
-- last_name varchar(100)
-- email varchar(50)
-- address_id int

-- Address as a
-- -
-- id int
-- street varchar(100)
-- city varchar(100)
-- state varchar(2)
-- zipcode varchar(9)

-- Product as p
-- -
-- id int
-- name varchar(100)
-- cost decimal
-- quantity int
-- category_id int

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