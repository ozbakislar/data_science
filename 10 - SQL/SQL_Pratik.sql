-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- SQL_Pratik

------------------------------------------------------------------------------------------------

-- DERS: 21.12.24

------------------------------------------------------------------------------------------------
/*
Bir kütüphanedeki kitaplarin bilgilerini depolamak icin "books" isminde bir tablo olusturun.
Tablo asagidaki sütunlara sahip olmalidir: */

-- book_id (integer)
-- title (varchar(80))
-- author (varchar(50))
-- published_date (date)
-- genre (varchar(20))

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

Baslik: "Suc ve Ceza"
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
Serial'da üretilen otomatik sayilari kullanmak icin DEFAULT keyword'u kullanilabilir. 
Bu sekilde field isimleri tablo isminden sonra yazilmaya gerek duyulmadan data eklenebilir. */

------------------------------------------------------------------------------------------------
/*
Bir ögrencinin adres bilgilerini depolayan bir tablo (student_address) olusturun.
Bu tablo, her ögrenci icin yalnizca bir tane adres bilgisine sahip olacak. Tablonun asagidaki
sütunlara sahip olması gerekiyor:

address_id (Primary Key, integer, otomatik artan)
student_id (Öğrenci tablosuna referans, NULL olamaz)
city (varchar(50))
country (varchar(15)) */

CREATE TABLE student_address(
address_id SERIAL PRIMARY KEY,
student_id INTEGER,
city VARCHAR(50),
country VARCHAR(15),
FOREIGN KEY(student_id) REFERENCES students(student_id)
                            );

-- students -- PK -- parent
-- student_address -- FK(references PK) -- child
							
SELECT *
FROM student_address

INSERT INTO student_address VALUES (DEFAULT, 2, 'New York', 'USA'),
(DEFAULT, 3, 'Paris', 'FR'),
(DEFAULT, 4, 'London', 'UK'),
(DEFAULT, 5, 'Amsterdam', 'NL');

--Önemli olan FK'lerin parent tabloda student id field'i altinda olmasi 
--Parent'ta PK olarak kullanilmamis bir id'i FK olarak kullanamayiz.

------------------------------------------------------------------------------------------------

-- teachers tablosu olusturup kayitlari ekleyin.

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER DEFAULT 0,
    email VARCHAR(100)
                      );
					  
INSERT INTO teachers (name, age, email) VALUES
('John Doe', 25, 'john.doe@example.com'),
('Jane Smith', 30, 'jane.smith@example.com'),
('Michael Brown', 28, 'michael.brown@example.com'),
('Emily Johnson', 22, 'emily.johnson@example.com'),
('David Lee', 35, 'david.lee@example.com'),
('Maria Garcia', 27, 'maria.garcia@example.com'),
('Christopher Martinez', 29, 'christopher.martinez@example.com'),
('Sarah White', 26, 'white@example.com'),
('James Taylor', 31, 'james.taylor@example.com'),
('Jennifer Adams', 33, 'jennifer.adams@example.com'),
('Daniel Hernandez', 28, 'daniel.hernandez@example.com'),
('Amanda Thomas', 24, 'amanda.thomas@example.com'),
('Robert White', 32, 'white@example.com'),
('Megan Scott', 29, 'scott@example.com'),
('Kevin Scott', 27, 'scott@example.com');

SELECT * FROM teachers;

-- teachers tablosundaki kayitlari isimlere göre alfabetik olarak siralayin.

SELECT *
FROM teachers
ORDER BY name ASC

-- teachers tablosundaki kayitlari yasa göre azalan olarak siralayin.

SELECT *
FROM teachers
ORDER BY age DESC

-- teachers tablosundaki kayitlari önce email'e göre artan, sonra yasa göre azalan siralayin.

SELECT *
FROM teachers
ORDER BY email ASC, AGE DESC

-- teachers tablosundaki kayitlari ismin uzunluguna göre azalan siralayin.

SELECT *,
	LENGTH(name) as name_length
FROM teachers
ORDER BY LENGTH(name) DESC

-- Yasi 25'ten kücük olan ögretmenlerin email ve yaslarini listeleyin.

SELECT email, age
FROM teachers
WHERE age < 25

-- Yasi en büyük olan 5 egitmeni siralayin.

SELECT *
FROM teachers
ORDER BY age DESC
LIMIT 5

-- Yasi en kücük olan 4. ve 5. egitmeni siralayin.

SELECT *
FROM teachers
ORDER BY age ASC
OFFSET 3
LIMIT 2 -- FETCH NEXT 2 ROWS ONLY

------------------------------------------------------------------------------------------------

CREATE TABLE personal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER,
    city VARCHAR(50),
    email VARCHAR(100),
    salary NUMERIC(10, 2),
    department VARCHAR(50)
                       );

INSERT INTO personal (name, age, city, email, salary, department) VALUES
('John Doe', 25, 'New York', 'john.doe@example.com', 60000, 'IT'),
('Jane Smith', 30, 'London', 'jane.smith@example.com', 75000, 'Finance'),
('Michael Brown', 28, 'Paris', 'michael.brown@example.com', 50000, 'HR'),
('Emily Johnson', 22, 'Berlin', 'emily.johnson@example.com', 45000, 'Marketing'),
('David Lee', 35, 'Tokyo', 'david.lee@example.com', 85000, 'IT'),
('Maria Garcia', 27, 'Moscow', 'maria.garcia@example.com', 55000, 'Sales'),
('Christopher Martinez', 29, 'Sydney', 'christopher.martinez@example.com', 65000, 'Finance'),
('Sarah Wilson', 26, 'Tokyo', 'sarah.wilson@example.com', 48000, 'HR'),
('James Taylor', 31, 'London', 'james.taylor@example.com', 70000, 'IT'),
('Jennifer Adams', 33, 'New York', 'jennifer.adams@example.com', 72000, 'Marketing'),
('Maria Darlin', 26, 'Moscow', 'maria.darlin@example.com', 55000, 'Sales'),
('Rod Johnson', 28, 'Berlin', 'rod.johnson@example.com', 45000, 'Marketing');

SELECT * FROM personal;

-- Tüm calisanlarin toplam maasini bulun.

SELECT
	sum(salary) AS toplam_maas
FROM personal

-- Tüm calisanlarin ortalama maasini bulun.

SELECT
	ROUND(avg(salary), 2) AS avg_maas
FROM personal

-- IT departmanindaki en yüksek maasi bulun.

SELECT
	max(salary) AS max_maas
FROM personal
WHERE department = 'IT'

-- New York, Berlin veya Tokyo'da calisanlarin sayisini bulun.

SELECT
	count(*) AS total
FROM personal
WHERE city IN ('New York', 'Berlin', 'Tokyo');