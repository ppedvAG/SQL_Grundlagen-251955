USE Northwind
/*******************************************/

-- WHILE - leitet eine Schleifenanweisung ein

/*******************************************/

-- WHILE = Eine Schleife
DECLARE @Counter INT = 0

WHILE @Counter <= 5
BEGIN
SELECT 'Hallo'
SET @Counter += 1
END

WHILE 1=1 BEGIN SELECT 'Hallo' END 


-- Zusätzlihc IF Prüfung innerhalb der WHILE-Schleife
DECLARE @Zähler INT = 0

WHILE @Zähler <= 5
BEGIN

IF @Zähler = 2
	BEGIN
		SELECT 'Bin gerade bei 2' 
	END
ELSE
	BEGIN 
		SELECT @Zähler
	END
SET @Zähler += 1
END
