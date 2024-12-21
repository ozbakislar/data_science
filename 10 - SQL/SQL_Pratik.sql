-- DERS: 21.12.24 (Pratik)

------------------------------------------------------------------------------------------------
/*
Bir kütüphanedeki kitaplarin bilgilerini depolamak icin "books" isminde bir tablo olusturun.
Tablo asagidaki sütunlara sahip olmalidir: */

-- book_id (Integer)
-- title (Varchar(80))
-- author (Varchar(50))
-- published_date (Date)
-- genre (Varchar(20))

CREATE TABLE books(
	book_id INTEGER,
	title VARCHAR(80),
	author VARCHAR(50),
	published_date DATE,
	genre VARCHAR(20)
	               )

-- variable ismi olustururken bosluk kullanmiyoruz.

-- "books" tablosuna asagidaki kitap bilgilerini ekleyin:

-- Id: 100
-- Baslik: "Savas ve Baris"
-- Yazar: "Lev Tolstoy"
-- Yayinlanma Tarihi: "1869-01-01"
-- Tür: "Roman"

INSERT INTO books VALUES (100, 'Savas ve Baris', 'Lev Tolstoy', '1869-01-01', 'Roman');

SELECT *
FROM books
/*
"books" tablosuna asagidaki kitaplarin bilgilerini ekleyin:

Kitap 1:

İd: 101
Baslik: "1984"
Yazar: "George Orwell"
Yayinlama Tarihi: "1949-06-08"
Tür: "Distopya"

Kitap 2:

İd: 102
Baslik: "Bülbülü Öldürmek"
Yazar: "Harper Lee"
Yayinlanma Tarihi: "1960-07-11"
Tür: "Roman"

Kitap 3:

İd:103
Baslik: "Yabanci"
Yazar: "Albert Camus"
Yayinlanma Tarihi: "1942-01-01"
Tür: "Roman" */

-- 1. yol

INSERT INTO books VALUES(101, '1984', 'George Orwell', '1949-06-08', 'Distopya');
INSERT INTO books VALUES(102, 'Bülbülü Öldürmek', 'Harper Lee', '1960-07-11', 'Roman');
INSERT INTO books VALUES(103, 'Yabanci', 'Albert Camus', '1942-01-01', 'Roman');

-- 2. yol

INSERT INTO books VALUES(101, '1984', 'George Orwell', '1949-06-08', 'Distopya'),
                        (102, 'Bülbülü Öldürmek', 'Harper Lee', '1960-07-11', 'Roman'),
                        (103, 'Yabanci', 'Albert Camus', '1942-01-01', 'Roman');
/*
"books" tablosuna yalnizca 

Baslik: "Suç ve Ceza"
Yazar: "Fyodor Dostoyevski"  

Baslik: "Martin Eden"
Yazar: "Jack London"
Tür: "Roman" 

alanlarini iceren yeni kitap bilgilerini ekleyin. Diger alanlar icin varsayilan degerler kullanilmalidir. */

INSERT INTO books(title, author) VALUES('Suc ve Ceza', 'Fyodor Dostoyevski');

INSERT INTO books(title, author, genre) VALUES('Martin Eden', 'Jack London', 'Roman');

SELECT *
FROM books

------------------------------------------------------------------------------------------------
/*
Ögrenci bilgileri icin bir tablo (students) olusturun.

student_id (Primary Key, integer, otomatik artan)
first_name (Metin 50 karakter, Null olamaz)
last_name (Metin 30 karakter, Null olamaz)
date_of_birth (Tarih, Null olamaz)
email (Metin 50 karakter, Null olamaz, benzersiz)
phone_number (Metin 15 karakter)
gender (Metin 8 karakter, 'male' veya 'female' olmali) */

CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	date_of_birth DATE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	phone_number CHAR(15),
	gender VARCHAR(8) CHECK (gender IN ('male', 'female'))
                      );

SELECT *
FROM students

-- ERROR -> first name null olamaz!

INSERT INTO students(last_name, date_of_birth, email, phone_number, gender) 
VALUES ( 'Doe', '1998-05-15', 'john@example.com', '555-1234', 'male');

-- Works

INSERT INTO students(first_name, last_name, date_of_birth, email, phone_number, gender) 
VALUES ('John', 'Doe', '1998-05-15', 'john@example.com', '555-1234', 'male');

-- ERROR -> phone too long

INSERT INTO students(first_name, last_name, date_of_birth, email, phone_number, gender) 
VALUES ('Jane', 'Smith', '2000-08-22', 'jane@example.com', '555-567978675646458', 'female');

-- Works

INSERT INTO students(first_name, last_name, date_of_birth, email, phone_number, gender) 
VALUES ('Jane', 'Smith', '2000-08-22', 'jane2@example.com', '555-567', 'female');

-- ERROR -> last name bos olamaz not null!

INSERT INTO students(first_name, date_of_birth, email, phone_number, gender) 
VALUES ('Michael', '1999-03-30', 'michael@example.com', '555-9876', 'male');

-- Works 

INSERT INTO students(first_name, last_name, date_of_birth, email, phone_number, gender) 
VALUES ('Michael', 'Jackson', '1999-03-30', 'michael@example.com', '555-9876', 'male');

-- Error -> duplicate key value

INSERT INTO students 
VALUES(3, 'Kevin', 'Garcia', '1999-05-30', 'kevin@example.com', '555-2222', 'male');

-- Works

INSERT INTO students 
VALUES(DEFAULT, 'Kevin', 'Garcia', '1999-05-30', 'kevin6@example.com', '555-2222', 'male');
/*
Serial'da üretilen otomatik sayilari kullanmak icin DEFAULT keywordu kullanilabilir. 
Bu sekilde field isimleri tablo isminden sonra yazilmaya gerek duyulmadan data eklenebilir. */

------------------------------------------------------------------------------------------------
/*
Bir ögrencinin adres bilgilerini depolayan bir tablo (student_address) olusturun.
Bu tablo, her ögrenci icin yalnizca bir tane adres bilgisine sahip olacak. Tablonun asagidaki
sütunlara sahip olması gerekiyor:

address_id (Primary Key, integer, otomatik artan)
student_id (Öğrenci tablosuna referans, NULL olamaz)
city (Varchar(50))
country (Varchar(15)) */

CREATE TABLE student_address(
address_id SERIAL PRIMARY KEY,
student_id INTEGER,
city VARCHAR(50),
country VARCHAR(15),
FOREIGN KEY(student_id) REFERENCES students(student_id)
                            );

SELECT *
FROM student_address