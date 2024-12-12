-- GreenPages Database

------------------------------------------------------------------------------------------------

-- DERS: 11.12.24

------------------------------------------------------------------------------------------------

-- create table customers

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  country     VARCHAR(50),
  score       INTEGER
);

------------------------------------------------------------------------------------------------

-- Insert customers data

INSERT INTO customers (customer_id, first_name, last_name, country, score) VALUES
(1,'Maria', 'Cramer', 'Germany', 350),
(2,'John', 'Steel', 'USA', 900),
(3,'Georg', 'Pipps', 'UK', 750),
(4,'Martin', 'Müller', 'Germany', 500),
(5,'Peter', 'Franken', 'USA', NULL);

------------------------------------------------------------------------------------------------

-- create table orders

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id    SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date  DATE,
  quantity    INTEGER
);

------------------------------------------------------------------------------------------------

-- create table employees

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
  emp_id      SERIAL PRIMARY KEY,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  emp_country VARCHAR(50),
  salary      INTEGER
);

------------------------------------------------------------------------------------------------

-- DERS: 12.12.24

------------------------------------------------------------------------------------------------

-- SORU: Customer tablosundaki  bütün fieldlari getirin.
-- Select'te * isaretiyle tablodan tüm fieldleri secip getirdik.

SELECT *
FROM customers

------------------------------------------------------------------------------------------------

-- SORU: Customer tablosundan sadece first_name ve country fieldlarini getirin.
-- Sütunlari yazarken araya virgül koymak gerekli

SELECT
	first_name,
	country
FROM customers c

------------------------------------------------------------------------------------------------























