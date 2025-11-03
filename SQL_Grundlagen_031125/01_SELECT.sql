-- einzeiligen Kommentar

/*
	Mehrzeilige
	Kommentare
	Ich gehe 
	über
	mehrere 
	Zeilen
	juhu! :-)
*/

-- USE datenbanknamen wechseln wir die angesprochene Datenbank
-- Alternativ "oben links" im Drop-Down Menü richtige DB auswählen
USE Northwind

/*
	SELECT: wählt Spalten aus, die im Ergebnisfenster
	angezeigt werden soll
*/

SELECT * FROM Customers  -- * = alle Spalten in der angesprochenen Tabelle

-- "Custom" Werte und mathematische Operationen ebenfalls möglicj

SELECT 100

SELECT 'Hallo!' -- Strings werden in einzelne Anführungszeichen geschrieben

SELECT 'Hallo!', 100, 100 +5, 200 * 20
--Zeile Markieren STRG+E oder F5 oder oben "Ausführen" klicken
-----------------------------------------------

-- SQL ist NICHT case-sensitive, Formatierung spielt keine Rolle, keine Semikolons
SeLeCt			cOUnTRy,
			CoMpANyNamE
FrOm			CusTomErs

SELECT * FROM Customers

SELECT * FROM [Order Details]
--------------------------------------------------

-- Sortieren mit ORDER BY
SELECT * FROM Customers
ORDER BY City ASC

-- Absteigend sortieren mit DESC
SELECT * FROM Customers
ORDER BY City DESC

-- ORDER BY ist syntaktisch IMMER am Ende
-- DESC = descending = absteigend
-- ASC = ascending = aufsteigend (Default)

SELECT City, PostalCode/*, Country*/ FROM Customers
ORDER BY PostalCode

SELECT City, ContactName FROM Customers
ORDER BY City ASC--, ContactName ASC
----------------------------------------------

-- TOP X gibts nur die ersten X Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht auch mit %-Angaben
-- SELECT TOP 10 PERCENT

SELECT TOP 10 PERCENT * FROM Customers

-- Die 20 kleinsten Frachtkosten aus der Orders Tabelle
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

-- Die 20 größten Frachtkosten aus der Orders Tabelle
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

/*
	WICHTIG!: "BOTTOM" X existiert nicht, Ergebnise einfach "umdrehen" mit 
	ORDER BY
*/

---------------------------------------
-- Duplikate "filtern" mit SELECT DISTINCT
-- Filtert alle Ergebnisse/Datensätze deren werte exakt gleich sind

SELECT Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers

-- UNION führt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Spaltenanzahl muss gleich sein, Datentypen müssen Kompatibel sein


SELECT * FROM Customers
UNION
SELECT * FROM Customers

-- mit UNION ALL wird KEIN Distinct ausgeführt :)

SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers


SELECT TOP 20 * FROM Orders
--ORDER BY Freight ASC
UNION ALL
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

-- Muss in unterabfragen machen
SELECT * FROM (
	SELECT TOP 20 * FROM Orders ORDER BY Freight ASC) as LowFreight
UNION ALL
SELECT * FROM (
	SELECT TOP 20 * FROM Orders ORDER BY Freight DESC) as HightFreight

SELECT 100, 'Hallo'
UNION ALL
SELECT 5, NULL

--------------------------------------------------
-- Spalten "umbennen" über Aliase bzw "as"
SELECT 100 as Zahl, 'Hallo'  Begrüßung

SELECT 100 as 'Das ganze ist eine Zahl' FROM Customers