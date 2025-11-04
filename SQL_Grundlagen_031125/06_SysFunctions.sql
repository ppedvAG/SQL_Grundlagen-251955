USE Northwind

-- String Funktionen bzw. Text-Datentypen manipulieren

-- LEN gibt die laenge des Strings zurück (Anzahl der Charakter) als int
SELECT CompanyName, LEN(CompanyName) FROM Customers

-- LEFT/RIGHT geben "linken" bzw "rechten" x Zeichen eines Strings zurück
SELECT CompanyName, LEFT(CompanyName, 5) FROM Customers
SELECT CompanyName, RIGHT(CompanyName, 5) FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x mit 
-- "replace" Wert ersetzen
SELECT STUFF(Phone, LEN(Phone)- 4, 5, 'XXXXX') FROM Customers

-- SUBSTRING(Spalte, x, y) springt zu Position x in einer Spalte und gibt y Zeichen zurück
SELECT SUBSTRING(CompanyName, 5, 10), CompanyName FROM Customers

-- PADINDEX sucht nach einem "Schema" (wie Like) in einem String und gibt die Position aus,
-- an der das Schema das erste mal gefunden wurde
SELECT PATINDEX('%m%', CompanyName), CompanyName FROM Customers

-- CONCAT fügt mehrere Strings in die Selbe Spalte hinzu
SELECT CONCAT(FirstName, ' ', LastName) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees
-----------------------------------------------------------------------------------

-- Datumsfunktionen
SELECT GETDATE() -- akutelle Systemzeit
SELECT CURRENT_TIMESTAMP
SELECT SYSDATETIME()

SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) as Tag,
OrderDate FROM Orders

-- "Zieht" ein gewünschtes Intervall aus einem Datum
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) as Stunde
FROM Orders

-- Zieht den IntervallNamen aus einem Datum
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDAte),
DATEPART(WEEKDAY, OrderDate), OrderDate FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz in Intervall zwischen zwei Datums
SELECT DATEDIFF(YEAR, '2005/02/13', GETDATE()), GETDATE()
SELECT DATEDIFF(MONTH, OrderDate, GETDATE()) FROM Orders

---------------------------------------------------------------
-- CAST oder CONVERT, wandeln Datentypen in der Ausgabe um
SELECT CAST(OrderDate as date) FROM Orders
SELECT CONVERT(date, OrderDate) FROM Orders

-- ISNULL prüft auf NULL Werte und ersetzen diese wenn gewünscht
SELECT ISNULL(Fax, 'Nicht vorhandene FAX!') as KeineFax, Fax FROM Customers

-- FORMAT
DECLARE @d AS DATE = '08/09/2024';

SELECT FORMAT(@d, 'd', 'en-US') AS 'US English',
       FORMAT(@d, 'd', 'en-gb') AS 'British English',
       FORMAT(@d, 'd', 'de-de') AS 'German',
       FORMAT(@d, 'd', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT FORMAT(@d, 'D', 'en-US') AS 'US English',
       FORMAT(@d, 'D', 'en-gb') AS 'British English',
       FORMAT(@d, 'D', 'de-de') AS 'German',
       FORMAT(@d, 'D', 'zh-cn') AS 'Chinese Simplified (PRC)';

-- Telefonnummer customizen
SELECT FORMAT(4915827654, CONCAT('+', '## #### ####')) AS 'Custom Number'

-- Zahlen formate
SELECT TOP 5 Freight,
	FORMAT(Freight, 'N', 'en-us'),
	FORMAT(Freight, 'G', 'en-us'),
	FORMAT(Freight, 'C', 'en-us')
FROM Orders

--REPLACE(x, y, z) => "y" sucht in "x" den String um Ihn mit "z" zu ersetzen
SELECT REPLACE('Hallo Welt!', 'Welt!', 'und Willkommen!')

-- REPLICATE(x, y,) => Setze "y" mal die "x" vor der Spalte "Phone"
SELECT Phone +  REPLICATE('0', 3) FROM Customers

-- Reverse(Spaltenname) => z.B "Hallo" wird zu "ollaH"
SELECT CompanyName, REVERSE(CompanyName) From Customers

-- UPPER(Spaltenname) => alles in Großbuchstaben
SELECT CompanyName, UPPER(CompanyName) FROM Customers

-- LOWER(Spaltenname) => alles in Kleinbuchstaben
SELECT CompanyName, LOWER(CompanyName) FROM Customers

-- TRANSLATE(inputString, chars, replace)
-- => Geben deinen Inputtring an, wähle die "chars" aus die im "inputString" ersetzt werden sollen
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '    ')