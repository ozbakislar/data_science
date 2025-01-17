-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- Blue SQL

------------------------------------------------------------------------------------------------

-- DERS: 12.12.24

------------------------------------------------------------------------------------------------

CREATE TABLE personel (
	id SERIAL PRIMARY KEY,
	departman_id INTEGER NOT NULL,
	ulke_id VARCHAR(50) NOT NULL,
	ad VARCHAR(50) NOT NULL,
	soyad VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	dogum DATE NOT NULL,
	maas NUMERIC(10, 2) NOT NULL
                       );

INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (1, 4, 'TR', 'Mehmet', 'Ozman', 'grafiker@yahoo.com', '1976-11-01', 2500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (2, 5, 'TR', 'Güray', 'Oskay', 'gurayoskay@gmail.com', '1979-02-03', 1500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (3, 5, 'TR', 'Serkan', 'Çiftçi', 'kizilsakal@trumpet.sk', '1982-12-04', 850);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (4, 8, 'TR', 'Emre', 'Büyükkalfa', 'emrebuyukkalfa@hotmail.com', '1978-07-13', 2000);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (5, 4, 'TR', 'Ali', 'Polat', 'hasanali@hotmail.com', '1978-09-05', 3500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (6, 5, 'TR', 'Özgür', 'Şengül', 'ozgursengul@yahoo.com', '1981-11-16', 900);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (7, 5, 'TR', 'Can', 'Göksun', 'cangoksun@gmail.com', '1980-05-19', 1200);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (8, 5, 'TR', 'Dara', 'Ganjiavi', 'daragan@yahoo.com', '1975-02-14', 1500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (9, 5, 'TR', 'Elif', 'Akşar', 'elifeel@hotmail.com', '1975-12-26', 750);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (10, 3, 'TR', 'Azade', 'Çerkezoğlu', 'info@azade.info', '1979-09-05', 2200);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (11, 3, 'TR', 'Asude', 'Çerkezoğlu', 'asude@gmail.com', '1973-09-05', 1100);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (12, 8, 'TR', 'Cengiz', 'Çerkezoğlu', 'cengiz@gmail.com', '1950-01-01', 2600);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (13, 1, 'TR', 'Seval', 'Çerkezoğlu', 'sevalc@gmail.com', '1962-05-01', 1200);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (14, 1, 'TR', 'Aytek', 'Karadeniz', 'aytek@hotmail.com', '1983-10-11', 950);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (15, 2, 'TR', 'Eralp', 'Görgün', 'eralpgorgun@yahoo.com', '1982-04-24', 1600);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (16, 2, 'TR', 'Çağrı', 'Singör', 'cagri.singor@hotmail.com', '1978-02-05', 850);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (17, 2, 'TR', 'Peyman', 'Köseoğlu', 'pudi@yahoo.com', '1952-07-24', 2600);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (18, 8, 'TR', 'Yaman', 'Köseoğlu', 'yamank@superonline.com', '1945-07-06', 3300);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (19, 4, 'TR', 'Doğan', 'Tacikayan', 'dogant@yahoo.com', '1985-03-02', 1500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (20, 3, 'TR', 'Sema', 'Özkul', 'semai@hotmail.com', '1976-10-19', 1400);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (21, 8, 'TR', 'Hakan', 'Çolak', 'hakancolak@yahoo.com', '1972-06-18', 1600);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (22, 9, 'TR', 'Dilek', 'Çolak', 'dilekcolak@gmail.com', '1973-06-16', 1600);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (23, 8, 'TR', 'Gürkan', 'Engin', 'gurkanengin@gmail.com', '1970-07-11', 1600);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (24, 1, 'TR', 'Alperen', 'Canıdemir', 'alperenc@hotmail.com', '1978-11-01', 1400);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (25, 1, 'TR', 'Yavuz', 'Akbaş', 'yavak@gmail.com', '1969-12-05', 1500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (26, 2, 'TR', 'Bülent', 'Çavuş', 'bulentc@msn.com', '1981-11-04', 1900);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (27, 2, 'TR', 'Cüneyt', 'Değertekin', 'cucu@msn.com', '1979-12-28', 1450);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (28, 9, 'TR', 'Ersin', 'Ergen', 'ersinergen@yahoo.com', '1973-01-28', 2000);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (29, 9, 'TR', 'Fatih', 'Zenginer', 'fatihz@gmail.com', '1978-12-27', 1650);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (30, 9, 'TR', 'Mehmet', 'Ergül', 'malier@hotmail.com', '1970-07-25', 1450);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (31, 9, 'TR', 'Mehmet', 'Ün', 'mehmet_un@yahoo.com', '1980-07-20', 1500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (32, 1, 'TR', 'Ramazan', 'Salman', 'ramazansalman@yahoo.com', '1978-06-18', 1300);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (33, 3, 'TR', 'Yeşim', 'Kantar', 'yesim21@yahoo.com', '1972-06-16', 1200);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (34, 1, 'TR', 'İlkay', 'Yalçın', 'ilkayal@gmail.com', '1982-07-15', 900);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (35, 2, 'TR', 'Cenker', 'Uçan', 'cenker@gmail.com', '1969-05-15', 3400);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (36, 3, 'TR', 'Okan', 'Metin', 'okaniko@hotmail.com', '1982-03-14', 1400);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (37, 4, 'TR', 'Ercan', 'Paksoylu', 'ercanpak@hotmail.com', '1975-07-11', 1800);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (38, 5, 'TR', 'Ercüment', 'Paksoylu', 'ercupak@hotmail.com', '1978-05-01', 2400);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (39, 2, 'TR', 'Ahu', 'Akar', 'ahuakar@yahoo.com', '1978-11-01', 4500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (40, 8, 'TR', 'Cemal', 'Akar', 'cemalakar@yahoo.com', '1972-01-01', 3500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (41, 8, 'TR', 'Kemal', 'Akar', 'kemalakar@yahoo.com', '1950-10-03', 2400);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (42, 3, 'TR', 'Gülten', 'Akar', 'gultenakar@yahoo.com', '1960-09-20', 1200);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (43, 6, 'TR', 'Suna', 'Yaşar', 'suna.yasar@gmail.com', '1970-10-20', 650);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (44, 6, 'TR', 'Mehmet', 'Yaşar', 'mehmet.yasar@gmail.com', '1968-10-22', 900);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (45, 9, 'TR', 'Dilek', 'Ergen', 'dileker@msn.com', '1975-12-12', 1200);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (46, 2, 'TR', 'Hasan', 'Çerkezköylü', 'hasanc@msn.com', '1970-12-31', 1200);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (47, 0, 'TR', 'Ekin', 'Boylan', 'ekinboylan@hotmail.com', '1970-04-04', 400);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (48, 4, 'DE', 'Hans', 'Müller', 'hansm@libero.id', '1976-12-13', 2500);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (49, 1, 'DE', 'Lisa', 'Schaudi', 'lisas@gmx.de', '1970-10-19', 3600);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (50, 2, 'UK', 'Gabriel', 'Franklin', 'gabriel_franklin@yahoo.com', '1980-09-01', 2250);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (51, 5, 'JP', 'Yoshi', 'Mitsu', 'yoshimitsu@tekken.com', '1976-10-12', 1000);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (55, 7, 'TR', 'İhsan', 'Taşdemir', 'itasdemir@msn.com', '1960-12-15', 400);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (56, 7, 'TR', 'Reha', 'Engin', 'rehaengin@yahoo.com', '1978-12-12', 450);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (57, 1, 'TR', 'Reha', 'Engin', 'reha.engin@gmail.com', '1945-01-01', 800);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (58, 5, 'JP', 'Jin', 'Kazama', 'jinkazama@tekken.com', '1978-12-27', 950);
INSERT INTO personel (id, departman_id, ulke_id, ad, soyad, email, dogum, maas) VALUES (59, 4, 'DE', 'Kerem', 'Köseoğlu', 'kerem@doublekey.org', '1978-12-27', 4100);

SELECT * 
FROM personel

------------------------------------------------------------------------------------------------

CREATE TABLE departman (
	id SERIAL PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    odano VARCHAR(20) NULL
                       );

INSERT INTO departman (id, ad) VALUES
(1, 'Muhasebe'),
(2, 'İnsan Kaynakları'),
(3, 'Pazarlama'),
(4, 'IT'),
(5, 'Üretim'),
(6, 'Temizlik'),
(7, 'Güvenlik'),
(8, 'Yönetim'),
(9, 'Lojistik');

SELECT * 
FROM departman

------------------------------------------------------------------------------------------------

CREATE TABLE musteri (
 	id SERIAL PRIMARY KEY,
 	ulke_id VARCHAR(2) NOT NULL,
 	ad VARCHAR(50) NOT NULL,
 	soyad VARCHAR(50) NOT NULL,
 	email VARCHAR(50) NOT NULL UNIQUE,
 	dogum DATE,
 	kullaniciadi VARCHAR(50) NOT NULL UNIQUE,
 	sifre VARCHAR(50) NOT NULL,
 	bgcolor VARCHAR(7)
                     );

INSERT INTO musteri (ulke_id, ad, soyad, email, dogum, kullaniciadi, sifre, bgcolor) VALUES
('TR', 'Bülent', 'Muska', 'bulentmuska@msn.com', '1980-10-13', 'bulent', 'b0e75b7691b253f27451b953001b0fda', '#ffffff'),
('TR', 'Nuri', 'Çolak', 'nuric@hotmail.com', '1976-06-02', 'sap', '2d1b2a5ff364606ff041650887723470', '#ffcc00'),
('TR', 'Mete', 'Çağlayan', 'mete.caglayan@sap.com', '1976-01-05', 'sivribiber', 'c7d9950f607ee6574109a9fc8ebe4c0e', '#cccccc'),
('TR', 'Begüm', 'Güven', 'begum77@yahoo.com', '1977-11-08', 'wookie', '7eb8844fd48cc40732ef5ff47a1e6378', '#000000'),
('TR', 'Buket', 'Akçetin', 'buket.akcetin@klueber.de', '1978-06-22', 'bukle', '8128bb905f44b01f31bdce5052f7168b', '#000000'),
('TR', 'Cemal', 'Çinkılıç', 'cemal@doublekey.org', '1978-12-27', 'cemal', '35393c24384b8862798716628f7bc6f4', '#ffffff'),
('TR', 'Burak', 'Göreli', 'burak.goreli@diss.com', '1972-10-15', 'hummer', 'd6e4c2f87ffb3d1ea114d4dcc024b40d', '#000000'),
('TR', 'Okay', 'Alp', 'okay@gmail.com', '1974-07-02', 'okayalp', '8a21299df04e5d0d2666a1bac264f3bf', '#ffffff'),
('TR', 'Azra', 'Yalnız', 'azra@gmail.com', '1972-10-15', 'azrael', '827ccb0eea8a706c4c34a16891f84e7b', '#ffcc00'),
('TR', 'Oya', 'Başar', 'oyabas@hotmail.com', '1973-02-02', 'oyab', '243e1dab25756ff5371f2159ed435f47', '#000000'),
('TR', 'Kayıhan', 'Onuk', 'kayihano@hotmail.com', '1978-03-22', 'kaykay', '24e279a2b9cefd0ff8410f3d310d4524', '#000000'),
('TR', 'Tolga', 'Ader', 'tolgader@hotmail.com', '1972-10-15', 'tolgader', 'f094b3ba050b9686eb8e557eacfd01e6', '#cccccc'),
('TR', 'Tolga', 'Çavuşoğlu', 'tolga.cavusoglu@eczacibasi.com.tr', '1972-07-09', 'tolgac', '18cf6b1fcc6f34a15b7b553860ad705a', '#000000'),
('TR', 'Volkan', 'Özkoçak', 'master@gmail.com', '1970-10-18', 'volki', '089ac4682a780fd36a19a6279c977758', '#ffcc00'),
('UK', 'Melissa', 'Crawford', 'melcraw@mirc.co.uk', '1983-10-19', 'melcraw', '25d55ad283aa400af464c76d713c07ad', '#000000'),
('TR', 'Barış', 'Çekiç', 'baris.cekic@t-systems.com.tr', '1970-10-22', 'peace', 'd35a02eb49149450fb2fffc6e467eb37', '#cccccc'),
('DE', 'Horst', 'Müller', 'horst@gmail.com', '1970-07-07', 'horst', 'fb46aed9b51e53a33a2714a13a371c9a', '#ffcc00'),
('DE', 'Kurt', 'Frankfurter', 'kurtfrank@yahoo.com', '1971-05-13', 'kurtf', '9dca5e87630b9185169af2d17f5c11f4', '#ffffff'),
('TR', 'Yavuz', 'Çetin', 'yavuz.cetin@otherside.com', '1970-05-12', 'yavuz', '5195dacabbea185567e62b2bcdd6de7c', '#cccccc'),
('TR', 'Kerim', 'Çaplı', 'kerim.capli@otherside.com', '1960-08-01', 'kerimcapli', '5195dacabbea185567e62b2bcdd6de7c', '#ffffff');

SELECT * 
FROM musteri

------------------------------------------------------------------------------------------------

CREATE TABLE siparis (
	id SERIAL PRIMARY KEY,
    tarih DATE,
    musteri_id INTEGER
                     );

INSERT INTO siparis (id, tarih, musteri_id) VALUES
(1, '2005-01-01', 18),
(2, '2005-01-01', 2),
(3, '2005-01-03', 2),
(4, '2005-01-04', 7),
(5, '2005-01-05', 9),
(6, '2005-01-05', 15),
(7, '2005-01-12', 20),
(8, '2005-04-04', 2),
(9, '2005-04-10', 1);

SELECT * 
FROM siparis 

------------------------------------------------------------------------------------------------

CREATE TABLE ulke (
	id SERIAL PRIMARY KEY,
    ad VARCHAR(2),
    orjinalad VARCHAR(50)
                  );

INSERT INTO ulke (ad, orjinalad) VALUES  
('TR', 'Türkiye'),
('DE', 'Almanya'),
('UK', 'İngiltere'),
('JP', 'Japonya');

SELECT * 
FROM ulke 

------------------------------------------------------------------------------------------------

-- DERS: 13.12.24

------------------------------------------------------------------------------------------------

-- SORU: Sirkette calisan bütün elemanlarin listesini getir.

SELECT *
FROM personel p 

-- SORU: Sirkette calisan bütün elemanlarin ad, soyad ve maas bilgilerini iceren listeyi getir.

SELECT
	ad,
	soyad,
	maas
FROM personel p 

------------------------------------------------------------------------------------------------

-- SORU: Simdiye kadar en az bir siparis vermis olan müsterilerin ID'lerinin listesini getir.

SELECT DISTINCT
	musteri_id 
FROM siparis s 

------------------------------------------------------------------------------------------------

-- DERS: 16.12.24

------------------------------------------------------------------------------------------------
/*
SORU: Elemanlarin adini, soyadini ve maasini listelerken Ad sütununun basligi 'A', soyad
sütununun basligi ise 'S' olsun. Maas sütununun basligi yine 'maas' olarak kalabilir. */

-- Önce tablomuzu cagirip hatirlayalim.

SELECT *
FROM personel p

-- Bu sekilde a ve s harflerini büyük yapamadik.

SELECT
	ad AS A,
	Soyad S,
	maas
FROM personel p
/*
Dogru Cözüm: Cift tirnak field isimlerini düzenlerken, tek tirnak ise Insert Into gibi valuelari
ifade etmek icin kullanilir. */

SELECT
	ad AS "A",
	Soyad "S",
	maas
FROM personel p

------------------------------------------------------------------------------------------------

-- SORU: Sirkette calisan herkesin listesini kisilerin ismine göre dizilmis halde getirin. 

SELECT *
FROM personel p
ORDER BY ad ASC

-- SORU: Sirkette calisan herkesin listesini kisilerin ismine göre tersten dizilmis halde getirin.

SELECT *
FROM personel p
ORDER BY ad DESC
/*
SORU: Bütün sirket calisanlarinin ad, soyad ve maas bilgilerinin tam listesini; ada göre ters
soyada göre ters ve maasa göre düz bir sekilde sirali getirin. */
      
SELECT ad, soyad, maas
FROM personel p
ORDER BY ad DESC, soyad DESC, maas ASC

------------------------------------------------------------------------------------------------

-- SORU: Ilk siparis vermis olan müsteriyi bulun.

SELECT *
FROM siparis s

SELECT
	musteri_id AS "MUSTERI"
FROM siparis s
ORDER BY id -- Tarih field'i da kullanilabilirdi.
LIMIT 1;

-- LIMIT'e alternatif olarak kullanilabilen alttaki sorgu da vardir:

SELECT *
FROM personel p

SELECT *
FROM personel p
ORDER BY maas
OFFSET 5
ROWS FETCH NEXT 3 ROWS ONLY; -- LIMIT 3

------------------------------------------------------------------------------------------------

-- DERS: 17.12.24

------------------------------------------------------------------------------------------------

-- SORU: Personellerden ulke_id'si TR olanlari getirin.

SELECT *
FROM personel p
WHERE ulke_id = 'TR'

-- SORU: Ismi Mehmet olanlari getirin.

SELECT *
FROM personel p 
WHERE ad = 'Mehmet'

-- SORU: 1 Kasim 1978 tarihinde dogmus bütün calisanlarin ad, soyad, dogum günü bilgilerini getirin.

SELECT ad, soyad, dogum 
FROM personel p
WHERE dogum = '1978-11-01'


------------------------------------------------------------------------------------------------

-- SORU: Mehmet Ozman isimli personelin tüm özlük bilgilerini getirin.

SELECT *
FROM personel
WHERE ad = 'Mehmet' AND soyad = 'Ozman';

------------------------------------------------------------------------------------------------

-- SORU: Adi Mehmet veya Dilek olan kisilerin tam listesini getirin.

SELECT *
FROM personel p
WHERE
	ad = 'Mehmet'
 	OR
 	ad = 'Dilek'
 	
--SORU: Adi Mehmet veya Dilek olan ve maasi 1400'ün üzerinde olan calisanlarin listesini getirin.
 	
SELECT *
FROM personel p
WHERE                              
	(ad = 'Mehmet'OR ad = 'Dilek') 
    AND 
    maas > 1400
/*
Parantez koyarsak öncelik siralamasindaki karisikligi engelleriz. Sorgulamada parantez
kullanilmadigi takdirde operatör önceligi AND'e verir. Bu da sorgu sonucunu degistirir. */
    
------------------------------------------------------------------------------------------------
/*
SORU: Maasi 1000 ile 2000 arasinda olan bütün calisanlarin id, ad, soyad ve maas bilgilerini
getirin. Liste maas tutarina göre siralanmis olsun. */
    
SELECT
 	id,
 	ad,
 	soyad,
 	maas
FROM personel p
WHERE maas
	BETWEEN 1000 AND 2000
ORDER BY maas;

-- SORU: 1978 yilinda dogmus bütün calisanlarin ad, soyad ve dogum günü bilgilerini getirin.

SELECT
	ad,
	soyad,
	dogum AS dogum_gunu
FROM personel p
WHERE dogum
	BETWEEN '1978-01-01' AND '1978-12-31'
	
------------------------------------------------------------------------------------------------
/*
Her bir calisanin ID’sini, adini, soyadini ve Marduk geldiginde kac gündür yasiyor olacagini
iceren bir liste hazirlayin. (Marduk gelis tarihi: 21 Aralik 2012) */

SELECT
	id,
	ad,
	soyad,
	('2012-12-21' - dogum) AS gunfarki
FROM personel p

------------------------------------------------------------------------------------------------
/*
SORU: İsmi Mehmet, Dilek veya Cengiz olan bütün calisanlari listeleyin.
      Liste ad ve soyada göre siralanmis olsun. */

SELECT *
FROM personel p
WHERE ad
	IN('Mehmet', 'Dilek', 'Cengiz')
ORDER BY ad, soyad -- DEFAULT deger ASC

-- Birden fazla OR kullanimi IN kullanimi demektir.

------------------------------------------------------------------------------------------------

-- DERS: 18.12.24

------------------------------------------------------------------------------------------------

-- SORU: Ismi 'A' ile baslayan bütün calisanlarin listesini getirin.

SELECT *
FROM personel p

SELECT *
FROM personel p
WHERE ad
	LIKE 'A%'
	
-- SORU: Soyadi 'oğlu' ile biten bütün calisanlarin listesini getirin.

SELECT *
FROM personel p
WHERE soyad 
	LIKE '%oğlu'

------------------------------------------------------------------------------------------------

-- SORU: Toplam calisan sayisini getirin.
	
SELECT *
FROM personel p
	
SELECT COUNT (*) AS total_personel -- count(id) de kullanilabilirdi.
FROM personel p

------------------------------------------------------------------------------------------------

-- SORU: Önümüzdeki ay elemanlara toplam ne kadar maas verilmesi gerektigini hesaplayin.

SELECT *
FROM personel p

SELECT SUM(maas) AS toplam_maas
FROM personel;

-- SORU: İsmi Mehmet olan personellerin toplam maasini hesaplayin.

SELECT sum(maas) AS "Mehmetler_toplam_maas"
FROM personel p
WHERE ad = 'Mehmet'

-- Yukaridaki soruya ilave olarak toplam maas degerinin sonuna TL isareti eklemek icin

SELECT CONCAT(SUM(maas),' ', 'TL') AS "Mehmetler_toplam_maas"
FROM personel p
WHERE ad = 'Mehmet'

-- SORU: Muhasebe depertmanina ödenmesi gereken toplam maas ne kadar hesaplayin.

SELECT *
FROM personel p -- personel tablosunda muhasebe depertmaninin id'si direkt belirtilmemis.

SELECT id
FROM departman d 
WHERE ad = 'Muhasebe' -- depertman tablosundan muhasebe departmaninin id'sinin 1 oldugunu ögrendik.

SELECT sum(maas) AS muhasebe_toplam_maas
FROM personel p
WHERE departman_id = 1

------------------------------------------------------------------------------------------------

-- SORU: Sirkette en yüksek maas alan kisi ne kadar aliyor bulun

SELECT max(maas) AS max_maas
FROM personel 

-- SORU: Sirkette en düsük maas alan kisi ne kadar aliyor bulun.

SELECT min(maas) AS min_maas
FROM personel

-- SORU: Sirkette ödenen en yüksek maas ile en düsük maas farki nedir hesaplayin.

SELECT max(maas) - min(maas) AS maas_farki
FROM personel

------------------------------------------------------------------------------------------------

-- DERS: 19.12.24

------------------------------------------------------------------------------------------------

-- SORU: Her bir departmanda kac kisi calisiyor, departman numarasina göre siralayin.

SELECT *
FROM personel p

SELECT
	departman_id,
	count(*) AS toplam_calisan
FROM personel p
GROUP BY departman_id
ORDER BY departman_id

-- SORU: Herbir ülkeden kac calisan bulunuyor bulunuz.

SELECT
	ulke_id,
	count(*) AS toplam_kisi_sayisi
FROM personel p
GROUP BY ulke_id
ORDER BY count(*)

-- SORU: Her bir departmana toplam ne kadar maas ödenecegini hesaplayin.

SELECT
	departman_id,
	sum(maas) AS toplam_departman_maas
FROM personel p
GROUP BY departman_id
ORDER BY departman_id

-- SORU: Her bir departmana ortalama ne kadar maas ödenecegini hesaplayin.

SELECT
	departman_id,
	avg(maas) AS ort_departman_maas
FROM personel p
GROUP BY departman_id
ORDER BY departman_id

-- SORU: Bir de küsuratli bu sayilari yuvarlayarak hesaplayin.

-- virgülden sonra 0 hane olacak sekilde:

SELECT 
	departman_id,
	ROUND(AVG(maas)) AS ort_departman_maas
FROM personel p 
GROUP BY departman_id

-- Virgülden sonra 2 hane olacak sekilde:

SELECT 
	departman_id,
	ROUND(AVG(maas), 2) AS ort_departman_maas
FROM personel p 
GROUP BY departman_id

------------------------------------------------------------------------------------------------

-- DERS: 20.12.24

------------------------------------------------------------------------------------------------

-- SORU: 59 ID'li personeli Almanya'ya gönderip maasini da 100 Birim zam yapin.

UPDATE personel 
SET maas = maas + 100, ulke_id = 'DE'
WHERE id = 59

SELECT *
FROM personel p 

-- Eger WHERE kosulu olmadan yazilirsa tüm tablo SET ifadesindeki gibi degismis olur.

------------------------------------------------------------------------------------------------

-- SORU: ID'si 59 olan kisinin kayitlarini database'den kaldirin.

DELETE
FROM personel
WHERE id = 59

SELECT *
FROM personel p

------------------------------------------------------------------------------------------------

-- DERS: 23.12.24

------------------------------------------------------------------------------------------------

CREATE TABLE haber (
    id SERIAL PRIMARY KEY,
    tarih DATE,
    baslik CHAR(50),
    metin TEXT,
    görüntü INTEGER
                   );

SELECT *
FROM haber

-- SORU: haber tablosun özet isimli field'i ekleyin.

ALTER TABLE haber
ADD özet varchar(100)

-- SORU: özet alani icin 100 karakter yeterli degil, bu alanin uzunlugunu 250 karakter yapin.

ALTER TABLE haber
ALTER COLUMN özet TYPE VARCHAR(250)

-- SORU: özet alanini silin.

ALTER TABLE haber
DROP özet 

------------------------------------------------------------------------------------------------

-- SORU: Ilk siparis vermis olan müsterinin özlük bilgilerini getirin.

SELECT * FROM musteri m

SELECT * FROM siparis s

SELECT *
FROM musteri m
WHERE id = 18

SELECT musteri_id 
FROM siparis s
ORDER BY tarih 
LIMIT 1

SELECT *
FROM musteri m
WHERE id IN (
	SELECT musteri_id 
	FROM siparis s
	ORDER BY tarih
	LIMIT 1
			)

-- SORU: Son siparis vermis olan müsterinin özlk bilgilerini getirin.

SELECT *
FROM musteri m
WHERE id = 18

SELECT musteri_id 
FROM siparis s
ORDER BY tarih DESC 
LIMIT 1

SELECT *
FROM musteri m
WHERE id IN (
	SELECT musteri_id 
	FROM siparis s
	ORDER BY tarih DESC 
	LIMIT 1
            )

-- SORU: Sirkette en yüksek maasi alan kisinin özlük bilgilerini getirin.
			
SELECT *
FROM personel p
WHERE maas IN (
	SELECT maas
	FROM personel p2
	ORDER BY maas DESC
	LIMIT 1
			  );

-- Ayni tabloda oldugumuz icin daha kisa bir yollada cözebiliriz.

SELECT *
FROM personel p
ORDER BY maas DESC
LIMIT 1

------------------------------------------------------------------------------------------------

-- DERS: 24.12.24

------------------------------------------------------------------------------------------------
/*
-- SORU: Her bir personelin ID'sini, adini ve soyadini; bunun yani sira calistigi departmanin
ID'sini ve adini bir arada listeleyip getirin. */

SELECT
	p.id AS personel_id,
	p.ad AS "AD",
	p.soyad AS "SOYAD",
	d.id AS departman_id,
	d.ad AS departman_adi
FROM personel p
INNER JOIN departman d
ON p.departman_id  = d.id
/*
SORU: Her bir personelin adini, soyadini ve ülkesinin ismini listeleyin. Liste; ülke adi,
personel adi ve personel soyadina göre siralanmis olsun. */

------------------------------------------------------------------------------------------------

-- DERS: 02.01.25

------------------------------------------------------------------------------------------------
/*
SORU: Her bir personelin adini, soyadini ve ülkesinin ismini listeleyin. Liste; ülke adi, personel
adi ve personel soyadina göre siralanmis olsun.*/

SELECT
	p.ad AS ad,
	p.soyad AS soyad,
	u.orjinalad AS ulkesi
FROM personel p
INNER JOIN ulke u
ON p.ulke_id = u.ad
ORDER BY u.orjinalad, p.ad, p.soyad

-- SORU: Bir liste hazirlayin, her bir ülkenin ID’si, ismi ve o ülkeden gelen personelin sayisi olsun.

SELECT
	u.id AS ulke_id,
	u.orjinalad AS ulke_ad,
	COUNT(p.id) AS calisan_sayisi
FROM personel p
INNER JOIN ulke u
ON p.ulke_id = u.ad 
GROUP BY u.id 
/*
Pratikte; COUNT; SUM gibi matematiksel komutlar söz konusu oldugunda, sayilan alan haricindeki
(COUNT(*) gibi) bütün alanlari GROUP BY listesine dahil etmemiz gerekecektir. */

------------------------------------------------------------------------------------------------

-- SORU: Bütun personelin ve bütün müsterilerin ad, soyad, E-Posta ve dogum günü bilgilerini tek listede getirin.

SELECT
	ad,
	soyad,
	dogum,
	email
FROM personel p
UNION
SELECT
	ad,
	soyad,
	dogum,
	email
FROM musteri m

------------------------------------------------------------------------------------------------

-- DERS: 03.01.25

------------------------------------------------------------------------------------------------

-- SORU: Herbir departmanin id'sini, adini ve o departmana ödenen toplam maasi tek bir liste icinde getirin.

SELECT * FROM personel p 

SELECT * FROM departman d

SELECT 
	d.id AS departman_id,
	d.ad AS departman_ad,
	SUM(p.maas) AS toplam_maas
FROM departman d
INNER JOIN personel p
ON p.departman_id = d.id
GROUP BY d.id, d.ad

-- SORU: Yukaridaki listeyi maas toplamina göre artan sekilde siralayin.

SELECT 
	d.id AS departman_id,
	d.ad AS departman_ad,
	SUM(p.maas) AS toplam_maas
FROM departman d
INNER JOIN personel p
ON p.departman_id = d.id
GROUP BY d.id, d.ad
ORDER BY SUM(p.maas)

-- SORU: Personele ödenen maaslari ülke bazinda toplayip listeleyin, ciktilar ülke ismine göre siralanmis olsun.

SELECT * FROM ulke u

SELECT
	u.id AS ulke_id,
	u.ad AS millet,
	SUM(p.maas) AS toplam_maas
FROM ulke u
INNER JOIN personel p
ON p.ulke_id = u.ad
GROUP BY u.id, u.ad
ORDER BY u.ad
/*
SORU: Aylik maasi 2000'den fazla olan kisilerin maaslarinin toplamini ülke bazinda getirin. Cikti listesinde
ülkenin id'si, adi ve maas toplami yer alsin. */

SELECT
	u.id AS ulke_id,
	u.ad AS millet,
	SUM(p.maas) AS toplam_maas
FROM ulke u
INNER JOIN personel p
ON p.ulke_id = u.ad
WHERE p.maas > 2000
GROUP BY u.id, u.ad
/*
SORU: Departmanlara ödenecek toplam maaslari departman id'si ve ad bazinda (her bir departman icin)
listeleyin. Ancak, bu listede sadece toplam ödenecek maas tutari 10.000'in üzerinde olan departmanlar 
yer alsin. */

SELECT * FROM departman d 

SELECT 
	d.id AS id,
	d.ad AS departman,
	SUM(p.maas) AS toplam_maas
FROM personel p 
INNER JOIN departman d 
ON d.id = p.departman_id 
GROUP BY d.id, d.ad
HAVING SUM(p.maas) > 10000;


------------------------------------------------------------------------------------------------

-- DERS: 07.01.25

------------------------------------------------------------------------------------------------

-- CTE (Common Table Expressions)

-- Sadece CTE kismi görülmektedir. Tek basina calismaz ana sorgu ile baglanmasi gerekir.

WITH AvgSalaryByDepartment AS (
    SELECT 
        departman_id,
        AVG(maas) AS avg_salary
    FROM personel
    GROUP BY departman_id
							  )

-- NESTED CTE örnek yapisal gösterim

WITH CTE_Total_Salary AS (
    SELECT 
        departman_id,
        SUM(maas) AS TotalSalary
    FROM personel
    GROUP BY departman_id
						 ),
CTE_Avg_Salary AS (
    SELECT 
        departman_id,
        AVG(maas) AS AvgSalary
    FROM personel
    GROUP BY departman_id
				  )
SELECT 
    p.ad,
    p.soyad,
    d.ad AS DepartmanAdi,
    cts.TotalSalary,
    cas.AvgSalary
FROM personel p
LEFT JOIN departman d ON p.departman_id = d.id
LEFT JOIN CTE_Total_Salary cts ON p.departman_id = cts.departman_id
LEFT JOIN CTE_Avg_Salary cas ON p.departman_id = cas.departman_id;

-- Departmanlara göre ortalama maas hesaplama

WITH AvgSalaryByDepartment AS (
	SELECT
		p.departman_id,
		AVG(maas) AS avg_salary
	FROM personel p
	GROUP BY departman_id
							  )
SELECT
	d.ad AS department_name,
	a.avg_salary
FROM AvgSalaryByDepartment a
JOIN departman d
ON a.departman_id = d.id
ORDER BY avg_salary DESC

SELECT * FROM departman d









































