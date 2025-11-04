USE Northwind

-- Aggregatfunktionen: Führt eine Berechnung auf einer Menge von Werten durch und gibt
--					   einen einzigen Wert zurück
-- Ausnahme: COUNT(*) ignoriert keine NULL Werte, Aggregatfunktionen schon

SELECT 
SUM(Freight) as Summe,
MIN(Freight) as Minimum,
MAX(Freight) as Maximum,
AVG(Freight) as Durchschnitt,
COUNT(ShippedDate) as ZähleSpalte, COUNT(*) as ZähleAlles
FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders

SELECT CustomerID, Freight FROM Orders
ORDER BY CustomerID

-- Freight Summe pro CstomerID
SELECT CustomerID, SUM(Freight) FROM Orders
GROUP BY CustomerID

-- Quantity SUmme pro ProductID haben:
SELECT ProductID, SUM(Quantity) as Summe FROM [Order Details]
GROUP BY ProductID

-- Quantity Summe pro Productname für Produkte der Kategorien 1-4
SELECT ProductName, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN(1, 2, 3, 4)
GROUP BY ProductName
ORDER BY 2 DESC

-- Verkaufte Steuckzahlen pro Produkt, aber nur ueber 1000
SELECT ProductName, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE SUM(Quantity) > 1000
GROUP BY ProductName
ORDER BY 2 DESC

-- HAVING funktioniert 1zu1 wie WHERE, kann aber gruppierte/aggregierte Werte nachträglich filtern
SELECT ProductName, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY 2 DESC