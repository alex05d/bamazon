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

