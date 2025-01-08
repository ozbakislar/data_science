-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- Pratik SQL

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

CREATE TABLE books (
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

INSERT INTO books VALUES (101, '1984', 'George Orwell', '1949-06-08', 'Distopya');
INSERT INTO books VALUES (102, 'Bülbülü Öldürmek', 'Harper Lee', '1960-07-11', 'Roman');
INSERT INTO books VALUES (103, 'Yabanci', 'Albert Camus', '1942-01-01', 'Roman');

-- 2. yol

INSERT INTO books VALUES (101, '1984', 'George Orwell', '1949-06-08', 'Distopya'),
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

INSERT INTO books(title, author) VALUES ('Suc ve Ceza', 'Fyodor Dostoyevski');

INSERT INTO books(title, author, genre) VALUES ('Martin Eden', 'Jack London', 'Roman');

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

CREATE TABLE students (
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

CREATE TABLE student_address (
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

------------------------------------------------------------------------------------------------

-- DERS: 04.01.25

------------------------------------------------------------------------------------------------

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER,
    city VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    department VARCHAR(50)
                        );

INSERT INTO employees (name, age, city, email, phone_number, department) VALUES
('John Doe', 25, 'New York', 'john.doe@example.com', '555-1234', 'IT'),
('Jane Smith', 30, 'London', 'jane.smith@example.com', '555-5678', 'Finance'),
('Michael Brown', 28, 'Paris', 'michael.brown@mail.com', '555-9876', 'HR'),
('Emily Johnson', 22, 'Berlin', 'emily.johnson@example.com', '555-2222', 'Marketing'),
('David Lee', 35, 'Tokyo', 'david.lee@mail.com', '555-4444', 'IT'),
('Maria Garcia', 27, 'Moscow', 'garcia@mail.com', '555-7777', 'Sales'),
('Christopher Martinez', 29, 'Sydney', 'christopher.martinez@example.com', '555-6666', 'Finance'),
('Sarah White', 26, 'Toronto', 'white@example.com', '555-8888', 'HR'),
('James Taylor', 31, 'Los Angeles', 'james.taylor@example.com', '555-3333', 'IT'),
('Jennifer Adams', 33, 'Rome', 'jennifer.adams@example.com', '555-1111', 'Marketing'),
('Daniel Hernandez', 28, 'Seoul', 'daniel.hernandez@example.com', '555-9999', 'Sales'),
('Amanda Thomas', 24, 'Rio de Janeiro', 'amanda.thomas@example.com', '555-5555', 'Finance'),
('Robert White', 32, 'Mumbai', 'white@example.com', '555-4444', 'IT'),
('Megan Scott', 29, 'Cairo', 'megan.scott@example.com', '555-7777', 'Sales'),
('Kevin Garcia', 27, 'Mexico City', 'garcia@mail.com', '555-2222', 'Marketing');

INSERT INTO employees (name, age, city, email, phone_number, department) VALUES 
('melisa johnson', 27, 'Mexico City', 'melisa@MAIL.COM', '555-2222', 'Marketing')

SELECT * FROM employees

-- SORU: Her e-mail adresini bir kere yazdirarak getirin.

SELECT DISTINCT (email) FROM employees

-- SORU: employees tablosundaki ilk 5 kaydi görüntüleyin.

SELECT * FROM employees e LIMIT 5

-- SORU: employees tablosundaki 6. kayittan itibaren 5 kaydi görüntüleyin.

SELECT * FROM employees e LIMIT 5 OFFSET 5

SELECT * FROM employees e OFFSET 5 LIMIT 5 -- OFFSET'e özel bir durum basta da sonda da calisir.

-- SORU: employees tablosundaki son 3 kaydi (id'ye göre) görüntüleyin.

SELECT * FROM employees e ORDER BY id DESC LIMIT 3

-- SORU: employees tablosundaki departmani 'IT' olan calisanlari görüntüleyin.

SELECT * FROM employees e WHERE department = 'IT'

-- SORU: employees tablosundaki yasi 25'den kücük veya sehri 'Rome' olan calisanlari görüntüleyin.

SELECT * FROM employees e WHERE age < 25 OR city = 'Rome'

-- SORU: employees tablosundaki departmani 'Sales', 'HR' veya 'IT' olan calisanlari görüntüleyin.

SELECT * FROM employees e WHERE department IN ('Sales', 'HR', 'IT')

-- SORU: employees tablosundaki departmani 'Sales', 'HR' veya 'Finance' olan calisanlari görüntüleyin.

SELECT * FROM employees e WHERE department NOT IN ('Sales', 'HR', 'Finance')

-- SORU: employees tablosundaki yasi 25 ve 30 arasinda olan calisanlarin isim ve yaslarini between ile görüntüleyin.

SELECT * FROM employees e WHERE age BETWEEN 25 AND 30

-- SORU: employees tablosundaki yasi 25'ten kücük veya 30'dan büyük olan calisanlarin isim ve yaslarini görüntüleyin.

SELECT * FROM employees e WHERE age NOT BETWEEN 25 AND 30

SELECT * FROM employees e WHERE age <25 OR age > 30 -- BETWEEN'siz cözüm
/*
wildcard -> LIKE

	_ -> Tek karakter
	% -> Coklu karakter
	
regex -> ~

	. -> Tek karakter
	(.*) -> Coklu karakter
	^ -> Birincil karakter, degil
	$ -> Sonuncu karakter */
/*
SORU: employees tablosundaki email alanini 'mail.com' ile biten calisanlarin isim ve emaillerini
isme göre artan görüntüleyin. */

SELECT name, email FROM employees e WHERE email LIKE '%mail.com' ORDER BY name -- wildcard ile cözüm

SELECT name, email FROM employees e WHERE email ~ '(.*)mail.com' ORDER BY name -- regex ile cözüm

-- SORU: employees tablosundaki ismi 'an' hecesini iceren calisanlarin isimlerini görüntüleyin.

SELECT name, email FROM employees e WHERE email LIKE '%an%' -- wildcard ile cözüm

SELECT name FROM employees e WHERE name ~ 'an' -- regex ile cözüm

-- SORU: employees tablosundaki isminin 2. harfi 'a' 3. harfi 'n' olan calisanlarin isimlerini görüntüleyin.

SELECT name FROM employees e WHERE name LIKE '_an%' -- wildcard ile cözüm

SELECT name FROM employees e WHERE name ~ '.an' -- regex ile cözüm (Hatali cözüm)
/*
Bu kodda an iceren tüm isimleri döndürür, sadece önünde bir karakter daha oldugundan emin olur ama
ilk karakter olup olmamasi önemli degildir. */

SELECT name FROM employees e WHERE name ~ '^.an(.*)' -- regex ile cözüm
/*
Bu kodda ^ isareti ile birinci karakterden basladigimizi kontrol ettik, böylelikle . 1., a 2. n 3.
karaktere denk gelmis oldu. */
/*
SORU: employees tablosundaki e-posta adresi 'john' ile baslayanlari wildcard ile, 'jane' ile baslayanlari ise
regex ile silin. */

DELETE FROM employees WHERE email LIKE 'john%' -- wildcard ile cözüm

DELETE FROM employees WHERE email ~ '^jane' -- regex ile cözüm

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

-- SORU: Tüm calisanlarin adlarini büyük harfle görüntüleyin.

SELECT upper(name) FROM personal

-- SORU: Tüm calisanlarin adlarini oldugu gibi, emaillerini ise kücük harfle görüntüleyin.

SELECT name, lower(email) FROM personal

-- SORU: Tabloda IT yerine 'Information Technology' yazin.

SELECT name, REPLACE(department, 'IT', 'Information Technology') FROM personal

-- SORU: Isim ve sehir alanlarini ayni sütunda listeleyin.

SELECT concat(name, ' ', city) AS people_from FROM personal

-- SORU: e-posta adreslerinde '@example.com' alan adini '@company.com' ile degistirerek görüntüleyin.

SELECT name, REPLACE(email, '@example.com', '@company.com') FROM personal

-- SORU: Her bir departmandaki ortalama maasi görüntüleyin.

SELECT round(avg(salary), 2) avg_salary, department FROM personal GROUP BY department

-- SORU: Ortalama maasi 60.000'in üzerindeki departmanlari görüntüleyin.

SELECT department, avg(salary) FROM personal GROUP BY department HAVING avg(salary) > 60000
/*
Yasi 30'dan kücük olan calisanlarin departmanlarini eger departmanin ortalama maasi 60.000'in
üzerindeyse görüntüleyin. */

SELECT avg(salary), department FROM personal WHERE age < 30 GROUP BY department HAVING avg(salary) > 60000

-- SORU: John Doe adli calisanin maasini 65000 olarak güncelleyin.

UPDATE personal SET salary = 65000 WHERE name = 'John Doe'

SELECT * FROM personal
/*
SORU: employees tablosunda 'Mexico City' sehrinde bulunan ve 'Marketing 'departmaninda calisanlarin
departmanini 'Sales' olarak degistirin. */

UPDATE employees SET department = 'Sales' WHERE city = 'Mexico City' AND department = 'Marketing'

SELECT * FROM employees e

-- SORU: personal tablosunda 'IT' departmaninda calisanlarin maasini %10 arttirin.

UPDATE personal SET salary = salary * 1.1 WHERE department = 'IT'

SELECT * FROM personal

-- SORU: employees tablosunda e-postasi büyük harf iceren calisanlarin e-posta adreslerini kücük harfe cevirin.

UPDATE employees SET email = lower(email)

SELECT * FROM employees e

-- SORU: personal tablosunda 30 yasindan büyük ve 'New York' sehrinde bulunan calisanlarin maasini 5000 arttirin.

UPDATE personal SET salary = salary + 5000 WHERE age > 30 AND city = 'New York'

SELECT * FROM personal

-- SORU: employees tablosunda 'personal' tablosunda bulunmayan kayitlar icin departmani 'Unknown' olarak ayarlayin.

UPDATE employees SET department = 'Unknown' WHERE NOT EXISTS (SELECT 1 FROM personal WHERE personal.name = employees.name)

SELECT * FROM employees e

-- SORU: personal tablosunda employees tablosunda bulunan ve 'Finance' departmaninda calisanlarin maasini 2000 arttirin.

UPDATE personal SET salary = salary + 2000 WHERE name IN (SELECT name FROM employees WHERE department = 'Finance')

SELECT * FROM personal

-- SORU: employees tablosunda, yasi tüm calisanlarin yas ortalamasindan düsük olan calisanlarin adlarina ' - Updated' ekleyin.

UPDATE employees SET name = name ||' - Updated' WHERE age < (SELECT avg(age) FROM employees)

SELECT * FROM employees e

------------------------------------------------------------------------------------------------

-- DERS: 11.01.25

------------------------------------------------------------------------------------------------




























