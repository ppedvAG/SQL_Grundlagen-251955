/*
	
	Datentypen in SQL: 3 große Gruppen

	1. Charakter/String Datentypen
	char(10) = 'Hallo' = 10 Byte Speicherplatz => Fixe Speichergröße
	nchar(10) => 20+2 Byte extra => Unicode

	varchar(10) = 'Hallo' => 5 Byte Speicherplatz => Variable Speichergröße
	nvarchar() => 10 Byte + 2 => Unicode

	Legacy: text --> mittlerweile VARCHAR(MAX) = bis zu 2GB
	varchar(8000) & nvarchar(4000)



	2. Zahlen/Numerischen Datentypen:
	tinyint = 1 Byte = 0 - 255
	smallint = 2 Byte = -32.768 - 32.767
	int = 4 Byte = 2,14Mrd +-
	bigint = 8 Byte = 9,2 Trillion +-

	bit = 1 oder 0 (True oder false)
	decimal(x, y) = x Ziffern insgesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern insgesamt, davon sind 2 Nachkommastellen
	money = ca. 9,2 Trillion  +-
	smallmoney = ca 214K +-

	float(n) = bis 53
	1-24 = 7 Stellen Präzi abrunden = 4 Byte
	25-53 = 15 Stellen Präzi abrunden = 8 Byte

	real = 4 Byte


	3. Datum/Zeit Datentypen:
	time = hh:mm:ss.nnnnnnn (00:00:00.0000000 - 23:59:59.9999999) = 5 Byte
	date = YYYY-MM-DD (0001-01-01 - 9999-12-31) = 3 Byte
	datetime = YYYY-MM-DD hh:mm:ss.mmm 
				(1753-01-01 00:00:00.000 - 9999-12-31 23:59:59:997) = 8 Byte
	datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn
				(0001-01-01 00:00:00.0000000 - 9999-12-31 23:59:59.9999999) = 8 Byte
	smalldatetime = YYYY-MM-DD hh:mm:ss
					(1900-01-01 00:00:00 - 2079-06-06 23:59:59) = 4 Byte

*/