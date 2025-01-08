-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- Orange SQL

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
SORU: students isimli bir table olusturun. Bu table'da student_id, first_name, last_name
birth_date ve department olsun. (Data tiplerini uygun sekilde seciniz.) student_id field'i
Primary Key olsun. */
 
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
/*
SORU: Alttaki girisleri students tablosuna yapin:

      Jane Smith, '1999-07-22', Mathematics,

      Emily' Johnson, 2001-03-18, Physics,

      Michael Brown, 1998-12-01, Biology */

INSERT INTO students (first_name, last_name, birth_date, department) VALUES 
('Jane', 'Smith', '1999-07-22', 'Mathematics'),
('Emily', 'Johnson', '2001-03-18', 'Physics'),
('Michael', 'Brown', '1998-12-01', 'Biology');

-- SORU: Sadece belli field'lara bilgi girisi yapin ---> first name: Alice, depart: Chemistry

INSERT INTO students (first_name, department) VALUES
('Alice', 'Chemistry')

SELECT *
FROM students s

------------------------------------------------------------------------------------------------

CREATE TABLE ogrenciler (
	ogrenci_no char(7), -- Mutlaka 7 karakter yer kaplayacak
	isim varchar(20),
	soyisim varchar(30),
	not_ort real, -- Ondalikli sayilari belirtmek icin
	kayit_tarihi date
                        );

SELECT *
FROM ogrenciler o

-- Var olan tablodan yeni tablo create etmek (isim, soyisim ve not_ort field'larini kullanarak)

CREATE TABLE ogrenci_notlar
AS
SELECT isim, soyisim, not_ort -- Avantaj: Kriterleri bir öncekinden ceker.
FROM ogrenciler o 

SELECT *
FROM ogrenci_notlar

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

INSERT INTO ogrenciler2 (isim, soyisim) VALUES ('Bilal', 'Ece')

INSERT INTO ogrenciler2 (isim, soyisim) VALUES ('John', 'Steve')

-- NULL'larin hepsi UNIQUE kabul edilir. 
--Her field'da birden fazla null olabilir. (Postgre ve MysQL böyle kabul ediyor.)

SELECT *
FROM ogrenciler2 o

------------------------------------------------------------------------------------------------
/*
Primary Key: Eger bir field "primary key" olarak deklare edilmisse, field datalari "unique" ve
"not null" olmali. Bir tabloda sadece 1 tane "primary key" olabilir. */

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

CREATE TABLE ogrenciler4 ( 
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

Child tablo: Foreign Key iceren ve parent tabloya referansla baglanan tablodur. Child tablo
parent tablonun primary key veya Unique anahtarini Foreign Key olarak kendi icinde barindirir
ve bu Foreign Key üzerinden parent tabloyla iliskilendirilir. */
             
/*
Foreign Key: Foreign Key baska bir tablodaki Primary Key ile iliskilendirilmis olmalidir. Deger
olarak "null" kabul eder. Tekrarlanan verileri kabul eder. Bir tablo birden cok "Foreign Key"
alanina sahip olabilir. */
			
CREATE TABLE sirketler (
	sirket_id integer, 
	sirket varchar(50) PRIMARY KEY,
	personel_sayisi integer
                       );

CREATE TABLE personel (
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
                 
-- SORU: Age ve salary icin veri giris sarti olusturalim: salary 5000'den büyük olmali, age 0'dan kücük olmamali.

CREATE TABLE person (
	id INTEGER,
	name VARCHAR(50),
	salary REAL CHECK(salary>5000), -- 5000 degerinden yüksek giris olmali
	age INTEGER CHECK(age>0)  -- negatif deger olmamali
                    );

INSERT INTO person VALUES (11, 'Ali Can', 6000, 35)

INSERT INTO person VALUES (12, 'Ruşen Ece', 5500, -3) -- Hatali giris: Age degeri sarti saglamiyor. (age>0)

INSERT INTO person VALUES (13, 'Ali Can', 4000, 45)  -- Hatali giris: Salary degeri sarti saglamiyor. (>5000)

SELECT * FROM person p 
 
------------------------------------------------------------------------------------------------

-- DERS: 16.12.24

------------------------------------------------------------------------------------------------

CREATE TABLE workers (
	calisan_id char(9),
	calisan_isim varchar(50),
	calisan_dogdugu_sehir varchar(50)
                     );

INSERT INTO workers VALUES (123456789, 'Ali Can', 'İstanbul'); 
INSERT INTO workers VALUES (234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES (345678901, 'Mine Bulut', 'İzmir');

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

CREATE TABLE developers (
	id SERIAL PRIMARY KEY,
	name varchar(50),
	email varchar(50) UNIQUE,
	salary real,
	prog_lang varchar(20),
	city varchar(50),
	age int	
						);

INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Abdullah Berk', 'abdullah@mail.com', 4000, 'Java', 'Ankara', 28);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Mehmet Cenk', 'mehmet@mail.com', 5000, 'JavaScript', 'İstanbul', 35);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Ayşenur Han', 'aysenur@mail.com', 5000, 'Java', 'İzmir', 38);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Kübra Han', 'kubra@mail.com', 4000, 'JavaScript', 'İstanbul', 32);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Muhammed Demir', 'muhammed@mail.com', 6000, 'Java', 'İzmir', 25);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Fevzi Kaya', 'fevzi@mail.com', 6000, 'Html', 'İstanbul', 28);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Enes Can', 'enes@mail.com', 5500, 'Css', 'Ankara', 28);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Tansu Han', 'tansu@mail.com', 5000, 'Java', 'Bursa', 32);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Said Ran', 'said@mail.com', 4500, 'Html', 'İzmir', 33);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Mustafa Pak', 'mustafa@mail.com', 4500, 'Css', 'Bursa', 32);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Hakan Tek', 'hakan@mail.com', 7000, 'C++', 'Konya', 38);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Deniz Çetin', 'deniz@mail.com', 4000, 'C#', 'İstanbul', 30);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Betül Çetin', 'btl@mail.com', 4000, 'C#', 'Bursa', 29);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Ayse Gül', 'ayse@mail.com', 4000, 'C#', 'Ankara', 29);
INSERT INTO developers(name, email, salary, prog_lang, city, age) VALUES ('Ali Şeker', 'ali@mail.com', 4000, 'C#', 'Ankara', 29);

SELECT *
FROM developers

------------------------------------------------------------------------------------------------

-- Random ile Getirme - Order By Random - developers Tablosunu Kullanarak -

SELECT *
FROM developers d
ORDER BY RANDOM()
LIMIT 5;

------------------------------------------------------------------------------------------------

-- SORU: developers tablosundan ekleme sirasina göre ilk 3 kaydi getirin.

SELECT *
FROM developers d
LIMIT 3;

-- SORU: developers tablosundan ekleme sirasina göre ilk 2 kayittan sonraki ilk 3 kaydi getirin.

SELECT *
FROM developers d
OFFSET 2
LIMIT 3;

-- SORU: developers tablosundan maasi en düsük ilk 3 kaydi getirin.

SELECT *
FROM developers d
ORDER BY salary ASC
LIMIT 3;

-- SORU: developers tablosundan maasi en yüksek 2. developerin tüm bilgilerini getiriniz.

SELECT *
FROM developers d
ORDER BY salary DESC 
OFFSET 1
LIMIT 1;

------------------------------------------------------------------------------------------------

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
                   
INSERT INTO person VALUES (123456789, 'Ali', 'Can', 'İstanbul');
INSERT INTO person VALUES (234567890, 'Veli', 'Cem', 'Ankara');  
INSERT INTO person VALUES (345678901, 'Mine', 'Bulut', 'Ankara');  
INSERT INTO person VALUES (256789012, 'Mahmut', 'Bulut', 'İstanbul'); 
INSERT INTO person VALUES (344678901, 'Mine', 'Yaşa', 'Ankara');  
INSERT INTO person VALUES (345678901, 'Veli', 'Yılmaz', 'İstanbul');
INSERT INTO person VALUES (256789018, 'Samet', 'Bulut', 'İzmir'); 
INSERT INTO person VALUES (256789013, 'Veli', 'Cem', 'Bursa'); 
INSERT INTO person VALUES (256789010, 'Samet', 'Bulut', 'Ankara'); 

SELECT *
FROM person;

-- SORU: person isim ve soyisim degerlerini, soyisim kelime uzunluklarina göre siralayarak listeleyiniz.

SELECT
	isim,
	soyisim
FROM person p
ORDER BY LENGTH(soyisim);
/*
SORU: person tablosunda tüm isim ve soyisim degerlerini aralarinda bir bosluk ile ayni sütunda
cagirarak, her bir isim ve soyisim degerinin toplam uzunluguna göre siralayiniz. */

SELECT CONCAT(isim, ' ', soyisim) AS "AdSoyad"
FROM person p
ORDER BY LENGTH(isim) + LENGTH(soyisim) -- Alternatif: ORDER BY LENGTH(CONCAT(isim, ' ', soyisim));
/*
|| Operatörü ile de string birlestirmesi yapilabilir. üstteki CONCAT islemini bu sefer söyle
yapabiliriz:

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

CREATE TABLE calisanlar1 (
id char(5),
isim varchar(50),
maas int,
ise_baslama date
                         );

INSERT INTO calisanlar1 VALUES ('10002', 'Donatello', 12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('10003', null, 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('10004', 'Donatello', 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('10005', 'Michelangelo', 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('10006', 'Leonardo', null, '2019-04-12');
INSERT INTO calisanlar1 VALUES ('10007', 'Raphael', null, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('', 'April', 2000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('', 'Ms.April', 2000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('10002', 'Splinter', 12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ( null, 'Fred', 12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('10008', 'Barnie',10000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('10009', 'Wilma',11000, '2018-04-14');
INSERT INTO calisanlar1 VALUES ('10010', 'Betty',12000, '2018-04-14');

CREATE TABLE adresler1 (
adres_id char(5),
sokak varchar(30),
cadde varchar(30),
sehir varchar(20)
                       );

INSERT INTO adresler1 VALUES ('10003', 'Ninja Sok.', '40. Cad.', 'İST');
INSERT INTO adresler1 VALUES ('10003', 'Kaya Sok.', '50. Cad.', 'Ankara');
INSERT INTO adresler1 VALUES ('10002', 'Taş Sok.', '30. Cad.', 'Konya');
INSERT INTO adresler1 VALUES ('10012', 'Taş Sok.', '30. Cad.', 'Konya');
INSERT INTO adresler1 VALUES (NULL, 'Taş Sok.', '23. Cad.', 'Konya');
INSERT INTO adresler1 VALUES (NULL,'Taş Sok.', '33. Cad.', 'Bursa');

SELECT * FROM calisanlar1;
SELECT * FROM adresler1;

--SORU: calisanlar1 tablosundan ismi 'Donatello' olanlarin tüm bilgilerini listeleyin.

SELECT *
FROM calisanlar1 c 
WHERE isim = 'Donatello'

--SORU: calisanlar1 tablosundan maasi 5000'den fazla olanlarin tüm bilgilerini listeleyin.

SELECT *
FROM calisanlar1 c 
WHERE maas > 5000

--SORU: calisanlar1 tablosundan maasi 5000'den fazla olanlarin isim ve maaslarini listeleyin.

SELECT
	isim,
	maas 
FROM calisanlar1 c 
WHERE maas > 5000

------------------------------------------------------------------------------------------------

-- DERS: 18.12.24

------------------------------------------------------------------------------------------------

CREATE TABLE musteriler (
urun_id int,  
musteri_isim varchar(50),
urun_isim varchar(50)
                        );

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler;

-- SORU: Müsteriler tablosundan ürün ismi Orange, Apple veya Apricot olan verileri listeleyin.

SELECT *
FROM musteriler
WHERE urun_isim 
	IN ('Orange', 'Apple', 'Apricot');

-- SORU: Müsteriler tablosundan ürün ismi Orange, Apple veya Apricot olmayan verileri listeleyin.

SELECT *
FROM musteriler
WHERE urun_isim 
	NOT IN ('Orange', 'Apple', 'Apricot');

------------------------------------------------------------------------------------------------

CREATE TABLE markalar (
marka_id INT, 
marka_isim VARCHAR(20), 
calisan_sayisi INT
                      );

INSERT INTO markalar VALUES (100, 'Vakko', 12000);
INSERT INTO markalar VALUES (101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES (102, 'Adidas', 10000);
INSERT INTO markalar VALUES (103, 'LCWaikiki', 21000);

CREATE TABLE calisanlar3 (
id INT, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas INT, 
isyeri VARCHAR(20)
                         );

INSERT INTO calisanlar3 VALUES (123456789, 'Ali Şeker', 'İstanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES (234567890, 'Ayşe Gül', 'İstanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES (345678901, 'Veli Yılmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES (456789012, 'Veli Yılmaz', 'İzmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES (567890123, 'Veli Yılmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES (456789012, 'Ayşe Gül', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES (123456710, 'Fatma Yaşa', 'Bursa', 2500, 'Vakko');

SELECT * FROM markalar;
SELECT * FROM calisanlar3;

--SORU: calisanlar3 tablosunda max maas degerini bulun.

SELECT max(maas)
FROM calisanlar3

--SORU: calisanlar3 tablosunda min maas degerini bulun.

SELECT min(maas)
FROM calisanlar3

--SORU: calisanlar3 tablosunda toplam maas degerini bulun.

SELECT sum(maas)
FROM calisanlar3

--SORU: calisanlar3 tablosunda ortalama maas degerini bulun.

SELECT avg(maas)
FROM calisanlar3

-- SORU: calisanlar3 tablosundaki kayit sayisini bulun.

SELECT count(*)
FROM calisanlar3

-- SORU: calisanlar3 tablosunda maasi 2500 olanlarin kayit sayisini bulun.

SELECT count(*)
FROM calisanlar3
WHERE maas = 2500

------------------------------------------------------------------------------------------------

-- DERS: 19.12.24

------------------------------------------------------------------------------------------------

CREATE TABLE manav (
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
                   );

INSERT INTO manav VALUES ( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES ( 'Ayşe', 'Armut', 3);
INSERT INTO manav VALUES ( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES ( 'Hasan', 'Üzüm', 4);  
INSERT INTO manav VALUES ( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES ( 'Ayşe', 'Elma', 3);  
INSERT INTO manav VALUES ( 'Veli', 'Üzüm', 5);  
INSERT INTO manav VALUES ( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES ( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES ( 'Ayşe', 'Üzüm', 2);

SELECT * FROM manav;

-- SORU: Manav tablosundaki tüm isimleri ve her bir isim icin, toplam ürün miktarini görüntüleyin.

SELECT
	isim,
	Sum(urun_miktar) as toplam_urun
FROM  manav
Group by isim
/*
SORU: Manav tablosundaki tüm isimleri ve her bir isim icin toplam ürün miktarini görüntüleyin ve
toplam ürün miktarina göre azalan olarak siralayiniz. */

SELECT 
	isim,
	SUM(urun_miktar) AS top_urun_miktari
FROM manav m 
GROUP BY isim 
ORDER BY SUM(urun_miktar) DESC 

-- SORU: Her bir ismin aldigi, her bir ürünün toplam miktarini, isme göre sirali bicimde görüntüleyin.

SELECT 
	isim,
	urun_adi,
	SUM(urun_miktar) AS top_urun_miktari
FROM manav m 
GROUP BY isim, urun_adi -- Önce isim sonra urun_adi'na göre grupladik.
ORDER BY isim 

-- SORU: Ürün adina göre, her bir ürünü alan toplam kisi sayisini gösterin.

SELECT
	urun_adi,
	count(DISTINCT isim) AS toplam_urun_kisi
FROM manav m
GROUP BY urun_adi

-- Elma ve Armut 2 kez ayni kisi (Ali ve Veli) tarafindan alindigi icin bunu saymamasi adina DISTINCT kullandik.

-- SORU: Her bir isme göre, alinan toplam ürün miktari ve ürün cesit miktarini bulun.

SELECT
	isim,
	sum(urun_miktar) AS toplam_urun,
	count(DISTINCT urun_adi) AS urun_cesit_sayisi
FROM manav
GROUP BY isim

------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS personel;
CREATE TABLE personel (
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
                      );

INSERT INTO personel VALUES (123456789, 'Ali Yılmaz', 'İstanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES (234567890, 'Veli Şahin', 'İstanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES (345678901, 'Mehmet Öztürk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES (456789012, 'Mehmet Öztürk', 'İzmir', 6000, 'Ford'); 
INSERT INTO personel VALUES (567890123, 'Mehmet Öztürk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES (678901245, 'Veli Şahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES (123456710, 'Hatice Şahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel p 

-- SORU: Her bir sirketin MIN maas bilgisini eger bu bilgi 4000'den yüksekse getirin.

SELECT
	sirket,
	min(maas) AS min_maas
FROM personel p
GROUP BY sirket
HAVING min(maas) > 4000
/*
SORU: Maasi 4000'den fazla olan calisanlarin sirketlerini bulduktan sonra, bu sinirin üstünde olan
MIN maas bilgisini her sirket icin görüntüleyin. */

SELECT
	sirket,
	min(maas) AS min_maas
FROM personel p
WHERE maas > 4000 -- Soruda ilk etapta genel filtreleme olarak verilmisti.
GROUP BY sirket

------------------------------------------------------------------------------------------------

-- DERS: 20.12.24

------------------------------------------------------------------------------------------------

CREATE TABLE calisanlar4 (
id INT UNIQUE, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas INT, 
isyeri VARCHAR(20)
                         );	
	
INSERT INTO calisanlar4 VALUES (123456789, 'Ali Şeker', 'İstanbul', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES (234567890, 'Ayşe Gül', 'İstanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar4 VALUES (345678901, null, 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar4 VALUES (456789012, 'Veli Yılmaz', 'İzmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES (567890123, 'Veli Yılmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar4 VALUES (678901234, 'Ayşe Gül', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES (789012345, 'Fatma Yaşa', null, 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES (890123456, null, 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES (901234567, 'Ali Han', null, 2500, 'Vakko');

SELECT * FROM calisanlar4;	

-- SORU: id'si 123456789 olan calisanin isyeri ismini 'Trendyol' olarak güncelleyin.

UPDATE calisanlar4
SET isyeri = 'Trendyol'
WHERE id = 123456789;

-- SORU: id’si 567890123 olan calisanin ismini 'Veli Yıldırım' ve sehrini 'Bursa' olarak güncelleyin.

UPDATE calisanlar4
SET isim = 'Veli Yıldırım', sehir = 'Bursa'
WHERE id = 567890123

-- SORU: Markalar tablosundaki marka_id degeri 102’ye esit veya büyük olanlarin marka_id’sini 2 ile carparak degistirin.

SELECT *
FROM markalar 

UPDATE markalar
SET marka_id = marka_id * 2
WHERE marka_id >= 102

-- SORU: Markalar tablosundaki tüm markalarin calisan_sayisi degerlerini marka_id ile toplayarak güncelleyin.

-- Bu sorguyu icra ederken tüm tablo degisecegi icin DBeaver bize uyari verir.

UPDATE markalar
SET calisan_sayisi = calisan_sayisi + marka_id

------------------------------------------------------------------------------------------------

-- DERS: 23.12.24

------------------------------------------------------------------------------------------------

CREATE TABLE teachers (
	id int,
	firstname varchar(50),
	lastname varchar(50),
	age int,	
	city varchar(20),
	course_name varchar(20),
	salary real	
                       );

INSERT INTO teachers VALUES (111, 'AhmeT  ', '  Han', 35, 'İstanbul', 'SpringMVC', 5000);
INSERT INTO teachers VALUES (112, 'Mehmet', 'Ran ', 33, 'Van', 'HTML', 4000);
INSERT INTO teachers VALUES (113, ' Bilal', 'Fan ', 34, 'Bursa', 'SQL', 3000);
INSERT INTO teachers VALUES (114, 'Celal', ' San', 30, 'Bursa', 'Java', 3000);
INSERT INTO teachers VALUES (115, 'Deniz', ' Can', 30, 'İstanbul', 'SQL', 3500);
INSERT INTO teachers VALUES (116, 'ekreM', 'Demir', 36, 'İstanbul', 'Java', 4000.5);
INSERT INTO teachers VALUES (117, 'Fatma', 'Çelik', 38, 'Van', 'SpringBOOT', 5550);
INSERT INTO teachers VALUES (118, 'Hakan', 'Çetin', 44, 'İzmir', 'Java', 3999.5);
INSERT INTO teachers VALUES (119, 'mert', 'Çetin', 32, 'İzmir', 'HTML', 2999.5);
INSERT INTO teachers VALUES (120, 'Nilay', 'Çetin', 32, 'İzmir', 'CSS', 2999.5);
INSERT INTO teachers VALUES (121, 'Selma', 'Çelik', 40, 'Ankara', 'SpringBOOT', 5550);
INSERT INTO teachers VALUES (122, 'fatiH', 'Can', 32, 'Ankara', 'HTML', 2550.22);
INSERT INTO teachers VALUES (123, 'Nihat', 'Keskin', 32, 'İzmir', 'CSS', 3000.5);
INSERT INTO teachers VALUES (124, 'Hasan', 'Temel', 37, 'İstanbul', 'S.Security', 3000.5);

SELECT * FROM teachers;
/*
SORU: teachers tablosundaki tüm kayitlarin, firstname degerlerini büyük harfe, lastname
degerlerini kücük harfe cevirerek, uzunluklari ile birlikte listeleyin. */

SELECT 
	UPPER(firstname) AS upper_firstname,
	LENGTH(firstname) AS len_firstname,
	LOWER(lastname) AS lower_lastname,
	LENGTH(lastname) AS len_lastname
FROM teachers t 
/*
SORU: teachers tablosunda firstname#i upper yapIn, lastname#i lower yapIn ve bu field#lardaki 
deGerlerin baslangic ve sondaki bosluklari kaldirin, bosluk kaldirma öncesi-sonrasi sütunlari da
uzunluklariyla birlikte raporlayin.

TRIM: Bosluklari kaldirmak icin kullanilir. */

SELECT 
	UPPER(firstname) AS upper_firstname,
	LENGTH(firstname) AS len_firstname,-- TRIM öncesi uzunluklar
	LENGTH(TRIM(firstname)) AS trim_len_first , -- TRIM sonrasi uzunluk 
	LOWER(lastname) AS lower_lastname,
	LENGTH(lastname) AS len_lastname, -- TRIM öncesi uzunluklar
	LENGTH(TRIM(lastname)) AS trim_len_last -- TRIM sonrasi uzunluk 
FROM teachers t 

-- Alternatif Cözüm

SELECT
	UPPER(firstname) AS upper_firstname,
	LENGTH(firstname) AS len_first,
	TRIM(UPPER(firstname)) AS trim_first,
	LENGTH(TRIM(firstname)) AS trim_len_first,
	LOWER(lastname) AS lower_lastname,
	LENGTH(lastname) AS len_last,
	TRIM(LOWER(lastname)) AS trim_last,
	LENGTH(TRIM(lastname)) AS trim_len_last
FROM teachers t
/*
SORU: teachers tablosundaki tüm kayitlarin firstname degerlerinin ilk harfini büyük digerlerini
kücük harfe cevirerek görüntüleyin. 

INITCAP fonksiyonu kelimelerin ilk harfini büyük digerlerini kücük yapar. (Python capitalize() gibi)

SELECT INITCAP('HELLO WORLD, SQL IS AWESOME!') AS formatted_text; */

SELECT 
	firstname,
	INITCAP(firstname) AS init_firstname
FROM teachers t

------------------------------------------------------------------------------------------------

-- SORU: calisanlar4 tablosuna yas(int) seklinde yeni bir sütun ekleyin.

ALTER TABLE calisanlar4
ADD yas INT

SELECT *
FROM calisanlar4 c 
/*
SORU: calisanlar4 tablosuna remote field'ini boolean data tipi seklinde yeni bir sütun olarak
ekleyin. Varsayilan olarak remote degeri TRUE olsun. */

ALTER TABLE calisanlar4
ADD remote BOOLEAN DEFAULT TRUE

-- SORU: calisanlar4 tablosunda yas sütununu silin.

ALTER TABLE calisanlar4
DROP yas

-- SORU: calisanlar4 tablosundaki maas sütununun data tipini real olarak güncelleyin.

ALTER TABLE calisanlar4
ALTER COLUMN maas TYPE REAL

-- SORU: calisanlar4 tablosunda isim sütununa NOT NULL constraint'i ekleyin.

ALTER TABLE calisanlar4
ALTER COLUMN isim SET NOT NULL -- Bu kodda hata alinir cünkü mevcut field'da NULL degerler var.

------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS markalar;
CREATE TABLE markalar (
	marka_id int,
	marka_isim varchar(20),
	calisan_sayisi int
                      );

INSERT INTO markalar VALUES (100, 'Vakko', 12000);
INSERT INTO markalar VALUES (101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES (102, 'Adidas', 10000);
INSERT INTO markalar VALUES (103, 'LCWaikiki', 21000);

SELECT * FROM markalar m 

-- SORU: marka_id'si 100 olan firmada calisanlarin bilgilerini listeleyin.

SELECT *
FROM calisanlar3 c
WHERE isyeri IN (
	SELECT marka_isim
	FROM markalar m
	WHERE marka_id = 100
				)
				
------------------------------------------------------------------------------------------------

-- DERS: 24.12.24

------------------------------------------------------------------------------------------------
				
-- SORU: calisanlar3 tablosunda max maasi alan calisanin tüm field'larini listeleyin.

SELECT *
FROM calisanlar3 c
WHERE maas IN (
	SELECT max(maas)
	FROM calisanlar3 c 
	          )
	          
-- SORU: calisanlar3 tablosunda max veya min maasi alan calisanlarin tüm fieldlarini listeleyin.
	          
SELECT *
FROM calisanlar3 c
WHERE
	maas = (SELECT max(maas) FROM calisanlar3 c)
	OR 
	maas = (SELECT min(maas) FROM calisanlar3 c)

-- SORU: calisanlar3 tablosunda max maasdan bir düsük maas alan calisanin tüm fieldlarini listeleyin.
	  
SELECT *
FROM calisanlar3 c
WHERE maas IN (
	SELECT maas
	FROM calisanlar3 c
	ORDER BY maas DESC
	OFFSET 1
	LIMIT 1
	          )
	          
-- SORU: Ankara'da calisani olan markalarin id'lerini, calisan sayilarini ve marka isimlerini listeleyin.
	         
SELECT marka_id, calisan_sayisi, marka_isim 
FROM markalar m
WHERE marka_isim IN (
	SELECT isyeri
	FROM calisanlar3 c
	WHERE sehir = 'Ankara'
				    )
/*				    
SORU: Calisan sayisi 15.000'den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini
ve maaslarini listeleyin. */
				    
SELECT isim, maas, isyeri
FROM calisanlar3 c 
WHERE isyeri IN (
	SELECT marka_isim
	FROM markalar m 
	WHERE calisan_sayisi > 15000
				)

-- SORU: Her markanin id’sini, ismini ve toplam kac sehirde bulundugunu listeleyin.

SELECT * FROM markalar m 
SELECT * FROM calisanlar3 c 

SELECT 
	marka_id,
	marka_isim,
	(
	SELECT COUNT(DISTINCT sehir) AS sehir
	FROM calisanlar3 c 
	WHERE c.isyeri = m.marka_isim -- Eslestirme yapilmazsa ayni degeri döndürür.
	)
FROM markalar m 

-- SORU: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve min maasini listeleyin.

SELECT * FROM markalar m 
SELECT * FROM calisanlar3 c

SELECT
	marka_isim,
	calisan_sayisi,
	(
	SELECT max(maas) AS max_maas
	FROM calisanlar3 c
	WHERE c.isyeri = m.marka_isim
	),
	(
	SELECT min(maas) AS min_maas
	FROM calisanlar3 c
	WHERE c.isyeri = m.marka_isim
	)
FROM markalar m 
	
------------------------------------------------------------------------------------------------

CREATE TABLE mart (     
	urun_id int,      
	musteri_isim varchar(50),
	urun_isim varchar(50)
                  ); 

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan (     
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
                   );

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayşe', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yaşar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart;
SELECT * FROM nisan;

-- SORU: Mart ayinda 'Toyota' satisi yapilmis ise Nisan ayindaki tüm ürünlerin bilgilerini listeleyin.

SELECT *
FROM nisan n 
WHERE EXISTS ( -- EXIST ile cözüm
	SELECT 1 -- Var olmak yok olmak durumuna bakildigi icin genel kullanim bu sekilde.
	FROM mart m 
	WHERE urun_isim = 'Toyota'
			 );

-- SORU: Mart ayinda 'Volvo' satisi yapilmissa Nisan ayindaki tüm ürünlerin bilgilerini listeleyin.

SELECT *
FROM nisan n 
WHERE EXISTS (
	SELECT 1
	FROM mart m 
	WHERE urun_isim = 'Volvo'
			 );

-- Mart ayinda Volvo satisi olmadigi icin Subquery kismi False döndürdü ve sonuc bos geldi.
/*
-- SORU: Mart ayinda satilan ürünlerin urun_id ve musteri_isim'lerini, eger ürun (urun_isim)
Nisan ayinda da satilmissa listeleyin. */

SELECT 
	urun_id,
	urun_isim 
FROM mart m 
WHERE EXISTS (
	SELECT *
	FROM nisan n 
	WHERE m.urun_isim = n.urun_isim
             );
/*
SORU: Her iki ayda birden satilan ürünlerin urun_isim'lerini, bu ürünleri NİSAN ayinda satin alan
musteri_isim'lerine göre listeleyin. */

SELECT
	musteri_isim,
	urun_isim
FROM nisan n
WHERE EXISTS (
	SELECT *
	FROM mart m
	WHERE m.urun_isim = n.urun_isim
             )

------------------------------------------------------------------------------------------------

-- DERS: 02.01.25

------------------------------------------------------------------------------------------------
             
-- VIEW
/*
Bazi sorgulari tekrar tekrar yazmak yeine ilgili kismi hafizasina almak icin Create View yapilir
ve daha sonra da Select ile cagirilir. Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen
sorgulama yerine view'e atadigimiz ismi SELECT komutuyla cagiririz.

Python'daki def function'a benzeyen bir yapidir.*/
/*           
SORU: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minimum
maasini listeleyen bir sorgu yazin. */
             
CREATE VIEW max_min_maas
AS
SELECT 	calisan_sayisi,
		marka_isim,
		(
	SELECT max(maas) AS max_maas
	FROM calisanlar3 c
	WHERE c.isyeri = m.marka_isim),
		(
	select min(maas) AS min_maas
	FROM calisanlar3 c
	WHERE isyeri = m.marka_isim
		)
FROM markalar m

-- Simdi olusturdugumuz VIEW'i cagiralim

SELECT *
FROM max_min_maas mmm

-- Silmek icin

DROP VIEW max_min_maas

-- Degistirmek icin REPLACE VIEW

CREATE OR REPLACE VIEW max_min_maas
AS 
SELECT 
    marka_isim, 
    calisan_sayisi, 
    (SELECT MAX(maas) FROM calisanlar3 WHERE isyeri = marka_isim) AS max_maas,
    (SELECT MIN(maas) FROM calisanlar3 WHERE isyeri = marka_isim) AS min_maas,
    (SELECT AVG(maas) FROM calisanlar3 WHERE isyeri = marka_isim) AS avg_maas
FROM markalar;

-- 2. Degisim yolu:

DROP VIEW IF EXISTS max_min_maas;
CREATE VIEW max_min_maas
AS 
SELECT 
    marka_isim, 
    calisan_sayisi, 
    (SELECT MAX(maas) FROM calisanlar3 WHERE isyeri = marka_isim) AS max_maas,
    (SELECT MIN(maas) FROM calisanlar3 WHERE isyeri = marka_isim) AS min_maas,
    (SELECT AVG(maas) FROM calisanlar3 WHERE isyeri = marka_isim) AS avg_maas
FROM markalar;

-- Simdi olusturdugumuz VIEW'i cagiralim.

SELECT *
FROM max_min_maas
             
------------------------------------------------------------------------------------------------

-- Index numarasini istenen degerden baslatmayi örnegin 1000'den baslatmayi deneyelim.

-- Öncelikle örnek bir tablo create edelim, üzerinde degistirelim.

CREATE TABLE sample_table (
	id SERIAL PRIMARY KEY, -- Serial field olmali
	other_column TEXT 
						  )
						 
-- SEQUENCE güncellemesi
						 
SELECT pg_get_serial_sequence('sample_table', 'id');

-- Üstteki komut SEQUENCE'in adini döndürür.

-- Sequence'in baslangic degerini güncelleyelim.

ALTER SEQUENCE sample_table_id_seq RESTART WITH 1000;

--Yeni kayit ekleyerek deneme yapalim.

INSERT INTO sample_table (other_column) VALUES ('First Record');

SELECT * FROM sample_table

------------------------------------------------------------------------------------------------             
             
-- WHERE EXISTS Konusuna Ilave Örnekler

CREATE TABLE customers1 (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL
                        );

CREATE TABLE orders1 (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_name TEXT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers1(customer_id)
					 );


INSERT INTO customers1 (customer_id, first_name, last_name, email) VALUES
(1, 'John', 'Smith', 'john.smith@example.com'),
(2, 'Jane', 'Doe', 'jane.doe@example.com'),
(3, 'Michael', 'Brown', 'michael.brown@example.com'),
(4, 'Emily', 'Davis', 'emily.davis@example.com'),
(5, 'Sarah', 'Wilson', 'sarah.wilson@example.com'),
(6, 'David', 'Taylor', 'david.taylor@example.com'),
(7, 'Laura', 'Moore', 'laura.moore@example.com'),
(8, 'James', 'Anderson', 'james.anderson@example.com');


INSERT INTO orders1 (order_id, customer_id, product_name, order_date) VALUES
(1, 1, 'Smartphone', '2025-01-01'),
(2, 3, 'Laptop', '2025-01-01'),
(3, 1, 'Tablet', '2025-01-02'),
(4, 5, 'Camera', '2025-01-03'),
(5, 6, 'Headphones', '2025-01-04'),
(6, 3, 'Monitor', '2025-01-05'),
(7, 8, 'Speaker', '2025-01-06');

SELECT * FROM customers1;

SELECT * FROM orders1;         

-- SORU: Sadece siparis vermis müsterileri listeleyin.

SELECT *
FROM customers1 c
WHERE EXISTS (
	SELECT 1
	FROM orders1 o
	WHERE c.customer_id = o.customer_id
 			 );

-- Sonuc sadece siparis kaydi olan müsterileri icerir.
             
-- SORU: Siparisi olmayan müsterileri listeleyin.

SELECT *
FROM customers1
WHERE NOT EXISTS (
	SELECT 1
	FROM orders1
	WHERE customers1.customer_id = orders1.customer_id
				 );

-- SORU: Belirli bir ürünü örnegin 'Laptop' siparis eden müsterileri listeleyin.

SELECT *
FROM customers1 c
WHERE EXISTS (
	SELECT 1
	FROM orders1 o
	WHERE c.customer_id = o.customer_id
	AND
	o.product_name ='Laptop'
			 );

------------------------------------------------------------------------------------------------

-- ISNULL

-- Filtreleme gibi calisir ve bos mu demektir.

-- SORU: calisanlar4 tablosundan isim sütunu NULL olanlari listeleyin.

SELECT *
FROM calisanlar4 c
WHERE isim IS NULL;

-- SORU: calisanlar4 tablosunda isim sütunu NULL olmayanlari listeleyin.

SELECT *
FROM calisanlar4 c
WHERE isim IS NOT NULL

-- SORU: calisanlar4 tablosundaki NULL olan isimlerini unknown olarak güncelleyin.

UPDATE calisanlar4
SET isim = 'Unknown'
WHERE isim IS NULL

------------------------------------------------------------------------------------------------

-- DERS: 06.01.25

------------------------------------------------------------------------------------------------
             
-- ON DELETE CASCADE

-- Parent tablo: adresler

DROP TABLE IF EXISTS adresler;
CREATE TABLE adresler (
    adres_id SERIAL PRIMARY KEY,
    sokak_adi TEXT NOT NULL,
    sehir TEXT NOT NULL,
    posta_kodu CHAR(5) NOT NULL
                      );

-- Child tablo: calisanlar

DROP TABLE IF EXISTS calisanlar;
CREATE TABLE calisanlar (
    calisan_id SERIAL PRIMARY KEY,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    pozisyon TEXT NOT NULL,
    adres_id INT NOT NULL,
    CONSTRAINT fk_adres FOREIGN KEY (adres_id) REFERENCES adresler(adres_id)
                        );
/*
Foreign key iliskisi tanimlanmistir (adres_id üzerinden). ON DELETE sarti tanimlanmistir, bu nedenle
PostgreSQL varsayilan davranisi olan ON DELETE NO ACTION uygulanir. */

-- Parent tabloya (adresler) 10 satir veri ekleme

INSERT INTO adresler (sokak_adi, sehir, posta_kodu) VALUES
('Cumhuriyet Caddesi', 'Ankara', '06420'),
('İstiklal Sokak', 'İstanbul', '34000'),
('Konak Mahallesi', 'İzmir', '35040'),
('Barış Caddesi', 'Bursa', '16050'),
('Fatih Caddesi', 'Adana', '01010'),
('Yeşil Vadi Sokak', 'Antalya', '07030'),
('Kızılırmak Sokak', 'Samsun', '55060'),
('Gazi Bulvarı', 'Kayseri', '38000'),
('Atatürk Bulvarı', 'Eskişehir', '26010'),
('Piri Reis Caddesi', 'Trabzon', '61040');


-- Child tabloya (calisanlar) 10 satir veri ekleme

INSERT INTO calisanlar (ad, soyad, pozisyon, adres_id) VALUES
('Ali', 'Yılmaz', 'Mühendis', 1),
('Ayşe', 'Kaya', 'Yönetici', 2),
('Mehmet', 'Demir', 'Analist', 3),
('Zeynep', 'Çelik', 'Pazarlama Uzmanı', 4),
('Ahmet', 'Şahin', 'Teknisyen', 5),
('Fatma', 'Gül', 'Muhasebeci', 6),
('Emre', 'Aydın', 'Yazılım Geliştirici', 7),
('Elif', 'Polat', 'Veri Bilimci', 8),
('Can', 'Kara', 'Proje Yöneticisi', 9),
('Cem', 'Koç', 'Sistem Yöneticisi', 10);


-- Parent tablo (adresler) verileri

SELECT * FROM adresler;

-- Child tablo (calisanlar) verileri

SELECT * FROM calisanlar;

-- Parent tablodan data silmeye calisalim.

DELETE
FROM adresler
WHERE adres_id = 1
/*
Eror verdi. adres_id = 1 olan parent kaydi calisanlar tablosunda kullanildigi icin silme islemi
gerceklesmez. Bu, foreign key kisitlamasinin varsayilan davranisi olan ON DELETE NO ACTION nedeniyle olur.

ON DELETE NO ACTION: bir parent tablodan (örnekte adresler) bir satir silmeye calistiginizda, eger o satir
bir child tabloda (calisanlar) referans ediliyorsa, silme islemi gerceklesmez.

Cözüm Önerileri

1. Child tabloyu temizlemek: Öncelikle ilgili child kaydini manuel olarak silebiliriz:

DELETE FROM calisanlar WHERE adres_id = 1;

Sonra parent tablo'dan da silinebilir:

DELETE FROM adresler WHERE adres_id = 1;

2. Foreign key'i kaldirmak: Öncelikle kisitlamayi kaldirip sonra silme yapabiliriz:

ALTER TABLE calisanlar DROP CONSTRAINT fk_adres;

Sonra parent tablo'dan da silinebilir:

DELETE FROM adresler WHERE adres_id = 1;

3. ON DELETE CASCADE kullanmak:

Parent silindiginde child kayitlarinin da otomatik silinmesini saglamak icin foreign key'i su sekilde
tanimlayabiliriz: */

ALTER TABLE calisanlar DROP CONSTRAINT fk_adres;
/*
Var olan foreign key kisitlamasi ON DELETE CASCADE icermedigi icin, bu davranisi ekleyebilmek adina
eski kisitlamayi kaldirmamiz gerekir. DROP CONSTRAINT fk_adres: calisanlar tablosundaki fk_adres adindaki
foreign key kisitlamasini kaldirir. */
 
ALTER TABLE calisanlar ADD CONSTRAINT fk_adres 
FOREIGN KEY (adres_id) REFERENCES adresler (adres_id) ON DELETE CASCADE;
/*
ADD CONSTRAINT fk_adres: fk_adres adinda yeni bir foreign key kisitlamasi ekliyoruz.

FOREIGN KEY (adres_id): calisanlar tablosundaki adres_id sütununu foreign key olarak tanimliyoruz.

REFERENCES adresler(adres_id): adresler tablosundaki adres_id sütununa referans veriyoruz.

Bu, calisanlar.adres_id degerlerinin yalnizca adresler.adres_id sütunundaki mevcut degerlerle eslesmesine
izin verir.

ON DELETE CASCADE: Bu, adresler tablosundan bir kayit silindiginde, o kayda referans eden tüm calisan
kayitlarinin da otomatik olarak silinmesini saglar.

Neden ekliyoruz?

Parent tablodan (adresler) bir kayit silindiginde, iliskili child kayitlarin (calisanlar) da otomatik olarak
silinmesini istiyoruz.

ON DELETE CASCADE kullanimi dikkatli düsünülmelidir, cünkü parent kaydini silmek tüm ilgili child kayitlari
da siler. Bu islem geri alinamaz.

Eger tablo tasariminda ON DELETE CASCADE yoksa, bu davranis saglanamaz ve silme isleminden önce ilgili child
kayitlarini manuel olarak temizlemeniz gerekir. Yani: ON DELETE CASCADE davranisi DELETE sorgusunun kendisine
eklenemez, yalnizca tablo tasariminda belirlenir. Sonra parent tablodan silinebilir. */

DELETE FROM adresler WHERE adres_id = 1;

------------------------------------------------------------------------------------------------
/*
EXCEPT

Bir sorgunun sonuclarindan, diger bir sorgunun sonuclarinda bulunmayan degerleri göstermek icin kullanilir.

Dikkat: Hangi tablonun üste yazilacagi önemlidir. */

-- SORU: developers tablosundaki sehirleri, calisanlar4 tablosundaki sehirler haric listeleyin.

SELECT d.city
FROM developers d
EXCEPT
SELECT c.sehir
FROM calisanlar4 c

-- SORU: calisanlar4 tablosundaki sehirleri, developers tablosundaki sehirler haric listeleyin.

SELECT c.sehir
FROM calisanlar4 c
EXCEPT
SELECT d.city
FROM developers d

------------------------------------------------------------------------------------------------

-- DERS: 07.01.25

------------------------------------------------------------------------------------------------






















             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             




