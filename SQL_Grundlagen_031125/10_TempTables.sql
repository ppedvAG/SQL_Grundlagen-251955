USE Northwind

/******************************************/

-- Temporäre Tabellen / Temp Tables / #Tables

/******************************************/

/*
	- existiert nur innerhalb meiner Session (Skriptfesnter / Abfragefenster)
	- SELECT INTO #TableName => Ergebnisse werden in eine Temporäre Tabelle geschrieben
	- werden in SystemDB => tempDB => Temporäre Tabellen
	- Ergebnisse werden nur einmal generiert --> TempTables sehr schnell aber nicht aktuell
	- mit einem # = "lokal"
	- mit zwei ## = "global"
*/

-- Erstellen
SELECT * INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Temporäre Tabelle aufrufen
SELECT * FROM #TempTable

-- manuell loeschen
DROP TABLE #TempTable

-- globale Temp table
SELECT * INTO ##TempTable
FROM Customers
WHERE Country = 'Germany'