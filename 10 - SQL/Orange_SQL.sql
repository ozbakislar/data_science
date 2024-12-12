-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- OrangePages Database

------------------------------------------------------------------------------------------------

-- DERS: 12.12.24

------------------------------------------------------------------------------------------------

-- Tekli yorum satiri icin "--" kullanilir.

/*
 * coklu
 * yorum
 * satiri icin /*.......*/   arasina yazabiliriz.
 */

------------------------------------------------------------------------------------------------

/* SORU: students isimli bir table olusturun. Bu table'da student_id, first_name,
         last_name, birth_date ve department olsun. (Data tiplerini uygun sekilde seciniz.)
         student_id field'i Primary Key olsun. */

DROP TABLE IF EXISTS students;
CREATE TABLE students (
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_date DATE,
	department VARCHAR(50)
);

SELECT *
FROM students

------------------------------------------------------------------------------------------------

-- SORU: 5 Mayis 2000 dogumlu John Doe isimli ve Computer Science departmaninda calisan kisiyi ekleyelim.

INSERT INTO students (first_name, last_name, birth_date, department) VALUES
('John', 'Doe', '2000-05-15', 'Computer Science');

------------------------------------------------------------------------------------------------

/* SORU: Alttaki girisleri students tablosuna yapiniz:

         Jane Smith, '1999-07-22', Mathematics,

         Emily' Johnson, 2001-03-18, Physics,

         Michael Brown, 1998-12-01, Biology */

INSERT INTO students (first_name, last_name, birth_date, department) VALUES 
('Jane', 'Smith', '1999-07-22', 'Mathematics'),
('Emily', 'Johnson', '2001-03-18', 'Physics'),
('Michael', 'Brown', '1998-12-01', 'Biology');

SELECT *
FROM students s

------------------------------------------------------------------------------------------------

-- Sadece belli field'lara bilgi girisi yapalim.
-- first name: Alice, depart: Chemistry

INSERT INTO students (first_name, department) VALUES
('Alice', 'Chemistry')

------------------------------------------------------------------------------------------------

-- Tablo olusturma

CREATE TABLE ogrenciler(
	ogrenci_no char(7), -- mutlaka 7 karakter yer kaplayacak
	isim varchar(20),
	soyisim varchar(30),
	not_ort REAL, -- ondalıklı sayıları belirtmek için
	kayit_tarihi date
);

SELECT *
FROM ogrenciler o

------------------------------------------------------------------------------------------------

-- Var olan tablodan yeni tablo create etmek (isim, soyisim ve not_ort field'larini kullanarak)

CREATE TABLE ogrenci_notlar
AS
SELECT isim, soyisim, not_ort -- Avantaj: Kriterleri bir öncekinden ceker.
FROM ogrenciler o 

SELECT *
FROM ogrenci_notlar

------------------------------------------------------------------------------------------------

INSERT INTO ogrenciler VALUES
('1234567', 'Tom', 'Cruise', 85.5, '2024-12-12')

INSERT INTO ogrenciler VALUES
('2345678', 'Tom', 'Hanks', 95, now());

SELECT *
FROM ogrenciler o

------------------------------------------------------------------------------------------------





