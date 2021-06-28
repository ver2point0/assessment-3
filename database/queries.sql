-- Queries go here

-- Retrieve the first name, last name, and email address of all customers that have a Gmail email address.
SELECT first_name, last_name, email
FROM Customers
WHERE email ILIKE '%gmail.com';

-- Retrieve the address of the customers and the order IDs for all orders that were placed in 2020
SELECT street, city, state, zipcode, orders.id
FROM Orders
JOIN Customers
ON orders.customers_id = customers.id
JOIN Addresses
ON customers.addresses_id = addresses.id
WHERE orders_date > '2019-12-31'::date and orders_date < '2021-01-01'::date;

-- Retrieve all product details for products that are under the "Kitchen" category
SELECT products.id, name, cost, quantity, categories_id
FROM Products
JOIN Categories
ON products.categories_id = categories.id
WHERE categories_name='Kitchen'

-- Retrieve the product names and prices of all products ordered by the customer with first name "Bugs" and last name "Bunny"
SELECT products.name, products.cost
FROM Products
JOIN Orders
ON products.id = orders.products_id
JOIN customers
ON orders.customers_id = customers.id
WHERE first_name='Bugs' and last_name='Bunny';