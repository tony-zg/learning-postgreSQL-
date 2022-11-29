-- Create schema

CREATE TABLE customers (
    id INT NOT NULL, 
    first_name STRING, 
    last_name STRING, 
    address  STRING, 
    PRIMARY KEY (id)
)

CREATE TABLE products (
    id INT NOT NULL,
    name STRING,
    price MONEY,
    PRIMARY KEY (id)
)

-- CRUD -----------------------------------------------------------------------------
-- C in CRUD, insert data

INSERT INTO products
VALUES (1, 'Pen', 1.5) -- Create new product 

INSERT INTO products 
VALUES (2, 'Pencil') -- Create another new product
        (3, 'Ruler', 3)

-- CRUD -----------------------------------------------------------------------------
-- R in CRUD, READ, SELECT, and WHERE 

SELECT * FROM products -- Select all items

SELECT name, price FROM products -- Select only name and price

SELECT * FROM products WHERE id = 1  -- Select prodcuts that have id =1

-- CRUD -----------------------------------------------------------------------------
-- U in CRUD, updating single values and adding columns 

UPDATE products --->
SET price = 0.8 --->  Update a particular column 
WHERE id = 2    --->

ALTER TABLE products  ---->
ADD stock INT         ---->  // ADD an extra column in the product table 

-- CRUD -----------------------------------------------------------------------------
-- D in CRUD

DELETE FROM products 
WHERE id = 2

 -----------------------------------------------------------------------------
-- FOREIGN KEY 
CREATE TABLE orders (
    id INT NOT NULL, 
    order_number INT, 
    customer_id INT, 
    product_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id),
    FOREIGN KEY(product_id) REFERENCES products(id) 
)

 -----------------------------------------------------------------------------
--Join tables together 
-- 1. Join orders(from the table which has the foreign key) table and customers table together to create a new table 
--2. Join orders table(from the table which has the foreign key) and product table together to create a new table 

 INSERT INTO customers 
 VALUES (1, 4362, 2, 1)

-- 1
 SELECT orders.order_number, customers.first_name, customers.last_name, customers.address
 From orders
 INNER JOIN customers ON orders.customer_id = customer_id

-- 2
SELECT orders.order_number, products.name, products.price, products.stock
FROM orders
INNER JOIN products ON orders.product_id = products.id