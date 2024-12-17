-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- OrangePages Database

------------------------------------------------------------------------------------------------

-- DERS: 12.12.24

------------------------------------------------------------------------------------------------

-- Tekli yorum satiri icin "--" kullanilir.
/*
 coklu
 yorum
 satiri icin /*...*/ arasina yazabiliriz. */

------------------------------------------------------------------------------------------------
/*
SORU: students isimli bir table olusturun. Bu table'da student_id, first_name,
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

-- SORU: 5 Mayis 2000 dogumlu John Doe isimli ve Computer Science departmaninda calisan kisiyi tabloya ekleyin.

INSERT INTO students (first_name, last_name, birth_date, department) VALUES
('John', 'Doe', '2000-05-15', 'Computer Science');

------------------------------------------------------------------------------------------------
/*
SORU: Alttaki girisleri students tablosuna yapin:

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

-- SORU: Sadece belli field'lara bilgi girisi yapin ---> first name: Alice, depart: Chemistry

INSERT INTO students (first_name, department) VALUES
('Alice', 'Chemistry')

------------------------------------------------------------------------------------------------

CREATE TABLE ogrenciler(
	ogrenci_no char(7), -- Mutlaka 7 karakter yer kaplayacak
	isim varchar(20),
	soyisim varchar(30),
	not_ort real, -- Ondalikli sayilari belirtmek icin
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

-- DERS: 13.12.24

------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS aktorler (
	id INTEGER,
    name VARCHAR(30),
    email VARCHAR(50)
                                    );

SELECT *
FROM aktorler a 

------------------------------------------------------------------------------------------------

-- Dizayn hatasindan dolayi yanlis girisi kabul eden datalar

INSERT INTO aktorler VALUES (1001, 'Kemal Sunal', 'aktor@gmail.com')

INSERT INTO aktorler VALUES (1002, 'Şener Şen', 'aktor@gmail.com');
/*
Üstteki girislerde unique constraint kriteri olmadigi icin ayni mail girisine yanlislikla izin
vermis olduk. Dizayn hatasi! */

------------------------------------------------------------------------------------------------

-- Tek field icin veri girisi:

INSERT INTO aktorler(name) VALUES ('Türkan Şoray');

------------------------------------------------------------------------------------------------

--CONSTRAINTS / KISITLAMALAR / BELIRLEYICILER

-- UNIQUE ve NOT NULL

CREATE TABLE ogrenciler2 (
	ogrenci_no char (7) UNIQUE, -- UNIQUE sütunda birden fazla NULL olabilir.
	isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL,
	not_ort real,
	kayit_tarihi date
);

INSERT INTO ogrenciler2 VALUES ('1234567', 'Ali', 'Yılmaz', 80, now())

INSERT INTO ogrenciler2 VALUES ('2345678', 'Ali', 'Veli', 90, now())

INSERT INTO ogrenciler2 VALUES ('2345679', ' ', 'Ece',  50, now()) -- Bosluk karakteri NULL degildir.

INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('Bilal', 'Ece')

INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('John', 'Steve')

-- NULL'larin hepsi UNIQUE kabul edilir. 
--Her field'da birden fazla null olabilir. (Postgre ve MysQL böyle kabul ediyor.)

SELECT *
FROM ogrenciler2 o

------------------------------------------------------------------------------------------------
/*
Primary Key:
            Eger bir field "primary key" olarak deklare edilmisse, 
            field datalari "unique" ve "not null" olmali.
            Bir tabloda sadece 1 tane "primary key" olabilir. */

-- Primary Key atamasi icin 1. yol:

CREATE TABLE ogrenciler3 (
	ogrenci_no char(7) PRIMARY KEY,
	isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL,
	not_ort real,
	kayit_tarihi date
                         );
                        
SELECT *
FROM ogrenciler3 o 

-- Primary Key atamasi icin 2. yol (Cok tercih edilmez.):

CREATE TABLE ogrenciler4( 
	ogrenci_no char(7),
	isim varchar(20) NOT NULL,
	soyisim varchar (30) NOT NULL,
	not_ort real,
	kayit_tarihi date,
CONSTRAINT ogr_no_pk PRIMARY KEY(ogrenci_no)
                        );
                       
-- NOT: 2. metotta PK icin, istedigimiz özel ismi (custom) verebiliriz. (ogr_no_pk yazdik.)                      

SELECT *
FROM ogrenciler4 o

INSERT INTO ogrenciler4 VALUES ('1234567', 'Ali', 'Yılmaz', 80, now())

INSERT INTO ogrenciler4 (isim, soyisim) VALUES ('John', 'Steve') /* Hata aliriz. Cünkü Primary Key
                                                                 olan ogrenci_no hücresini bos gecemeyiz. */

------------------------------------------------------------------------------------------------

/*
Parent Tablo: Birincil anahtari (Primary Key) veya Unique Key iceren ve referans verilen tablodur.
              Diger bir deyisle, parent tablo, child tablonun foreign key tarafindan referans alinan tablodur.
              Child tablo, Foreign Key iceren ve parent tabloya referansla baglanan tablodur.
              Child tablo, parent tablonun primary key veya Unique anahtarini Foreign Key olarak kendi
              icinde barindirir ve bu Foreign Key üzerinden parent tabloyla iliskilendirilir. */
             
/*
Foreign Key: Foreign Key baska bir tablodaki Primary Key ile iliskilendirilmis olmalidir.
			 Deger olarak "null" kabul eder.
			 Tekrarlanan verileri kabul eder.
			 Bir tablo birden cok "Foreign Key" alanina sahip olabilir. */
			
------------------------------------------------------------------------------------------------

CREATE TABLE sirketler(
	sirket_id integer, 
	sirket varchar(50) PRIMARY KEY,
	personel_sayisi integer
                      );

CREATE TABLE personel(
	id integer,
	isim varchar(50),
	sehir varchar(50),
	maas real,
	sirket varchar(50),
FOREIGN KEY(sirket) REFERENCES sirketler(sirket)
                     );

-- CONSTRAINT per_fk FOREIGN KEY(sirket) REFERENCES sirketler(sirket)); bu yazim seklinde custom foreign key baglanti ismi verilmis olur.
-- Personel tablosundaki sirket field'i sirketler tablosundaki sirket ile iliskili olacak.
-- Personel tablosundaki her bir satir, sirketler tablosunda gercekten var olan bir sirkete ait olmalidir.
-- Eger sirketler tablosunda olmayan bir sirket adi personel tablosuna eklenmeye calisilirsa, bu islem hata verir.

------------------------------------------------------------------------------------------------

-- CHECK Constraints
                    
/* Age ve salary icin veri giris sarti olusturalim:
salary 5000'den büyük olmali, age 0'dan kücük olmamali. */

CREATE TABLE person(
	id INTEGER,
	name VARCHAR(50),
	salary REAL CHECK(salary>5000), -- 5000 degerinden yüksek giris olmali
	age INTEGER CHECK(age>0)  -- negatif deger olmamali
                   );

SELECT * FROM person p 

INSERT INTO person VALUES (11, 'Ali Can', 6000, 35)

INSERT INTO person VALUES (12, 'Ruşen Ece', 5500, -3) -- Hatali giris: Age degeri sarti saglamiyor. (age>0)

INSERT INTO person VALUES (13, 'Ali Can', 4000, 45)  -- Hatali giris: Salary degeri sarti saglamiyor. (>5000)
 
------------------------------------------------------------------------------------------------

-- DERS: 16.12.24

------------------------------------------------------------------------------------------------

-- Alias ile yapilan isler sadece raporlamada görülür.

CREATE TABLE workers(
	calisan_id char(9),
	calisan_isim varchar(50),
	calisan_dogdugu_sehir varchar(50)
);

INSERT INTO workers VALUES(123456789, 'Ali Can', 'İstanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'İzmir');

SELECT * FROM workers;
/*
SORU: Alttaki sorulari raporlama icin olusturun:
     - calisan_id sütun ismini id olarak degistir,
     - calisan_isim sütun ismini isim olarak degistir,
     - workers olan tablo ismini w olarak degistir. */

SELECT
	calisan_id AS id,
	calisan_isim AS isim
FROM workers w

------------------------------------------------------------------------------------------------

CREATE TABLE developers(
	id SERIAL PRIMARY KEY,
	name varchar(50),
	email varchar(50) UNIQUE,
	salary real,
	prog_lang varchar(20),
	city varchar(50),
	age int	
						);

INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Abdullah Berk', 'abdullah@mail.com', 4000, 'Java', 'Ankara', 28);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Mehmet Cenk', 'mehmet@mail.com', 5000, 'JavaScript', 'İstanbul', 35);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Ayşenur Han', 'aysenur@mail.com', 5000, 'Java', 'İzmir', 38);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Kübra Han', 'kubra@mail.com', 4000, 'JavaScript', 'İstanbul', 32);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Muhammed Demir', 'muhammed@mail.com', 6000, 'Java', 'İzmir', 25);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Fevzi Kaya', 'fevzi@mail.com', 6000, 'Html', 'İstanbul', 28);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Enes Can', 'enes@mail.com', 5500, 'Css', 'Ankara', 28);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Tansu Han', 'tansu@mail.com', 5000, 'Java', 'Bursa', 32);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Said Ran', 'said@mail.com', 4500, 'Html', 'İzmir', 33);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Mustafa Pak', 'mustafa@mail.com', 4500, 'Css', 'Bursa', 32);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Hakan Tek', 'hakan@mail.com', 7000, 'C++', 'Konya', 38);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Deniz Çetin', 'deniz@mail.com', 4000, 'C#', 'İstanbul', 30);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Betül Çetin', 'btl@mail.com', 4000, 'C#', 'Bursa', 29);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Ayse Gül', 'ayse@mail.com', 4000, 'C#', 'Ankara', 29);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES('Ali Şeker', 'ali@mail.com', 4000, 'C#', 'Ankara', 29);

SELECT *
FROM developers

------------------------------------------------------------------------------------------------

-- Random ile Getirme - Order By Random - developers Tablosunu Kullanarak -

SELECT *
FROM developers d
ORDER BY RANDOM()
LIMIT 5;

------------------------------------------------------------------------------------------------

-- Senaryo 1: developers tablosundan ekleme sirasina göre ilk 3 kaydi getirin.

SELECT *
FROM developers d
LIMIT 3;

-- Senaryo 2: developers tablosundan ekleme sirasina göre ilk 2 kayittan sonraki ilk 3 kaydi getirin.

SELECT *
FROM developers d
OFFSET 2
LIMIT 3;

-- Senaryo 3: developers tablosundan maasi en düsük ilk 3 kaydi getirin.

SELECT *
FROM developers d
ORDER BY salary ASC
LIMIT 3;

-- Senaryo 4: developers tablosundan maasi en yüksek 2. developerin tüm bilgilerini getiriniz.

SELECT *
FROM developers d
ORDER BY salary DESC 
OFFSET 1
LIMIT 1;

------------------------------------------------------------------------------------------------

-- Order By ve Length Kullanimi

-- person tablosu üzerinde calisalim.

SELECT *
FROM person

-- person tablosunda sadece 1 deger var o yüzden silip tekrardan icini dolduralim.

DROP TABLE IF EXISTS person;
CREATE TABLE person (
	ssn char(9),
	isim varchar(50),
	soyisim varchar(50),
	adres varchar(50)
                    );
                   
INSERT INTO person VALUES(123456789, 'Ali', 'Can', 'İstanbul');
INSERT INTO person VALUES(234567890, 'Veli', 'Cem', 'Ankara');  
INSERT INTO person VALUES(345678901, 'Mine', 'Bulut', 'Ankara');  
INSERT INTO person VALUES(256789012, 'Mahmut', 'Bulut', 'İstanbul'); 
INSERT INTO person VALUES (344678901, 'Mine', 'Yaşa', 'Ankara');  
INSERT INTO person VALUES (345678901, 'Veli', 'Yılmaz', 'İstanbul');
INSERT INTO person VALUES(256789018, 'Samet', 'Bulut', 'İzmir'); 
INSERT INTO person VALUES(256789013, 'Veli', 'Cem', 'Bursa'); 
INSERT INTO person VALUES(256789010, 'Samet', 'Bulut', 'Ankara'); 

SELECT *
FROM person;

-- Senaryo 1: person isim ve soyisim degerlerini, soyisim kelime uzunluklarina göre siralayarak listeleyiniz.

SELECT
	isim,
	soyisim
FROM person p
ORDER BY LENGTH(soyisim);
/*
Senaryo 2: person tablosunda tüm isim ve soyisim degerlerini aralarinda
bir bosluk ile ayni sütunda cagirarak, her bir isim ve soyisim degerinin
toplam uzunluguna göre siralayiniz. */

SELECT CONCAT(isim, ' ', soyisim) AS "AdSoyad"
FROM person p
ORDER BY LENGTH(isim) + LENGTH(soyisim) -- Alternatif: ORDER BY LENGTH(CONCAT(isim, ' ', soyisim));
/*
NOT: || Operatörü ile de string birlestirmesi yapilabilir.
     üstteki CONCAT islemini bu sefer söyle yapabiliriz:

SELECT
    isim || ' ' || soyisim
FROM person
ORDER BY LENGTH(isim || ' ' || soyisim); */

SELECT 
	isim || ' ' || soyisim AS isim_soyisim, 
	LENGTH(isim || ' ' || soyisim) AS toplam_uzunluk
FROM person
ORDER BY toplam_uzunluk

-- Alttaki islemde fazladan LENGTH degerlerini de raporladik, bir üstteki gibi ama bosluklari saymadan!

SELECT CONCAT(isim, ' ', soyisim), LENGTH(CONCAT(isim, soyisim)) -- Length yazarak field actik.
FROM person
ORDER BY LENGTH(CONCAT(isim, soyisim))

------------------------------------------------------------------------------------------------

-- DERS: 17.12.24

------------------------------------------------------------------------------------------------







