-- Notlar TechproEducation Data Science egitiminden alinmistir.

------------------------------------------------------------------------------------------------

-- Sample SQL

------------------------------------------------------------------------------------------------

-- DERS: 03.01.25

------------------------------------------------------------------------------------------------

-- Disaridan bir veriyi veri tabanina cekmek

CREATE TABLE OtomobilFiyatlari(
	marka VARCHAR(250),
	model VARCHAR(250),
	donanim VARCHAR(200),
	motor VARCHAR(200),
	yakit VARCHAR(200),
	vites VARCHAR(200),
	fiyat VARCHAR(200),
	websitesi VARCHAR(255)
							  );

SELECT * FROM otomobilfiyatlari o

-- Tüm verilerin sayisal oldugundan emin olalim.

SELECT *
FROM otomobilfiyatlari
WHERE fiyat !~ '^[0-9]+$';

DELETE FROM otomobilfiyatlari
WHERE marka = 'marka'
AND model = 'model'
AND donanim = 'donanim'
AND motor = 'motor'
AND yakit = 'yakit'
AND vites = 'vites'
AND fiyat = 'fiyat'
AND websitesi = 'websitesi';

-- Bosluklari ve diger gereksiz karakterleri kaldiralim.

UPDATE otomobilfiyatlari
SET fiyat = TRIM(BOTH ' ' FROM fiyat);

-- Fiyat sütununu sayisal türe dönüstürelim.

ALTER TABLE otomobilfiyatlari
ALTER COLUMN fiyat TYPE INT USING (fiyat::integer);
SELECT * FROM otomobilfiyatlari

SELECT * FROM otomobilfiyatlari