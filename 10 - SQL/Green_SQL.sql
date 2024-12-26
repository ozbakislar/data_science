-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- GreenPages Database

------------------------------------------------------------------------------------------------

-- DERS: 11.12.24

------------------------------------------------------------------------------------------------

-- Python ve SQL Baglantisini Nasil Saglayabilirim?
-- https://medium.com/academy-team/python-ve-sql-ba%C4%9Flant%C4%B1s%C4%B1n%C4%B1-nas%C4%B1l-sa%C4%9Flayabilirim-4f1d5f4a5585

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

-- SELECT DISTINCT

-- Sorgu sonucunda tekrar eden verileri cikarip yalnizca essiz verilerin görüntülenmesini saglar.

-- SORU: country degerlerini tekrar eden degerler olmadan getiriniz.

SELECT DISTINCT
	country 
FROM customers c 

------------------------------------------------------------------------------------------------

-- DERS: 16.12.24

------------------------------------------------------------------------------------------------

-- ALIAS - AS 

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

-- ORDER BY

SELECT *
FROM customers c

SELECT *
FROM customers c
ORDER BY score ASC -- customers tablosunu score degerlerine göre kücükten büyüge siraladik.

SELECT *
FROM customers c
ORDER BY score DESC -- customers tablosunu score degerlerine göre büyükten kücüge siraladik.
/*
PostgreSQL'de NULL degerler ASC siralamasinda en alta gider, DESC'de ise en üste. MYSQL'de ise bu
isleyis tam tersidir. Eger Postgre'de Null degeri en üstte görmek istersek alttaki gibi yazariz: */

SELECT *
FROM customers c 
ORDER BY score ASC NULLS FIRST -- NULL hücreler basa geldi.

SELECT *
FROM customers c
ORDER BY score DESC NULLS LAST -- NULL hücreler alta geldi.

------------------------------------------------------------------------------------------------

-- ORDER BY Icin Iki Kriter Kullanimi

-- SORU: Tüm customers listesini country'e göre alfabetik olarak ve score'a göre büyükten kücüge sirala.

SELECT *
FROM customers c 
ORDER BY country ASC, score DESC
/*
Önce country'e göre siraladik, sonra ülkeleri kendi icerisinde score'a göre tekrar siraladik.
Birden fazla siralamada önce birinci field'dakileri siralar, sonra birinci field'da ayni olanlara
bagli olarak ikinci field'dakileri kendi arasinda siralar. */

-- Order By kullaniminda field adini yazmak yerine tablodaki sira numarasini da yazabiliriz.

SELECT *
FROM customers c
ORDER BY 4 ASC, 5 DESC

------------------------------------------------------------------------------------------------

-- LIMIT

-- Secilen satir sayisi kadar sonucu döndürür.

-- SORU: customers tablosundaki ilk iki satiri getirin.

SELECT *
FROM customers c
LIMIT 2;

------------------------------------------------------------------------------------------------

-- OFSET VE LIMIT

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

-- WHERE

SELECT *
FROM customers c

-- SORU: Sadece German olanlari getirin. - Sadece ifadesinden filtreleme yapilacagi anlasilir.

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

-- AND
/*
WHERE ifadesi icinde birden fazla kosulu birlestirmek icin kullanilir. Bu ifade, tüm kosullarin
dogru oldugu satirlari secer. Yani, AND ifadesiyle birlestirilen her bir kosulun saglanmasi
gereklidir. */

-- SORU: customers tablosundan ülkesi Germany ve score degeri 400'den kücük olanlari listeleyin.

SELECT *
FROM customers c
WHERE
	country = 'Germany'
	AND
	score < 400

------------------------------------------------------------------------------------------------

-- OR	
/*
WHERE ifadesi icinde birden fazla kosulu birlestirmek icin kullanilir. OR ifadesi, belirtilen
kosullardan en az birinin dogru oldugu satirlari secer. Yani, herhangi bir kosulun saglanmasi
yeterlidir. */
	
-- SORU: Ülkesi Germany olanlari veya score degeri 800'den kücük olanlari getirin.
	
SELECT *
FROM customers c
WHERE
	country = 'Germany'
	OR
	score < 800;

------------------------------------------------------------------------------------------------

-- NOT
/*
Bir kosulun tersini almak icin kullanilir. Bu ifade, belirtilen kosul dogru degilse satirlari
secer. NOT, WHERE, HAVING ifadesinde veya baska bir kosul ifadesinde kullanilabilir. */

-- SORU: score degeri 400'den kücük olanlari düsünün ve tam tersini alin:

SELECT *
FROM customers c
WHERE NOT score < 400

------------------------------------------------------------------------------------------------

-- BETWEEN
/*
Bir field'daki degerlerin belirli bir aralik icinde olup olmadigini kontrol etmek icin
kullanilir. BETWEEN ifadesi, iki sinir deger belirterek bu degerler arasindaki
(sinir degerler de dahil) satirlari secer. Bu ifade, sayisal, tarihsel veya alfabetik araliklari
belirlemek icin kullanilabilir. */

-- SORU: score degeri 100 ve 500 arasinda olanlari getirin. (100 ve 500 ikisi de dahil.)

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

-- IN
/*
Bir field degerinin belirli bir dizi degerlerden biri olup olmadigini kontrol etmek icin
kullanilir. Bu ifade, birden fazla degeri kontrol etmek istediginizde OR operatörüne göre daha
okunabilir ve daha kisa bir yazim saglar. */

--SORU: Tüm customers icerisinden custumer_id'si 1, 2, 5 olanlari getirin.

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

-- LIKE

-- SQL'de örüntü eslesmesi yapmak icin kullanilan bir operatördür.
/*	
SORU: customers tablosundaki first_name field'i icerisindeki kayitlardan 'n' karakteri ile biten
kayitlari getirin. */
	
SELECT *
FROM customers c
WHERE first_name
	LIKE '%n' -- Basi ne olursa olsun 'n' ile biten.
/*	
SORU: customers tablosundaki first_name field'i icerisindeki kayitlardan 'M' ile baslayan
kayitlari getirin. */
	
SELECT *
FROM customers c
WHERE first_name
	LIKE 'M%' -- Sonu ne olursa olsun 'M' ile baslayan.	
/*
SORU: customers tablosundaki first_name field'i icerisindeki kayitlardan ortasinda 'r'
gecenleri getirin. */
	
SELECT *
FROM customers c
WHERE first_name
	LIKE '%r%' -- Basi ve sonu ne olursa olsun arasinda 'r' olan.
	
------------------------------------------------------------------------------------------------

-- ILIKE Komutu

-- Büyük/kücük harf duyarliligi olmadan arama yapmak icin kullanilir. (no case sensitive)

-- SORU: customers tablosunda, country sütununda "usa" kelimesini büyük/kücük harf duyarliligi olmadan listeleyin.
	
SELECT *
FROM customers c
WHERE country ILIKE 'usa';	
	
------------------------------------------------------------------------------------------------	
	
-- AGGREGATE Fonksiyonlari

-- COUNT()
/*
SQL'de bir sorgu sonucunda belirli bir sütundaki degerlerin sayisini döndüren bir toplu islevdir.
Hesaplamalar, yeni deger türetmeler veya gruplandirilmis verileri Select icinde tanimladigimizdan
count fonksiyonunu da SELECT'ten sonra yazariz. Count fonksiyonunu kullanip kullanmayacagimizi
anlamak adina total number anahtar kelimesini akilda tutabiliriz. */

-- SORU: custmers icin total sayi nedir hesaplayin.

SELECT *
FROM customers c 

SELECT count(*) AS total_customers -- 1. yol
FROM customers c

SELECT count(customer_id) total_customers -- 2. yol
FROM customers c
/*
Eger müsteri sayisinin tamamini elde etmek istersek count fonksiyonunu (*) ile kullanmaliyiz
ya da customer_id gibi bir field'i saydirmaliyiz. (Primary Key olan) */

SELECT count(score) total_scores -- count() NULL hücreyi saymaz.
FROM customers c

SELECT 
	COUNT(distinct country) as country_unique_deger_sayisi, -- unique olan deger sayisini sayar.
	COUNT(c.*) as hepsi_null_olmayan_row_sayisi -- COUNT(TableName.*)
FROM customers c
/*
COUNT(TableName.*) kullaniminda eger tüm satir degerleri NULL olan bir satir olsaydi o zaman bu
satiri saymayacakti. */

------------------------------------------------------------------------------------------------

-- SUM()
/*
SQL'de bir sütundaki sayisal degerlerin toplamini hesaplamak icin kullanilan bir toplu islevdir.
Bir sütundaki tüm değerlerin toplamini döndürür. Yalnizca sayisal sütunlarla calisir. NULL'lar
0 olarak ele alinir. */

-- SORU: orders icin toplam quantity ne kadardir hesaplayin.

SELECT *
FROM orders o 

SELECT sum(quantity) AS total_quantity
FROM orders o 

------------------------------------------------------------------------------------------------

-- AVG()
/*
SQL'de bir sütundaki sayisal degerlerin ortalamasini hesaplamak icin kullanilir. Bir sütundaki
degerlerin ortalamasini döndürür. Yalnizca sayisal sütunlarla calisir. NULL degerleri dikkate
almaz. */

-- SORU: Tüm customers icin ortalama score nedir hesaplayin.

SELECT avg(score) AS average_scores -- NULL hücreyi dikkate almayip 4'e böldü, 5 deger olmasina ragmen.
FROM customers 

-- Eger NULL hücreye bir deger atayarak ortalamaya katilmasini istersek. 

SELECT AVG(COALESCE(score, 0)) AS average_scores -- NULL degerini 0 olarak degistirdik.
FROM customers c

SELECT AVG(COALESCE(score, (SELECT AVG(score) FROM customers))) AS average_scores -- NULL degerini ortalama ile degistirdik.
FROM customers;

SELECT sum(score) / count(*) AS average_scores -- COALESCE kullanmadan NULL degerini 0 olarak atadik.
FROM customers c

------------------------------------------------------------------------------------------------

-- MIN() MAX()

-- SORU: customers icin en yüksek score degeri nedir hesaplayin.

SELECT max(score) AS max_score
FROM customers c 

-- SORU: customers icin en düsük score degeri nedir hesaplayin.

SELECT min(score) AS min_score
FROM customers c

-- SORU: Ilk ve son siparisin tarihini min-max fonksiyonlarini kullarak hesaplayin.

SELECT *
FROM orders o

SELECT min(order_date) AS first_order
FROM orders o

SELECT max(order_date) AS last_order
FROM orders o

-- Alternatif yol min()

SELECT order_date AS first_order
FROM orders o
ORDER BY order_date ASC
LIMIT 1

-- Alternatif yol max()

SELECT order_date AS last_order
FROM orders o
ORDER BY order_date DESC 
LIMIT 1

------------------------------------------------------------------------------------------------

-- DERS: 19.12.24

------------------------------------------------------------------------------------------------

-- GROUP BY
/*
SQL sorgularinda verileri belirli bir sütuna göre gruplamak ve bu gruplar üzerinde toplu islemler
yapmak icin kullanilir. Özellikle SELECT ifadesi icinde ve genellikle COUNT, SUM, AVG, MIN, MAX
gibi toplu islevlerle birlikte kullanilir. */

-- SORU: Her bir ülke icin total customers sayilarini getirin. (Her bir kelimesine dikkat edin.)

SELECT *
FROM customers c 

SELECT
	count(*) AS total_customers,
	country -- GROUP BY ifadesinin icinde yazan burada da yazilmali
FROM customers c
GROUP BY country

-- SORU: Her bir ülke icin total customers sayilarini getirirken toplam sayiya göre büyükten kücüge siralayin.

SELECT
	COUNT() (*) AS total_customers,
	country
FROM customers c
GROUP BY country
ORDER BY COUNT(*) DESC

-- SORU: Her bir ülke icin en yüksek score degerini getirin.

SELECT
	country,
	max(score) AS max_score
FROM customers c
GROUP BY country

-- Her bir ifadesi --> Group By, en yüksek ifadesi --> max()

------------------------------------------------------------------------------------------------

-- HAVING()

-- HAVING: GROUP BY ifadesi ile gruplanmis sonuc kümelerini filtrelemek icin kullanilir. (Group By'siz asla!)
-- WHERE: Satirlari gruplamadan önce genel tabloyu filtreler.

-- SORU: Her bir ülke icin toplam müsteri sayisini bulup sadece 1'den fazla olan sonuclari getirin.


SELECT *
FROM customers c 

SELECT 
	country,
	COUNT(*) AS total_customers
FROM customers c 
GROUP BY country 
HAVING COUNT(*) > 1; 

------------------------------------------------------------------------------------------------

-- STRING Fonksiyonlari

-- CONCAT()
/*
SQL'de bir veya daha fazla karakter dizisini birlestirmek veya birlesik bir karakter dizisi
olusturmak icin kullanilir. */

-- SORU: customers tablosunda first_name ve last_name'i, araya tire (-) isareti ekleyerek combine edin.

SELECT * FROM customers c

SELECT
	CONCAT(first_name, '-', last_name) AS full_name
FROM customers c

------------------------------------------------------------------------------------------------

-- UPPER() - LOWER()
/*
SQL'de metin sütunlarindaki karakterleri büyük harfe (UPPER) veya kücük harfe (LOWER) dönüstürmek
icin kullanilir. */

-- SORU: customers icin first_name'i büyük harflere, last_name'i kücük harflere dönüstürün.

SELECT
	UPPER(first_name) AS upper_first_name,
	LOWER(last_name) AS lower_last_name
FROM customers c

------------------------------------------------------------------------------------------------

-- LENGTH()

-- Bir metin veya karakter dizisinin uzunlugunu (karakter sayisini) döndüren bir fonksiyondur.

SELECT 
	last_name,
	LENGTH(last_name) AS leng_last_name
FROM customers c

------------------------------------------------------------------------------------------------

-- TRIM()
/*
SQL'de bir metin veya karakter dizisinin basindaki ve/veya sonundaki bosluklari
(veya belirli karakterleri) kaldirmak icin kullanilir. */

-- TRIM öncesi ve sonrasi uzunluklar

SELECT
	last_name,
	LENGTH(last_name) AS leng_last_name, -- TRIM öncesi uzunluklar
	TRIM(last_name) AS clean_lastname, -- TRIM isleminin kendisi
	LENGTH(TRIM(last_name)) AS clean_length_lastname -- TRIM sonrasi uzunluklar
FROM customers c 

-- Uzunluklar ayni cikti cünkü kirli bir data degildi.

------------------------------------------------------------------------------------------------

-- DERS: 20.12.24

------------------------------------------------------------------------------------------------

-- SUBSTRING()

-- SQL'de bir metin veya karakter dizisinden belirli bir alt dizesini almak icin kullanilir.

SELECT *
FROM customers c

SELECT
	last_name,
	substring(last_name, 2, 3)
FROM customers c

------------------------------------------------------------------------------------------------

-- REPLACE()

-- String ifadeleri yenisi ile degistirmek icin kullanilir.
/*
SORU: customers tablosundaki müsterilerin country alaninda bulunan "USA" degerlerini
"United States" olarak güncelleyin. */

SELECT *
FROM customers c

SELECT
	customer_id ,
	first_name ,
	last_name ,
	REPLACE(country, 'USA', 'United States') AS country2,
	score
FROM customers c

------------------------------------------------------------------------------------------------

-- REVERSE()

-- String ifadeyi ters cevirir.

-- SORU: customers tablosundaki firs_name'i ters cevirerek görüntüleyin.

SELECT *
FROM customers c

SELECT
	customer_id,
	REVERSE(first_name) AS reversed_name,
	last_name 
FROM customers c 

------------------------------------------------------------------------------------------------

-- REPLACE() REVERSE() Birlikte Kullanimi

-- SORU: Employee tablosundakilerin isimlerini tersine cevirin ve icindeki 'a' harflerini '@' isaretiyle degistirin.

SELECT *
FROM employees e 

SELECT
	emp_id,
	REPLACE(REVERSE(first_name), 'a', '@') AS replaced_reversed_name,
	last_name 
FROM employees e

------------------------------------------------------------------------------------------------

-- UPDATE()

-- syntax acisindan mutlaka bu 3'lü kelime grubunu alt alta kullanmaliyiz:

-- UPDATE
-- SET
-- WHERE

SELECT *
FROM customers c

INSERT INTO customers VALUES (6, 'Anna', 'Nixon', 'UK', NULL)

INSERT INTO customers (customer_id, first_name, last_name) VALUES (7, 'Max', 'Lang')

-- SORU: customer_id'si 6 olan kisinin ülkesini Germany olarak güncelleyin.

UPDATE customers
SET country = 'Germany'
WHERE customer_id = 6

-- Saglikli güncelleme olmasi icin kisinin ismi yerine ID'si üzerinden gitmek dogrudur.

SELECT * -- UPDATE edilen deger en alta gider.
FROM customers c

-- SORU: Anna isimli kisinin score degerini 100 ve ülkesini USA olarak degistirin, güncelleyin.

UPDATE customers
SET country = 'USA', score = 100
WHERE customer_id = 6

------------------------------------------------------------------------------------------------

-- DELETE() / TRUNCATE()

-- DELETE ile TRUNCATE ve DROP sorgusu arasindaki fark nedir?
-- DELETE, veritabanindaki tablodan bir veya daha fazla mevcut kaydi siler.
-- TRUNCATE, mevcut tablodaki tüm satirlari siler ve sütunlari adlariyla birakir.
-- DROP, tablonun tamamini veritabanindan cikarir.

-- SORU: Yeni eklenen Anna'yi ve Max'i customers tablosundan silin.

DELETE
FROM customers
WHERE customer_id IN (6, 7)

SELECT *
FROM customers c 

--SORU: Tüm customers'lari database'den kaldir ama tablo sablonu kalsin.

TRUNCATE TABLE customers
	
INSERT INTO customers (customer_id, first_name, last_name, country, score) VALUES
(1, 'Maria', 'Cramer', 'Germany', 350),
(2, 'John', 'Steel', 'USA', 900),
(3, 'Georg', 'Pipps', 'UK', 750),
(4, 'Martin', 'Müller', 'Germany', 500),
(5, 'Peter', 'Franken', 'USA', NULL);
	
------------------------------------------------------------------------------------------------

-- VACUUM()
/*
 PostgreSQL'de bir tablo veya veri silindiginde disk alanini geri kazanmak istiyorsaniz, VACUUM
 komutunu kullanabilirsiniz. VACUUM komutu silinen verilerin yer kaplamasini önler, bos alani
 temizler ve veritabanindaki diger islemler icin kullanilabilir hale getirir. 

Syntax: VACUUM FULL table_name; */
	
------------------------------------------------------------------------------------------------

-- DERS: 23.12.24

------------------------------------------------------------------------------------------------	
	
-- ALTER TABLE
/*
ALTER TABLE tabloda ADD, MODIFY veya DROP/DELETE COLUMNS islemleri icin kullanilir.
ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de kullanilir. */

CREATE TABLE public.persons ( -- public ifadesi Schemas'i gösterir burada yazilmayabilirdi.
	id SERIAL PRIMARY KEY,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL UNIQUE
                            );

-- SORU: persons tablosuna email diye bir field ekleyin.

ALTER TABLE persons
ADD email varchar(20) UNIQUE 

SELECT *
FROM persons

-- SORU: persons tablosuna adress isimli bir field ekleyin.

ALTER TABLE persons
ADD COLUMN adress varchar(100) NOT NULL -- COLUMN ifadesi opyisoneldir.

-- SORU: persons tablosundan adress isimli field'i kaldirin.

ALTER TABLE persons
DROP adress;

-- SORU: persons tablosunda phone field'inin veri tipini varchar(20) olarak degistirin.

ALTER TABLE persons
ALTER COLUMN phone TYPE VARCHAR(20)

-- SORU: persons tablosunun adini contacts olarak degistirin.

ALTER TABLE persons
RENAME TO contacts

SELECT * FROM persons p -- Hata verir cünkü tablonun adini degistirdik.

SELECT * FROM contacts

-- SORU: contacts tablosundaki phone field'inin adini contact_number olarak degistirin.

ALTER TABLE contacts
RENAME COLUMN phone TO contact_number;

SELECT * FROM contacts c

-- SORU: customers tablosundaki score field'ina NOT NULL contraint'i ekleyin.

ALTER TABLE customers
ALTER COLUMN score SET NOT NULL -- Bu kodda hata alinir cünkü mevcut field'da NULL degerler var.

------------------------------------------------------------------------------------------------

-- SUBqueries - Nested Query
/*
Bir SQL sorgusunun icinde baska bir SQL sorgusunun yer almasidir. İc ice sorgular, daha karmasik
sorgular olusturmamizi saglar ve genellikle alt sorgunun sonucuna bagli olarak dis sorgunun
calismasini saglar. */

-- SORU: customers ID'i kullanarak score degeri 500'den büüyk olan customers'larin order detaylarini getirin.

SELECT * FROM customers c

SELECT * FROM orders o 
/*
SELECT *
FROM orders
WHERE customer_id IN (2, 3) -> customer_id = 2 OR customer_id = 3 seklinde de yazabiliriz.

2, 3 degerini asagidaki tablodan buldugumuz icin asagidaki sorguyu yukaridaki sorgunun icine gömebiliriz.

SELECT customer_id 
FROM customers c
WHERE score > 500 */

SELECT *
FROM orders
WHERE customer_id IN (
	SELECT customer_id
	FROM customers c
	WHERE score > 500
                     );

------------------------------------------------------------------------------------------------

-- DERS: 24.12.24

------------------------------------------------------------------------------------------------

-- JOINS
/*
SQL (Structured Query Language) sorgularinda birden fazla tablodan veri almak icin kullanilan
bir terimdir. İki veya daha fazla tabloyu belirli bir iliski veya kosul üzerinde birlestirerek
iliskili verileri birlestirilmis sonuclar olarak döndürmeyi saglar. */

-- INNER JOIN

--SORU: customer_id, first_name, order_id ve quantity field'larini sadece eslesen satirlari alarak listeleyin.

SELECT * FROM customers c

SELECT * FROM orders o

SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id

-- LEFT JOIN
/*
Sol tablodaki tüm kayitlari, sag tablodaki eslesen kayitlarla birlikte döndürür.
Eger sag tabloda eslesen bir kayit yoksa, sol tablodaki kayit yine döner ancak sag tablo icin
alanlar NULL degeri alir. */
/*
-- SORU: customers tablosundan customer_id, first_name ve orders tablosundan orderid, quantity
field'larini left join tarzinda birlestirerek getirin. */

SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity 
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

-- RIGHT JOIN

SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity 
FROM customers c 
RIGHT JOIN orders o 
ON c.customer_id = o.customer_id

-- FULL JOIN
/*
Sol ve sag tablodaki tüm kayitlari (eslesenler ve eslesmeyenler dahil) birlestirir. Eslesmeyen alanlar
icin NULL degerler döner. */
/*
SORU: customers tablosundan customer_id, first_name ve orders tablosundan orderid, quantity field'larini
full join tarzinda birlestirerek getiriniz. */

SELECT 
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity 
FROM customers c 
FULL JOIN orders o 
ON c.customer_id = o.customer_id 

------------------------------------------------------------------------------------------------

-- DERS:

------------------------------------------------------------------------------------------------

	