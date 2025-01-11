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

CREATE TABLE Cats (
    CatID INT PRIMARY KEY,
    Name VARCHAR(50),
    Breed VARCHAR(50),
    Color CHAR(20),
    Age INT,
    Weight FLOAT
				  );

INSERT INTO Cats (CatID, Name, Breed, Color, Age, Weight) VALUES
(1, 'Whiskers', 'Persian', 'White', 5, 8.2),
(2, 'Luna', 'Siamese', 'Brown', 3, 6.5),
(3, 'Simba', 'Maine Coon', 'Orange', 4, 10.1),
(4, 'Mittens', 'Tabby', 'Gray', 2, 4.9),
(5, 'Oreo', 'Domestic Shorthair', 'Black and White', 1, 3.7),
(6, 'Tiger', 'Bengal', 'Striped', 6, 12.3),
(7, 'Pink', 'Maine Coon', 'Pink', 5, 10.2),
(8, 'Milo', 'Tabby', 'Orange', 2, 5.2),
(9, 'Loki', 'Siamese', 'Gray', 3, 6.7),
(10, 'Bella', 'Maine Coon', 'Brown', 5, 9.4),
(11, 'Shadow', 'Domestic Shorthair', 'Black', 1, 4.1);

SELECT * FROM Cats;

CREATE TABLE Owners (
    CatID INT PRIMARY KEY,
    Breed VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    OwnerName VARCHAR(100),
    OwnerAge INT
					);

INSERT INTO Owners (CatID, Breed, City, State, OwnerName, OwnerAge) VALUES
(1, 'Persian', 'New York', 'NY', 'Alice', 34),
(2, 'Maine Coon', 'Los Angeles', 'CA', 'Bob', 29),
(3, 'Tabby', 'Chicago', 'IL', 'Charlie', 41),
(4, 'Siamese', 'Houston', 'TX', 'Diana', 26),
(5, 'Domestic Shorthair', 'Phoenix', 'AZ', 'Evan', 38),
(6, 'Persian', 'San Francisco', 'CA', 'Fiona', 32),
(7, 'Tabby', 'Seattle', 'WA', 'George', 27),
(8, 'Maine Coon', 'Miami', 'FL', 'Hannah', 35),
(9, 'Siamese', 'Atlanta', 'GA', 'Ivy', 24),
(10, 'Domestic Shorthair', 'Boston', 'MA', 'Jack', 30);

-- SORU: Persian cinsi bir kediye sahip olan kullanicilarin eyaletini getiren bir SQL sorgusu yazin.

SELECT
	state
FROM
	owners
WHERE breed = 'Persian'

-- SORU: New York'ta yasayan kullanicilarin sahip oldugu kedilerin isimlerini getiren bir SQL sorgusu yazin.

SELECT name
FROM cats
WHERE
	Breed IN
	(
	SELECT
		Breed
	FROM
		owners
	WHERE
		city = 'New York'
	)
/*
SORU: Cats tablosundaki her bir kedinin Breed ve Name bilgilerini, ayrica sahibinin yasadigi City bilgisini
de getiren, CatID ile Owners tablosundaki eslesmeyi saglayan bir alt sorgu kullanarak getirin. */
	
SELECT 
	Name,
	Breed, 
	(
	SELECT city
	FROM owners o 
	WHERE o.catid = c.catid
	)
FROM cats c
/*
SORU: California'da yasayan kullanicilarin sahip oldugu kedilerin ortalama yasini hesaplayan bir SQL
sorgusu yazin. */

-- Subquery ile

SELECT
	avg(age) AS average_age
FROM cats c
WHERE catid IN
	(
	SELECT catid
	FROM owners o
	WHERE state = 'CA'
	)
	
-- JOIN ile
	
SELECT
	avg(age) avg_age
FROM cats c JOIN owners o 
ON c.catid =o.catid 
WHERE o.state ='CA'

------------------------------------------------------------------------------------------------

CREATE TABLE clients (
    id int,
    name VARCHAR(50),
    city VARCHAR (50),
    salary int,
    company VARCHAR (20)
					 );

INSERT INTO clients VALUES (123456789, 'Ali Şeker', 'İstanbul', 2500, 'Vakko'); 
INSERT INTO clients VALUES (234567890, 'Ayşe Gül', 'İstanbul', 1500, 'LCWaikiki'); 
INSERT INTO clients VALUES (345678901, 'Veli Yılmaz', 'Ankara', 3000, 'Vakko'); 
INSERT INTO clients VALUES (456789012, 'Veli Yılmaz', 'İzmir', 1000, 'Pierre Cardin'); 
INSERT INTO clients VALUES (567890123, 'Veli Yılmaz', 'Ankara', 7000, 'Adidas'); 
INSERT INTO clients VALUES (456789012, 'Ayşe Gül', 'Ankara', 1500, 'Pierre Cardin'); 
INSERT INTO clients VALUES (123456710, 'Fatma Yaşa', 'Bursa', 2500, 'Vakko');

SELECT * FROM clients;

CREATE TABLE brands (
	brand_id int,
	brand_name VARCHAR (20), 
	employee_number int
					);

INSERT INTO brands VALUES (100, 'Vakko', 12000);
INSERT INTO brands VALUES (101, 'Pierre Cardin', 18000);
INSERT INTO brands VALUES (102, 'Adidas', 10000);
INSERT INTO brands VALUES (103, 'LCWaikiki', 21000); 
INSERT INTO brands VALUES (104, 'Nike', 19000);

SELECT * FROM brands;

-- SORU: brand_id 101'den büyük olan kayitlarin id, isim, maas ve sehir alanlarini getirin.

-- Subquery ile

SELECT 
	name, salary, city, 
	(
	SELECT brand_id 
	FROM brands b 
	WHERE b.brand_name = c.company
	)
FROM clients c 
WHERE company IN 
	(
	SELECT brand_name 
	FROM brands b 
	WHERE brand_id > 101
	)

-- JOIN ile

SELECT c.name,
	c.salary,
	c.city,
	b.brand_id
FROM clients c
JOIN brands b
ON b.brand_name = c.company
WHERE b.brand_id > 101
/*
SORU: Calisan sayisi 15000'den büyük olan markalarin adlarini ve bu markalar icin calisan kisilerin isimlerini
maaslarini ve calisan kisi sayisini getirin. */

SELECT name, salary, company,
	(
	SELECT employee_number 
	FROM brands b
	WHERE b.brand_name = c.company
	)
FROM clients c 
WHERE company IN 
	(
	SELECT brand_name 
	FROM brands b
	WHERE employee_number > 15000
	)
	
------------------------------------------------------------------------------------------------
	
CREATE TABLE workers (
	worker_id SMALLINT, 
	worker_name VARCHAR(50), 
	worker_salary NUMERIC,
	CONSTRAINT Worker_id_pk PRIMARY KEY (worker_id)
					 );
	
INSERT INTO workers VALUES (101, 'Tom Hanks', 12000); 
INSERT INTO workers VALUES (102, 'Brad Pitt', 2000);
INSERT INTO workers VALUES (103, 'Aisha Can', 7000);
INSERT INTO workers VALUES (104, 'Angie Ocean', 12000);

SELECT * FROM workers;

-- SORU: Mevcut bir tabloya bir field (alan) - worker_address - ekleyin.

ALTER TABLE workers ADD worker_address Varchar(50)

-- SORU: Varsayilan bir deger ile nasil bir field (alan) - employee_adress - ekleyin.

ALTER TABLE workers ADD employee_address TEXT DEFAULT 'New York, California, Ohio'

-- SORU: Bir field ekleyin tabloya, field adi company_name, default degeri Techpro Education olsun.	

ALTER TABLE workers ADD company_name TEXT DEFAULT 'Techpro Education'

-- SORU: Birden fazla alan ekleyin - zip code, city -.

ALTER TABLE workers 
ADD zip_code NUMERIC DEFAULT 10002,
ADD city varchar(40)

-- SORU: Bir tablodan bir alan silin - worker_address -.

ALTER TABLE workers DROP COLUMN worker_address; -- COLUMN olmadan da calisir.

-- SORU: Mevcut bir tablodaki bir alanin adini degistirin - worker_salary -> employee_salary.

ALTER TABLE workers RENAME worker_salary TO employee_salary

-- SORU: Tabloyu yeniden isimlendirin - workers -> w_employee -.

ALTER TABLE workers RENAME TO w_employee

-- SORU: worker_name'e kisitlayici olarak not null atayin.

ALTER TABLE w_employee ALTER COLUMN worker_name SET NOT NULL

-- SORU: employee_salary field'ina unique degerler ekleyin.

UPDATE w_employee SET employee_salary = 20000
WHERE worker_name = 'Angie Ocean'

ALTER TABLE w_employee ADD CONSTRAINT e_salary_unique
UNIQUE (employee_salary)

-- SORU: worker_name field'inin dtype'ini char yapin.

ALTER TABLE w_employee
ALTER COLUMN worker_name TYPE char(60)

-- SORU: company_name field'inin dtype'ini varchar yapin.

ALTER TABLE w_employee
ALTER COLUMN company_name TYPE varchar(60)

-- SORU: worker_name'deki not null'i silin.

ALTER TABLE w_employee
ALTER COLUMN worker_name
DROP NOT NULL

------------------------------------------------------------------------------------------------

CREATE TABLE Flights (
    FlightID CHAR(3),
    FlightNumber VARCHAR(10),
    DepartureCity VARCHAR(20),
    ArrivalCity VARCHAR(20)
					 );

INSERT INTO Flights VALUES ('101', 'F123', 'New York', 'London');
INSERT INTO Flights VALUES ('102', 'F124', 'Tokyo', 'Paris');
INSERT INTO Flights VALUES ('103', 'F125', 'Dubai', 'Sydney');
INSERT INTO Flights VALUES ('104', 'F126', 'Berlin', 'Madrid');
INSERT INTO Flights VALUES ('105', 'F127', 'Rome', 'Cairo');
INSERT INTO Flights VALUES ('106', 'F128', 'Moscow', 'Beijing');
SELECT * FROM Flights;

SELECT * FROM Flights;

CREATE TABLE Passengers (
    PassengerID CHAR(3),
    PassengerName VARCHAR(30),
    PassportNumber VARCHAR(10),
    FlightID CHAR(3)
						);

INSERT INTO Passengers VALUES ('201', 'John Doe', 'A12345', '101');
INSERT INTO Passengers VALUES ('202', 'Jane Smith', 'B67890', '102');
INSERT INTO Passengers VALUES ('203', 'Alice Johnson', 'C11223', '103');
INSERT INTO Passengers VALUES ('204', 'Bob Brown', 'D45678', '101');
INSERT INTO Passengers VALUES ('205', 'Charlie Black', 'E98765', '102');
INSERT INTO Passengers VALUES ('206', 'Dana White', 'F23456', '103');
INSERT INTO Passengers VALUES ('207', 'Eve Green', 'G34567', NULL);
INSERT INTO Passengers VALUES ('208', 'Frank Blue', 'H45678', NULL);
INSERT INTO Passengers VALUES ('209', 'Grace Pink', 'I56789', '107');
INSERT INTO Passengers VALUES ('210', 'Henry Silver', 'J67890', '108'); 
INSERT INTO Passengers VALUES ('211', 'Ivy Purple', 'K78901', '109'); 
INSERT INTO Passengers VALUES ('212', 'Jake Yellow', 'L89012', '110'); 

SELECT * FROM Passengers;

-- SORU: INNER JOIN kullanarak hangi yolcularin hangi ucusta oldugunu bulun.

SELECT
	f.flightid,
	flightnumber,
	arrivalcity,
	p.passengername
FROM flights f
INNER JOIN passengers p
ON f.flightid = p.flightid

-- SORU: LEFT JOIN kullanarak henüz ucusu olmasa bile tüm yolculari döndürün.

SELECT
	p.flightid,
	f.flightnumber,
	f.arrivalcity,
	p.passengername
FROM passengers p LEFT JOIN flights f
ON f.flightid = p.flightid

-- SORU: RIGHT JOIN kullanarak hic yolcu rezerve edilmemis olsa bile tüm ucuslari döndürün.

SELECT 
    f.flightid, 
    f.flightnumber,
    f.arrivalcity,
    p.passengername,
    p.passportnumber 
FROM passengers p RIGHT JOIN flights f 
ON f.flightid = p.flightid

------------------------------------------------------------------------------------------------

CREATE TABLE Airports (
    airport_id CHAR(2),
    airport_name VARCHAR(30),
    city VARCHAR(30),
    country VARCHAR(30),
    connected_airport_id CHAR(2) 
					   );

INSERT INTO Airports VALUES ('A1', 'JFK Airport', 'New York', 'USA', 'A2');
INSERT INTO Airports VALUES ('A2', 'Heathrow Airport', 'London', 'UK', 'A3');
INSERT INTO Airports VALUES ('A3', 'Charles de Gaulle', 'Paris', 'France', 'A4');
INSERT INTO Airports VALUES ('A4', 'Schiphol Airport', 'Amsterdam', 'Netherlands', 'A5');
INSERT INTO Airports VALUES ('A5', 'Frankfurt Airport', 'Frankfurt', 'Germany', NULL);

SELECT * FROM Airports;

-- Hangi havalimanlarinin birbirine bagli oldugunu bulmak icin asagidaki sorguyu yazariz.

SELECT
	a1.airport_id,
	a1.airport_name,
	a2.airport_name AS connected_airport
FROM
	airports a1 INNER JOIN airports a2
ON
	a1.connected_airport_id = a2.airport_id




























