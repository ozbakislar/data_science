-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- GreenPages Database

------------------------------------------------------------------------------------------------

-- DERS: 11.12.24

------------------------------------------------------------------------------------------------

-- create table customers

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY, -- NOT NULL ve UNIQUE birlesimi
	first_name  VARCHAR(50) NOT NULL,
	last_name   VARCHAR(50) NOT NULL,
	country     VARCHAR(50),
	score       INTEGER
                       ); -- Noktali virgülü DBeaver'da kullanmak zorunda degiliz.

-- insert customers data

INSERT INTO customers (customer_id, first_name, last_name, country, score) VALUES
(1, 'Maria', 'Cramer', 'Germany', 350),
(2, 'John', 'Steel', 'USA', 900),
(3, 'Georg', 'Pipps', 'UK', 750),
(4, 'Martin', 'Müller', 'Germany', 500),
(5, 'Peter', 'Franken', 'USA', NULL);

SELECT *
FROM customers

------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	order_id    SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	order_date  DATE,
	quantity    INTEGER
                    );
                   
INSERT INTO orders (order_id, customer_id, order_date, quantity) VALUES
(1001,1, '2021-01-11', 250),
(1002,2, '2021-04-05', 1150),
(1003,3, '2021-06-18', 500),
(1004,6, '2021-08-31', 750);

SELECT *
FROM orders o 

------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	emp_id      SERIAL PRIMARY KEY,
	first_name  VARCHAR(50) NOT NULL,
	last_name   VARCHAR(50) NOT NULL,
	emp_country VARCHAR(50),
	salary      INTEGER
                       );
                      
INSERT INTO employees (emp_id, first_name, last_name, emp_country, salary) VALUES
(1,'John', 'Steel', 'USA', 55000),
(2,'Ann', 'Labrune', 'France', 75000),
(3,'Marie', 'Bertrand', 'Brazil', 75000),
(4,'Georg', 'Afonso', 'UK', 75000),
(5,'Marie', 'Steel', 'UK', 75000);

SELECT *
FROM employees e 

------------------------------------------------------------------------------------------------

-- DERS: 12.12.24

------------------------------------------------------------------------------------------------
/*
Komutlarin Sirasi     Komutlarin Arka Planda Calisma Sirasi

SELECT                FROM 
FROM                  WHERE
WHERE                 GROUP BY
GROUP BY              HAVING
HAVING                SELECT
ORDER BY              ORDER BY
LIMIT                 LIMIT */

------------------------------------------------------------------------------------------------

-- SORU: customers tablosundaki bütün field'lari getirin.

SELECT *
FROM customers

-- Select'te * isaretiyle tablodan tüm field'lari secip getirdik.

------------------------------------------------------------------------------------------------

-- SORU: customers tablosundan sadece first_name ve country field'larini getirin.

SELECT
	first_name,
	country
FROM customers c

-- Sütunlari yazarken araya virgül koymak gerekli

------------------------------------------------------------------------------------------------

-- DERS: 13.12.24

------------------------------------------------------------------------------------------------
/*
SELECT DISTINCT: Sorgu sonucunda tekrar eden verileri cikarip yalnizca essiz (unique) verilerin
                 görüntülenmesini saglar. */

-- SORU: country degerlerini tekrar eden degerler olmadan getiriniz.

SELECT DISTINCT
	country 
FROM customers c 

------------------------------------------------------------------------------------------------

-- DERS: 16.12.24

------------------------------------------------------------------------------------------------

-- Alias Uygulamasi

SELECT *
FROM employees AS e -- AS kelimesi opsiyoneldir.

SELECT
	c.customer_id -- c.customer_id yazarken c. opsiyoneldir.
FROM customers c 


SELECT -- SELECT ile yapilan her sey raporlama icindir. Kalici degildir.
	salary,
	salary*0.10 AS bonus -- AS kelimesi opsiyoneldir. Bonus isimli yeni bir field'i raporladik.
FROM employees e

------------------------------------------------------------------------------------------------

-- Order By Komutu

SELECT *
FROM customers c

SELECT *
FROM customers c
ORDER BY score ASC -- customers tablosunu score degerlerine göre kücükten büyüge siraladik.

SELECT *
FROM customers c
ORDER BY score DESC -- customers tablosunu score degerlerine göre büyükten kücüge siraladik.
/*
NOT: PostgreSQL'de NULL degerler ASC siralamasinda en alta gider, DESC'de ise en üste. 
     MYSQL'de ise bu isleyis tam tersidir. Eger Postgre'de Null degeri en üstte görmek
     istersek alttaki gibi yazariz: */

SELECT *
FROM customers c 
ORDER BY score ASC NULLS FIRST -- NULL hücreler basa geldi.

SELECT *
FROM customers c
ORDER BY score DESC NULLS LAST -- NULL hücreler alta geldi.

------------------------------------------------------------------------------------------------

-- Order By Icin Iki Kriter Kullanimi

-- SORU: Tüm customers listesini country'e göre alfabetik olarak ve score'a göre büyükten kücüge sirala.

SELECT *
FROM customers c 
ORDER BY country ASC, score DESC
/*
Önce country'e göre siraladik, sonra ülkeleri kendi icerisinde score'a göre tekrar siraladik.
Birden fazla siralamada önce birinci field'dakileri siralar, sonra birinci field'da ayni olanlara
bagli olarak ikinci field'dakileri kendi arasinda siralar. */

-- Order By kullaniminda field adini yazmak yerine tablodaki sira numarasini da yazabiliriz ama tercih edilmez.

SELECT *
FROM customers c
ORDER BY 4 ASC, 5 DESC

------------------------------------------------------------------------------------------------

-- Limit Command

-- Secilen satir sayisi kadar sonucu döndürür.

-- SORU: customers tablosundaki ilk iki satiri getirin.

SELECT *
FROM customers c
LIMIT 2;

------------------------------------------------------------------------------------------------

-- Ofset ve Limit Kullanimi

-- Ofset: Yazilan rakam kadar satiri atlayip sonrakilerini getirmenizi saglar.

SELECT *
FROM customers c
LIMIT 3

SELECT *
FROM customers c
OFFSET 2 -- Ilk 2 sirayi atlayacak.
LIMIT 1 -- Ilk 2 siradan sonra gelen 3. kisiyi gösterecek.

------------------------------------------------------------------------------------------------

-- DERS: 17.12.24

------------------------------------------------------------------------------------------------

-- Where Komutu

SELECT *
FROM customers c

-- SORU: Sadece German olanlari getirin. - Sadece ifadesinden filtreleme yapilacagi anlasilir. -

SELECT * 
FROM customers c
WHERE country = 'Germany' -- "Germany" seklinde cift tirnak calismaz.

-- SORU: score degeri 500'den büyük olanlari getirin.

SELECT *
FROM customers c
WHERE score > 500

-- SORU: score degeri 500'den kücük olanlari getirin.

SELECT *
FROM customers c
WHERE score < 500

-- SORU: Germany olmayanlari getirin.

-- 1. yol

SELECT * 
FROM customers c
WHERE country != 'Germany'

-- 2. yol

SELECT * 
FROM customers c
WHERE  country <> 'Germany'

-- 3. yol

SELECT *
FROM customers c
WHERE NOT country = 'Germany'

------------------------------------------------------------------------------------------------
/*
AND Operatörü: WHERE ifadesi icinde birden fazla kosulu birlestirmek icin kullanilir.
               Bu ifade, tüm kosullarin dogru oldugu satirlari secer.
               Yani, AND ifadesiyle birlestirilen her bir kosulun saglanmasi gereklidir. */

-- SORU: customers tablosundan ülkesi Germany ve score 400'den kücük olanlari listeleyin.

SELECT *
FROM customers c
WHERE
	country = 'Germany'
	AND
	score < 400

------------------------------------------------------------------------------------------------
/*
OR Operatörü: WHERE ifadesi icinde birden fazla kosulu birlestirmek icin kullanilir. 
              OR ifadesi, belirtilen kosullardan en az birinin dogru oldugu satirlari secer. 
              Yani, herhangi bir kosulun saglanmasi yeterlidir. */
	
-- SORU: Ülkesi Germany olanlari veya score 800'den kücük olanlari getirin.
	
SELECT *
FROM customers c
WHERE
	country = 'Germany'
	OR
	score < 800;

------------------------------------------------------------------------------------------------
/*
NOT Operatörü: Bir kosulun tersini almak icin kullanilir.
               Bu ifade, belirtilen kosul dogru degilse satirlari secer.
               NOT, WHERE, HAVING ifadesinde veya baska bir kosul ifadesinde kullanilabilir. */

-- SORU: score 400'den kücük olanlari düsünün ve tam tersini alin:

SELECT *
FROM customers c
WHERE NOT score < 400

------------------------------------------------------------------------------------------------
/*
BETWEEN Operatörü: Bir field'daki degerlerin belirli bir aralik icinde olup olmadigini
                   kontrol etmek icin kullanilir. BETWEEN ifadesi, iki sinir deger belirterek
                   bu degerler arasindaki (sinir degerler de dahil) satirlari secer. Bu ifade,
                   sayisal, tarihsel veya alfabetik araliklari belirlemek icin kullanilabilir. */

-- SORU: score degeri 100 ve 500 arasinda olanlari getir. (100 ve 500 ikisi de dahil.)

-- 1. yol

SELECT *
FROM customers c
WHERE score
	BETWEEN 100 AND 500;

-- 2. yol

SELECT *
FROM customers c 
WHERE 
	score >= 100 
	AND 
	score <= 500;

------------------------------------------------------------------------------------------------
/*
IN Operatörü: Bir field degerinin belirli bir dizi degerlerden biri olup olmadigini kontrol etmek
              icin kullanilir. Bu ifade, birden fazla degeri kontrol etmek istediginizde OR operatörüne
              göre daha okunabilir ve daha kisa bir yazim saglar. */

--SORU: Tüm customers icerisinde custumer_id'si 1, 2, 5 olanlari getirin.

-- 1. yol

SELECT *
FROM customers c
WHERE customer_id
	IN (1, 2, 5)
	
	
-- 2. yol

SELECT *
FROM customers c
WHERE
	customer_id = 1
	OR 
	customer_id = 2
	OR 
	customer_id = 3
	
------------------------------------------------------------------------------------------------

-- DERS: 18.12.24

------------------------------------------------------------------------------------------------
	