DROP DATABASE IF EXISTS products_DB;

CREATE DATABASE products_DB;

USE products_DB;

CREATE TABLE products
(
    id INT NOT NULL
    AUTO_INCREMENT,
    product_name VARCHAR
    (45) NULL,
    department_name VARCHAR
    (45) NULL,
    price DECIMAL
    (10,2) NULL,
    stock_quantitiy INT NULL,
    PRIMARY KEY
    (id)
);

    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Brisket","Meat",30.00,
    15
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Chicken","Meat",
    15.00,
    13
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Pork","Meat",
    20.00,
    11
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Turkey","Meat",
    12.00,
    5
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Broccoli","Veggies",
    2.50,
    30
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Lettuce","Veggies",3.00,
    8
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Carrots","Veggies",
    1.00,
    10
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Apples","Fruit",
    .50,
    2
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Grapes","Fruit",
    2.00,
    20
    );
    INSERT INTO products
        (product_name, department_name, price, stock_quantitiy)
    VALUE
    ("Bananas","Fruit",
    4.00,
    15
    );