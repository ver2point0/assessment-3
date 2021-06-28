-- Seed data goes here

-- Addresses seed data
INSERT INTO Addresses (street, city, state, zipcode) VALUES ('205 Proteus', 'Groton', 'CT', '06340');
INSERT INTO Addresses (street, city, state, zipcode) VALUES ('603 Signer', 'Honolulu', 'HI', '96818');
INSERT INTO Addresses (street, city, state, zipcode) VALUES ('1397 Braden Shoals', 'New Karine', 'NY', '03913');
INSERT INTO Addresses (street, city, state, zipcode) VALUES ('41613 Huel Ranch', 'Loycefort', 'FL', '12109');
INSERT INTO Addresses (street, city, state, zipcode) VALUES ('704 Cecil Mountain', 'West Jon', 'SD', '91578');
INSERT INTO Addresses (street, city, state, zipcode) VALUES ('6232 Guiseppe Courts', 'Jamartown', 'MD', '49028');

-- Category seed data
INSERT INTO Category (category_name) VALUES ('Home');
INSERT INTO Category (category_name) VALUES ('Kitchen');
INSERT INTO Category (category_name) VALUES ('Bedroom');
INSERT INTO Category (category_name) VALUES ('Bathroom');
INSERT INTO Category (category_name) VALUES ('Office');
INSERT INTO Category (category_name) VALUES ('Gym');

-- Product seed data
INSERT INTO Product (name, cost, category_id, quantity) VALUES
('Couch', 10,(SELECT id FROM Category WHERE category_name='Home'), 8),
('Desk', 20,(SELECT id FROM Category WHERE category_name='Home'), 6),
('Dishwasher', 1,(SELECT id FROM Category WHERE category_name='Kitchen'), 7),
('Table', 2,(SELECT id FROM Category WHERE category_name='Kitchen'), 9),
('Dresser', 4,(SELECT id FROM Category WHERE category_name='Bedroom'), 8),
('Stool', 6,(SELECT id FROM Category WHERE category_name='Bedroom'), 10),
('Lotion', 7,(SELECT id FROM Category WHERE category_name='Bathroom'), 3),
('Shampoo', 8,(SELECT id FROM Category WHERE category_name='Bathroom'), 4),
('Scissors', 19,(SELECT id FROM Category WHERE category_name='Office'), 5),
('Pen', 18,(SELECT id FROM Category WHERE category_name='Office'), 1),
('Yoga mat', 17,(SELECT id FROM Category WHERE category_name='Gym'), 3),
('Towel', 17,(SELECT id FROM Category WHERE category_name='Gym'), 2);

-- Customer seed data
INSERT INTO Customer (first_name, last_name, email, phone, addresses_id) VALUES
('Bugs', 'Bunny', 'bbunny@gmail.com', '5555555555', (SELECT id FROM Addresses WHERE city='Groton')),
('Tianna', 'Lowe', 'tlowe@example.com', '6666666666', (SELECT id FROM Addresses WHERE city='Honolulu')),
('Leopold', 'Towne', 'ltowne@gmail.com', '7777777777', (SELECT id FROM Addresses WHERE city='New Karine')),
('Elda', 'Sipes', 'esipes@example.com', '8888888888', (SELECT id FROM Addresses WHERE city='Loycefort')),
('Jed', 'Kunde', 'jkunder@gmail.com', '9999999999', (SELECT id FROM Addresses WHERE city='West Jon')),
('Andre', 'Rohan', 'arohan@example.com', '4444444444', (SELECT id FROM Addresses WHERE city='Jamartown'));

-- Order seed data
INSERT INTO Order (product_id, product_quantity, customer_id, order_date) VALUES
((SELECT id FROM Product WHERE name='Table'), 1, (SELECT id FROM Customer WHERE last_name='Lowe'), '2019-01-01'),
((SELECT id FROM Product WHERE name='Desk'), 1, (SELECT id FROM Customer WHERE last_name='Bunny'), '2020-02-03'),
((SELECT id FROM Product WHERE name='Stool'), 1, (SELECT id FROM Customer WHERE last_name='Towne'), '2021-03-04'),
((SELECT id FROM Product WHERE name='lotion'), 1, (SELECT id FROM Customer WHERE last_name='Kunde'), '2021-04-05'),
((SELECT id FROM Product WHERE name='Pen'), 1, (SELECT id FROM Customer WHERE last_name='Rohan'), '2020-06-07'),
((SELECT id FROM Product WHERE name='Yoga mat'), 1, (SELECT id FROM Customer WHERE last_name='Sipes'), '2019-10-11'),